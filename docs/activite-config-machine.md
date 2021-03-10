
# À la découverte de la configuration réseau de ma machine

Les réseaux sont constitués de *liaisons* (câbles, fibres, faisceaux
hertziens...) et d'*équipements d'interconnexion* (routeurs, switches,
firewalls,...). Mais leur finalité est de relier des *équipements
terminaux* comme des ordinateurs, des smartphones ou des objets
connectés. Dans cette activité, nous allons découvrir les principaux
paramètres à configurer sur une machine pour qu'elle fonctionne
correctement sur un réseau.

!!! note "Attention à votre système d'exploitation!" 

    Certaines commandes n'ont pas le même nom (ou les même
    paramètres) dans les différents systèmes d'exploitation. Dans ce 
    cas, nous  utilisions parfois la représentation ci-dessous. 
    Sélectionnez votre OS (Windows ou Linux) pour voir les commandes 
    adéquates.

    === "Windows"

        ```` shell
        # Pour lister les paramètres réseau, tapez: 
        ipconfig /all
        ````

    === "Linux"

        ```` shell
        # Pour lister les adresses des différentes interfaces, tapez: 
        ip address list
        ````

Dans cette activité, nous allons beaucoup utiliser la ligne de commande.
Si vous ne savez pas ouvrir un terminal, suivez les instructions
ci-dessous:

=== "Windows"

    !!! note ""
        Ouvrez le "menu démarrer" (touche "Windows" ) puis tapez `cmd` 
        et entrée".

=== "Linux"
    !!! note ""
        Ouvrez le lanceur de programmes (touche "Windows") puis tapez 
        `term`. Le système devrait vous proposer l'un des émulateurs de 
        terminal déja installés. Sélectionnez celui que vous préférez.

        Sous Ubuntu, une autre alternative est d'utiliser le raccourci 
        clavier `Ctrl + Alt + t`.


## Notion d'adresse

Une machine dispose de plusieurs adresses:

* une pour chaque niveau de de la pile de protocole (adresse MAC,
  adresse IP, nom de machine...)
* Dans certains cas, une même machine peut même posséder plusieurs
  adresses pour la même couche


### Quel est le nom de ma machine?

Les ordinateurs possèdent généralement un nom de machine. Vous pouvez
retrouver le nom de votre machine à l'aide de la commande `hostname`. 
Notez le nom de votre machine.


### Quelle est l'adresse de ma machine?

Les commandes ci-dessous vous permettent de lister les interfaces 
(aussi appelée cartes réseaux ou "NIC") de votre machine ainsi que leurs
différentes adresses. Essayez de retrouver les adresses MAC et IP des 
interfaces de votre machine et notez les dans un tableau sur le modèle 
de celui ci-dessous.

=== "Windows"
    !!! note ""
        ```` shell
        ipconfig /all
        ````

=== "Linux"
    !!! note ""
        ```` shell
        ip address list
        ````

        *Note:* lorsque cela ne soulève pas d'ambiguïté, la commande 
        `ip` assure automatiquement la complétion des paramètres qui lui 
        sont passés. Ainsi `ip a l` donnera le même résultat que 
        `ip address list`... Et comme `list` est le paramètre par défaut
        pour la sous commande `address`, `ip a` sera même suffisant.
        Les informaticiens ne sont pas fainéants, ils savent juste 
        s'économiser :-)

Essayez de retrouver les adresses MAC et IP des interfaces de votre
machine. Notez les dans un tableau comme celui-ci:

Interface    | Adresse MAC   | Adresse IP
:------------|---------------| -----------
interface 1  |   @MAC_1      |   @IP_1_1
             |               |   @IP_1_2
interface 2  |   @MAC_2      |   @IP_1_2
    ...      |       ...     |   ...



### Qu'est ce que l'adresse de loopback?

Sur toutes les machines, une adresse particulière désigne la machine
locale. On l'appelle "l'adresse de loopback". On l'utilise pour faire 
des tests et pour communiquer avec d'autres programmes qui se trouvent 
sur la machine.

L'adresse de loopback a les caractéristiques suivantes:

* elle n'a pas d'adresse MAC
* au niveau réseau (IP), son adresse est `127.0.0.1` en IPv4 et `::1` en IPv6
* le nom de machine `localhost` lui est généralement associé 

La commande `ping` sert à envoyer un paquet de test vers une autre
machine. En réponse, cette machine revoie une copie du message reçu ce
qui permet de vérifier le bon fonctionnement de la liaison. 

**Note 1**: Cela suppose que la machine cible accepte de coopérer, ce qui
n'est pas toujours le cas.

**Note 2**:Par défaut, sous Windows, `ping` s'arrête automatique après avoir envoyé
4 paquets de test, alors que sous Linux, il faut forcer son arrêt à
l'aide de `Ctrl+C`.

Utilisez la commande `ping` pour vérifier la connection avec votre 
interface de loopback en tapant les 3 commandes suivantes. 

Remarquez que ping accepte indifféremment des adresses IPv4, IPv6 ou des
noms de machine. Prenez le temps de regarder les informations retournées
par la commande `ping`. Regardez notamment par quelle adresse IP, le 
nom de machine `localhost` a été remplacé.

````sh
ping 127.0.0.1
ping ::1
ping localhost
````



## Comment résoudre une adresse?

Nous venons de voir qu'une machine peut avoir un nom de machine, une ou
plusieurs adresses IP ainsi qu'une adresse MAC pour chacune de ses
interfaces.

Les protocoles de résolution d'adresse permettent de trouver la 
correspondance entre deux adresses de deux couches adjacentes. Par 
exemple:

* La résolution [DNS](glossaire.md#dns) permet de trouver l'adresse IP à
  partir d'un nom de machine (Reverse DNS permet de faire la résolution
  dans le sens inverse)
* La résolution [ARP](glossaire.md#arp) permet de trouver l'adresse MAC
  d'une machine à partir de son adresse IP (Reverse ARP permet la
  requête inverse)

<!-- Nous allons utiliser ces deux protocoles de résolution d'adresse. -->
Afin d'économiser le temps nous nous focaliserons sur la résolution DNS.


### La résolution DNS

Différents programmes permettent de faire des requêtes DNS. Nous allons
utiliser la commande `nslookup` qui a le mérite d'exister sous Windows
comme sous Linux.

Tapez les commandes suivantes. 
````sh
nslookup localhost
nslookup google.fr
nslookup google.com
````
Pour trouver ses réponses `nslookup` procède en deux étapes:

* Il recherche tout d'abord si l'adresse de la machine recherchée a été
  configuré de manière fixe par l'administrateur (résolution statique).
* Dans le cas contraire (ce qui est le plus fréquent), il interroge un
  *serveur DNS* (résolution dynamique). Nous reviendrons juste après sur
  la façon de sélectionner ce serveur.

L'administrateur de votre ordinateur peut configurer la résolution
statique en éditant le fichier de configuration adéquat. Regardons ce 
fichier (les lignes commençant par `#` sont des commentaires et ne sont
donc pas prises en compte).

=== "Windows"
    ```` shell
    type C:\Windows\System32\Drivers\etc\hosts
    ````

=== "Linux"
    ```` shell
    cat /etc/hosts
    ````

Il est très rare d'avoir à configurer statiquement la résolution DNS, et
**nous vous déconseillons de le faire** sans bonne raison. En effet, il
est possible que les résultats de la résolution changent pour
différentes raisons, par exemple pour répartir la charge d'un même site
sur différents serveurs. Vous pouvez vous en apercevoir en faisant la
même requête `nslookup google.com` à plusieurs minutes d'intervalle ou
en confrontant vos résultats avec ceux d'autres collègues.


Puisque la résolution statique est déconseillée, comment mon ordinateur
sélectionne-t-il le serveur DNS à interroger? Faute de temps, il est
difficile de rentrer dans les détails. Disons simplement que, quand elle
démarre, votre machine récupère ses paramètres de configuration auprès
d'un *serveur [DHCP](glossaire.md#dhcp)* qui lui communique notamment
l'adresse d'un ou plusieurs serveur DNS. Si vous êtes à la maison, ce
serveur tourne sur votre "Box Internet" et le serveur DNS qui vous est 
proposé est géré par votre fournisseur d'accès internet.

Cette pseudo centralisation du DNS permet aux états (qui accordent leur
licence aux opérateurs télécom) de gére 

La gestion du DNS peut revêtir un intérêt stratégique. N'oublions pas 
que ce sont les états qui accordent aux opérateurs télécoms les licences
qui les autorisent à opérer. Par ce biais, il leur est facile de limiter
l'accès à certains sites. Prenons l'exemple du site `sci-hub.se` qui 
donne accès à des publications scientifiques en contournant les droits
des maisons d'édition.

Faites une recherche DNS pour trouver l'adresse IP de ce site:
````sh
nslookup sci-hub.se
````
En analysant la réponse de cette commande, vous devriez voir qu'elle ne 
vous retourne pas l'adresse demandée.

Reprenons la même requête mais en la dirigeant vers un le célèbre 
serveur DNS de Google dont l'adresse IP est `8.8.8.8`:
````sh
nslookup sci-hub.se 8.8.8.8
````
Vous devriez obtenir une adresse valide cette fois-ci.

Conclusion: Même si ce n'est pas le seul, le blocage de résolution DNS
est un moyen couramment utilisé pour empêcher l'accès à des sites
internet.




### La résolution ARP

**<a class="text-danger">TODO:  Probablement Hors scope (faute de
temps). Peut-être à proposer comme une activité bonus à faire par les
plus motivés/compétents entre les deux séances. </a>**

note pour installer arp depuis linux `sudo apt install net-tools`




### IP publique / IP privée

Dans les parties précédentes, vous avez noté les différentes adresses IP
attribuées à votre machine. Les résultats dépendent fortement de votre
réseau et de votre machine. Vous avez également vu que la commande 
`ping` permet de tester la connectivité avec une machine identifiée par 
son adresse IP. 

Dans cette partie, commencez par essayer de tester la connectivité avec
les différentes adresses IP des autres membres de votre groupe.

Y-êtes vous arrivé·e? Probablement pas :-( Si ça a marché, il y a de
fortes chance que ce soit avec des adresses IPv6. Essayons de
comprendre...


#### Un peu de théorie...

Il existe deux version du protocole IP: IPv4 et IPv6. La principale
raison de l'introduction d'IPv6 est la pénurie d'adresses IPv4. En
effet, les adresses IPv4 sont codées sur 4 octets (`w.x.y.z`). Cela
permet un peu plus de 4 milliards d'adresses. Ce nombre s'est révélé
insuffisant pour permettre d'adresser directement l'ensemble des
équipements connectés à l'Internet. IPv6 a résolu le problème en codant
les adresses sur 16 octets soit plus de $10^{38}$ adresses. Mais le 
passage d'IPv4 à IPv6 va prendre du temps et nous allons devoir vivre
avec le double système pendant un certain temps...

##### IPv4 et NAT

Les protocoles [NAT](glossaire.md#nat) ont été imaginés pour de palier
le manque d'adresses IPv4. Sans approfondir, disons simplement que NAT
permet à un routeur (typiquement votre box d'accès Internet) de "prêter"
son adresse IP aux équipements de son réseau. Votre ordinateur dispose
de sa propre adresse pour communiquer avec les autres équipements (dont
la box) au sein du réseau local mais cette adresse est choisie dans une
plage particulière dite d'*adresses privées* (par exemple les plages
`192.168.x.y`  ou `10.x.y.z`). Chacun peut construire son réseau local
en utilisant ces adresses. Mais pour éviter les conflits d'adresse, il
n'est pas possible d'utiliser une adresse privée pour communiquer sur
l'Internet (les routeurs de l'internet ne traitent pas ces adresses).
Pour aller sur Internet, il faut donc utiliser une *adresse IP publique*
mais c'est cette ressource qui est limitée en IPv4. Votre fournisseur
d'accès à Internet attribue donc une IPv4 publique à votre box qui peut
alors la prêter aux autres équipements en utilisant le protocole NAT.

Lorsque vous avez demandé ses adresses IPv4 à votre machine, vous avez
logiquement récupéré ses adresses privées puisque votre machine ne
connaît l'IP publique votre box. Comme ces adresses ne sont pas
routables sur l'Internet, il est logique que vous n'ayez pas réussi à
faire un ping avec elles.

##### Et en IPv6 ?

En IPv6, il n'y a pas de pénurie d'adresses, les IPv6 des machines sont
donc généralement publiques par défaut (sauf celles que l'on veut
volontairement être non routables comme celles commençant par `fe80:`).
Le ping entre deux adresses IPv6 devrait donc pouvoir fonctionner.

Mais pour que cela fonctionne, il faut encore que les fournisseurs
d'accès à Internet des deux machines implémentent effectivement IPv6, ce
qui n'est pas forcément le cas... 


##### En quoi est-ce un problème ?

Comme vous pouvez le constater, le fait de n'avait une IP publique que
sur votre box ne vous empêche pas de vous connecter à Internet. Le
problème se pose lorsque vous voulez exposer un service sur Internet
(autrement dit: héberger un serveur). Dans ce cas, il faut bien que vous
disposiez d'une adresse publique pour que vos clients s'y connectent. De
la même façon, qu'elle peut vous prêter son IP pour sortir sur Internet,
votre box peut faire suivre le trafic qu'elle reçoit vers l'un de vos
serveurs. Mais cela induit de nombreuses complications, à commencer par
le fait que vous ne pourrez héberger qu'un seul serveur car vous ne
disposez que d'une seule IP publique. D'autre part, cela suppose que
votre fournisseur d'accès vous attribue systématiquement la même adresse
IP publique (on parle alors d'*IP fixe*), ce qui n'est pas forcément
toujours le cas compte tenu de la pénurie d'adresses.




#### Un peu de pratique...

##### Comment connaître l'IP publique de ma box ?

Différents sites internet vous permettent de connaître votre adresse IP
publique. Il s'agit généralement de serveur Web qui affichent l'adresse
source des paquets IP que vous leur envoyez. 

Nous vous proposons d'utiliser le site
[http://ip.lafibre.info/](http://ip.lafibre.info/) car il affiche
plusieurs informations intéressantes (notamment l'IPv4 et l'IPv6).

Ouvrez le lien dans votre navigateur et notez notamment les
informations suivantes (conservez les quelque part):

* votre adresse IPv4 publique, si vous en avez une 
* votre adresse IPv6 publique, si vous en avez une 
* les noms associés à ces adresses (résultat des requêtes reverse DNS )

Comparez ces adresses avec celles que vous aviez récupérées localement
sur votre machine. Vous devriez constater que 

* L'IPv4 publique est différente de l'IPv4 de votre machine (car votre
  box a utilisé NAT pour remplacer votre IP privée par son IP publique).
* Si vous avez de l'IPv6, il est fort probable que l'une des adresses
  IPv6 de votre machine corresponde exactement à celle affichée par le
  site. Cela signifie que votre machine est directement accessible
  depuis l'internet (il est donc possible d'y héberger un serveur en
  IPv6).

##### Tester la connectivité sur mon(mes) IP publique(s) ?

Maintenant que chacun·e a récupéré son(ses) IP publique(s), essayez de 
"pinguer" celles de vos collègues. Cela devait fonctionner désormais.

*Note*: La situation n'est pas exactement la même en IPv4 qu'en IPv6. En
IPv4, les requêtes arrivent sur la box internet de votre correspondant,
c'est donc elle qui y répond. Alors qu'en IPv6, elles arrivent
directement sur la machine cible. Bien que cela dépasse le cadre de
cette activité, les utilisateurs les plus avancés peuvent l'observer en
utilisant un outil d'analyse de trafic comme
[Wireshark](https://www.wireshark.org/) sur la cible de la requête. Vous 
devriez observer le trafic ping en IPv6 (puisqu'il atteint la machine) 
mais pas en IPv4 (car c'est la box qui y répond).



##### Remarques plus avancés sur l'IPv6

En IPv6, vous disposez généralement de plusieurs adresses IP
(trois, typiquement):

* L'une est dite temporaire. C'est celle dont se sert la machine pour
  faire des requêtes vers d'autres serveur. Cette adresse change
  périodiquement afin de limiter la possibilité de vous pister.
  Attention! cela ne vous garantit en aucun cas l'anonymat!
* Une adresse qui ne change pas au cours. C'est cette adresse qu'il faut
  utiliser si pour héberger vos propres serveurs. En effet, il vaut
  mieux que l'adresse des serveurs ne change pas trop au cours du
  temps...
* Une adresse dite de *lien local* et qui commence en `fe80::`. Celle-ci
  est uniquement destinée aux communications avec les machines
  directement reliées sur le même câble. Nous n'en dirons pas plus si ce
  n'est qu'elle n'offre pas de connectivité internet puisqu'elle n'est
  pas routable sur l'Internet.


Vous noterez que les deux premières adresses commencent de la même
façon. Plus exactement, ont dit qu'elles ont le même *préfixe*. Ce
préfixe a typiquement une longueur de 64 bits (soit 8 octets). Si en
IPv4, les fournisseurs d'accès ne fournissent qu'une seule IP publique,
en IPv6 en revanche, chaque client se voit attribuer une large plage
d'adresses qui ont toutes le même préfixe. Les adresses IPv6 ayant une
taille de 128 bits et si l'on fixe les 64 premiers bits pour le préfixe,
il reste 64 bits pour numéroter des machines soit $2^{64}$, c'est à dire
plus de $10^{19}$ adresses pour chaque client! Autant dire que la
pénurie d'adresse est résolue!


##### Manipulations avancés en IPv6 (et IPv4)

Pour les utilisateurs un peu avancées, il est assez simple de tester
l'exposition d'un service sur Internet. cela suppose:

* d'installer et lancer un serveur sur votre machine, 
* le cas échéant, de configurer le firewall de votre machine pour
  accepter les connexions entrantes
* si vous êtes en IPv4 uniquement (pas d'IPv6) ou si vous voulez que le
  service soit accessible en IPv4, il faudra également configurer votre
  box que qu'elle fasse suivre (*port forwading*) le trafic des ports
  TCP et/ou UDP concernés (par exemple TCP port 80 pour un serveur web
  http) vers la machine où est installé le serveur

Attention à ce que vous faites! Pensez à arrêter vos serveurs et à
refermer les différents ports à la fin de vos expérimentations.

Certaines de ces activités nécessiteront les droits administrateurs.

Pour vous entraîner, vous pouvez par exemple installer 
* un serveur web, par exemple
  [XAMPP](https://www.apachefriends.org/fr/index.html) sous windows ou
  bien `apache` ou `nginx` sous linux
* ou simplement `netcat` (linux) ou [`ncat`](http://nmap.org/ncat/) sous
  windows qui permettent de lancer un serveur et de s'y connecter sur
  n'importe quel port
* et même installer un serveur `ssh`, attention toutefois à bien
  sécuriser vos accès!






## Pour aller plus loin
### Les paramètres nécessaires 


* @IP (v4, v6, les 2)
* masque: aie! il va falloir faire simple pour éviter de perdre tout le monde un peu compliqué 
* Routeur par défaut 
* serveur DNS


### Comment déterminer ces paramètres? 

Configuration manuelle ou dynamique via DHCP

note: DHCP est très utilisé en IPv4. Il est également disponible en IPv6
mais est beaucoup moins utilisé dans ce cas car IPv6 fournit un nouveau
système d'auto-configuration d'adresse qui permet de se passer de
serveur DHCP



--8<-- "includes/abbreviations.md"
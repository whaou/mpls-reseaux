
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
        Ouvrez le "menu démarrer" (touche "Windows" ) puis tapez `cmd` et 
        "entrée".

=== "Linux"
    !!! note ""
        Ouvrez le lanceur de programmes (touche "Windows") puis tapez 
        `term`. Le système devrait vous proposer l'un des émulateurs de 
        terminal déja installés. Sélectionnez celui que vous préférez.


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
    ```` shell
    ipconfig /all
    ````

=== "Linux"
    ```` shell
    ip address list
    ````

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


### La Résolution DNS

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
vous retourne pas l'adresse demandé.

Reprenons la même requête mais en la dirigeant vers un le célèbre 
serveur DNS de Google dont l'adresse IP est `8.8.8.8`:
````sh
nslookup sci-hub.se 8.8.8.8
````
Vous devriez obtenir une adresse valide cette fois-ci.

Même si ce n'est pas le seul, le blocage de résolution DNS est un moyen
couramment utilisé pour empêcher l'accès à des sites internet.




### La Résolution ARP

Hors scope
note pour installer arp depuis linux `sudo apt install net-tools`


### IP publique / IP privée



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
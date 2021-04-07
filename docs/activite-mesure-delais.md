# Mesure des délais sur Internet

La notion de délai est l'une des métriques importantes
permettant de caractériser les performances des systèmes de
communication. De nombreux paramètres influent sur les délais et leur
variation au cours du temps (jitter).

Cette activité, a plusieurs objectifs:

* connaître les facteurs influençant les délais dans les réseaux
* utiliser des outils simples pour estimer la latence
* décrire et appliquer une démarche scientifique dans le cadre d'un
  protocole expérimental simple


## Rappel théoriques

Les sources de délai les plus courantes sont les suivantes:

* Le **temps de propagation** est le temps mis par un signal pour aller
  d'un point à un autre (cf. section suivante).
* La **durée d'émission** est le temps nécessaire pour émettre un
  certain volume d'informations à un débit donné (cf. section suivante).
* Le **temps de traitement** est le temps pris par les différents
  équipements traversés pour réaliser les traitements nécessaires à
  l'acheminement des messages.
* Les **congestions** sont liées à des situations où l'afflux de messages
  entrants est supérieur à la capacité de sortie d'un équipement. L'une des
  raisons des congestions est la mutualisation des liaisons entre différents
  utilisateurs.
  Les afflux ponctuels peuvent être absorbés dans des files d'attente.
  Cependant cela a un impact fort sur la latence de bout en bout. 
* Lorsque des erreurs se produisent, il peut être nécessaire de
  **re-transmettre** les messages perdus. Cela constitue une évidente
  source de retard. 

Dans cette activité, nous allons nous focaliser sur le temps de
propagation. Nous commencerons par quelques rappels de formalisation
puis nous essaierons de réaliser quelques mesures sur l'Internet et de
les analyser. 


### Temps de propagation

Le *temps de propagation* ($t_p$) est le temps mis par un signal pour
aller d'un point à un autre. Il dépend de la distance ($d$) à parcourir
et de la *vitesse de propagation* ($v_p$) dans le milieu considéré. Ces
trois paramètres sont liés par la relation suivante (qui dérive
directement de l'équation aux dimensions).

$v_p = \frac{d}{t_p}$, soit $t_p = \frac{d}{v_p}$

À noter que pour les ondes électromagnétiques, la vitesse de propagation
est liée à la vitesse de la lumière ($c$) et à l'indice de propagation
du milieu considéré. Le tableau ci-dessous donne quelques ordres de
grandeurs. Notez que les ondes radio se propagent plus rapidement que la
lumière dans une fibre optique!

   
Type              |   Milieu   |   Indice   |  Vitesse de propagation 
:-----------------|------------| -----------| -----------
Signal radio      |  air       |     1      |  $3.10^{8}~m.s^{-1}$
Signal optique    |  fibre     |     0.66   |  $2.10^{8}~m.s^{-1}$
Signal électrique |  cuivre    |     0.66   |  $2.10^{8}~m.s^{-1}$
son               |  air       |            |  $340~m.s^{-1}$
son               |  eau       |            |  $1500~m.s^{-1}$


### Durée d'émission

La *durée d'émission* ($t_e$) d'un message dépend de sa taille ($L$, en
bits) et du débit ($D$, en bits/secondes). De même que précédemment, on
retrouve la relation entre ces trois grandeurs à partir de l'équation 
aux dimensions du débit.

$D = \frac{L}{t_e}$ soit $t_e = \frac{L}{D}$

Attention à ne pas tomber dans le piège classique de la confusion entre
les bits et les octets. Les volumes de données (par exemple la taille
d'un fichier) sont traditionnellement exprimés en octets, alors que les 
débits sont typiquement exprimés en bits/seconde. Il ne faut donc pas 
oublier le facteur 8 pour convertir les octets en bits...


### Illustration vidéo

La vidéo ci-dessous illustre ces notions. 

Les liaisons bleues et jaunes fonctionnent à $1~Mb/s$ alors que la liaison
rouge est à $5~Mb/s$. La longueur des traits figurant les paquets
représente la durée d'émission. Elle est bien 5 fois plus courte pour la
liaison rouge.

La distance $d$ est identique sur les liaisons bleue et rouge. Le temps
de propagation (c'est à dire le temps de parcours du 1er bit par ex.)
est donc identique.

Sur la liaisons jaune en revanche, la distance est plus courte. Le temps
de propagation est donc plus court également.

<iframe width="560" height="315" src="https://www.youtube.com/embed/yZi5g39pad0" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; 
gyroscope; picture-in-picture" allowfullscreen></iframe>

## Modèle proposé

Dans cette activité, nous allons considérer un modèle basique basé sur 
des hypothèses simples:

* Nous ne considérerons qu'une seule source de délai: le temps de
  propagation
* Nous ignorerons donc les durées d'émission, les temps de traitements
  ainsi que les éventuelles congestions ou re-transmissions
* De plus, nous considérerons que le type de signal (et donc la vitesse
  de propagation) est identique tout au long du parcours.

Ces hypothèses reviennent à considérer que la source est reliée
directement à la destination par une liaison dédiée ne comportant aucun
équipement actif.


### Justification des hypothèses

Soyons clairs, la motivation principale de ces hypothèses est de
simplifier la mise en oeuvre de l'activité. D'autant que la précision de
mesure des ordinateurs dont vous disposez reste limitée. 

Concernant les erreurs, nous pouvons faire l'hypothèse raisonnable
qu'elles sont peu fréquentes et qu'elles se matérialiseront par des
mesures aberrantes que nous pourrons écarter facilement. C'est une
approche couramment admise en sciences expérimentales. 

Par ailleurs, nous n'avons aucun contrôle sur l'apparition des
congestions sur l'Internet. Là encore, nous tâcherons d'écarter les
mesures aberrantes. Notons également que, même si nous n'avons pas le
temps d'approfondir cette question, la taille des files d'attente est
généralement relativement limitée afin d'éviter de trop longues
attentes. La contrepartie est que, lorsque leur file d'attente est
pleine, les équipements détruisent les paquets en surplus. Cela revient
donc générer des erreurs de transmission.

L'ignorance de la durée d'émission est plus discutable. En effet, le
phénomène est indéniablement présent et modélisable (cf. § précédent).
Dans la version initiale de cette activité, il était même prévu de vous
faire estimer ce temp. Cependant, la précision des machines à
disposition (en particulier sous Windows) ne permettrait pas de tirer
facilement de conclusions. N'hésitez pas en discuter entre vous et avec
les formateurs! Posez vous notamment la question de savoir à partir de
quel débit le temps d'émission peut être considéré comme négligeable vis
à vis des autres sources de délai...

Quoi qu'il en soit un modèle est forcément une abstraction simplifiée de
la réalité. L'essentiel est d'avoir conscience de ses limites.


## Protocole expérimental

Nous allons chercher à caractériser le temps de propagation ($t_p$) de
notre liaison en faisant une série de pings.

Rappelons que `ping` nous donne une mesure du temps d'aller retour (ou
RTT) entre la source de notre message et sa destination. 

Nous allons mesurer le RTT vers différents serveurs de l'Internet, en
déduire le temps de propagation puis évaluer leur distance par
rapport à nous. 

Ensuite, nous chercherons à évaluer la pertinence notre modèle en le 
confrontant à la réalité.


## Mesures de RTT et estimation de la distance

Commençons par mesurer le RTT vers différents serveurs de la planète à
l'aide de la commande `ping`. Ciblez par exemple les serveurs suivants
(libre à vous d'enrichir la liste!):

* le serveur de L'Institut Mines-Télécom à Paris: `imt.fr`
* le serveur de l'université de Berkeley (Californie): `berkeley.edu`
* le site officiel de la ville de Pékin: `www.beijing.gov.cn`
* le site officiel de la ville de Singapour: `www.gov.sg`

Notez que, la première fois, le premier échange peut mettre un temps
significativement plus long que les suivants. Essayez ce comprendre
pourquoi et si cela se justifie, écartez cette mesure.

À partir de notre modèle ($t_p = \frac{d}{v_p}$) estimez la distance
vers chacun des nœuds testés. Cela revient à remplir le tableau
ci-dessous. Note: Vous aurez besoin de faire une hypothèse sur le type
de liaison; cela fait partie du modèle.

Les ordres de grandeur de vos résultats vous semblent-ils cohérents? À
ce stade, si vous notez des incohérences que vous ne savez pas
expliquer, notez les simplement. Nous en discuterons par la suite.

Cible                |  RTT  (ms) |  Distance (km)
:--------------------|------------|---------------------
`imt.fr`             |  ...       |   ...
`berkeley.edu`       |  ...       |   ...
`www.beijing.gov.cn` |  ...       |   ...
`www.gov.sg`         |  ...       |   ...
.....                |  ...       |   ...



## Évaluation du modèle

Afin de valider notre modèle, comparons nos résultats avec ceux fournis
par une méthode complètement indépendante. Il se trouve que les
géographes ont eux aussi des méthodes pour calculer la distance entre
deux villes. 

Le site [distance.to](https://fr.distance.to/) permet de mesurer la
distance orthodromique (c'est à dire la distance à vol d'oiseau en
suivant la courbure de la terre) entre deux villes du globe. Servez-vous 
en pour valider vos résultats et estimer la précision du modèle.


## Étude des écarts du modèle

### Un cas aberrant

Si tout s'est déroulé comme prévu, vous devriez avoir au moins une
grosse anomalie concernant le site `www.gov.sg`. 

Depuis le départ, nous avons fait l'hypothèse implicite que le serveur
du gouvernement de Singapour était hébergé à...Singapour. Mais nos
mesures semblent contredire cette hypothèse. Devons nous mettre en cause
notre modèle ou cette hypothèse sur la localisation du serveur?

Le site [iplocation.net](https://www.iplocation.net) (parmi beaucoup
d'autres) permet de trouver la localisation géographique d'une adresse
IP. Il se base sur des données fournies par les fournisseurs d'accès à
Internet. La précision de ces données varie suivant les fournisseurs et
les bases de données, mais elles permettent souvent de se faire un idée
(au moins à l'échelle d'un pays).

Jouez avec [iplocation.net](https://www.iplocation.net) pour:

* localiser votre propre adresse IP publique
* localiser celle des sites qui donnaient des résultats aberrants avec
  notre modèle

Concernant `www.gov.sg`, notez qui est le propriétaire de l'adresse IP.
Connaissez-vous cette société? Savez-vous quelle est son activité?
Discutez-en entre vous et avec les formateurs.



### Autre façon pour localiser une machine

Les gros hébergeurs du cloud ont généralement l'habitude d'associer des
noms DNS à chacune de leurs adresses IP. Ces noms de machine sont
destinés à être interprétés par des humains et comportent souvent des
informations explicites sur leur localisation. 

Prenons l'exemple de `berkeley.edu`. Effectuons une requête DNS pour
retrouver son adresse IP.

```sh
nslookup www.berkeley.edu 
``` 

Effectuons maintenant la requête DNS inverse (qui donne le nom de
machine en fonction de l'IP):
```sh
nslookup <Addresse_IP_récupérée_lors_de_la_requête_précédente>
``` 

Vous devriez obtenir le nom complet de la machine. Avez-vous tou·te·s
obtenu les mêmes résultats? Savez-vous expliquer pourquoi ce nom n'est
pas simplement `berkeley.edu`? Discutez-en entre vous et avec les
formateurs.

Le nom de la machine devrait vous renseigner sur l'hébergeur de ce
serveur et le site où se situe cette machine. Essayez de savoir où se
situe précisément ce site et refaites le calcul de distance
orthodromique pour affiner l'évaluation de la précision du modèle.


## Traceroute

La commande `traceroute` (`tracert` sous windows) permet d'identifier
les différent routeurs à traverser pour atteindre une destination
donnée. Certains routeurs ne coopèrent pas avec cette commande (en fait,
ils ne répondent pas au ping envoyé par traceroute). Pour les autres,
traceroute affiche leur adresse IP ainsi que leur nom de machine lorsque
la requête de DNS inverse a fonctionné.

Lancez la commande suivante pour identifier la route jusqu'au serveur de
`berkley.edu` et essayez de suivre le chemin emprunté par les paquets.

*Note*: Le nom des routeurs intègre souvent le [code
AITA](https://fr.wikipedia.org/wiki/Liste_des_codes_AITA_des_a%C3%A9roports/A)
de l'aéroport le plus proche

Par défaut, traceroute effectue trois essais pour chaque saut. C'est
pourquoi vous voyez trois résultats sur chaque ligne. Si vous avez de la
chance, vous pourrez constater que, parfois, le chemin n'est pas le
même. Cela est notamment lié aux stratégies de partage de charge (ou
"load balancing") qui permettent de distribuer la charge entre
différentes machines.


=== "Windows"
    !!! note ""

        ```` sh
        tracert -w 500 -h 64 berkeley.edu
        ````

        * l'option `-w 500` indique d'attendre 500 ms avant de considérer 
          qu'un routeur intermédiaires n'a pas répondu
        * l'option `-h 64` indique de limiter la recherche aux 64 
          premières machines identifiées


=== "Linux"
    !!! note ""

        ```` sh
        traceroute berkeley.edu
        ````

Amusez vous à identifier les routes vers différents sites et les IP
publiques de membres de votre groupe.

<!-- **<p class="text-danger">TODO: On pourrait parler d'outils externes
comme les looking glass (et éventuellement les weathermaps pour la
congestions). Mais est-ce nécessaire.</p>** -->


## Conclusion

* De nombreux facteurs impactent les délais de transmission des paquets.
    * Le temps de propagation est très dimensionnant pour les liaisons de
      longues distance. 
    * Les recherches en physique quantique, et en particulier sur
      l'intrication des particules permettront peut-être un jour de
      dépasser cette limite physique.
* Une autre solution consiste à rapprocher les serveurs de leurs
  utilisateurs. 
    * On arrive à réduire le délai perçu par l'utilisateur en dupliquant
      les serveurs dans des endroits stratégiques et en configurant
      habilement les serveurs DNS pour pointer vers les serveurs les
      plus proches. 
    * C'est la technique utilisée dans les CDN (Content Delivery
      Networks) ou dans l'approche MEC (Mobile Edge Computing) de la 5G.
* D'une manière générale, pour améliorer les performances et tenir la
  montée en charge (on dit aussi "passer à l'échelle"), les industriels
  sont amenés à déployer de solutions d'hébergement et des stratégies de
  routage complexes qui perturbent la compréhension des concepts pour
  les débutants.
* Des commandes simples (`ping`, `nslookup`, `traceroute`...)
  disponibles en standard sur les machines permettent de tester et de
  caractériser les liaisons. 
    * D'autres outils complémentaires sont disponibles, notamment en
      ligne, sur des sites spécialisés.
* Concernant la recherche:
    * La modélisation permet de formaliser un problème sur la base
      d'hypothèses. Mais ces modèles doivent être caractérisés et leur
      limites bien identifiées.
    * En recherche, on ne sais jamais ce que l'on va trouver! Par
      exemple, alors que nous cherchions à caractériser la latence dans
      les réseaux, nous avons découvert différentes problématiques liées
      à l'hébergement de services sur Internet. 



--8<-- "includes/abbreviations.md"
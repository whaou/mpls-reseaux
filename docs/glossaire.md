# Glossaire


Le monde des réseaux regorgent de termes parfois abscons pour le commun
des mortels. Voici la signification de quelques acronymes et leur
définition simple.


## ARP
*Address Resolution Protocol*

Protocole assurant la résolution d'adresse MAC. Il permet à une machine
d'interroger les autres machines du réseau local afin d'obtenir
l'adresse MAC correspondant à une adresse IP donnée. En général, la 
réponse est apportée directement par la machine qui possède l'adresse IP
recherchée.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Address_Resolution_Protocol){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Address_Resolution_Protocol){target=_blank}.


## API
*Application Programming Interface*

Interface de programmation permettant à un programme d'exposer un
service auprès d'autres programmes. Ces interfaces permettent par
exemple d'accéder à des informations (lecture, écriture) ou de
déclencher des actions.


Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Interface_de_programmation){target=_blank}, 
[en](https://en.wikipedia.org/wiki/API){target=_blank}.




## DHCP
*Dynamic Host Configuration Protocol*

Protocole qui permet à un nœud de récupérer automatiquement ses
paramètres de configuration réseau auprès d'un *serveur DHCP*. Ces 
paramètres comprennent notamment l'adresse IP que la machine devra 
utiliser ainsi que l'adresse d'un ou plusieurs serveurs DNS.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol){target=_blank}, 
[en](https://wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol){target=_blank}.


## DNS
*Domain Name System*

Système de nommage des machines utilisé sur l'Internet. Désigne
également le nom du protocole permettant de demander à un *serveur DNS*
l'adresse IP correspondant à un nom de machine.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Domain_Name_System){target=_blank}, 
[en](https://wikipedia.org/wiki/Domain_Name_System){target=_blank}.


## IoT
*Internet of Things* (ou IdO: Internet des objets)

L'Internet des Objets désigne à la fois les équipements et les
mécanismes (protocoles et réseaux de communication) permettant de faire
dialoguer des objets entre eux. 

Dans sa version la plus simple, l'Internet des Objets permet à des 
capteurs (par exemple de température) des remonter leur valeur vers 
des serveurs. Il permet également d'interagir à distance avec des 
actionneurs (par exemple de déclencher le chauffage à distance). Une 
application plus complexe concerne par exemple les véhicules 
communicants.

Une caractéristique de l'IoT et qu'il s’intéresse souvent à de petits
objets dont les resources sont très contraintes en matière d'énergie, de puissance de calcul ou de moyen de communication. De plus, le nombre 
d'objets à intégrer peut parfois être très important. C'est pourquoi des solutions spécifiques sont dédiées à l'IoT. 

Une autre contrainte de l'IoT est que les objets sont parfois 
difficilement accessibles une fois déployés. Ce qui peut poser des 
problèmes pour assurer leur maintenance ou leur mise à jour. Associées à 
la limite de puissance de calcul et de stockage, cela peut conduire à de
sérieux problèmes en matière de cybersécurité.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Internet_des_objets){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Internet_of_things){target=_blank}.



## IP
*Internet Protocol*

C'est le protocole de la couche réseau (niveau 3 du modèle OSI). Il est
notamment en charge de l'adressage (adresses IP) et du routage (chemin
suivi) des paquets sur le réseau. À ce jour, la version 4 (IPv4) est
encore la plus utilisée. Elle est peu à peu remplacée par la version 6
(IPv6) qui fournit notamment un espace d'adressage beaucoup plus
important.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Internet_Protocol){target=_blank}, 
[en](https://wikipedia.org/wiki/Internet_Protocol){target=_blank}.


## JSON
*JavaScript Object Notation*

Format de représentation de données structurées facilement interprétable
par les machines d'autant que des librairies pour le manipuler existent
dans la plupart des langages de programmation. Les données sont
organisées sous forme de `clé`:`valeur`. Il est également possible
d'imbriquer ces données et de les organiser sous forme de listes.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation){target=_blank}, 
[en](https://en.wikipedia.org/wiki/JavaScript_Object_Notation){target=_blank}.


## MAC
*Medium Access Control* 

Nom donné à la couche gérant l'accès au canal (niveau 2 du modèle OSI).
Cette couche gère notamment le partage du canal entre les différents 
émetteurs. Elle implémente souvent un mécanisme de détection d'erreurs 
et parfois de correction de ces erreurs ou bien de retransmission quand
une erreur est détectée.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Contr%C3%B4le_d%27acc%C3%A8s_au_support){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Medium_access_control){target=_blank}.


## NAT
*Network Address Translation* 

Protocole permettant à un routeur de substituer l'adresse d'un paquet
par une autre. Ce protocole est principalement utilisé par les routeurs
d'accès pour substituer les IP privées du réseau local par une IP
publique routable sur l'Internet. Cela permet d'une part de palier le
manque d'adresses IPv4 et d'autre part de limiter l'accès direct aux
machines d'un réseau local depuis l'extérieur.

Il existe différents types de NAT mais nous ne n'évoquerons pas ces
différences ici.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Network_address_translation){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Network_address_translation){target=_blank}.


## RTT 
*Round Trip Time*

Le RTT représente le temps d'aller / retour entre deux machines. La
commande `ping` permet par exemple de mesurer ce temps. Une machine
envoie un paquet de test à la machine cible qui le renvoie à son tour à
l'expéditeur initial. Le RTT est mesuré par l'expéditeur initial. C'est
le temps entre le début de l'émission du paquet de test et la réception 
de la fin du la réponse.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Round-trip_delay_time){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Round-trip_delay){target=_blank}.


## URL
*Uniform Resource Locator*

Adresse au format texte permettant de localiser une resource sur
Internet de façon unique. Le début de l'URL indique également le
protocole à utiliser pour accéder à cette resource. Par exemple
`https://www.imt-atlantique.fr/fr` indique comment accéder à la page
d'accueil en français de la machine `www` du domaine `imt-atlantique.fr`
en utilisant le protocole HTTPS.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Uniform_Resource_Locator){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Uniform_Resource_Locator){target=_blank}.


## VM
*Virtual Machine*

Une machine virtuelle est un logiciel qui reproduit de manière virtuelle
l'ensemble des composants matériels d'un ordinateur. Il est ainsi 
possible de faire tourner une ou plusieurs *machine(s) virtuelle(s)* sur
le même *hôte physique*.

Cela permet notamment de facilement:

* installer de nouvelles configuration,
* dupliquer des configurations intéressantes,
* faire fonctionner plusieurs *instances* de machines virtuelles sur un 
  même *hôte* physique,
* isoler les différentes VM entre elles afin de limiter les 
  interférences entre elles (pb de sécurité, incompatibilités de 
  configuration, isolation des pannes...).

Les VM peuvent être utilisée sur des ordinateurs personnels à des fins 
de test ou pour de besoins de configuration spécifiques (ex. une VM 
Linux sur un hôte sous Windows) ou bien sur des serveurs afin de 
mutualiser les resources matérielles entre différents clients ou 
services.

Liens wikipedia: [fr](https://fr.wikipedia.org/wiki/Machine_virtuelle){target=_blank}, 
[en](https://en.wikipedia.org/wiki/Virtual_machine){target=_blank}.




<!-- 
* [**DHCP**](https://fr.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol):
  *Dynamic Host Configuration Protocol*. Protocole qui permet
  à un nœud de récupérer automatiquement ses paramètres de configuration
  réseau auprès d'un *serveur DHCP*.
* [**DNS**](https://fr.wikipedia.org/wiki/Domain_Name_System): 
  *Domain Name System*. Système de nommage des machines utilisé
  sur l'Internet. Désigne également le nom du protocole permettant de 
  demander à un *serveur DNS* l'adresse IP correspondant à un nom de 
  machine.
* [**IP**](https://fr.wikipedia.org/wiki/Internet_Protocol): 
  *Internet Protocol*. C'est le protocole de la couche réseau
  (niveau 3 du modèle OSI). Il est notamment en charge de l'adressage
  (adresses IP) et du routage (chemin suivi) des paquets sur le réseau.
  À ce jour, la version 4 (IPv4) est encore la plus utilisée. Elle est 
  peu à peu remplacée par la version 6 (IPv6) qui fournit notamment un 
  espace d'adressage beaucoup plus important. -->


--8<-- "includes/abbreviations.md"
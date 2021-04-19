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
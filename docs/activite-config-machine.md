
# À la découverte de la configuration réseau de ma machine

Les réseaux sont constitués de liaisons (câbles, fibres, faisceaux
hertziens...) et d'équipements d'interconnexion (routeurs, switches,
firewalls,...). Mais leur finalité est de relier des équipements
terminaux comme des ordinateurs, des smartphones ou des objets
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
        ipconfig --all
        ````

    === "Linux"

        ```` shell
        # Pour lister les adresses des différentes interfaces, tapez: 
        ip address list
        ````

## Notion d'adresse
### Quelle est l'adresse de ma machine?

Plusieurs adresses (IP, nom de machine, MAC), et même plusieurs IP (IPv4, IPv6, plusieurs IP...)
`ipconfig -all` / `ip address list`

### Comment résoudre une adresse?

* MAC/IP -> ARP
* IP->nom de machine -> [DNS](glossaire.md#dns)

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
# Mesure des délais sur Internet

La notion de délai est l'une des métriques importantes
permettant de caractériser les performances des systèmes de
communication. De nombreux paramètres influent sur les délais et leur
variation au cours du temps (jitter).

Les sources de délai les plus courantes sont les suivantes:

* Le **temps de propagation** est le temps mis par un signal pour aller
  d'un point à un autre (cf. section suivante)
* La **durée d'émission** est le temps nécessaire pour émettre un
  certain volume d'informations à un débit donné (cf. section suivante)
* Le **temps de traitement** est le temps pris par les différents
  équipements traversés pour réaliser les traitements nécessaires à
  l'acheminement des messages.
* Les **congestions** sont liées à des situations où l'afflux de
  messages entrants est supérieur à la capacité de sortie d'un
  équipement du réseau. Les afflux ponctuels peuvent être traités grâce
  à des files d'attente. Cependant cela a un impact fort sur la latence
  de bout en bout. 
  L'une des raisons des congestions est la mutualisation des liaisons 
  entre les différents utilisateurs.
* Lorsque des erreurs se produisent, il peut être nécessaire de
  **re-transmettre** les messages perdus. Cela constitue une évidente
  source de retard. 

Dans cette activité, nous allons nous focaliser sur le temps de
propagation (principalement) et la durée d'émission (un peu). Nous
commencerons par quelques rappels de formalisation puis nous essaierons
de réaliser quelques mesures sur l'Internet et de les analyser. 

## Rappel théoriques

### Temps de propagation

Le *temps de propagation* ($t_p$) est le temps mis par un signal pour
aller d'un point à un autre. Il dépend de la distance ($d$) à parcourir
et de la *vitesse de propagation* ($v_p$) dans le milieu considéré. Ces
trois paramètres sont liés par la relation suivante (qui dérive
directement de l'équation aux dimensions).

$v_p = \frac{d}{t_p}$, soit $t_p = \frac{d}{v_p}$

À noter que pour les ondes électromagnétiques, la vitesse de propagation
est liée à la vitesse de la lumière ($c$) et l'indice de propagation du
milieu considéré. Le tableau ci-dessous donne quelques ordres de
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
bits) et du débit ($D$ en bits/secondes). De même que précédemment, on
retrouve la relation entre ces trois grandeurs à partir de l'équation 
aux dimensions du débit.

$D = \frac{L}{t_e}$ soit $t_e = \frac{L}{D}$

Attention à ne pas tomber dans le piège classique de la confusion entre
les bits et les octets. Les volumes de données (par exemple la taille
d'un fichier) sont traditionnellement exprimés en octets, alors que les 
débits sont typiquement exprimés en bits/seconde. Il ne faut donc pas 
oublier le facteur 8 pour convertir les octets en seconde...



## Modèle proposé

Dans cette activité, nous allons considérer un modèle basique basé sur 
des hypothèses simples:

* Nous ne considérerons que deux sources de délai: le temps de
  propagation et la durée d'émission
* Nous ignorerons donc les temps de traitements ainsi que les
  éventuelles congestions ou re-transmissions
* De plus, nous considérerons que le type de signal et le débit du lien
  sont identiques tout au long du parcours.

Notons, que ces hypothèses reviennent à considérer que la source est
reliée directement à la destination par une liaison dédiée ne comportant
aucun équipement actif.

On définit le *délai de transmission* ($t$) comme le temps entre
l'émission du premier bit d'un message (de $L$ bits) et la reception du
dernier bit de ce message par son destinataire.

Dans nos hypothèses, le délai de transmission ($t$) est la somme du
temps de propagation et du temps d'émission. Nous avons donc:

$t = t_p+t_e =  \frac{d}{v_p} + \frac{L}{D}$



## Protocole expérimental

Nous allons chercher à caractériser le *débit moyen* ($D$) et le temps
de propagation ($t_p$) de notre liaison en faisant une série de pings.

Rappelons que ping nous donne une mesure du temps d'aller retour (ou RTT
pour Round Trip Time) entre la source de notre message et sa
destination.


### Estimation du temps d'émission

Remarquons tout d'abord que temps de propagation ne dépend pas de la
taille des paquets transmis. À partir de notre modèle ($t = t_p+t_e$),
il est donc possible d'isoler l'effet du temps de propagation en faisant
la différence entre les délais de transmission mesurés pour deux tailles
de paquet différentes.
 
Par exemple, si l'on appelle $t_{1}$ et $t_{2}$ les temps de
transmission mesurés respectivement pour des paquets de taille $L_1$ et
$L_2$, la différence de temps de transmission ($\Delta$) est égale à
celle des durée d'émission.

$\Delta  = t_{1} - t_{2} = (t_p + t_{e1}) - (t_p + t_{e2}) = t_{e1}- t_{e2}$

$\Delta  = \frac{L_{1}}{D} - \frac{L_{2}}{D}$

Soit $D = \frac{L_{1} - L_{2}}{\Delta} = \frac{L_{1} - L_{2}}{t_1 - t_2}$

## Mesures






--8<-- "includes/abbreviations.md"
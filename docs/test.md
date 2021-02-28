
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
    paramètres) dans les systèmes d'exploitation. Dans ce cas, nous 
    utilisions parfois la représentation ci-dessous. Sélectionnez votre 
    OS (Windows ou Linux) pour voir les commandes adéquates.

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




!!! note "Titre de la note"
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

??? note "Indice..."
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.


[Windows](javascript:alert$.next(&quot;Done!&quot;)){: .btn .btn-primary }
[Linux](#){: .btn .btn-secondary .disabled }

[test](javascript:myFunction();){: .btn .btn-primary }
<script>
function myFunction() {
    alert("I am an alert box!");
//   var x = document.getElementById("myDIV");
//   if (x.innerHTML === "Hello") {
//     x.innerHTML = "Swapped text!";
//   } else {
//     x.innerHTML = "Hello";
//   }
} 
</script>

Please buy the great products from {{ acme }}!

{% set os = 'win' %}
{% set os = 'linux' %}


<button type="button" class="btn btn-primary">Window</button>
<button type="button" class="btn btn-secondary disabled">Linux</button>

{% if os is equalto 'win' %}
    Under Windows
{% else %}
    NOT Under Windows
{% endif %}


### Adding a glossary

When [Snippets][7] is enabled, content from other files can be embedded, which
is especially useful to include abbreviations from a central file – a glossary –
and embed them into any other file.

_Example_:

=== "Windows"

    ```` markdown
    The HTML specification is maintained by the W3C.
    
    --8<-- "includes/abbreviations.md"
    ````

=== "Linux"

    ```` markdown
    *[HTML]: Hyper Text Markup Language
    *[W3C]: World Wide Web Consortium
    ````

_Result_:

The HTML specification is maintained by the W3C.

_Remember to locate the Markdown file containing the definitions outside of the_
`docs` _folder (here_ `includes` _is used), or MkDocs may complain about an 
unreferenced file._

  [7]: #snippets


```` markdown linenums="1"
*[HTML]: Hyper Text Markup Language
*[W3C]: World Wide Web Consortium
````

The `#!python range()` function is used to generate a sequence of numbers.





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
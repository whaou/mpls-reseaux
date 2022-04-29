
Ce dépôt contient la documentation en ligne de la formation "Les secrets
des réseaux" de la MPLS.

Cette documentation est construite automatiquement à l'aide de l'outil
[MkDocs](https://www.mkdocs.org/). L'idée est de décrire simplement le
contenu dans des fichiers markdown (dans le répertoire `docs`), puis
MkDocs génère automatiquement les pages HTML statiques correspondantes.

La doc peut être testée localement à l'aide des commandes 
`mkdocs serve`. De même, il est possible de la générer localement avec 
`mkdocs build`.

La branche `master` contient la dernière version à jour et des tags
identifient les versions précédentes (à ce jour: `v1` pour la session 
2021) 

Le dépôt inclut par ailleurs des fichiers de configuration pour 
l'intégration continue afin de publier automatiquement les pages web du 
site dès qu'un push est réalisé. Pour des raisons historiques, il existe
deux versions de ces scripts:

* l'une pour l'infrastructure GitLab CI d'Inria qui a hébergé ce site
  lors de la première session (session 2021). Le résultat était alors 
  publié sur https://ccouturi.gitlabpages.inria.fr/mpls-reseaux/. Et
* une autre depuis le passage sur Github (en 2022) utilisant le système
  d'*actions* et de *pages* de Github qui publie sur 
  https://whaou.github.io/mpls-reseaux/. 



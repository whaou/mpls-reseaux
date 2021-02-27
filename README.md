
Ce dépôt contient la documentation en ligne de la formation "Les secrets
des réseaux" de la MPLS.

Cette documentation est construite automatiquement à l'aide de l'outil
[MkDocs](https://www.mkdocs.org/). L'idée est de décrire simplement le
contenu dans des fichiers markdown (dans le répertoire `docs`), puis
MkDocs génère automatiquement les pages HTML statiques correspondantes.

La doc peut être testée localement à l'aide des commandes 
`mkdocs serve`. De même, il est possible de la générer localement avec 
`mkdocs build`.

Par ailleurs, l'intégration avec GitLab CI permet de re-générer et de
publier automatiquement la documentation à chaque commit. Le résultat
est publié sur Gitlab Pages à l'adresse suivante:
https://ccouturi.gitlabpages.inria.fr/mpls-reseaux/



Les infos ci-dessous sont extraites de la [doc présentant l'intégration
entre mkdocs et gitlab CI et pages](https://gitlab.com/pages/mkdocs).
Elles ne présentent pas d'intérêt particulier pour l'utilisateur
standard.



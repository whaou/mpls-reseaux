# Internet des objets avec micro:bit


## Utiliser microbit dans un projet IoT

La carte Micro:bit ne peut pas se connecter seule � internet.
Nous mettrons en oeuvre un dispositif s'apuyant sur une carte Raspberry Pi (ou PC sous Linux) pour r�cup�rer des donn�es capt�es par plusieurs cartes Micro:bit sur une page web, accessibles depuis un ordinateur.

![Architecture MB/Raspberry Pi](img/mb_architecture.png){ width="75%" }

* une carte microbit Ma�tre connect�e au raspberry PI par un c�ble USB. Elle �change avec les microbit esclaves via radio.
* de 1 � 24 cartes microbit esclave. Elles r�cup�rent des donn�es de 1 ou plusieurs capteurs et les transmettent sur demande � la carte microbit maitre via radio (groupe radio 1).

TODO...


--8<-- "includes/abbreviations.md"

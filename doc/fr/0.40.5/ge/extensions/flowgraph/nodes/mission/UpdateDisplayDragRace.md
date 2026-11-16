# `flowgraph_nodes_mission_UpdateDisplayDragRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua` · VM : Game Engine (GE) · 129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/UpdateDisplayDragRace")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Update Display Drag Race' (categorie repeat_instant) pour la mission de drag race : affiche sur le panneau du quart de mile le temps et la vitesse du joueur en changeant la forme (shapeName) des objets scene display_time_i_l/r et display_speed_i_l/r (modeles art/shapes/quarter_mile_display/display_<chiffre>.dae). Le pin 'side' ('l' ou 'r') choisit le cote ; la vitesse en m/s est convertie en mph (x2,237).

## Remarques

- La description des pins 'side' et 'velocity' est identique ('Velocity of the players vehicle') : copie-colle dans le code.
- La conversion m/s vers mph est faite avec une condition 'velocity == 0 and velocity or velocity*2.237'.
- Si la scene n'a pas les objets display_*, les indexations de nil provoquent une erreur.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide les listes d'afficheurs et met la sortie flow a false. | 96 |
| `C:init()` | Meme initialisation. | 104 |
| `C:insertDigits()` | Recherche dans la scene les 20 objets display_time_i_l/r et display_speed_i_l/r (i de 1 a 5) et les stocke. | 80 |
| `C:postInit()` | Definit les valeurs proposees pour le pin 'side' : left=l, right=r. | 22 |
| `C:updateDisplay(side, finishTime, finishSpeed)` | Construit la liste des chiffres (temps avec 3 decimales, vitesse avec 2) et applique le bon modele sur chacun des 5 afficheurs du cote voulu ; un 'empty' est ajoute pour le zero de tete. | 29 |
| `C:work()` | Sur reset : retrouve les afficheurs et remet l'affichage a 0. Sinon, si time, velocity et side sont fournis, met a jour l'affichage ; flow=true. | 112 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua`.*

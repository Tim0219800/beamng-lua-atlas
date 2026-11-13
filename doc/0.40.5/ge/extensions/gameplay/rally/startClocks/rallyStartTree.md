# `gameplay_rally_startClocks_rallyStartTree`

*Fichier : `lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua` · VM : Game Engine (GE) · 203 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_startClocks_rallyStartTree` : `extensions.load("gameplay_rally_startClocks_rallyStartTree")`, puis la globale `gameplay_rally_startClocks_rallyStartTree`

Affichage LED du panneau d'horloge de départ (« rally start tree ») de BeamNG. Il retrouve dans la scène les TSStatic utilisant la forme s_rally_start_tree.dae, puis dessine dans deux textures (couleur et opacité, 900x540) une grille de LED : feux tricolores (R/A/G), horloge à 6 chiffres en vert, libellé d'étape en ambre et compte à rebours en rouge. Aide aussi à choisir l'orientation de l'affichage vers un point cible. Module simple (table C), sans constructeur.

## Remarques

- Les textures sont déclarées dans C.textures (tags @rallyStartClockDisplay et @rallyStartClockOpacity) ; draw doit recevoir une table avec les champs color et opacity correspondants.
- Chiffres disponibles : 0 à 9, S et tiret ; un caractère sans motif est ignoré.
- Les LED éteintes sont dessinées en noir (showInactiveLeds = true).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_startClocks_rallyStartTree.draw(textures, display)` | Dessine l'état complet de l'afficheur dans les textures : feux, horloge, libellé d'étape et compte à rebours (format « -N », « M:SS » ou un ou deux chiffres). | 130 |
| `gameplay_rally_startClocks_rallyStartTree.findClocks()` | Parcourt les TSStatic de la scène et renvoie ceux dont shapeName est la forme du start tree. | 66 |
| `gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos)` | Calcule un vecteur de visée pour l'affichage d'une horloge : combine la tangente et la normale de la surface de la horloge, orientées dans le sens de la route et vers l'intérieur, selon que l'horloge est à droite ou à gauche de la ligne de départ. | 178 |

### Détail des paramètres

#### `gameplay_rally_startClocks_rallyStartTree.draw(textures, display)`

Dessine l'état complet de l'afficheur dans les textures : feux, horloge, libellé d'étape et compte à rebours (format « -N », « M:SS » ou un ou deux chiffres).

- `textures` (*table*) : {color, opacity} : objets texture ciblés
- `display` (*table*) : {clock=string "HH:MM:SS" style, label=string, countdown=string, semaphore="R"|"A"|"G"}

#### `gameplay_rally_startClocks_rallyStartTree.findClocks()`

Parcourt les TSStatic de la scène et renvoie ceux dont shapeName est la forme du start tree.

- **renvoie** : table[] Liste de {anchor, shapeName (forme d'affichage), transform, scale}

#### `gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos)`

Calcule un vecteur de visée pour l'affichage d'une horloge : combine la tangente et la normale de la surface de la horloge, orientées dans le sens de la route et vers l'intérieur, selon que l'horloge est à droite ou à gauche de la ligne de départ.

- `clock` (*table*) : Élément renvoyé par findClocks (utilise clock.anchor)
- `startLine` (*table*) : {pos, rot} de la ligne de départ ; rot nécessaire
- `targetPos` (*vec3*) : Position de la cible (côté où se trouve la horloge par rapport à la route)
- **renvoie** : vec3|nil Direction composée ; nil si la rotation est absente ou dégénérée

## Champs

| Champ | Type | Description |
|---|---|---|
| `textures` | table | Définition des deux textures dynamiques : color (clearColor transparent) et opacity (clearColor noir), chacune avec tag, width et height. |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua`.*

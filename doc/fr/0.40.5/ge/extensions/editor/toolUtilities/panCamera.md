# `editor_toolUtilities_panCamera`

*Fichier : `lua/ge/extensions/editor/toolUtilities/panCamera.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_panCamera` : `extensions.load("editor_toolUtilities_panCamera")`, puis la globale `editor_toolUtilities_panCamera`

Caméra « pan » partagée par les outils de splines de l'éditeur. Elle prend la main sur la caméra libre de l'éditeur (via toolCamera), passe en vue de dessus et permet de se déplacer au clic droit et de zoomer à la molette. Un outil hôte l'enregistre avec configure, l'appelle chaque frame avec drive, et peut lui faire cadrer la sélection courante.

## Exemple

```lua
local pan = extensions.editor_toolUtilities_panCamera
pan.configure({focusProvider = function() return selectedPoints end})
pan.toggle()
-- à chaque frame de l'outil :
pan.drive(isDraggingNode)
```

## Remarques

- L'état (on, focusProvider) est local au module : une seule caméra pan à la fois.
- gotoPoints renvoie false si ni la caméra pan ni toolCamera ne sont actives : l'appelant doit alors faire son propre saut de caméra libre.
- Le cadrage passe par util.splineFocus puis toolCamera.flyPan ; l'altitude est relative au terrain.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_panCamera.close()` | Désactive la caméra pan et rend la caméra libre à l'éditeur (toolCamera.handBack). | 52 |
| `editor_toolUtilities_panCamera.configure(opts)` | Enregistre un callback fournissant les points de la sélection courante, utilisé pour cadrer à l'ouverture de la caméra. | 29 |
| `editor_toolUtilities_panCamera.drive(blocked)` | À appeler à chaque frame : applique le déplacement (glisser clic droit) et le zoom (molette) via toolCamera.drive. | 71 |
| `editor_toolUtilities_panCamera.gotoPoints(points)` | Routage du « aller à » : si la caméra pan (ou toolCamera) est active, la fait voler vers les points donnés et renvoie true ; sinon renvoie false et l'appelant fait son saut normal. | 63 |
| `editor_toolUtilities_panCamera.isOn()` | Indique si la caméra pan est active. | 33 |
| `editor_toolUtilities_panCamera.open()` | Active la caméra pan (toolCamera.takeOver) et passe en vue de dessus : cadre la sélection fournie par focusProvider s'il y en a une, sinon bascule en vue de dessus à la position et à la hauteur actuelles de la caméra. | 39 |
| `editor_toolUtilities_panCamera.toggle()` | Bascule : ferme la caméra pan si elle est active, sinon l'ouvre. | 57 |

### Détail des paramètres

#### `editor_toolUtilities_panCamera.configure(opts)`

Enregistre un callback fournissant les points de la sélection courante, utilisé pour cadrer à l'ouverture de la caméra.

- `opts` (*table|nil*) : Table avec le champ focusProvider : fonction sans argument renvoyant une liste de points {x,y,z} ou nil.

#### `editor_toolUtilities_panCamera.drive(blocked)`

À appeler à chaque frame : applique le déplacement (glisser clic droit) et le zoom (molette) via toolCamera.drive.

- `blocked` (*boolean|nil*) : true pour suspendre le mouvement pendant les interactions modales de l'outil (dessin de polygone, glissement de nœud, placement…).

#### `editor_toolUtilities_panCamera.gotoPoints(points)`

Routage du « aller à » : si la caméra pan (ou toolCamera) est active, la fait voler vers les points donnés et renvoie true ; sinon renvoie false et l'appelant fait son saut normal.

- `points` (*table*) : Liste de points {x,y,z} à cadrer.
- **renvoie** : boolean true si la demande a été traitée par la caméra pan.

#### `editor_toolUtilities_panCamera.isOn()`

Indique si la caméra pan est active.

- **renvoie** : boolean true si la caméra pan pilote la vue.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/panCamera.lua`.*

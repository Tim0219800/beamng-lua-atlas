# `editor_toolUtilities_siteView`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteView.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteView` : `extensions.load("editor_toolUtilities_siteView")`, puis la globale `editor_toolUtilities_siteView`

Gère la caméra des outils d'éditeur à contour (open space editor, parking lot editor) : quelle étape d'édition est affichée (Footprint ou Design) et laquelle des trois caméras (pan, rotate, free) cadre la sélection. S'appuie sur editor/toolUtilities/toolCamera pour les déplacements. Un seul outil est actif à la fois, donc l'état (étape, mode, dernière sélection) est unique au niveau du module. Le massing editor garde sa propre version, mais offre les mêmes boutons.

## Exemple

```lua
local sv = require('editor/toolUtilities/siteView')
sv.init({ ring = function() return myOutlinePoints end, terrainZ = function(x, y) return core_terrain.getTerrainHeight(vec3(x, y, 0)) end, selIndex = function() return selected end, onStep = function(key) end })
sv.reset()
-- chaque frame : sv.followSelection(); sv.drive(isDrawing)
```

## Remarques

- init(c) attend une table avec ring() (liste de points avec .x/.y), terrainZ(x, y), selIndex() et onStep(key) ; seuls ring et selIndex sont facultatifs dans le code, terrainZ est appelé sans test dès qu'on cadre.
- Sans contour (ring() nil ou vide), focus() cadre le point (0, 0) avec un rayon de 24 m.
- Le mode 'pan' place la caméra à l'altitude qui fait tenir le contour dans le champ (rayon / tan(fov/2)) plus 5 m de marge ; le mode 'rotate' orbite avec un rayon d'au moins 8 m.
- Le mode 'free' rend la caméra de l'éditeur à l'utilisateur ; re-cliquer dessus ne fait rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteView.activate(m)` | Prend la main sur la caméra de l'éditeur (toolCam.takeOver) puis cadre la sélection. | 65 |
| `editor_toolUtilities_siteView.clickMode(m)` | Action d'un bouton de caméra : bascule vers ce mode, ou recadre s'il est déjà actif (sauf 'free', où rien ne se passe). C'est ce deuxième appui qui sert de « aller au site ». | 104 |
| `editor_toolUtilities_siteView.drive(blocked)` | Pilotage par frame de la caméra (toolCam.drive), sauf en mode free. | 116 |
| `editor_toolUtilities_siteView.focus(m)` | Envoie la caméra active (pan ou orbite) vers la sélection, d'après le contour fourni par ring(). Mémorise aussi la sélection courante. | 56 |
| `editor_toolUtilities_siteView.followSelection()` | Recadre si la sélection (ctx.selIndex()) a changé depuis le dernier cadrage. Sans effet en mode free. | 109 |
| `editor_toolUtilities_siteView.getMode()` | Renvoie le mode de caméra courant. | 133 |
| `editor_toolUtilities_siteView.getStep()` | Renvoie l'étape courante. | 132 |
| `editor_toolUtilities_siteView.handBack()` | Rend la caméra de l'éditeur en quittant l'outil (toolCam.handBack(false)). | 121 |
| `editor_toolUtilities_siteView.init(c)` | Lie le module à l'outil hôte en stockant le contexte. `ring` renvoie le contour à cadrer, `terrainZ` le sol sous un point, `selIndex` la sélection courante (pour recadrer quand elle change) et `onStep` est appelé quand l'étape change. | 32 |
| `editor_toolUtilities_siteView.isShaping()` | Vrai quand l'étape courante est 'footprint'. | 131 |
| `editor_toolUtilities_siteView.reset()` | Remet l'état d'ouverture de l'outil : étape design, mode rotate, puis active et cadre la caméra en orbite. | 126 |
| `editor_toolUtilities_siteView.setMode(m)` | Change de caméra. Vers 'free' : rend la caméra à l'éditeur. Depuis 'free' vers un autre mode : reprend la main et cadre ; sinon, recadre simplement. | 71 |
| `editor_toolUtilities_siteView.setStep(key)` | Change d'étape d'édition et appelle ctx.onStep(key). 'footprint' impose la caméra pan (les nœuds sont dessinés à plat) et retient si l'utilisateur était en free ; en quittant, restaure free si c'était le cas, sinon repasse en rotate. | 86 |

### Détail des paramètres

#### `editor_toolUtilities_siteView.activate(m)`

Prend la main sur la caméra de l'éditeur (toolCam.takeOver) puis cadre la sélection.

- `m` (*string|nil*) : Mode à activer ; par défaut le mode courant.

#### `editor_toolUtilities_siteView.clickMode(m)`

Action d'un bouton de caméra : bascule vers ce mode, ou recadre s'il est déjà actif (sauf 'free', où rien ne se passe). C'est ce deuxième appui qui sert de « aller au site ».

- `m` (*string*) : Mode du bouton cliqué.

#### `editor_toolUtilities_siteView.drive(blocked)`

Pilotage par frame de la caméra (toolCam.drive), sauf en mode free.

- `blocked` (*boolean*) : Supprime le mouvement pendant les interactions modales de l'outil (tracé, glissement d'une poignée).

#### `editor_toolUtilities_siteView.focus(m)`

Envoie la caméra active (pan ou orbite) vers la sélection, d'après le contour fourni par ring(). Mémorise aussi la sélection courante.

- `m` (*string|nil*) : 'pan' ou autre (orbite) ; par défaut le mode courant.

#### `editor_toolUtilities_siteView.getMode()`

Renvoie le mode de caméra courant.

- **renvoie** : string 'pan', 'rotate' ou 'free'.

#### `editor_toolUtilities_siteView.getStep()`

Renvoie l'étape courante.

- **renvoie** : string 'footprint' ou 'design'.

#### `editor_toolUtilities_siteView.init(c)`

Lie le module à l'outil hôte en stockant le contexte. `ring` renvoie le contour à cadrer, `terrainZ` le sol sous un point, `selIndex` la sélection courante (pour recadrer quand elle change) et `onStep` est appelé quand l'étape change.

- `c` (*table*) : Contexte { ring, terrainZ, selIndex, onStep }.

#### `editor_toolUtilities_siteView.isShaping()`

Vrai quand l'étape courante est 'footprint'.

- **renvoie** : boolean step == 'footprint'.

#### `editor_toolUtilities_siteView.setMode(m)`

Change de caméra. Vers 'free' : rend la caméra à l'éditeur. Depuis 'free' vers un autre mode : reprend la main et cadre ; sinon, recadre simplement.

- `m` (*string*) : 'pan', 'rotate' ou 'free'.

#### `editor_toolUtilities_siteView.setStep(key)`

Change d'étape d'édition et appelle ctx.onStep(key). 'footprint' impose la caméra pan (les nœuds sont dessinés à plat) et retient si l'utilisateur était en free ; en quittant, restaure free si c'était le cas, sinon repasse en rotate.

- `key` (*string*) : 'footprint' ou 'design'.

## Champs

| Champ | Type | Description |
|---|---|---|
| `modes` | table | Liste des boutons de caméra : { mode = 'pan'\|'rotate'\|'free', icon, tip }. |
| `steps` | table | Liste des étapes d'édition proposées dans l'interface : { key = 'footprint', label, icon } et { key = 'design', label, icon }. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteView.lua`.*

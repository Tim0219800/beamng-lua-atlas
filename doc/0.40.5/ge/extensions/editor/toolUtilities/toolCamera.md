# `editor_toolUtilities_toolCamera`

*Fichier : `lua/ge/extensions/editor/toolUtilities/toolCamera.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_toolCamera` : `extensions.load("editor_toolUtilities_toolCamera")`, puis la globale `editor_toolUtilities_toolCamera`

Caméra d'outil réutilisable : prend la main sur la caméra de l'éditeur avec la caméra pilotée par script 'scriptedFree' de BeamNG, la pilote chaque frame avec le glisser du bouton droit et la molette dans le viewport (via cameraRig), et lance des transitions lissées (smoothstep) vers un cadrage « pan » (vue de dessus) ou « orbite ». Pendant qu'elle conduit, elle bloque dans le groupe de filtre 'toolCameraZoom' les actions editorCameraZoom et changeCameraSpeed.

## Exemple

```lua
local cam = require('editor/toolUtilities/toolCamera')
cam.takeOver()
cam.flyOrbit(x, y, z, 20)
-- chaque frame : cam.drive(false)
-- en sortant : cam.handBack(true)
```

## Remarques

- flyPan, flyOrbit et recenterOrbit ne font rien tant que takeOver n'a pas été appelé (active == false).
- Durée d'un vol : de 1 s à 2 s selon la distance (2 s à partir de 400 m) quand `time` est nil.
- recenterOrbit glisse en 0.5 s par défaut.
- Le bouton droit pilote la caméra ; le bouton gauche reste libre pour l'outil.
- En mode pan la caméra reste dans l'emprise du terrain (marge d'une case) et flotte à hauteur constante au-dessus du terrain moyen en vue.
- drive ne fait rien pendant qu'une animation de caméra est en cours.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_toolCamera.drive(blocked)` | Pilotage interactif par frame : collecte le glisser bouton droit et la molette dans le viewport (ignorés si l'UI ou un état occupé déclaré par l'hôte capte la souris) et applique la pose de cameraRig à scriptedFree. Force l'affichage du curseur pendant le glisser pour que MouseDelta continue à être renseigné. | 183 |
| `editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time)` | Vol vers un cadrage ORBITE sur (x, y, z). `radius` dimensionne le recul pour bien cadrer le sujet ; yaw et pitch remplacent l'angle 3/4 par défaut (pour aborder un détail depuis une direction extérieure connue). | 160 |
| `editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time)` | Vol vers un cadrage PAN vu de dessus. Le point est tenu dans l'emprise du terrain. Si groundZ est absent, la hauteur du sol est échantillonnée sur le terrain. | 137 |
| `editor_toolUtilities_toolCamera.handBack(animate)` | Rend la caméra de l'éditeur : débloque la molette et revient à la caméra globale mémorisée. Sans effet si on ne conduit pas. | 121 |
| `editor_toolUtilities_toolCamera.isActive()` | Vrai si le module conduit scriptedFree. | 132 |
| `editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time)` | Glisse le PIVOT d'orbite sur (x, y, z) en GARDANT lacet, tangage et distance : le geste doux « recentrer sur ce que je viens de sélectionner », contrairement à flyOrbit qui recadre en 3/4. | 172 |
| `editor_toolUtilities_toolCamera.takeOver()` | Prend la main sur la caméra de l'éditeur : mémorise la caméra globale et sa pose, passe à 'scriptedFree' (locked, driveRot) à la même pose et bloque la molette de zoom standard. Sans effet si déjà actif ou sans core_camera. | 96 |

### Détail des paramètres

#### `editor_toolUtilities_toolCamera.drive(blocked)`

Pilotage interactif par frame : collecte le glisser bouton droit et la molette dans le viewport (ignorés si l'UI ou un état occupé déclaré par l'hôte capte la souris) et applique la pose de cameraRig à scriptedFree. Force l'affichage du curseur pendant le glisser pour que MouseDelta continue à être renseigné.

- `blocked` (*boolean|nil*) : Vrai : ne pas déplacer la caméra (interaction modale de l'outil).

#### `editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time)`

Vol vers un cadrage ORBITE sur (x, y, z). `radius` dimensionne le recul pour bien cadrer le sujet ; yaw et pitch remplacent l'angle 3/4 par défaut (pour aborder un détail depuis une direction extérieure connue).

- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- `z` (*number*) : Z monde.
- `radius` (*number|nil*) : Rayon du sujet.
- `yaw` (*number|nil*) : Lacet imposé.
- `pitch` (*number|nil*) : Tangage imposé.
- `time` (*number|nil*) : Durée en secondes (nil = selon la distance).

#### `editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time)`

Vol vers un cadrage PAN vu de dessus. Le point est tenu dans l'emprise du terrain. Si groundZ est absent, la hauteur du sol est échantillonnée sur le terrain.

- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- `groundZ` (*number|nil*) : Altitude du sol sous le point.
- `height` (*number|nil*) : Altitude absolue visée pour la caméra.
- `time` (*number|nil*) : Durée en secondes (0 = saut immédiat, nil = selon la distance).

#### `editor_toolUtilities_toolCamera.handBack(animate)`

Rend la caméra de l'éditeur : débloque la molette et revient à la caméra globale mémorisée. Sans effet si on ne conduit pas.

- `animate` (*boolean*) : Vrai : revient d'abord à la pose mémorisée par un vol lissé avant de rendre la main.

#### `editor_toolUtilities_toolCamera.isActive()`

Vrai si le module conduit scriptedFree.

- **renvoie** : boolean État actif.

#### `editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time)`

Glisse le PIVOT d'orbite sur (x, y, z) en GARDANT lacet, tangage et distance : le geste doux « recentrer sur ce que je viens de sélectionner », contrairement à flyOrbit qui recadre en 3/4.

- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- `z` (*number*) : Z monde.
- `time` (*number|nil*) : Durée en secondes (0.5 par défaut).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/toolCamera.lua`.*

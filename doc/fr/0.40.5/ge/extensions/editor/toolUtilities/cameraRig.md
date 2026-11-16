# `editor_toolUtilities_cameraRig`

*Fichier : `lua/ge/extensions/editor/toolUtilities/cameraRig.lua` · VM : Game Engine (GE) · 252 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_cameraRig` : `extensions.load("editor_toolUtilities_cameraRig")`, puis la globale `editor_toolUtilities_cameraRig`

Rig de caméra réutilisable pour les outils de l'éditeur : état de panoramique (pan, vue quasi aérienne nord en haut) et d'orbite avec inertie, qui produit une pose (pos, yaw, pitch, roll) pour une caméra pilotée par script (scriptedFree). Module d'état et de maths pur, sans couplage moteur : l'outil hôte lit les entrées, appelle update() chaque frame et pousse la pose renvoyée. Les transitions chronométrées entre focus restent à la charge de l'hôte.

## Remarques

- Les angles sont en degrés ; yaw 0 regarde vers +Y, un pitch positif regarde vers le bas.
- La position renvoyée est un vec3 partagé réutilisé à chaque appel : la copier pour la conserver.
- Le pan utilise pitch 89.9 (pas 90) et roll 0 pour éviter la dégénérescence de la base du quaternion.
- Constantes : pan hauteur 15 à 3000 m (défaut 220), zoom x0.86 par cran ; orbite distance 6 à 2500 m (défaut 130), pitch -30 à 88, marge au sol 2 m ; les deltas de souris > 250 px sont rejetés (recentrage du curseur caché).
- update() borne dt à 0.05 s.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height)` | Passe en mode PAN centré sur l'origine d'une emprise et renvoie sa pose cible vue de dessus. | 196 |
| `editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg)` | Passe en mode ORBITE centré sur le centroïde d'un bâtiment et renvoie sa pose cible en 3/4. La distance vaut radius*2.4 (bornée), sinon 130 m. | 209 |
| `editor_toolUtilities_cameraRig.getMode()` | Mode courant du rig. | 241 |
| `editor_toolUtilities_cameraRig.recenter(centroid)` | Déplace le PIVOT de l'orbite vers `centroid` en gardant yaw/pitch/distance, et renvoie la pose qui conserve le cadrage. Passe en mode orbite et annule l'inertie. | 223 |
| `editor_toolUtilities_cameraRig.settle()` | Annule toute inertie résiduelle (pan et orbite) et l'état de glissé ; à appeler quand une transition chronométrée se termine avant de rendre la main à l'interaction. | 234 |
| `editor_toolUtilities_cameraRig.update(dt, input)` | Avance la caméra interactive d'une frame et renvoie la pose à pousser. En pan, un glissé attrape le sol (avec inertie) ; en orbite il fait tourner autour du pivot (avec inertie) ; la molette zoome/dolly. | 98 |

### Détail des paramètres

#### `editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height)`

Passe en mode PAN centré sur l'origine d'une emprise et renvoie sa pose cible vue de dessus.

- `originXY` (*table|nil*) : {x=,y=} centre (0,0 si nil).
- `terrainH` (*number|nil*) : Altitude du sol ; si nil on garde la dernière connue.
- `height` (*number|nil*) : Hauteur de la caméra au-dessus du sol (bornée à 15-3000 m).
- **renvoie** : vec3 Position
- **renvoie** : number yaw
- **renvoie** : number pitch
- **renvoie** : number roll

#### `editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg)`

Passe en mode ORBITE centré sur le centroïde d'un bâtiment et renvoie sa pose cible en 3/4. La distance vaut radius*2.4 (bornée), sinon 130 m.

- `centroid` (*vec3|nil*) : Pivot (origine si nil).
- `radius` (*number|nil*) : Rayon englobant ; utilisé seulement s'il est > 1.
- `yawDeg` (*number|nil*) : Yaw initial (défaut 30).
- `pitchDeg` (*number|nil*) : Pitch initial (défaut 32, borné -30..88).
- **renvoie** : vec3 Position
- **renvoie** : number yaw
- **renvoie** : number pitch
- **renvoie** : number roll (0)

#### `editor_toolUtilities_cameraRig.getMode()`

Mode courant du rig.

- **renvoie** : string 'pan' (emprise) ou 'orbit' (volume).

#### `editor_toolUtilities_cameraRig.recenter(centroid)`

Déplace le PIVOT de l'orbite vers `centroid` en gardant yaw/pitch/distance, et renvoie la pose qui conserve le cadrage. Passe en mode orbite et annule l'inertie.

- `centroid` (*vec3|nil*) : Nouveau pivot (chaque composante manquante garde l'ancienne).
- **renvoie** : vec3 Position
- **renvoie** : number yaw
- **renvoie** : number pitch
- **renvoie** : number roll (0)

#### `editor_toolUtilities_cameraRig.update(dt, input)`

Avance la caméra interactive d'une frame et renvoie la pose à pousser. En pan, un glissé attrape le sol (avec inertie) ; en orbite il fait tourner autour du pivot (avec inertie) ; la molette zoome/dolly.

- `dt` (*number|nil*) : Durée de frame en secondes (plafonnée à 0.05).
- `input` (*table|nil*) : { dragActive:boolean, dragDX:number, dragDY:number (pixels écran), wheel:number (crans), groundZAt:function(x,y[,heightAbove])->number|nil (altitude du sol ; moyenne sur la vue si heightAbove), limitXY:function(x,y)->x,y (borne le centre du pan) }
- **renvoie** : vec3 Position de la caméra (vec3 partagé).
- **renvoie** : number yaw en degrés
- **renvoie** : number pitch en degrés
- **renvoie** : number roll en degrés

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/cameraRig.lua`.*

# `core_cameraInput`

*Fichier : `lua/ge/extensions/core/cameraInput.lua` · VM : Game Engine (GE) · 199 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_cameraInput` : `extensions.load("core_cameraInput")`, puis la globale `core_cameraInput`

Gestionnaires d'entrées caméra du joueur (regarder, se déplacer, zoomer, axes absolus de souris 3D/SpaceMouse), extraits de core/camera.lua. Ce n'est pas une extension : camera.lua fait require('core/cameraInput'), lui injecte moveFor et getFovDeg via setup(), puis ré-expose ces fonctions sur core_camera (les actions d'entrée appellent core_camera.rotate_yaw, etc.). Elles écrivent dans la structure MoveManager du joueur (champs yawLeft, yawRight, pitchUp, pitchDown, rollLeft, rollRight, forward, backward, left, right, up, down, zoomIn, zoomOut, yawRelative, pitchRelative, rollRelative, absXAxis, absYAxis, absZAxis), lue ensuite par les modes de caméra.

## Exemple

```lua
-- Normalement appelé par les bindings d'entrée :
core_camera.rotate_yaw(0.5, FILTER_PAD, 0)  -- tourner à droite à 50 %
core_camera.moveforward(1, 0)
```

## Remarques

- L'argument player est l'indice du joueur (0 par défaut) ; moveFor(player) renvoie la structure MoveManager de la vue de ce joueur.
- Les rotations 'relatives' (souris) sont mises à l'échelle du champ de vision : delta = fovDeg * val / 4500.
- Pour les axes absolus 3D : facteur de rotation 0.0005, facteur de translation 0.02 ; la valeur est la différence entre la valeur précédente et la nouvelle (donc un delta).
- yAxisMoveStep fait avancer à la vitesse val pendant 0.05 s (tickAbsAxes remet ensuite les axes à 0).
- yAxisMoveStep est sans effet si editor.disableCameraZoom est vrai ou si un contrôleur de cameraControllerRegistry consomme onEditorMouseWheel.
- Incohérence : yawAbs/rollAbs/pitchAbs/xAxisAbs/yAxisAbs/zAxisAbs écrivent dans la globale MoveManager (pas dans moveFor(player)) : ils ne gèrent donc pas plusieurs joueurs.
- Incohérence : les fonctions moveleft/moveright/moveforward/... (en minuscules) assignent la valeur directement, alors que moveForwardBackward/moveLeftRight gèrent un axe signé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_cameraInput.cameraZoom(val, player)` | Axe signé de zoom : val > 0 règle zoomIn, sinon zoomOut = -val. | 123 |
| `core_cameraInput.getLastCameraMovementType()` | Type de la dernière rotation caméra : 'absolute' (axes/touches), 'relative' (souris) ou 'none'. | 35 |
| `core_cameraInput.getLastFilter()` | Dernier type de source d'entrée utilisé pour tourner la caméra (FILTER_KBD clavier, FILTER_PAD manette, FILTER_MOUSE souris). Lu par les modes de caméra et l'UI. | 22 |
| `core_cameraInput.moveForwardBackward(val, player)` | Axe signé avant/arrière : val > 0 règle forward, sinon backward = -val. | 101 |
| `core_cameraInput.moveLeftRight(val, player)` | Axe signé gauche/droite : val > 0 règle right, sinon left = -val. | 112 |
| `core_cameraInput.movebackward(val, player)` | Touche de déplacement vers l'arrière : fixe moveFor(player).backward. | 156 |
| `core_cameraInput.movedown(val, player)` | Touche de déplacement vers le bas : fixe moveFor(player).down. | 158 |
| `core_cameraInput.moveforward(val, player)` | Touche de déplacement vers l'avant : fixe moveFor(player).forward. | 155 |
| `core_cameraInput.moveleft(val, player)` | Touche de déplacement à gauche (caméra libre ou réglage du siège conducteur) : fixe moveFor(player).left. | 153 |
| `core_cameraInput.moveright(val, player)` | Touche de déplacement à droite : fixe moveFor(player).right. | 154 |
| `core_cameraInput.moveup(val, player)` | Touche de déplacement vers le haut : fixe moveFor(player).up. | 157 |
| `core_cameraInput.pitchAbs(val)` | Axe absolu de tangage (souris 3D), même principe sur pitchRelative. | 167 |
| `core_cameraInput.rollAbs(val)` | Axe absolu de roulis (souris 3D), même principe que yawAbs sur rollRelative. | 166 |
| `core_cameraInput.rotate_pitch(val, filter, player)` | Axe signé de tangage : val > 0 règle pitchUp et annule pitchDown, sinon l'inverse. | 76 |
| `core_cameraInput.rotate_pitch_down(val, filter, player)` | Fixe l'entrée de tangage vers le bas. | 70 |
| `core_cameraInput.rotate_pitch_relative(val, player)` | Rotation relative (souris) en tangage, même principe que rotate_yaw_relative avec 'pitch'. | 143 |
| `core_cameraInput.rotate_pitch_up(val, filter, player)` | Fixe l'entrée de tangage vers le haut. | 64 |
| `core_cameraInput.rotate_roll_left(val, filter, player)` | Fixe l'entrée de roulis vers la gauche. | 95 |
| `core_cameraInput.rotate_roll_right(val, filter, player)` | Fixe l'entrée de roulis vers la droite. | 89 |
| `core_cameraInput.rotate_yaw(val, filter, player)` | Axe signé de lacet : val > 0 règle yawRight et annule yawLeft, val <= 0 l'inverse. | 51 |
| `core_cameraInput.rotate_yaw_left(val, filter, player)` | Fixe l'entrée de lacet gauche et mémorise le filtre et l'instant de rotation. | 39 |
| `core_cameraInput.rotate_yaw_relative(val, player)` | Rotation relative (souris) en lacet. Offre d'abord l'évènement au registre de contrôleurs (onRelativeInput 'yaw') ; s'il n'est pas consommé, ajoute fov*val/4500 à yawRelative. | 134 |
| `core_cameraInput.rotate_yaw_right(val, filter, player)` | Fixe l'entrée de lacet droite. | 45 |
| `core_cameraInput.setup(deps)` | Injection des dépendances par camera.lua : fonctions moveFor(player) et getFovDeg(). *(interne)* | 15 |
| `core_cameraInput.tickAbsAxes(dtReal)` | Appelée à chaque frame par la vue principale : remet à zéro les axes de translation absolus une fois la fenêtre de 0.05 s écoulée. *(interne)* | 187 |
| `core_cameraInput.timeSinceLastRotation(player)` | Temps écoulé depuis la dernière rotation de la caméra par ce joueur. | 31 |
| `core_cameraInput.xAxisAbs(val)` | Axe absolu de translation X (souris 3D) : MoveManager.absXAxis = (précédent - val) * 0.02. | 172 |
| `core_cameraInput.yAxisAbs(val)` | Axe absolu de translation Y (souris 3D) : MoveManager.absYAxis = (précédent - val) * 0.02. | 173 |
| `core_cameraInput.yAxisMoveStep(val)` | Déplacement par petit pas (zoom molette de souris 3D) : avance à la vitesse val pendant 0.05 s. Ignoré si le zoom caméra est désactivé dans l'éditeur ou consommé par un contrôleur (onEditorMouseWheel, val/20). | 178 |
| `core_cameraInput.yawAbs(val)` | Axe absolu de lacet (souris 3D) : MoveManager.yawRelative = (précédent - val) * 0.0005. | 165 |
| `core_cameraInput.zAxisAbs(val)` | Axe absolu de translation Z (souris 3D) : MoveManager.absZAxis = (précédent - val) * 0.02. | 174 |

### Détail des paramètres

#### `core_cameraInput.cameraZoom(val, player)`

Axe signé de zoom : val > 0 règle zoomIn, sinon zoomOut = -val.

- `val` (*number*) : Valeur signée
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.getLastCameraMovementType()`

Type de la dernière rotation caméra : 'absolute' (axes/touches), 'relative' (souris) ou 'none'.

- **renvoie** : string 'absolute', 'relative' ou 'none'

#### `core_cameraInput.getLastFilter()`

Dernier type de source d'entrée utilisé pour tourner la caméra (FILTER_KBD clavier, FILTER_PAD manette, FILTER_MOUSE souris). Lu par les modes de caméra et l'UI.

- **renvoie** : integer Constante FILTER_*

#### `core_cameraInput.moveForwardBackward(val, player)`

Axe signé avant/arrière : val > 0 règle forward, sinon backward = -val.

- `val` (*number*) : Valeur signée
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.moveLeftRight(val, player)`

Axe signé gauche/droite : val > 0 règle right, sinon left = -val.

- `val` (*number*) : Valeur signée
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.movebackward(val, player)`

Touche de déplacement vers l'arrière : fixe moveFor(player).backward.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.movedown(val, player)`

Touche de déplacement vers le bas : fixe moveFor(player).down.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.moveforward(val, player)`

Touche de déplacement vers l'avant : fixe moveFor(player).forward.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.moveleft(val, player)`

Touche de déplacement à gauche (caméra libre ou réglage du siège conducteur) : fixe moveFor(player).left.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.moveright(val, player)`

Touche de déplacement à droite : fixe moveFor(player).right.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.moveup(val, player)`

Touche de déplacement vers le haut : fixe moveFor(player).up.

- `val` (*number*) : Valeur [0..1]
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.pitchAbs(val)`

Axe absolu de tangage (souris 3D), même principe sur pitchRelative.

- `val` (*number*) : Position absolue de l'axe

#### `core_cameraInput.rollAbs(val)`

Axe absolu de roulis (souris 3D), même principe que yawAbs sur rollRelative.

- `val` (*number*) : Position absolue de l'axe

#### `core_cameraInput.rotate_pitch(val, filter, player)`

Axe signé de tangage : val > 0 règle pitchUp et annule pitchDown, sinon l'inverse.

- `val` (*number*) : Valeur signée [-1..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_pitch_down(val, filter, player)`

Fixe l'entrée de tangage vers le bas.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_pitch_relative(val, player)`

Rotation relative (souris) en tangage, même principe que rotate_yaw_relative avec 'pitch'.

- `val` (*number*) : Delta de souris
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_pitch_up(val, filter, player)`

Fixe l'entrée de tangage vers le haut.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_roll_left(val, filter, player)`

Fixe l'entrée de roulis vers la gauche.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_roll_right(val, filter, player)`

Fixe l'entrée de roulis vers la droite.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_yaw(val, filter, player)`

Axe signé de lacet : val > 0 règle yawRight et annule yawLeft, val <= 0 l'inverse.

- `val` (*number*) : Valeur signée [-1..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_yaw_left(val, filter, player)`

Fixe l'entrée de lacet gauche et mémorise le filtre et l'instant de rotation.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_yaw_relative(val, player)`

Rotation relative (souris) en lacet. Offre d'abord l'évènement au registre de contrôleurs (onRelativeInput 'yaw') ; s'il n'est pas consommé, ajoute fov*val/4500 à yawRelative.

- `val` (*number*) : Delta de souris
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.rotate_yaw_right(val, filter, player)`

Fixe l'entrée de lacet droite.

- `val` (*number*) : Valeur de l'axe [0..1]
- `filter` (*integer*) : Source d'entrée FILTER_*
- `player` (*integer|nil*) : Indice du joueur

#### `core_cameraInput.setup(deps)`

Injection des dépendances par camera.lua : fonctions moveFor(player) et getFovDeg().

- `deps` (*table*) : {moveFor = function(player), getFovDeg = function()}

#### `core_cameraInput.tickAbsAxes(dtReal)`

Appelée à chaque frame par la vue principale : remet à zéro les axes de translation absolus une fois la fenêtre de 0.05 s écoulée.

- `dtReal` (*number*) : Pas de temps réel (s)

#### `core_cameraInput.timeSinceLastRotation(player)`

Temps écoulé depuis la dernière rotation de la caméra par ce joueur.

- `player` (*integer|nil*) : Indice du joueur, 0 par défaut
- **renvoie** : number Durée en millisecondes (horloge système)

#### `core_cameraInput.xAxisAbs(val)`

Axe absolu de translation X (souris 3D) : MoveManager.absXAxis = (précédent - val) * 0.02.

- `val` (*number*) : Position absolue de l'axe

#### `core_cameraInput.yAxisAbs(val)`

Axe absolu de translation Y (souris 3D) : MoveManager.absYAxis = (précédent - val) * 0.02.

- `val` (*number*) : Position absolue de l'axe

#### `core_cameraInput.yAxisMoveStep(val)`

Déplacement par petit pas (zoom molette de souris 3D) : avance à la vitesse val pendant 0.05 s. Ignoré si le zoom caméra est désactivé dans l'éditeur ou consommé par un contrôleur (onEditorMouseWheel, val/20).

- `val` (*number*) : Vitesse du pas

#### `core_cameraInput.yawAbs(val)`

Axe absolu de lacet (souris 3D) : MoveManager.yawRelative = (précédent - val) * 0.0005.

- `val` (*number*) : Position absolue de l'axe

#### `core_cameraInput.zAxisAbs(val)`

Axe absolu de translation Z (souris 3D) : MoveManager.absZAxis = (précédent - val) * 0.02.

- `val` (*number*) : Position absolue de l'axe

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraInput.lua`.*

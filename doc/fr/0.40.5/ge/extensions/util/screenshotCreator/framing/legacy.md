# `util_screenshotCreator_framing_legacy`

*Fichier : `lua/ge/extensions/util/screenshotCreator/framing/legacy.lua` · VM : Game Engine (GE) · 359 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_framing_legacy` : `extensions.load("util_screenshotCreator_framing_legacy")`, puis la globale `util_screenshotCreator_framing_legacy`

Mode de cadrage « Legacy (pre-r186184) » du créateur de captures : calcule la position et l'orientation de la caméra pour qu'un véhicule tienne dans l'image, avec l'ancienne méthode (FOV fixe de 20°). Il s'enregistre auprès de util_screenshotCreator_framingManager via le hook onScreenshotCreatorCollectFramingModes (id « legacy », ordre 50). Il retient les nœuds du véhicule (hors antennes, drapeaux, nœuds non collidables et nœuds sous le sol), cherche par dichotomie la distance de caméra minimale qui garde tous les points d'extrémité dans les marges, puis relève la caméra si elle passe sous 0,75 m au-dessus du point le plus bas.

## Exemple

```lua
local res, err = util_screenshotCreator_framing_legacy.resolve({vehicle = be:getPlayerVehicle(0), resolution = {500, 281}})
if res then core_camera.setPosRot(0, res.pos.x, res.pos.y, res.pos.z, res.rot.x, res.rot.y, res.rot.z, res.rot.w) end
```

## Remarques

- FOV fixe à 20° (champ fov du résultat) ; context.fov est ignoré par ce mode.
- Résolution par défaut {500, 281}, plan proche par défaut 0,1.
- Les marges ne sont appliquées que si context.useFramingMargins (ou context.useMargins) vaut true. Sans context.margin, elles ne sont lues dans les réglages que pour la résolution par défaut 500x281, sinon la marge est nulle.
- Hauteur minimale de la caméra : 0,75 m au-dessus du nœud le plus bas ; au besoin l'élévation est augmentée (jusqu'à 85°), sauf si context.fixedRotation est fourni.
- Le champ boundBy de framingData indique le côté (left/right/top/bottom) qui limite le cadrage, ou « fallback ».

**Dépendances (chargées avant) :** `core_vehicle_manager`, `util_screenshotCreator_settings`, `util_screenshotCreator_thumbnailConfig`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_framing_legacy.frame(context)` | Alias de resolve (même fonction). | 276 |
| `util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName)` | Construit les données géométriques de cadrage d'un véhicule : boîte englobante orientée selon les axes de référence, centre, demi-étendues, point visé, direction de caméra et points d'extrémité (jusqu'à 100 nœuds max et 100 min par axe). Ne calcule pas la distance de caméra. | 45 |
| `util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes)` | Hook appelé par framingManager lors de la collecte des modes. Ajoute à la liste le mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve}. *(interne)* *(hook)* | 342 |
| `util_screenshotCreator_framing_legacy.resolve(context)` | Calcule la caméra de cadrage legacy pour context.vehicle. Renvoie une table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, ou nil et un message d'erreur si context.vehicle manque. | 276 |

### Détail des paramètres

#### `util_screenshotCreator_framing_legacy.frame(context)`

Alias de resolve (même fonction).

- `context` (*table*) : Voir resolve.
- **renvoie** : table|nil Voir resolve.
- **renvoie** : string|nil Message d'erreur.

#### `util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName)`

Construit les données géométriques de cadrage d'un véhicule : boîte englobante orientée selon les axes de référence, centre, demi-étendues, point visé, direction de caméra et points d'extrémité (jusqu'à 100 nœuds max et 100 min par axe). Ne calcule pas la distance de caméra.

- `vehicle` (*table*) : Objet véhicule.
- `fixedRotation` (*quat|nil*) : Orientation de caméra imposée ; sinon calculée à partir de la direction (-0.75, -0.66, 0.07) dans le repère du véhicule.
- `configName` (*string|nil*) : Nom de configuration passé à thumbnailConfig.getReferenceAxes pour choisir les axes de référence.
- **renvoie** : table framingData (bb, center, axis0..2, halfExtents, floorZ, lookAtPoint, camRot, camRight/Forward/Up, framingPoints…).

#### `util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes)`

Hook appelé par framingManager lors de la collecte des modes. Ajoute à la liste le mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve}.

- `modes` (*table[]*) : Liste à compléter.

#### `util_screenshotCreator_framing_legacy.resolve(context)`

Calcule la caméra de cadrage legacy pour context.vehicle. Renvoie une table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, ou nil et un message d'erreur si context.vehicle manque.

- `context` (*table*) : Contexte de cadrage : vehicle (obligatoire), resolution ({largeur, hauteur}), aspectRatio, nearPlane, fixedRotation (quat imposé), configName, useFramingMargins/useMargins (boolean), margin ({left,right,top,bottom,extraBottom}).
- **renvoie** : table|nil Résultat de cadrage (pos: vec3, rot: quat, fov, name, debugData, framingData).
- **renvoie** : string|nil Message d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_vehicle_manager, util_screenshotCreator_settings, util_screenshotCreator_thumbnailConfig. |

## Appels vers le moteur (C++)

- `be:` `getSurfaceHeightBelow`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/framing/legacy.lua`.*

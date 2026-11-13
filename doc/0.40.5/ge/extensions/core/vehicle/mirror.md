# `core_vehicle_mirror`

*Fichier : `lua/ge/extensions/core/vehicle/mirror.lua` · VM : Game Engine (GE) · 322 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_mirror` : `extensions.load("core_vehicle_mirror")`, puis la globale `core_vehicle_mirror`

Extension GE `core_vehicle_mirror` : réglage des angles des rétroviseurs d'un véhicule. Lit la liste des miroirs de vdata.mirrors, applique un décalage d'angle (offsetNormal) aux miroirs via veh:getMirror(id), mémorise les réglages par modèle et par config dans settings/mirrorOffsets.json, les réapplique à chaque apparition du véhicule, gère le glisser à la souris (vehicleEvent) et déplace la caméra conducteur vers un miroir (focusOnMirror). Contient aussi une petite fenêtre imgui de debug.

## Exemple

```lua
local offsets = core_vehicle_mirror.getAnglesOffset()   -- [nomMesh] = {name, id, angleOffset = {x, z}, clampX, clampZ, position, icon, row, label}
core_vehicle_mirror.setAngleOffset('mirror_L', 5, -3, nil, true)   -- x, z en degrés, sauvegarde
```

## Remarques

- Les angles sont en degrés (x : vers le haut/bas, z : gauche/droite), bornés par défaut à ±20° (MAXDEGREE) ou par clampX/clampZ définis dans le jbeam du miroir. Ils sont enregistrés par `veh.JBeam` puis par nom de config ('custom' si la config est une table sérialisée), puis par nom de mesh du miroir.
- Le véhicule visé est celui de core_vehicle_configTarget (ou le véhicule passé en argument).
- BUG : M.onExtensionUnloaded et M.onClientEndMission sont assignés à des variables locales jamais définies (valent nil) ; ces hooks n'existent donc pas.
- onVehicleSpawned teste `if #offset` sur une table à clés textuelles : #offset vaut 0, qui est vrai en Lua, donc le test est toujours passé ; il ne dépend pas du contenu.
- Le conflit de noms avec core_vehicleMirrors (fichier distinct, dans core/) est à noter : core_vehicle_mirror gère l'orientation des miroirs, core_vehicleMirrors le rendu (inactif) de leurs reflets.

**Dépendances (chargées avant) :** `ui_imgui`, `core_vehicle_configTarget`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_mirror.focusOnMirror(mirror_name)` | Passe en caméra conducteur et, si le miroir est hors du champ de vision, oriente la caméra (relativeYaw/relativePitch) vers lui. Sans nom, restaure l'orientation d'avant la mise au point. | 250 |
| `core_vehicle_mirror.getAnglesOffset(vid, v)` | Liste les miroirs du véhicule avec leur décalage d'angle actuel (réglage mémorisé ou 0) et leurs bornes. | 73 |
| `core_vehicle_mirror.onDeserialized(data)` | Hook : restaure la fenêtre de debug et recalcule le ratio d'écran. *(interne)* *(hook)* | 49 |
| `core_vehicle_mirror.onExtensionLoaded()` | Hook : charge les réglages depuis settings/mirrorOffsets.json. *(interne)* *(hook)* | 297 |
| `core_vehicle_mirror.onSerialize()` | Hook : sauvegarde l'état d'ouverture de la fenêtre de debug. *(interne)* *(hook)* | 43 |
| `core_vehicle_mirror.onSettingsChanged()` | Hook : recalcule le ratio degrés/pixel de la souris d'après la résolution (20° sur la moyenne largeur+hauteur). *(interne)* *(hook)* | 54 |
| `core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : applique le glisser souris en cours et affiche la fenêtre de debug si ouverte. *(interne)* *(hook)* | 166 |
| `core_vehicle_mirror.onVehicleDestroyed(vid)` | Hook : un véhicule est détruit (ne fait rien). *(interne)* *(hook)* | 59 |
| `core_vehicle_mirror.onVehicleSpawned(vid, veh)` | Hook : un véhicule apparaît ; réapplique les réglages mémorisés de tous ses miroirs. *(interne)* *(hook)* | 62 |
| `core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save)` | Applique un décalage d'angle à un miroir (offsetNormal = (0,1,0) tourné de x et z) et mémorise le réglage pour le modèle/la config. | 119 |
| `core_vehicle_mirror.setDebug(newValue)` | Ouvre ou ferme la fenêtre imgui « core_vehicle_mirror Debugger » (curseurs X/Z par miroir). | 215 |
| `core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name)` | Évènement de souris sur un miroir dans le monde : 'onDown' commence un réglage par glisser, 'onUp' le termine et sauvegarde. Autre valeur : log d'erreur. | 223 |

### Détail des paramètres

#### `core_vehicle_mirror.focusOnMirror(mirror_name)`

Passe en caméra conducteur et, si le miroir est hors du champ de vision, oriente la caméra (relativeYaw/relativePitch) vers lui. Sans nom, restaure l'orientation d'avant la mise au point.

- `mirror_name` (*string|nil*) : nom du mesh du miroir ; nil = revenir à l'orientation précédente

#### `core_vehicle_mirror.getAnglesOffset(vid, v)`

Liste les miroirs du véhicule avec leur décalage d'angle actuel (réglage mémorisé ou 0) et leurs bornes.

- `vid` (*integer|nil*) : id du véhicule ; nil = celui de `v`
- `v` (*userdata|nil*) : objet véhicule ; nil = véhicule configuré
- **renvoie** : table<string, table> [nomMesh] = {name, id, angleOffset = {x, z}, clampX, clampZ, position (UiColumn), icon, row (UiRow), label} ; {} si pas de miroirs

#### `core_vehicle_mirror.onDeserialized(data)`

Hook : restaure la fenêtre de debug et recalcule le ratio d'écran.

- `data` (*table*) : données de onSerialize

#### `core_vehicle_mirror.onSerialize()`

Hook : sauvegarde l'état d'ouverture de la fenêtre de debug.

- **renvoie** : table {windowOpen}

#### `core_vehicle_mirror.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : applique le glisser souris en cours et affiche la fenêtre de debug si ouverte.

- `dtReal` (*number*) : temps réel (s)
- `dtSim` (*number*) : temps de simulation (s)
- `dtRaw` (*number*) : temps brut (s)

#### `core_vehicle_mirror.onVehicleDestroyed(vid)`

Hook : un véhicule est détruit (ne fait rien).

- `vid` (*integer*) : véhicule

#### `core_vehicle_mirror.onVehicleSpawned(vid, veh)`

Hook : un véhicule apparaît ; réapplique les réglages mémorisés de tous ses miroirs.

- `vid` (*integer*) : véhicule
- `veh` (*userdata*) : objet véhicule

#### `core_vehicle_mirror.setAngleOffset(mirrorName, x, z, v, save)`

Applique un décalage d'angle à un miroir (offsetNormal = (0,1,0) tourné de x et z) et mémorise le réglage pour le modèle/la config.

- `mirrorName` (*string*) : nom du mesh du miroir
- `x` (*number*) : angle X en degrés
- `z` (*number*) : angle Z en degrés
- `v` (*userdata|nil*) : véhicule ; nil = véhicule configuré
- `save` (*boolean|nil*) : true : écrit settings/mirrorOffsets.json

#### `core_vehicle_mirror.setDebug(newValue)`

Ouvre ou ferme la fenêtre imgui « core_vehicle_mirror Debugger » (curseurs X/Z par miroir).

- `newValue` (*boolean*) : true pour ouvrir

#### `core_vehicle_mirror.vehicleEvent(evtType, vid, mirror_name)`

Évènement de souris sur un miroir dans le monde : 'onDown' commence un réglage par glisser, 'onUp' le termine et sauvegarde. Autre valeur : log d'erreur.

- `evtType` (*string*) : 'onDown' ou 'onUp'
- `vid` (*integer*) : véhicule
- `mirror_name` (*string*) : nom du mesh du miroir

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'ui_imgui', 'core_vehicle_configTarget'} |
| `onClientEndMission` | nil | Vaut nil (variable locale non définie, voir notes). ⚠ référence `onClientEndMission` non définie dans le fichier (vaut probablement nil) |
| `onExtensionUnloaded` | nil | Vaut nil (variable locale non définie, voir notes). ⚠ référence `onExtensionUnloaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/mirror.lua`.*

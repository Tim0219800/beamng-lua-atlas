# `editor_vehicleEditor_liveEditor_vePowerTrain`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua` · VM : Game Engine (GE) · 107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_vePowerTrain` : `extensions.load("editor_vehicleEditor_liveEditor_vePowerTrain")`, puis la globale `editor_vehicleEditor_liveEditor_vePowerTrain`

Fenêtre 'Powertrain' (Powertrain Inspector) du Vehicle Editor live. Chaque frame elle demande au véhicule powertrain.serializeDevicesInfo() (stocké dans vEditor.powertrainDevices), propose un combo des devices triés par nom, puis affiche leurs données jbeam et leurs données live grâce à powerTrainUtils. Dépend de editor_veMain.

## Remarques

- Incohérence : exporte `onDeserialize` (sans 'd') alors que le hook d'extension est `onDeserialized` ; devicePtr/windowOpen ne sont donc probablement pas restaurés.
- La liste de devices est recalculée quand vEditor.resetDeviceString est vrai (changement de véhicule ou activation de l'éditeur).

**Dépendances (chargées avant) :** `editor_veMain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data)` | Restaure windowOpen et devicePtr (nom non standard). *(interne)* *(hook)* | 74 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onEditorActivated()` | Appelé à l'activation de l'éditeur : force le recalcul de la liste de devices. *(interne)* *(hook)* | 96 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize()` | Renvoie {windowOpen, devicePtr}. *(interne)* *(hook)* | 67 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt)` | Appelé chaque frame : demande les infos de devices au véhicule et dessine le combo, les données jbeam et les données live. *(interne)* *(hook)* | 20 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player)` | Au changement de véhicule, si l'éditeur est actif, vide la liste de devices et force le recalcul de la liste de noms. *(interne)* *(hook)* | 90 |
| `editor_vehicleEditor_liveEditor_vePowerTrain.open()` | Ouvre la fenêtre. | 79 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data)`

Restaure windowOpen et devicePtr (nom non standard).

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize()`

Renvoie {windowOpen, devicePtr}.

- **renvoie** : table {windowOpen = boolean, devicePtr = integer}

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt)`

Appelé chaque frame : demande les infos de devices au véhicule et dessine le combo, les données jbeam et les données live.

- `dt` (*number*) : Delta temps.

#### `editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player)`

Au changement de véhicule, si l'éditeur est actif, vide la liste de devices et force le recalcul de la liste de noms.

- `oldVehicle` (*integer*) : ID de l'ancien véhicule.
- `newVehicle` (*integer*) : ID du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Powertrain Inspector'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua`.*

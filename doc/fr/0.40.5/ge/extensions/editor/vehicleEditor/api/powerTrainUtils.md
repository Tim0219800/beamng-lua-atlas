# `editor_vehicleEditor_api_powerTrainUtils`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_api_powerTrainUtils` : `extensions.load("editor_vehicleEditor_api_powerTrainUtils")`, puis la globale `editor_vehicleEditor_api_powerTrainUtils`

Fonctions d'affichage imgui partagées par l'inspecteur de transmission du Vehicle Editor (vePowerTrain). Elles montrent les données jbeam d'un périphérique (arbre récursif) et ses données live (vitesses angulaires, couples, rapports, embrayage…), avec des champs spécifiques selon le type de device (combustionEngine, differential, shaft, manualGearbox, frictionClutch, torqueConverter, automaticGearbox, cvtGearbox, dctGearbox).

## Remarques

- Les valeurs `device` viennent de powertrain.serializeDevicesInfo() côté véhicule, copiées dans vEditor.powertrainDevices.
- showJbeamData lit vEditor.vdata.powertrain[deviceID] ; deviceID est l'index Lua 0-based utilisé par vePowerTrain.
- Pour manualGearbox, la boucle `for i=0,#device.gearDamages` utilise l'opérateur # sur une table qui peut commencer à 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device)` | Affiche les données live communes : inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia. | 102 |
| `editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device)` | Affiche en deux colonnes les champs live propres au type du device (par exemple engineLoad pour un moteur, diffAngle/outputAV2/outputTorque2 pour un différentiel, clutchAngle/lockSpring pour un embrayage). | 11 |
| `editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance)` | Affecte la globale `vEditor` à l'instance donnée. *(interne)* | 133 |
| `editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID)` | Affiche dans un nœud d'arbre 'All jbeam data' toutes les données jbeam du device vEditor.vdata.powertrain[deviceID]. | 126 |

### Détail des paramètres

#### `editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device)`

Affiche les données live communes : inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia.

- `device` (*table*) : Données live sérialisées du device.

#### `editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device)`

Affiche en deux colonnes les champs live propres au type du device (par exemple engineLoad pour un moteur, diffAngle/outputAV2/outputTorque2 pour un différentiel, clutchAngle/lockSpring pour un embrayage).

- `deviceType` (*string*) : Type du device (device.type).
- `device` (*table*) : Données live sérialisées du device.

#### `editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance)`

Affecte la globale `vEditor` à l'instance donnée.

- `editorInstance` (*table*) : Instance de l'éditeur (normalement editor_veMain).

#### `editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID)`

Affiche dans un nœud d'arbre 'All jbeam data' toutes les données jbeam du device vEditor.vdata.powertrain[deviceID].

- `deviceID` (*integer*) : Index du device dans vdata.powertrain (0-based).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua`.*

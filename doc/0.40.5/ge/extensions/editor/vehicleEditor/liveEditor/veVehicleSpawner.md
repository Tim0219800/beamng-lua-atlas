# `editor_vehicleEditor_liveEditor_veVehicleSpawner`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua` · VM : Game Engine (GE) · 184 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veVehicleSpawner` : `extensions.load("editor_vehicleEditor_liveEditor_veVehicleSpawner")`, puis la globale `editor_vehicleEditor_liveEditor_veVehicleSpawner`

Outil 'Other/Vehicle Spawner' du Vehicle Editor live. Au chargement de l'éditeur il mémorise jusqu'à 20 véhicules (Car ou Truck) de core_vehicles.getVehicleList. La fenêtre permet de faire apparaître un véhicule à la position/orientation de la caméra (fenêtre 'Select Vehicle'), de choisir un point sur le terrain (molette = rotation de 5°) puis d'y aligner tous les véhicules de la liste (espacés de 10 m), et de tout supprimer ('Despawn All').

## Remarques

- Les véhicules apparaissent avec le frein à main relâché (input.event('parkingbrake', 0, 1)).
- Seuls les véhicules créés par 'Spawn Vehicles' sont suivis dans vehsData et supprimés par 'Despawn All' ; ceux créés depuis 'Select Vehicle' ne sont pas enregistrés.
- Bug mineur : `hit = cameraMouseRayCast(...)` est affecté sans `local` (globale `hit`).
- Un bouton par véhicule de vehsList : au maximum 20 modèles proposés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 172 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : remplit vehsList avec les 20 premiers véhicules Car/Truck. *(interne)* *(hook)* | 152 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 166 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.onUpdate()` | Appelé chaque frame : dessine la fenêtre, les repères de départ et la fenêtre de sélection de véhicule. *(interne)* *(hook)* | 113 |
| `editor_vehicleEditor_liveEditor_veVehicleSpawner.open()` | Ouvre la fenêtre. | 148 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'Other/Vehicle Spawner'. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua`.*

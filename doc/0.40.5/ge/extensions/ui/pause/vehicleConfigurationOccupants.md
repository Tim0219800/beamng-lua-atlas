# `ui_pause_vehicleConfigurationOccupants`

*Fichier : `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_vehicleConfigurationOccupants` : `extensions.load("ui_pause_vehicleConfigurationOccupants")`, puis la globale `ui_pause_vehicleConfigurationOccupants`

**Dépendances (chargées avant) :** `gameplay_seatOccupants`, `core_multiseat`, `core_playerPersonas`, `core_vehicle_configTarget`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_vehicleConfigurationOccupants.beginSession(enabled)` |  | 118 |
| `ui_pause_vehicleConfigurationOccupants.endSession()` |  | 129 |
| `ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies()` |  | 202 |
| `ui_pause_vehicleConfigurationOccupants.getState()` |  | 102 |
| `ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded()` | *(hook)* | 263 |
| `ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged()` | *(hook)* | 232 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId)` | *(hook)* | 224 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId)` | *(hook)* | 228 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged()` | *(hook)* | 252 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId)` | *(hook)* | 246 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId)` | *(hook)* | 236 |
| `ui_pause_vehicleConfigurationOccupants.removeAllDummies()` |  | 216 |
| `ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled)` |  | 137 |
| `ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active)` |  | 143 |
| `ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant)` |  | 148 |
| `ui_pause_vehicleConfigurationOccupants.unseatAll()` |  | 194 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onVehicleReplaced` | any |  |
| `onVehicleResetted` | any |  |

**Évènements UI (guihooks.trigger) :** `VehicleConfigOccupantsStateChanged`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua`.*

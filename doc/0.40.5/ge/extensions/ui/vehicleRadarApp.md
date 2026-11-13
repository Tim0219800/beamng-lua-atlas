# `ui_vehicleRadarApp`

*Fichier : `lua/ge/extensions/ui/vehicleRadarApp.lua` · VM : Game Engine (GE) · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleRadarApp` : `extensions.load("ui_vehicleRadarApp")`, puis la globale `ui_vehicleRadarApp`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleRadarApp.onExtensionLoaded()` | *(hook)* | 58 |
| `ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 153 |
| `ui_vehicleRadarApp.onVehicleSpawned()` | *(hook)* | 296 |
| `ui_vehicleRadarApp.onVehicleSwitched()` | *(hook)* | 292 |
| `ui_vehicleRadarApp.updateSetting(key, value)` |  | 63 |

**Globales affectées :** `i`

**Évènements UI (guihooks.trigger) :** `VehicleRadarSettingsLoaded`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `be:` `getObject`, `getObjectByID`, `getObjectCount`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleRadarApp.lua`.*

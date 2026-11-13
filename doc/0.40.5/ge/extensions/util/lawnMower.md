# `util_lawnMower`

*Fichier : `lua/ge/extensions/util/lawnMower.lua` · VM : Game Engine (GE) · 270 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_lawnMower` : `extensions.load("util_lawnMower")`, puis la globale `util_lawnMower`

**Dépendances (chargées avant) :** `util_surfaceMaskWheels`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_lawnMower.onClientStartMission()` | *(hook)* | 233 |
| `util_lawnMower.onDeserialized(data)` | *(hook)* | 264 |
| `util_lawnMower.onExtensionLoaded()` | *(hook)* | 244 |
| `util_lawnMower.onPreRender(dtReal, dtSim)` | *(hook)* | 164 |
| `util_lawnMower.onSerialize()` | *(hook)* | 260 |
| `util_lawnMower.onVehicleDestroyed(vehId)` | *(hook)* | 239 |
| `util_lawnMower.onVehicleSpawned(vehId)` | *(hook)* | 229 |
| `util_lawnMower.setEnabled(enabled)` |  | 251 |
| `util_lawnMower.toggle()` |  | 256 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `enabled` | boolean | mask service + parsed vehicle data |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/lawnMower.lua`.*

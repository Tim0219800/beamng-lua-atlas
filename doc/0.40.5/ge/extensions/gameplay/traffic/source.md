# `gameplay_traffic_source`

*Fichier : `lua/ge/extensions/gameplay/traffic/source.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic_source` : `extensions.load("gameplay_traffic_source")`, puis la globale `gameplay_traffic_source`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic_source.addSource(mode, data)` |  | 34 |
| `gameplay_traffic_source.autoAddPlayers(defaultMode)` |  | 118 |
| `gameplay_traffic_source.getSources()` |  | 72 |
| `gameplay_traffic_source.onUpdate(dt, dtSim)` | *(hook)* | 167 |
| `gameplay_traffic_source.onVehicleResetted(vehId)` | *(hook)* | 157 |
| `gameplay_traffic_source.onVehicleSwitched(oldId, newId, player)` | split-screen often calls autoAddPlayers before anyone is seated; pick vehicles up when they appear *(hook)* | 151 |
| `gameplay_traffic_source.removeSource(index)` |  | 65 |
| `gameplay_traffic_source.resetSources()` |  | 17 |
| `gameplay_traffic_source.setSourceMode(mode, options)` |  | 76 |
| `gameplay_traffic_source.updateSource(index)` |  | 96 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/source.lua`.*

# `editor_scriptAIManager`

*Fichier : `lua/ge/extensions/editor/scriptAIManager.lua` · VM : Game Engine (GE) · 593 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_scriptAIManager` : `extensions.load("editor_scriptAIManager")`, puis la globale `editor_scriptAIManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_scriptAIManager.getCurrentRecordings()` |  | 576 |
| `editor_scriptAIManager.onDeserialized(data)` | *(hook)* | 561 |
| `editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw)` | *(hook)* | 464 |
| `editor_scriptAIManager.onEditorGui()` | public interface *(hook)* | 130 |
| `editor_scriptAIManager.onEditorInitialized()` | *(hook)* | 571 |
| `editor_scriptAIManager.onSerialize()` | persistence *(hook)* | 557 |
| `editor_scriptAIManager.onVehicleSubmitInfo(vehId, data)` | *(hook)* | 515 |
| `editor_scriptAIManager.onVehicleSubmitRecording(vehId, data)` | vehicle API, do not use directly *(hook)* | 509 |
| `editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player)` | *(hook)* | 567 |
| `editor_scriptAIManager.onWindowMenuItem()` | *(hook)* | 552 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueAllObjectLua`, `setPhysicsSpeedFactor`
- `debugDrawer:` `drawLine`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/scriptAIManager.lua`.*

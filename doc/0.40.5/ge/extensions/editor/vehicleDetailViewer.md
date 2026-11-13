# `editor_vehicleDetailViewer`

*Fichier : `lua/ge/extensions/editor/vehicleDetailViewer.lua` · VM : Game Engine (GE) · 629 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleDetailViewer` : `extensions.load("editor_vehicleDetailViewer")`, puis la globale `editor_vehicleDetailViewer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleDetailViewer.onDeserialized(data)` | *(hook)* | 297 |
| `editor_vehicleDetailViewer.onEditorInitialized()` | *(hook)* | 614 |
| `editor_vehicleDetailViewer.onExtensionLoaded()` | *(hook)* | 600 |
| `editor_vehicleDetailViewer.onExtensionUnloaded()` | *(hook)* | 605 |
| `editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 488 |
| `editor_vehicleDetailViewer.onSerialize()` | *(hook)* | 274 |
| `editor_vehicleDetailViewer.onVehicleSpawned(vehicleId)` | *(hook)* | 595 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawFrustum`, `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleDetailViewer.lua`.*

# `ui_console`

*Fichier : `lua/ge/extensions/ui/console.lua` · VM : Game Engine (GE) · 1267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_console` : `extensions.load("ui_console")`, puis la globale `ui_console`

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_console.hide()` |  | 172 |
| `ui_console.onDeserialized(data)` | *(hook)* | 1215 |
| `ui_console.onExtensionLoaded()` | *(hook)* | 1230 |
| `ui_console.onFileChanged(filename, type)` | *(hook)* | 1239 |
| `ui_console.onSerialize()` | *(hook)* | 1199 |
| `ui_console.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 556 |
| `ui_console.onVehicleActiveChanged()` | *(hook)* | 1178 |
| `ui_console.onVehicleDestroyed()` | *(hook)* | 1178 |
| `ui_console.onVehicleSpawned()` | *(hook)* | 1178 |
| `ui_console.onVehicleSwitched()` | *(hook)* | 1178 |
| `ui_console.show()` |  | 168 |
| `ui_console.toggle()` |  | 176 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `inputCallback` | any |  ⚠ référence `inputCallback` non définie dans le fichier (vaut probablement nil) |
| `onExtensionUnloaded` | any |  ⚠ référence `onExtensionUnloaded` non définie dans le fichier (vaut probablement nil) |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `ConsoleInputCallback(data)` |  | 429 |

## Appels vers le moteur (C++)

- `Engine.` `getFrameLog`
- `Lua:` `getDevLogStats`, `queueLuaCommand`
- `be:` `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueJS`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/console.lua`.*

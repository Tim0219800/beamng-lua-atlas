# `editor_veMain`

*Fichier : `lua/ge/extensions/editor/veMain.lua` · VM : Game Engine (GE) · 446 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_veMain` : `extensions.load("editor_veMain")`, puis la globale `editor_veMain`

**Dépendances (chargées avant) :** `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_veMain.onDeserialize(data)` | *(hook)* | 427 |
| `editor_veMain.onEditorHeadlessChange(enabled, toolName)` | *(hook)* | 318 |
| `editor_veMain.onEditorHeadlessMainMenuBar()` | this hook function is called by the editor when in headless mode to draw your own menubar *(hook)* | 405 |
| `editor_veMain.onEditorInitialized()` | *(hook)* | 310 |
| `editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 341 |
| `editor_veMain.onPreRender(dtReal, dtSim, dtRaw)` | Update data for other vehicle editors to use *(hook)* | 251 |
| `editor_veMain.onSerialize()` | *(hook)* | 421 |
| `editor_veMain.onVehicleDestroyed()` | *(hook)* | 333 |
| `editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player)` | *(hook)* | 314 |
| `editor_veMain.saveCurrentWindowLayout()` |  | 417 |
| `editor_veMain.toggleActive()` |  | 302 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleEditorRenderJBeams` — écouté par 5 module(s)

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/veMain.lua`.*

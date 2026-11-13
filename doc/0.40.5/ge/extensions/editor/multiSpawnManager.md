# `editor_multiSpawnManager`

*Fichier : `lua/ge/extensions/editor/multiSpawnManager.lua` · VM : Game Engine (GE) · 879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_multiSpawnManager` : `extensions.load("editor_multiSpawnManager")`, puis la globale `editor_multiSpawnManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_multiSpawnManager.loadGroup(filePath)` |  | 192 |
| `editor_multiSpawnManager.onEditorGui(dt)` | *(hook)* | 757 |
| `editor_multiSpawnManager.onEditorInitialized()` | *(hook)* | 863 |
| `editor_multiSpawnManager.onVehicleGroupSpawned()` | public interface *(hook)* | 853 |
| `editor_multiSpawnManager.onWindowMenuItem()` | *(hook)* | 857 |
| `editor_multiSpawnManager.saveGroup(file, filePath)` |  | 223 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `filePaths` | table |  |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/multiSpawnManager.lua`.*

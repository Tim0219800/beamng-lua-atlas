# `editor_sitesEditor`

*Fichier : `lua/ge/extensions/editor/sitesEditor.lua` · VM : Game Engine (GE) · 404 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sitesEditor` : `extensions.load("editor_sitesEditor")`, puis la globale `editor_sitesEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sitesEditor.allowGizmo()` |  | 387 |
| `editor_sitesEditor.getCurrentLocation()` |  | 389 |
| `editor_sitesEditor.getCurrentParkingSpot()` |  | 391 |
| `editor_sitesEditor.getCurrentSites()` |  | 388 |
| `editor_sitesEditor.getCurrentZone()` |  | 390 |
| `editor_sitesEditor.loadSites(loadPath)` |  | 30 |
| `editor_sitesEditor.managerSites()` |  | 216 |
| `editor_sitesEditor.onDeserialized(data)` | *(hook)* | 364 |
| `editor_sitesEditor.onEditorGui()` | *(hook)* | 79 |
| `editor_sitesEditor.onEditorInitialized()` | *(hook)* | 307 |
| `editor_sitesEditor.onEditorToolWindowGotFocus(windowName)` | *(hook)* | 378 |
| `editor_sitesEditor.onEditorToolWindowHide(windowName)` | *(hook)* | 372 |
| `editor_sitesEditor.onSerialize()` | *(hook)* | 357 |
| `editor_sitesEditor.saveSites(sites, savePath)` |  | 21 |
| `editor_sitesEditor.selectZone(elem, mode)` |  | 392 |
| `editor_sitesEditor.show()` |  | 284 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | any |  ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor.lua`.*

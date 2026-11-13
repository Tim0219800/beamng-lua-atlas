# `ui_appLayouts`

*Fichier : `lua/ge/extensions/ui/appLayouts.lua` · VM : Game Engine (GE) · 721 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appLayouts` : `extensions.load("ui_appLayouts")`, puis la globale `ui_appLayouts`

**Dépendances (chargées avant) :** `ui_apps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appLayouts.addApp(layoutId, appName, placement)` |  | 528 |
| `ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement)` |  | 573 |
| `ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings)` |  | 600 |
| `ui_appLayouts.clearLayoutForType(layoutType)` |  | 678 |
| `ui_appLayouts.createLayout(data)` |  | 455 |
| `ui_appLayouts.deleteLayout(filenameToDelete)` |  | 267 |
| `ui_appLayouts.duplicateLayout(filename, newTitle)` |  | 497 |
| `ui_appLayouts.getAvailableLayouts()` |  | 101 |
| `ui_appLayouts.getCurrentLayout()` |  | 355 |
| `ui_appLayouts.getLayoutForType(layoutType)` |  | 687 |
| `ui_appLayouts.getPlayerCameraModes()` |  | 643 |
| `ui_appLayouts.getTypeLayoutMap()` |  | 692 |
| `ui_appLayouts.isEditing()` |  | 634 |
| `ui_appLayouts.onCameraChanged(player, camName)` | *(hook)* | 657 |
| `ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex)` |  | 548 |
| `ui_appLayouts.renameLayout(filename, title)` |  | 482 |
| `ui_appLayouts.resetLayout(filenameToReset, layoutType)` |  | 299 |
| `ui_appLayouts.resetUsedLayout()` |  | 443 |
| `ui_appLayouts.saveLayout(data)` |  | 261 |
| `ui_appLayouts.setCurrentLayout(layoutOrFilename)` |  | 360 |
| `ui_appLayouts.setEditing(enabled)` |  | 629 |
| `ui_appLayouts.setLayoutForType(layoutType, filename)` |  | 665 |
| `ui_appLayouts.setUsedLayout(idOrType)` |  | 415 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `PlayerCameraModeChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appLayouts.lua`.*

# `editor_biomeTool`

*Fichier : `lua/ge/extensions/editor/biomeTool.lua` · VM : Game Engine (GE) · 3986 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_biomeTool` : `extensions.load("editor_biomeTool")`, puis la globale `editor_biomeTool`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_biomeTool.onEditorAfterSaveLevel()` | *(hook)* | 3962 |
| `editor_biomeTool.onEditorGui()` | *(hook)* | 3623 |
| `editor_biomeTool.onEditorInitialized()` | *(hook)* | 3903 |
| `editor_biomeTool.onEditorToolWindowGotFocus(windowName)` | *(hook)* | 3956 |
| `editor_biomeTool.onEditorToolWindowHide(windowName)` | *(hook)* | 3950 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | any |  ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Classe `var`

| Méthode | Description | Ligne |
|---|---|---|
| `var.getEPFalloff(layerType, layerID)` |  | 1473 |
| `var.getEPItemDistance(layerType, layerID)` |  | 1516 |
| `var.getEPRandomTiltRange(layerType, layerID)` |  | 1431 |
| `var.getFieldMinMax(layerType, layerID, fieldName)` |  | 1421 |
| `var.setEPFalloff(layerType, layerID, val)` |  | 1494 |
| `var.setEPItemDistance(layerType, layerID, val)` |  | 1537 |
| `var.setEPRandomTiltRange(layerType, layerID, range)` |  | 1447 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `obj:` `getClassName`, `getId`, `getInternalName`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/biomeTool.lua`.*

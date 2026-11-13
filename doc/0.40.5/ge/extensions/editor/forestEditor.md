# `editor_forestEditor`

*Fichier : `lua/ge/extensions/editor/forestEditor.lua` · VM : Game Engine (GE) · 3222 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_forestEditor` : `extensions.load("editor_forestEditor")`, puis la globale `editor_forestEditor`

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_forestEditor.beginChangeBrushSizeWithKeys(direction)` |  | 3215 |
| `editor_forestEditor.changeBrush(value, step)` |  | 1425 |
| `editor_forestEditor.clearForestItemsSelection()` | Drop the forest item selection, highlight included: the viewport glow is an instance flag fed by each<br> item's own selected state, so it only goes away by clearing that state and pushing the instance data<br> again. Nothing to do (and no rebuild to pay for) when nothing is selected. | 208 |
| `editor_forestEditor.dumpBrushProperties()` |  | 144 |
| `editor_forestEditor.dumpForestBrushes()` | Debug | 132 |
| `editor_forestEditor.dumpForestBrushesMap()` |  | 138 |
| `editor_forestEditor.endChangeBrushSizeWithKeys()` |  | 3216 |
| `editor_forestEditor.onDeserialize(data)` | *(hook)* | 3192 |
| `editor_forestEditor.onEditorAfterSaveLevel()` | *(hook)* | 3111 |
| `editor_forestEditor.onEditorAxisGizmoAligmentChanged()` | *(hook)* | 2881 |
| `editor_forestEditor.onEditorAxisGizmoModeChanged(mode)` | *(hook)* | 3179 |
| `editor_forestEditor.onEditorGui()` | *(hook)* | 2040 |
| `editor_forestEditor.onEditorInitialized()` | hooks *(hook)* | 3073 |
| `editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 3133 |
| `editor_forestEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 3159 |
| `editor_forestEditor.onSerialize()` | *(hook)* | 3196 |
| `editor_forestEditor.refreshForestItemDataList()` |  | 1459 |
| `editor_forestEditor.selectBrushByIndex(index)` |  | 3188 |
| `editor_forestEditor.selectForestItems(forestItems, addToSelection)` |  | 219 |
| `editor_forestEditor.selectToolByName(toolName)` |  | 367 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)
- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`
- `Sim.` `deserializeLineObjects`, `findObjectByIdNoUpcast`, `getDataBlockSet`, `getUniqueName`, `serializeToLineObjectsFile`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`
- `obj:` `add`, `delete`, `getClassName`, `getData`, `getId`, `getInternalName`, `getKey`, `getName`, `getPosition`, `getScale`, `getTransform`, `getUid`, `getWorldBox`, `setField`, `setInternalName`, `setName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `findDerivedDatablockClassname`, `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/forestEditor.lua`.*

# `editor_materialEditor`

*Fichier : `lua/ge/extensions/editor/materialEditor.lua` · VM : Game Engine (GE) · 3879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_materialEditor` : `extensions.load("editor_materialEditor")`, puis la globale `editor_materialEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine)` |  | 1749 |
| `editor_materialEditor.deleteMapButton(label, property, layer)` |  | 1552 |
| `editor_materialEditor.imageButton(label, property, layer, additionalGuiFn)` |  | 1598 |
| `editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip)` |  | 1869 |
| `editor_materialEditor.onEditorActivated()` | *(hook)* | 3786 |
| `editor_materialEditor.onEditorDeactivated()` | *(hook)* | 3816 |
| `editor_materialEditor.onEditorDeleteSelection()` | *(hook)* | 3846 |
| `editor_materialEditor.onEditorGui()` | *(hook)* | 3552 |
| `editor_materialEditor.onEditorInitialized()` | *(hook)* | 3827 |
| `editor_materialEditor.onEditorObjectSelectionChanged()` | *(hook)* | 3843 |
| `editor_materialEditor.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 3753 |
| `editor_materialEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 3771 |
| `editor_materialEditor.onFilesChanged(files)` | *(hook)* | 3738 |
| `editor_materialEditor.onVehicleSwitched(oid, nid, player)` | *(hook)* | 3729 |
| `editor_materialEditor.selectMaterialByName(matName, clearFilter)` |  | 948 |
| `editor_materialEditor.setMaterialDirty(materialObj)` |  | 1247 |
| `editor_materialEditor.setProperty(materialObj, property, layer, value)` |  | 1254 |
| `editor_materialEditor.showMaterialEditor()` |  | 3005 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `customMaterialsArray` | table |  |
| `customMaterialsArrayPtr` | any |  |
| `dbg` | boolean |  |
| `o` | table |  |
| `v` | table |  |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `isLinkFile`, `triggerFilesChanged`
- `obj:` `getField`, `getMaterialNames`, `getModelFile`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `getClassIsSelectable`, `setHoveredObjectId`, `setMaterialFocus`, `setMaterialFocusHighlight`, `setMaterialFocusIsolate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/materialEditor.lua`.*

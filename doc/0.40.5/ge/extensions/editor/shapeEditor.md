# `editor_shapeEditor`

*Fichier : `lua/ge/extensions/editor/shapeEditor.lua` · VM : Game Engine (GE) · 985 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_shapeEditor` : `extensions.load("editor_shapeEditor")`, puis la globale `editor_shapeEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_shapeEditor.onDeserialized(data)` | *(hook)* | 927 |
| `editor_shapeEditor.onEditorDeactivated()` | *(hook)* | 962 |
| `editor_shapeEditor.onEditorExitLevel()` | *(hook)* | 938 |
| `editor_shapeEditor.onEditorGui()` | *(hook)* | 436 |
| `editor_shapeEditor.onEditorInitialized()` | *(hook)* | 67 |
| `editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo)` | M.onPreRender = onPreRender *(hook)* | 899 |
| `editor_shapeEditor.onEditorObjectSelectionChanged()` | *(hook)* | 942 |
| `editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 952 |
| `editor_shapeEditor.onSerialize()` | *(hook)* | 920 |
| `editor_shapeEditor.showShapeEditorLoadFile(filename)` |  | 907 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `removeFile`
- `obj:` `deleteObject`, `getClassName`, `getModelFile`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/shapeEditor.lua`.*

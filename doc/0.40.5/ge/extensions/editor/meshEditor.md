# `editor_meshEditor`

*Fichier : `lua/ge/extensions/editor/meshEditor.lua` · VM : Game Engine (GE) · 1081 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshEditor` : `extensions.load("editor_meshEditor")`, puis la globale `editor_meshEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshEditor.copySettingsAM()` | These methods are for the action map to call | 964 |
| `editor_meshEditor.onActivate_()` | *(hook)* | 1060 |
| `editor_meshEditor.onDeleteSelection()` | *(hook)* | 269 |
| `editor_meshEditor.onDeselect_()` | *(hook)* | 1055 |
| `editor_meshEditor.onEditorAxisGizmoAligmentChanged_()` | *(hook)* | 1040 |
| `editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 1029 |
| `editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo)` | *(hook)* | 354 |
| `editor_meshEditor.onEditorObjectSelectionChanged_()` | *(hook)* | 1047 |
| `editor_meshEditor.onEditorPreferenceValueChanged_(path, value)` | *(hook)* | 1011 |
| `editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry)` | *(hook)* | 1015 |
| `editor_meshEditor.onSelectAll()` | *(hook)* | 53 |
| `editor_meshEditor.onToolbar_()` | *(hook)* | 984 |
| `editor_meshEditor.onUpdate_()` | *(hook)* | 735 |
| `editor_meshEditor.pasteFieldsAM()` |  | 129 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `setSolidTriCulling`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshEditor.lua`.*

# `editor_decalEditor`

*Fichier : `lua/ge/extensions/editor/decalEditor.lua` · VM : Game Engine (GE) · 1400 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalEditor` : `extensions.load("editor_decalEditor")`, puis la globale `editor_decalEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalEditor.onEditorAxisGizmoAligmentChanged()` | *(hook)* | 282 |
| `editor_decalEditor.onEditorBeforeSaveLevel()` | *(hook)* | 1335 |
| `editor_decalEditor.onEditorGui()` | *(hook)* | 1359 |
| `editor_decalEditor.onEditorInitialized()` | *(hook)* | 1316 |
| `editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 1339 |
| `editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo)` | *(hook)* | 1017 |
| `editor_decalEditor.onExtensionLoaded()` | *(hook)* | 1301 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalEditor.lua`.*

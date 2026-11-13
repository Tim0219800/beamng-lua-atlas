# `editor_dataBlockEditor`

*Fichier : `lua/ge/extensions/editor/dataBlockEditor.lua` · VM : Game Engine (GE) · 303 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dataBlockEditor` : `extensions.load("editor_dataBlockEditor")`, puis la globale `editor_dataBlockEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dataBlockEditor.onEditorGui()` | *(hook)* | 138 |
| `editor_dataBlockEditor.onEditorInitialized()` | *(hook)* | 114 |
| `editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 285 |
| `editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo)` | *(hook)* | 101 |
| `editor_dataBlockEditor.onEditorObjectSelectionChanged()` | *(hook)* | 292 |
| `editor_dataBlockEditor.onExtensionLoaded()` | *(hook)* | 123 |

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`
- `obj:` `isSubClassOf`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dataBlockEditor.lua`.*

# `editor_particleEditor`

*Fichier : `lua/ge/extensions/editor/particleEditor.lua` · VM : Game Engine (GE) · 578 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_particleEditor` : `extensions.load("editor_particleEditor")`, puis la globale `editor_particleEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_particleEditor.onEditorInitialized()` | *(hook)* | 544 |
| `editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 457 |
| `editor_particleEditor.onEditorInspectorHeaderGui()` | *(hook)* | 291 |
| `editor_particleEditor.onExtensionLoaded()` | *(hook)* | 561 |
| `editor_particleEditor.onExtensionUnloaded()` | *(hook)* | 565 |

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/particleEditor.lua`.*

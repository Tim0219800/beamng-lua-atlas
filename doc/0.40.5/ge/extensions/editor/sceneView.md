# `editor_sceneView`

*Fichier : `lua/ge/extensions/editor/sceneView.lua` · VM : Game Engine (GE) · 448 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sceneView` : `extensions.load("editor_sceneView")`, puis la globale `editor_sceneView`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sceneView.onDeserialized(data)` | *(hook)* | 438 |
| `editor_sceneView.onEditorGui()` | *(hook)* | 76 |
| `editor_sceneView.onEditorInitialized()` | *(hook)* | 406 |
| `editor_sceneView.onSerialize()` | *(hook)* | 417 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sceneView.lua`.*

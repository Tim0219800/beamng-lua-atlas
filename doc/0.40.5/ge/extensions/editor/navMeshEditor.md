# `editor_navMeshEditor`

*Fichier : `lua/ge/extensions/editor/navMeshEditor.lua` · VM : Game Engine (GE) · 979 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_navMeshEditor` : `extensions.load("editor_navMeshEditor")`, puis la globale `editor_navMeshEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_navMeshEditor.allowGizmo()` |  | 971 |
| `editor_navMeshEditor.onEditorAfterOpenLevel()` | *(hook)* | 964 |
| `editor_navMeshEditor.onEditorAfterSaveLevel()` | *(hook)* | 963 |
| `editor_navMeshEditor.onEditorGui()` | *(hook)* | 900 |
| `editor_navMeshEditor.onEditorInitialized()` | *(hook)* | 942 |
| `editor_navMeshEditor.show()` |  | 920 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/navMeshEditor.lua`.*

# `editor_roadArchitect_staticMeshMgr`

*Fichier : `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_staticMeshMgr` : `extensions.load("editor_roadArchitect_staticMeshMgr")`, puis la globale `editor_roadArchitect_staticMeshMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx)` | Add/replace the mesh under audition with the mesh with the given index. | 72 |
| `editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes()` | Fetch the list of available static meshes. | 41 |
| `editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time)` | Moves the camera to the mesh audition preview pose.<br> [Also adjusts the timing parameters respectively]. | 118 |
| `editor_roadArchitect_staticMeshMgr.goToOldView()` | Returns the camera to the stored old view. | 138 |
| `editor_roadArchitect_staticMeshMgr.manageRotateCam()` | Manages the rotation of the audition camera. | 129 |
| `editor_roadArchitect_staticMeshMgr.removeAuditionMesh()` | Removes the static mesh under audition. | 55 |
| `editor_roadArchitect_staticMeshMgr.updateCameraPose()` | Updates the camera position upon changing of selected mesh. | 64 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `availStaticMeshes` | table | Public interface. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua`.*

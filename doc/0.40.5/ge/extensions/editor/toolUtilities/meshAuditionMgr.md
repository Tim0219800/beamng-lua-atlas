# `editor_toolUtilities_meshAuditionMgr`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua` · VM : Game Engine (GE) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshAuditionMgr` : `extensions.load("editor_toolUtilities_meshAuditionMgr")`, puis la globale `editor_toolUtilities_meshAuditionMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback)` | Add/replace the mesh under audition with the mesh with the given index. | 97 |
| `editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes()` | Function to get the list of available static meshes. | 53 |
| `editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time)` | Moves the camera to the mesh audition preview pose. [Also adjusts the timing parameters respectively]. | 143 |
| `editor_toolUtilities_meshAuditionMgr.goToOldView()` | Returns the camera to the stored old view. | 163 |
| `editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct)` | Handles the static mesh audition selection window. | 184 |
| `editor_toolUtilities_meshAuditionMgr.leaveAuditionView()` | Handles the leaving of the audition view (moves camera back and removes audition mesh) then handles the closing of the mesh selection window. | 174 |
| `editor_toolUtilities_meshAuditionMgr.manageRotateCam()` | Manages the rotation of the audition camera. | 154 |
| `editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes()` | Populates the list of available static meshes. | 56 |
| `editor_toolUtilities_meshAuditionMgr.registerWindow()` | Registers the mesh selection window. | 171 |
| `editor_toolUtilities_meshAuditionMgr.removeAuditionMesh()` | Removes the static mesh under audition. | 78 |
| `editor_toolUtilities_meshAuditionMgr.updateCameraPose()` | Updates the camera position upon changing of selected mesh. | 89 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua`.*

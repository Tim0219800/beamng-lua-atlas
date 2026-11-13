# `editor_roadArchitect_roadMesh`

*Fichier : `lua/ge/extensions/editor/roadArchitect/roadMesh.lua` · VM : Game Engine (GE) · 899 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_roadMesh` : `extensions.load("editor_roadArchitect_roadMesh")`, puis la globale `editor_roadArchitect_roadMesh`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_roadMesh.clearBridges()` | Clears the bridges structure. | 888 |
| `editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder)` | Creates a road mesh from the given rendering data.<br> [The index of the road is used outside this module to reference the mesh later]. | 669 |
| `editor_roadArchitect_roadMesh.tryRemove(roadName)` | Attempts to removes the meshes of the road with the given name, from the scene (if it exists). | 686 |
| `editor_roadArchitect_roadMesh.tryRemoveBridge(name)` | Attempts to remove the bridge with the given index. | 879 |
| `editor_roadArchitect_roadMesh.updateBridge(r, folder)` | Updates the given bridge. | 697 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/roadMesh.lua`.*

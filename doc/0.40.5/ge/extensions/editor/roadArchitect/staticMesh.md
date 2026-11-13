# `editor_roadArchitect_staticMesh`

*Fichier : `lua/ge/extensions/editor/roadArchitect/staticMesh.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_staticMesh` : `extensions.load("editor_roadArchitect_staticMesh")`, puis la globale `editor_roadArchitect_staticMesh`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder)` | Creates all the appropriate static meshes for a given road. | 228 |
| `editor_roadArchitect_staticMesh.tryRemove(roadName)` | Attempts to removes the meshes of the road with the given name, from the scene (if it exists).<br> [This is done through road indices; the actual handling of the meshes structure should be private to this module]. | 246 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/staticMesh.lua`.*

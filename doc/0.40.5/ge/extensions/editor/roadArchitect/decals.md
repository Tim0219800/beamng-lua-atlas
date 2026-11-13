# `editor_roadArchitect_decals`

*Fichier : `lua/ge/extensions/editor/roadArchitect/decals.lua` · VM : Game Engine (GE) · 508 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_decals` : `extensions.load("editor_roadArchitect_decals")`, puis la globale `editor_roadArchitect_decals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_decals.createDecal(road, folder)` | Creates a decal set for the given road.<br> [A decal set contains the main road decal, the centerline decal, road edge decals, lane division decals, and start/end junction line decals].<br> [The user can control the combination of these which will be rendered for the road, using the appropriate Imgui buttons]. | 91 |
| `editor_roadArchitect_decals.removeTemplates()` | Remove all the templates (all instances should be removed first). | 477 |
| `editor_roadArchitect_decals.tryRemove(name)` | Attempts to removes the decal set with the given name, from the scene (if it exists). | 447 |
| `editor_roadArchitect_decals.tryRemoveAll()` | Attemps to remove all decal sets from the scene. | 488 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/decals.lua`.*

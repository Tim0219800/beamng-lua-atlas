# `editor_roadArchitect_groups`

*Fichier : `lua/ge/extensions/editor/roadArchitect/groups.lua` · VM : Game Engine (GE) · 473 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_groups` : `extensions.load("editor_roadArchitect_groups")`, puis la globale `editor_roadArchitect_groups`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx)` | Adds a prefab group to the roads container, so it will be rendered for the purpose of auditioning.<br> [Roads will be elevated to the audition pose and remain hidden in the roads array]. | 117 |
| `editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain)` | Adds a group template to the session (adds all the group roads to roads list).<br> [The user has chosen this group, so the roads will not be elevated to the audition pose and will not be hidden].<br> [Unique name ids will be given to each profile and road in the group]. | 158 |
| `editor_roadArchitect_groups.copyPlacedGroup(pg)` | Deep copies the given placed group. | 240 |
| `editor_roadArchitect_groups.createGroup(gPolygon, roads)` | Identifies group (from given polygon) and creates a new prefab group. | 207 |
| `editor_roadArchitect_groups.createPrefabGroup(g)` | Turns the given placed group to a saved prefab group. | 247 |
| `editor_roadArchitect_groups.deserialiseGroup(gSer)` | De-serialises a prefab group. | 315 |
| `editor_roadArchitect_groups.getDefaultGroups()` | Populates the collection of default prefab groups, from the corresponding data files. | 351 |
| `editor_roadArchitect_groups.getPlacedGroups()` | Gets the collection of placed groups. | 380 |
| `editor_roadArchitect_groups.goToGroupView(gIdx, timer, time)` | Moves the camera to the prefab group preview pose.<br> [Also adjusts the timing parameters respectively]. | 105 |
| `editor_roadArchitect_groups.goToOldView()` | Returns the camera to the stored old view. | 297 |
| `editor_roadArchitect_groups.goToPlacedGroup(idx)` | Moves the camera above the placed group with the given index. | 405 |
| `editor_roadArchitect_groups.load()` | Loads a collection of current prefab groups from disk. | 338 |
| `editor_roadArchitect_groups.manageRotateCam()` | Manages the rotation of the audition camera. | 198 |
| `editor_roadArchitect_groups.removePlacedGroupHard(groupIdx)` | Removes a placed group from the placed group collection, including the roads inside it. | 389 |
| `editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx)` | Removes a placed group from the placed group collection, but not the roads inside it. | 386 |
| `editor_roadArchitect_groups.save(idx)` | Saves the collection of current prefab groups to disk. | 325 |
| `editor_roadArchitect_groups.serialiseGroup(g)` | Serialises a prefab group. | 305 |
| `editor_roadArchitect_groups.setPlacedGroups(pg)` | Sets the collection of placed groups. | 383 |
| `editor_roadArchitect_groups.updateGroupsAfterRoadRemove()` | Updates the placed groups list (called after a road has been removed). | 364 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `groups` | table | Public interface. |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/groups.lua`.*

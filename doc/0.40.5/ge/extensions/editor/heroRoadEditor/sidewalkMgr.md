# `editor_heroRoadEditor_sidewalkMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua` · VM : Game Engine (GE) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_sidewalkMgr` : `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, puis la globale `editor_heroRoadEditor_sidewalkMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir)` | Bake: write the group's walk to `dir` as a .dae and stand a persistent TSStatic on it, in place of the mesh. The geometry<br>is written around its own centre and the static placed there, so a road far out on the map still bakes small local<br>coordinates. Returns the scene-object name manifest, which is what un-baking removes it by. | 95 |
| `editor_heroRoadEditor_sidewalkMgr.removeGroup(group)` | Delete a group's walk mesh and forget it. | 61 |
| `editor_heroRoadEditor_sidewalkMgr.tris(group)` | The triangles this group's walk stands as, for the tool's own tally. | 87 |
| `editor_heroRoadEditor_sidewalkMgr.updateGroup(group)` | (Re)builds the group's sidewalks to match the current mesh edge + toggles. Called right after the mesh rebuild. Both sides<br> go into ONE mesh: they are the same two stones, so a road's whole footway is two draws whichever sides are on. | 70 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua`.*

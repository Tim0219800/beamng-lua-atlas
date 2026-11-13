# `editor_heroRoadEditor_barrierMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua` · VM : Game Engine (GE) · 182 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_barrierMgr` : `extensions.load("editor_heroRoadEditor_barrierMgr")`, puis la globale `editor_heroRoadEditor_barrierMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_barrierMgr.burnGroup(group)` | Burn: flip the group's current furniture pieces to persistent (canSave=true) and detach them from the transient pools<br> (props.commitPool). Returns the merged name manifest; the caller (exportMgr bake) stores it. | 159 |
| `editor_heroRoadEditor_barrierMgr.counts(group)` | Live placed-piece counts for a group, by category (both sides summed). Reads the transient prop pools -- so it reflects the<br> editable preview; a baked road's furniture is committed out of the pools, so this reports 0 there (as intended -- baked = locked). | 146 |
| `editor_heroRoadEditor_barrierMgr.removeGroup(group)` | Deletes all placed furniture for the group (teardown / node count dropped below 2). | 131 |
| `editor_heroRoadEditor_barrierMgr.updateGroup(group)` | (Re)builds the group's barriers + fences + lamp posts to match the current mesh edge + selections. Called after the mesh rebuild. | 111 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua`.*

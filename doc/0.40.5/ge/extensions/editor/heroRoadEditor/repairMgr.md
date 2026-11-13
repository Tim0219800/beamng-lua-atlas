# `editor_heroRoadEditor_repairMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_repairMgr` : `extensions.load("editor_heroRoadEditor_repairMgr")`, puis la globale `editor_heroRoadEditor_repairMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_repairMgr.clearRepairs(group)` | Delete a group's live repair decal instances + DecalData templates, and forget the bucket. Called on every rebuild + on<br> teardown. | 41 |
| `editor_heroRoadEditor_repairMgr.updateRepairs(group)` | (Re)build every placed repair cluster's decal scatter. No-op (past the clear) when the road has none / isn't ready. | 144 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua`.*

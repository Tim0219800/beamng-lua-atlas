# `editor_heroRoadEditor_exportMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_exportMgr` : `extensions.load("editor_heroRoadEditor_exportMgr")`, puis la globale `editor_heroRoadEditor_exportMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_exportMgr.applyState(group)` | Reconcile the group's mesh to its Edit/Live (enabled/disabled) state. Called after bake and after the toggle. This is also<br> the level-save split: everything a group owns is set transient in Edit and persistent in Live, so a level save writes a<br> road IFF it is Live -- nothing from a road you're still editing leaks into the map file.<br>   enabled (Edit)  -> drop any baked static + burned sidewalks/furniture; rebuild the live procedural surface (canSave=false)<br>                      + transient preview; decals canSave=false. Nothing here survives a level save.<br>   disabled (Live) -> drop the live procedural surface + any lingering transient preview; show the baked static (canSave=true)<br>                      and burned sidewalks (persistent TSStatics owned by the manifests); decals canSave=true. | 126 |
| `editor_heroRoadEditor_exportMgr.bakeGroup(group)` | Bake: (re)write the DAE chunk(s) for the group's current geometry, then switch it to the baked/disabled state. | 179 |
| `editor_heroRoadEditor_exportMgr.hasBaked(group)` | True if this group has a bake (its finalised state can be shown while disabled). | 91 |
| `editor_heroRoadEditor_exportMgr.unbakeGroup(group)` | Unbake: the ONLY way to leave Live. | 233 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua`.*

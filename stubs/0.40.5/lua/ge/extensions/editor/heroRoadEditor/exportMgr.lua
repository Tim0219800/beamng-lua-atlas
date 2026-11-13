---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_exportMgr` : `extensions.load("editor_heroRoadEditor_exportMgr")`, puis la globale `editor_heroRoadEditor_exportMgr`
---@class editor_heroRoadEditor_exportMgr
editor_heroRoadEditor_exportMgr = {}

--- Reconcile the group's mesh to its Edit/Live (enabled/disabled) state. Called after bake and after the toggle. This is also
---  the level-save split: everything a group owns is set transient in Edit and persistent in Live, so a level save writes a
---  road IFF it is Live -- nothing from a road you're still editing leaks into the map file.
---    enabled (Edit)  -> drop any baked static + burned sidewalks/furniture; rebuild the live procedural surface (canSave=false)
---                       + transient preview; decals canSave=false. Nothing here survives a level save.
---    disabled (Live) -> drop the live procedural surface + any lingering transient preview; show the baked static (canSave=true)
---                       and burned sidewalks (persistent TSStatics owned by the manifests); decals canSave=true.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:126
---@param group any
function editor_heroRoadEditor_exportMgr.applyState(group) end

--- Bake: (re)write the DAE chunk(s) for the group's current geometry, then switch it to the baked/disabled state.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:179
---@param group any
function editor_heroRoadEditor_exportMgr.bakeGroup(group) end

--- True if this group has a bake (its finalised state can be shown while disabled).
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:91
---@param group any
function editor_heroRoadEditor_exportMgr.hasBaked(group) end

--- Unbake: the ONLY way to leave Live.
---Source : lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:233
---@param group any
function editor_heroRoadEditor_exportMgr.unbakeGroup(group) end


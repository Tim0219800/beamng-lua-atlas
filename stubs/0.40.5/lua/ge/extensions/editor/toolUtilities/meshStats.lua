---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_meshStats` : `extensions.load("editor_toolUtilities_meshStats")`, puis la globale `editor_toolUtilities_meshStats`
---@class editor_toolUtilities_meshStats
editor_toolUtilities_meshStats = {}

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:27
function editor_toolUtilities_meshStats.begin() end

--- Record one ProceduralMesh by its scene-tree NAME (so a later rebuild under the same name overwrites, and a
---  render pass that renamed/dropped it is caught by the existence check in report()). family groups the rollup.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:35
---@param name any
---@param family any
---@param nVerts any
---@param nTris any
function editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris) end

--- Record the geometry of ONE part inside a merged mesh, by its structural category (bridge.deck, tunnel.floor /
---  tunnel.shell; soffit + pier are now instanced TSStatics, counted in the instanced-props scan). Additive: a bridge/tunnel cluster remeshes exactly once per import,
---  so the running sum is accurate for the import (this is a breakdown of, not a duplicate of, the mesh totals).
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:43
---@param category any
---@param nVerts any
---@param nTris any
function editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris) end

--- Aggregate everything and log the rollup. Ends the collection window.
---Source : lua/ge/extensions/editor/toolUtilities/meshStats.lua:72
---@param tag any
function editor_toolUtilities_meshStats.report(tag) end


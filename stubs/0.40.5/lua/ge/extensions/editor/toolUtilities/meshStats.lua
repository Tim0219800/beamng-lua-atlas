---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mesh weight diagnostic during an import (the editor's city/network importer). Distinguishes UNIQUE geometry (ProceduralMesh: buildings, bridge or tunnel decks, gantries, each with its own buffer and its own collision build) from INSTANCED geometry (TSStatics grouped by shape, Forest items). Generators call recordMesh during construction; the importer calls begin() at the start and report() at the end, which logs a summary per family.
--- Access: extension `editor_toolUtilities_meshStats`: `extensions.load("editor_toolUtilities_meshStats")`, then the global `editor_toolUtilities_meshStats`
---@class editor_toolUtilities_meshStats
editor_toolUtilities_meshStats = {}

--- Starts a collection window: enables collection and clears previous records.
---Source: lua/ge/extensions/editor/toolUtilities/meshStats.lua:27
function editor_toolUtilities_meshStats.begin() end

--- Records a ProceduralMesh by its NAME in the scene tree (a rebuild under the same name overwrites the entry). No effect outside collection or if name is nil.
---Source: lua/ge/extensions/editor/toolUtilities/meshStats.lua:35
---@param name string Name of the object in the scene.
---@param family string|nil Family for the summary (default 'other').
---@param nVerts integer|nil Number of vertices (default 0).
---@param nTris integer|nil Number of triangles (default 0).
function editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris) end

--- Records the geometry of ONE part of a mesh merged by structural category (bridge.deck, tunnel.floor, tunnel.shell). Additive: values add up. It is a breakdown of the mesh totals, not a duplicate.
---Source: lua/ge/extensions/editor/toolUtilities/meshStats.lua:43
---@param category string Category of the part.
---@param nVerts integer|nil Vertices to add.
---@param nTris integer|nil Triangles to add.
function editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris) end

--- Aggregates everything and logs the summary, then ends the collection window. Without an active collection, logs '[mesh] no active mesh-stats session' and returns.
---Source: lua/ge/extensions/editor/toolUtilities/meshStats.lua:72
---@param tag string|nil Log tag; default 'meshStats'.
function editor_toolUtilities_meshStats.report(tag) end


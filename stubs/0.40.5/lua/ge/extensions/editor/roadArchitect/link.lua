---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/link.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_link` : `extensions.load("editor_roadArchitect_link")`, puis la globale `editor_roadArchitect_link`
---@class editor_roadArchitect_link
editor_roadArchitect_link = {}

--- Computes a structure contain the data for a candidate junction.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1071
---@param rIdx any
---@param nIdx any
---@param rIdxs any
---@param nIdxs any
function editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs) end

--- Computes a collection of possible linkages between two given roads.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:371
---@param rIdx1 any
---@param nIdx1 any
---@param rIdxs any
---@param nIdxs any
function editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs) end

--- Creates the proposed junction which will split an existing road, place a T-junction in, and join to the new trunk and second road.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1180
---@param candJct any
function editor_roadArchitect_link.createSplitJunction(candJct) end

--- Join the roads described by the given linkage data.
---Source : lua/ge/extensions/editor/roadArchitect/link.lua:1020
---@param link any
function editor_roadArchitect_link.joinRoads(link) end


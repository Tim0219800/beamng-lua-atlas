---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/link.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road Architect editor module that links roads together. It detects whether the end of a road can be connected to that of another (identical profile, sidewalk/no sidewalk, highway/urban, one-way/two-way road, lane flaring, overlay) and creates the corresponding junction road. It also computes T/Y junction candidates (a road ending in the middle of another) and builds the junction that cuts the trunk road. It relies on the Road Architect roads, profiles, junctions and utilities modules.
--- Access: extension `editor_roadArchitect_link`: `extensions.load("editor_roadArchitect_link")`, then the global `editor_roadArchitect_link`
---@class editor_roadArchitect_link
editor_roadArchitect_link = {}

--- Looks, among the candidate roads, for the road onto which the end nIdx of road rIdx can attach as a junction (type 'T' or 'Y'). Requires both roads to have or not have sidewalks, ignores bridges and overlays, and keeps the closest candidate. The type is 'T' if the road is roughly perpendicular to the trunk road (dot product < 0.4), 'Y' otherwise (identical profile case only).
---Source: lua/ge/extensions/editor/roadArchitect/link.lua:1071
---@param rIdx integer Index of the road that must connect.
---@param nIdx integer Index of the end node of this road (1 = start, otherwise end).
---@param rIdxs integer[] Indices of the candidate trunk roads.
---@param nIdxs integer[] Index of the closest trunk road node, for each candidate.
---@return table|nil  Table { jName, jNode, tName, tNode, type, class } (junction road, its node, trunk road, its node, 'T' or 'Y', class description) or nil if no candidate.
function editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs) end

--- Iterates over the candidate roads rIdxs and tests each possible connection case with road rIdx1 (profile identity, sidewalks, highway/rural, one-way/two-way, flaring). Returns the closest link as a table { r1Name, r1Lie, r2Name, r2Lie, class }, or nil if no connection is possible. nIdx1 == 1 means we look at the start of road 1, otherwise its end.
---Source: lua/ge/extensions/editor/roadArchitect/link.lua:371
---@param rIdx1 integer Index (in roadMgr.roads) of the starting road.
---@param nIdx1 integer Index of the end node of the starting road (1 = start, otherwise end).
---@param rIdxs integer[] Indices of the candidate roads to test.
---@param nIdxs integer[] Index of the end node for each candidate road (1 = start, otherwise end), aligned with rIdxs.
---@return table|nil  Table { r1Name, r1Lie, r2Name, r2Lie, class } describing the chosen connection, or nil.
function editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs) end

--- Builds the proposed junction: saves the state of the roads, cuts the trunk road at node tNode into two roads, removes nearby nodes, pushes the ends back to the edge of the junction sphere, creates the junction (T) with the junction road then connects the three branches with 'Perfect' links. If one of the resulting trunk roads has fewer than 2 nodes, restores the original state and exits.
---Source: lua/ge/extensions/editor/roadArchitect/link.lua:1180
---@param candJct table Candidate returned by computePossibleJct ({ jName, jNode, tName, tNode, type, class }).
function editor_roadArchitect_link.createSplitJunction(candJct) end

--- Creates the connecting road described by the link (merge into a single road for 'Perfect', transition or taper road for the other classes). The choice of the internal function depends on link.class. Does nothing if the class is unknown.
---Source: lua/ge/extensions/editor/roadArchitect/link.lua:1020
---@param link table Table { r1Name, r1Lie, r2Name, r2Lie, class } as returned by computePossibleLinks.
function editor_roadArchitect_link.joinRoads(link) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_meshRefine` : `extensions.load("editor_heroRoadEditor_meshRefine")`, puis la globale `editor_heroRoadEditor_meshRefine`
---@class editor_heroRoadEditor_meshRefine
editor_heroRoadEditor_meshRefine = {}

--- Lateral column decimation. ptsA[s] is station s's cross-section ({o,dz} per column); bandMat has one material per band
---  (between columns c and c+1). Force-keeps col 1, col numCols and every material-band boundary, then RDPs the interior
---  columns using the MAX (o,dz) deviation ACROSS ALL stations -- so a column stays if the profile bends at ANY station
---  (e.g. a crown that fades in bends still keeps its apex columns). Returns a sorted array of kept column indices.
---Source : lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:129
---@param ptsA any
---@param bandMat any
---@param tolM any
---@param m any
function editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m) end

--- Multi-channel RDP over stations 1..m. With tolZM, tolM bounds the plan deviation only and tolZM the vertical one (a plan chord
---  just moves an edge sideways, while a vertical one is a bump under the wheels).
---Source : lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:49
---@param centres any
---@param W any
---@param numCols any
---@param tolM any
---@param m any
---@param maxSegM any
---@param mustKeep any
---@param tolZM any
function editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM) end


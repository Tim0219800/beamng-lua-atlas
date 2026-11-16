---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/meshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table of predefined cross-section profiles for the Track Builder: side walls, tilted walls and tubes. Each profile is a table {crossPoints, cap, uv, material, flipUVRight, [sharp]} meant to be extruded along a track segment. All use the 'track_editor_border' material. The file returns the table directly (no M); the names indicate the size: sideWall10 = 1 m high, tube5m = 5 m radius.
--- Access: extension `util_trackBuilder_meshes`: `extensions.load("util_trackBuilder_meshes")`, then the global `util_trackBuilder_meshes`
---@class util_trackBuilder_meshes
---@field rotWall15 table 2 m wall tilted by 15° (pi/12).
---@field rotWall30 table 2 m wall tilted by 30° (pi/6).
---@field rotWall45 table 2 m wall tilted by 45° (pi/4).
---@field rotWall90 table 2 m wall tilted by 90° (pi/2).
---@field sideWall01 table Side wall 0.1 m high.
---@field sideWall03 table Side wall 0.3 m high.
---@field sideWall05 table Side wall 0.5 m high.
---@field sideWall10 table Side wall 1 m high.
---@field sideWall100 table Side wall 10 m high.
---@field sideWall50 table Side wall 5 m high.
---@field tube10m table Tube of radius 10 m with a 2 m wall.
---@field tube10mFull table Complete tube of radius 10 m (20 steps).
---@field tube10mHigh table Tube of radius 10 m with a 10 m wall.
---@field tube5m table Tube of radius 5 m with a 1 m wall.
---@field tube5mFull table Complete tube of radius 5 m (20 steps).
---@field tube5mHigh table Tube of radius 5 m with a 5 m wall.
util_trackBuilder_meshes = {}


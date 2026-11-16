---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/sortLines.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development tool that sorts, by "name" field, the sound JSON files of a level. These files contain one JSON object per line ("JSON lines" format) in /levels/<level>/main/MissionGroup/Audio/. handleLevel walks the *.json files of this folder and handleFile rewrites each file with its lines sorted by name. It modifies files in place.
--- Access: extension `util_sortLines`: `extensions.load("util_sortLines")`, then the global `util_sortLines`
---@class util_sortLines
util_sortLines = {}

--- Reads a JSON lines file, sorts the lines by their name field (ascending order) and rewrites the file.
---Source: lua/ge/extensions/util/sortLines.lua:11
---@param path string Path of the file to sort.
function util_sortLines.handleFile(path) end

--- Sorts all the *.json files (non-recursive) of the /levels/<level>/main/MissionGroup/Audio/ folder.
---Source: lua/ge/extensions/util/sortLines.lua:35
---@param level string Level folder name.
function util_sortLines.handleLevel(level) end


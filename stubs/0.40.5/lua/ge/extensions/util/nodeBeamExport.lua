---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/nodeBeamExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal export of the player's vehicle: writes to a JSON file (.nbexport.json) the list of nodes (position and optional name) and beams (node ids) of the active vehicle, as a point/edge graph. Useful to visualize or analyze a vehicle's physical structure in an external tool. File names are numbered automatically (export_<N>.nbexport.json) in the vehicle folder.
--- Access: extension `util_nodeBeamExport`: `extensions.load("util_nodeBeamExport")`, then the global `util_nodeBeamExport`
---@class util_nodeBeamExport
util_nodeBeamExport = {}

--- Builds the graph of the active vehicle and writes it as JSON. Without a file name, uses suggestFilename(). Creates the destination folder if needed and logs the result.
---Source: lua/ge/extensions/util/nodeBeamExport.lua:97
---@param filename string|nil Output file path (default: export_<N>.nbexport.json in the vehicle folder)
---@return boolean  true if the write succeeded, false otherwise
function util_nodeBeamExport.exportFile(filename) end

--- Suggests the next free name export_<N>.nbexport.json in the active vehicle's folder (looks up existing files to increment N); creates the folder if needed.
---Source: lua/ge/extensions/util/nodeBeamExport.lua:70
---@return string|nil  Suggested path, or nil (error logged) if no vehicle folder is available
function util_nodeBeamExport.suggestFilename() end


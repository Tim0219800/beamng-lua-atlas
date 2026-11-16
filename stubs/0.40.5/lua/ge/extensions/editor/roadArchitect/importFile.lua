---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/importFile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- File import utilities for Road Architect, designed for headless use (tech/BeamNGpy bridge). They read a file from a virtual or native path, copy it if needed into /temp/roadArchitectImport, prepare the editor APIs (history, preferences) without opening the UI, then finalize the roads (DecalRoads, collisions, navgraph).
--- Access: extension `editor_roadArchitect_importFile`: `extensions.load("editor_roadArchitect_importFile")`, then the global `editor_roadArchitect_importFile`
---@class editor_roadArchitect_importFile
editor_roadArchitect_importFile = {}

--- Prepares the World Editor APIs needed for import and finalization without opening the UI: loads editor_main if needed, calls editor.initializeModules to create the history, then editor.ensurePreferencesApi or editor.loadPreferences for the preferences (needed by roadRiver.getPreference when finalizing DecalRoads).
---Source: lua/ge/extensions/editor/roadArchitect/importFile.lua:84
function editor_roadArchitect_importFile.ensureEditorHistory() end

--- If options.finalize is true, places the DecalRoads and meshes, reloads collisions and rebuilds the navgraph, like the Render/finalise toggle of Road Architect. Already finalized ("Road Architect" object exists): first calls roads.unfinalise() to avoid duplicates.
---Source: lua/ge/extensions/editor/roadArchitect/importFile.lua:114
---@param options table|nil Import options; only the finalize field (boolean) is read.
---@return boolean  true if finalization took place.
---@return string|nil  Error message, for example "finalize requires a loaded level (MissionGroup missing)".
function editor_roadArchitect_importFile.maybeFinalise(options) end

--- Reads the content of a file from an absolute virtual or native path. Tries readFile, the native-to-virtual conversion, then io.open in binary. Returns nil if the path is invalid or the file is not found.
---Source: lua/ge/extensions/editor/roadArchitect/importFile.lua:16
---@param filePath string Virtual or native path (backslashes are normalized to /).
---@return string|nil  File content, or nil.
function editor_roadArchitect_importFile.readTextFile(filePath) end

--- Writes the given content to /temp/roadArchitectImport/<file name> (folder created if needed) so that the game can read it in its virtual file system. Converts fileContent to a string with tostring if it is not one. Raises an error if the write fails.
---Source: lua/ge/extensions/editor/roadArchitect/importFile.lua:60
---@param filePath string Original path, of which only the file name is kept (import.bin by default).
---@param fileContent string|nil Content to write; if nil or empty, nothing is written.
---@return string  Usable path: the staged file, or filePath if nothing was written.
---@return boolean  true if the file was staged.
function editor_roadArchitect_importFile.stageText(filePath, fileContent) end


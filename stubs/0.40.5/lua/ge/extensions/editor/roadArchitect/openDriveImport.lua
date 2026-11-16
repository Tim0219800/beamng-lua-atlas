---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/openDriveImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- OpenDRIVE (.xodr) import into Road Architect. The XML file is parsed (roads: planView with line/arc/spiral/poly3/paramPoly3, elevationProfile, superelevation, laneOffset, laneSections with lane widths and heights; junctions), the reference line is discretized into a 3D polyline, then each OpenDRIVE road becomes an independent Road Architect road. OpenDRIVE junctions are read but not converted. Can be used without the UI (importFromFile, including with the file content supplied by the tech/BeamNGpy bridge). Records the import in the editor history (undo/redo).
--- Access: extension `editor_roadArchitect_openDriveImport`: `extensions.load("editor_roadArchitect_openDriveImport")`, then the global `editor_roadArchitect_openDriveImport`
---@class editor_roadArchitect_openDriveImport
editor_roadArchitect_openDriveImport = {}

--- Interactive version: opens the editor file selector (.xodr filter) then calls importFromFile with the chosen path. Errors are written to the log (level E) instead of being rethrown.
---Source: lua/ge/extensions/editor/roadArchitect/openDriveImport.lua:919
---@param options table|nil Options passed to importFromFile.
function editor_roadArchitect_openDriveImport.import(options) end

--- Imports a .xodr file (or its content supplied in fileContent), creates the corresponding Road Architect roads, applies placement, vertical offset, terrain conforming and terraforming according to options, finalizes and records the action in the history. Raises an error if the content is unreadable.
---Source: lua/ge/extensions/editor/roadArchitect/openDriveImport.lua:652
---@param filePath string Path of the .xodr file (may be ignored if fileContent is supplied).
---@param options table|nil Import options (placeMode, placeX, placeY, placeZ, offsetToTerrain, verticalOffset, terraform, domainOfInfluence, margin, finalize...).
---@param fileContent string|nil XML content of the file, already read (for example sent by BeamNGpy).
---@return table  Summary { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_openDriveImport.importFromFile(filePath, options, fileContent) end


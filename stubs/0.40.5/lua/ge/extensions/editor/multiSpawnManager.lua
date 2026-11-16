---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/multiSpawnManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Vehicle Groups Manager" (Gameplay menu) to create, edit, load and save vehicle groups (.vehGroup.json files) and make them spawn in the world via core_multiSpawn. A group is of type "custom" (hand-picked list of vehicles: model, config, paints) or "generator" (parameters: amount, allMods, allConfigs, minPop, modelPopPower, configPopPower, popDecreaseFactor, maxYear, with which core_multiSpawn.createGroup generates the vehicles). The groups found in vehicleGroups/ and settings/editor/vehicleGroups/ are loaded automatically on first display.
--- Access: extension `editor_multiSpawnManager`: `extensions.load("editor_multiSpawnManager")`, then the global `editor_multiSpawnManager`
---@class editor_multiSpawnManager
---@field filePaths string[] Folders explored to automatically load the groups: {"vehicleGroups/", "settings/editor/vehicleGroups/"}. Modifiable before the tool's first display.
editor_multiSpawnManager = {}

--- Reads a .vehGroup.json file, makes it the current group (after cleaning), selects its first vehicle and adds it to the groups list if it is not already there. Writes a warning to the log if the read fails.
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:192
---@param filePath string Path of the .vehGroup.json file.
function editor_multiSpawnManager.loadGroup(filePath) end

--- Editor hook called every frame: draws the "Vehicle Groups Manager" window (File and Tools menus, groups list, group editing, spawn options).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:757
---@param dt number Frame duration in seconds.
function editor_multiSpawnManager.onEditorGui(dt) end

--- Hook called at editor initialization: registers the main window and three modal windows (generator, custom paint, group replacement) and the "Gameplay" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:863
function editor_multiSpawnManager.onEditorInitialized() end

--- Hook emitted by core_multiSpawn once the group has spawned; sets spawnState back to 0 (makes "Please wait..." disappear).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:853
function editor_multiSpawnManager.onVehicleGroupSpawned() end

--- Menu entry handler: initializes the tables if needed, clears the editor's object selection and shows the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:857
function editor_multiSpawnManager.onWindowMenuItem() end

--- Writes the current group (processed by processGroup) to a JSON file and remembers the folder and the file path.
---Source: lua/ge/extensions/editor/multiSpawnManager.lua:223
---@param file any Unused (inferred from code).
---@param filePath string Destination path.
function editor_multiSpawnManager.saveGroup(file, filePath) end


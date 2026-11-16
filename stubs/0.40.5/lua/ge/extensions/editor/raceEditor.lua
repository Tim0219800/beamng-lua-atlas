---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main "Race Tool" window of the race/path editor (menu Gameplay > Race/Path Editor, edit mode "Edit Races"). It manages the current race file (*.race.json, default folder /gameplay/races/): load, save, new race, copy from a scenario Time Trials, list of all races. It hosts the sub-windows (pathnodes, segments, startPositions, trackLayout, timeTrials, tools) and a "Race Test" window (testing). Loads go through the edit history (undo/redo). The current path is a gameplay/race/path object.
--- Access: extension `editor_raceEditor`: `extensions.load("editor_raceEditor")`, then the global `editor_raceEditor`
---@class editor_raceEditor
editor_raceEditor = {}

--- Returns whether the edit gizmo is allowed: true when the current edit mode is "Edit Races".
---Source: lua/ge/extensions/editor/raceEditor.lua:551
---@return boolean  true if the current edit mode is the race editor's.
function editor_raceEditor.allowGizmo() end

--- Calls autoConfig() then getAiPath() on the current path to recompute the AI route (and the aiPathDistance distance).
---Source: lua/ge/extensions/editor/raceEditor.lua:28
function editor_raceEditor.calculateAiRoute() end

--- Call when the current path was modified outside the window: gives the path back to the active sub-window (setPath).
---Source: lua/ge/extensions/editor/raceEditor.lua:555
function editor_raceEditor.changedFromExternal() end

--- Returns the full path of the current race file (folder + name).
---Source: lua/ge/extensions/editor/raceEditor.lua:552
---@return string  Default "/gameplay/races/NewRace.race.json".
function editor_raceEditor.getCurrentFilename() end

--- Returns the gameplay/race/path object being edited.
---Source: lua/ge/extensions/editor/raceEditor.lua:553
---@return table  Race path object (pathnodes, segments, startPositions...).
function editor_raceEditor.getCurrentPath() end

--- Returns the race editor's "tools" sub-window.
---Source: lua/ge/extensions/editor/raceEditor.lua:567
---@return table  Instance of the raceEditor/tools module.
function editor_raceEditor.getToolsWindow() end

--- Returns whether the "Race Tool" window is displayed.
---Source: lua/ge/extensions/editor/raceEditor.lua:554
---@return boolean  Visibility of the raceEditorTool window.
function editor_raceEditor.isVisible() end

--- Reads a .race.json file, builds a new path (onDeserialized), recomputes the AI route and commits a "Set path to <name>" history action to replace it. Does nothing if filename is nil; logs an error if the file is not found.
---Source: lua/ge/extensions/editor/raceEditor.lua:79
---@param filename string|nil Path of the .race.json file.
---@return table|nil  currentPath (see notes: may be the old path).
function editor_raceEditor.loadRace(filename) end

--- Called after a Lua reload with the saved state; restores the path, the file name and folder, then recomputes the AI route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:520
---@param data table|nil onSerialize table: path, previousFilepath, previousFilename.
function editor_raceEditor.onDeserialized(data) end

--- Called every frame. Draws the Race Tool window (File menu, lists, sub-window tabs) and switches back to objectSelect mode if the window is hidden.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:254
function editor_raceEditor.onEditorGui() end

--- Declares the raceEditMode edit mode, registers the window (500x500) and the menu entry, then instantiates the sub-windows and the test window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:471
function editor_raceEditor.onEditorInitialized() end

--- Declares the raceEditor preferences category (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:535
---@param prefsRegistry table Editor preferences registry.
function editor_raceEditor.onEditorRegisterPreferences(prefsRegistry) end

--- If the hidden window is raceEditorTool, switches back to objectSelect mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:499
---@param windowName string Name of the hidden window.
function editor_raceEditor.onEditorToolWindowHide(windowName) end

--- Called before a Lua reload; serializes the current path and the last folder/file name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:511
---@return table  {path, previousFilepath, previousFilename}.
function editor_raceEditor.onSerialize() end

--- Update hook; draws the "Race Test" window (testingWindow:draw(dtSim)) when it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:113
---@param dtReal number Real-time delta (unused).
---@param dtSim number Simulation time delta passed to the test window.
---@param dtRaw number Raw time delta (unused).
function editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- If the window gaining focus is raceEditorTool, activates the raceEditMode edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor.lua:505
---@param windowName string Window name.
function editor_raceEditor.onWindowGotFocus(windowName) end

--- Serializes a race and writes it as JSON (jsonWriteFile, pretty format). Updates the remembered folder and file name.
---Source: lua/ge/extensions/editor/raceEditor.lua:67
---@param race table|nil Race path to save; if nil, uses the current path.
---@param savePath string Full path of the output file.
function editor_raceEditor.saveRace(race, savePath) end

--- Opens the "Race Test" window, gives it the current path and prepares the test race (testingWindow:setupRace).
---Source: lua/ge/extensions/editor/raceEditor.lua:106
function editor_raceEditor.setupRace() end

--- Clears the selection, shows the Race Tool window and activates the raceEditMode edit mode.
---Source: lua/ge/extensions/editor/raceEditor.lua:447
function editor_raceEditor.show() end


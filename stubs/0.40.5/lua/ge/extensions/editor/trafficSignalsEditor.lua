---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficSignalsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic light editor ("Traffic Signals Editor" window, menu Window > Gameplay, signalsEditMode edit mode). Lets you create and place signals (instances), controllers and phase sequences, edit controller definitions, simulate the lights in the level then save everything to the level's signals.json (editor.levelPath). Works on core_trafficSignals data (newSignal, newController, newSequence, setupSignals, loadSignals). Shift + left click creates a signal, left click selects.
--- Access: extension `editor_trafficSignalsEditor`: `extensions.load("editor_trafficSignalsEditor")`, then the global `editor_trafficSignalsEditor`
---@class editor_trafficSignalsEditor
editor_trafficSignalsEditor = {}

--- Returns the table of editor elements (signals, controllers, sequences) keyed by id.
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:257
---@return table<integer|string, table>  Elements by id.
function editor_trafficSignalsEditor.getCurrentElements() end

--- Returns the signal data being edited (live tables, not copied).
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:261
---@return table  {instances, controllers, sequences}.
function editor_trafficSignalsEditor.getCurrentSignals() end

--- Loads a JSON signals file and applies it with setCurrentSignals (obsolete format rejected).
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:295
---@param fileName string|nil File path, default <level>/signals.json.
function editor_trafficSignalsEditor.loadFile(fileName) end

--- End-of-mission hook: forces a re-initialization of the tables on the next opening.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1879
function editor_trafficSignalsEditor.onClientEndMission() end

--- After Lua reload: restores the options and reapplies the signals with setCurrentSignals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1888
---@param data table Value returned by onSerialize.
function editor_trafficSignalsEditor.onDeserialized(data) end

--- Editor frame hook: draws the window (File menu Load/Save/Clear, lists and properties of signals, controllers, sequences) and the signals' debug rendering. Initializes the tables on the first call.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1735
---@param dt number Time delta.
function editor_trafficSignalsEditor.onEditorGui(dt) end

--- Editor initialization hook: registers the window (540x600), the signalsEditMode edit mode with its shortcuts and the menu entry in the Gameplay group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1900
function editor_trafficSignalsEditor.onEditorInitialized() end

--- Before Lua reload: returns {options, signals} (serialized signals).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1883
---@return table  {options, signals}.
function editor_trafficSignalsEditor.onSerialize() end

--- Menu hook: initializes the tables if needed, clears the object selection and shows the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:1894
function editor_trafficSignalsEditor.onWindowMenuItem() end

--- Writes the serialized signals to a JSON file (jsonWriteFile) and displays "Signals saved!" for 3 s.
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:308
---@param fileName string|nil File path, default <level>/signals.json.
function editor_trafficSignalsEditor.saveFile(fileName) end

--- Replaces the editor data: resets, recreates instances (pos/dir converted to vec3), controllers and sequences via core_trafficSignals, then reselects the current elements. Without an argument, uses the level's signals (core_trafficSignals.getData()).
---Source: lua/ge/extensions/editor/trafficSignalsEditor.lua:265
---@param data table|nil {instances, controllers, sequences}; missing fields treated as empty.
function editor_trafficSignalsEditor.setCurrentSignals(data) end


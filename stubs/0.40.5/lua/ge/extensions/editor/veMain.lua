---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/veMain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the Vehicle Editor (vehicle editor, static and live modes). The extension also registers itself as the global `vEditor`: it stores there the current vehicle (vEditor.vehicle, vEditor.vdata, vEditor.vehData, vEditor.vehiclePos), the selected nodes/beams and the menus. It automatically loads all `ve*.lua` extensions of the vehicleEditor/, staticEditor/ and liveEditor/ folders, builds the menus from their `menuEntry`/`open`, and emits the `onVehicleEditorRenderJBeams` hook every frame so that debug tools draw with debugDrawer.
--- Access: extension `editor_veMain`: `extensions.load("editor_veMain")`, then the global `editor_veMain`
---@class editor_veMain
---@field dependencies table<integer, string> Extensions loaded beforehand: {'core_vehicle_manager'}.
editor_veMain = {}

--- Restores vEditor.editorMode from data.editorMode. Non-standard name (the extension hook is onDeserialized).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:427
---@param data table Table returned by onSerialize.
function editor_veMain.onDeserialize(data) end

--- Editor hook called when a headless tool is activated/deactivated. If toolName matches the current vehicle editor (vehicleEditorStatic/vehicleEditorLive), prepares the editor (setupEditor) and sets vEditor.editorActive, or removes the 'VehicleEditor' action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:318
---@param enabled boolean true if the tool is activated.
---@param toolName string Name of the headless tool.
function editor_veMain.onEditorHeadlessChange(enabled, toolName) end

--- Called by the editor in headless mode to draw the menu bar: menus File (Exit Vehicle Editor...), View (Reset Layout) and FPS / GpuWait / Poly indicators.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:405
function editor_veMain.onEditorHeadlessMainMenuBar() end

--- Called when the editor is initialized: adds the 'Vehicle Editor' entry (Vehicles group) to the Window menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:310
function editor_veMain.onEditorInitialized() end

--- When the color, colorPalette0 or colorPalette1 field of a BeamNGVehicle is modified in the inspector, converts the color and applies the paint via core_vehicle_partmgmt.setConfigPaints.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:341
---@param selectedIds table<integer, integer> IDs of the selected objects.
---@param fieldName string Name of the modified field.
---@param fieldValue string New value (color string).
---@param arrayIndex any Array index of the field (unused).
function editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Called every frame before rendering. If no vehicle is tracked, initializes vEditor from the player vehicle (be:getPlayerVehicleID(0)). Otherwise updates vEditor.vehiclePos then emits the hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:251
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_veMain.onPreRender(dtReal, dtSim, dtRaw) end

--- Serialization before Lua reload: returns {editorMode = vEditor.editorMode}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:421
---@return table  Data to restore.
function editor_veMain.onSerialize() end

--- Called when a vehicle is destroyed: sets vEditor.vehicle, vehData, vdata, nodeCIDToName and vehiclePos back to nil (without checking which vehicle it is).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:333
function editor_veMain.onVehicleDestroyed() end

--- Called when the player vehicle changes: reloads the data (vEditor.vehData, vdata, nodeCIDToName, vehicle) for newVehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/veMain.lua:314
---@param oldVehicle integer ID of the old vehicle.
---@param newVehicle integer ID of the new vehicle.
---@param player integer Player index.
function editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Saves the Vehicle Editor's current window layout via editor_layoutManager.saveCurrentWindowLayout.
---Source: lua/ge/extensions/editor/veMain.lua:417
function editor_veMain.saveCurrentWindowLayout() end

--- Activates the Vehicle Editor if inactive (activates the world editor, the headless mode, loads the apps), otherwise exits it (deactivateEditor(false)) while disabling core_vehicle_manager.setDebug.
---Source: lua/ge/extensions/editor/veMain.lua:302
function editor_veMain.toggleActive() end


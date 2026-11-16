---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleDetailViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Vehicle Detail Viewer" (menu Window > Vehicles, also F11 > Window > Experimental). Opens imgui windows that display orthographic views of the player vehicle (Left, Right, Top, Bottom, Front, Back) rendered into a texture via RenderViewManagerInstance, with zoom, drag panning and double-click reset. Each view is fitted to the vehicle's oriented bounding box (getSpawnWorldOOBB). Layouts can be saved in /settings/vehicleDetails/*.vehicleDetailSetting.json (default: default.vehicleDetailSetting.json).
--- Access: extension `editor_vehicleDetailViewer`: `extensions.load("editor_vehicleDetailViewer")`, then the global `editor_vehicleDetailViewer`
---@class editor_vehicleDetailViewer
editor_vehicleDetailViewer = {}

--- Restores the views and recreates the windowOpen imgui pointers. Also used to load a layout file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:297
---@param data table|nil Table from onSerialize or content of the layout file.
function editor_vehicleDetailViewer.onDeserialized(data) end

--- Adds the 'Vehicle Detail Viewer' menu entry (Vehicles group) which activates the tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:614
function editor_vehicleDetailViewer.onEditorInitialized() end

--- Called when the extension is loaded: displays a message and lists the available layout files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:600
function editor_vehicleDetailViewer.onExtensionLoaded() end

--- Called on unload: destroys the remaining render views.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:605
function editor_vehicleDetailViewer.onExtensionUnloaded() end

--- Called every frame before rendering: creates the view models for the player vehicle, loads the default layout, draws each view window and triggers the orthographic rendering; cleans up when everything is closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:488
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleDetailViewer.onPreRender(dtReal, dtSim, dtRaw) end

--- Before Lua reload: destroys the render views and returns {views} without the non-serializable objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:274
---@return table  {views = table}
function editor_vehicleDetailViewer.onSerialize() end

--- Called when a vehicle spawns: forgets the views to recreate them with the new vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleDetailViewer.lua:595
---@param vehicleId integer Vehicle ID.
function editor_vehicleDetailViewer.onVehicleSpawned(vehicleId) end


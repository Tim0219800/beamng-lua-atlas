---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Other/Vehicle Spawner' tool of the live Vehicle Editor. When the editor loads it remembers up to 20 vehicles (Car or Truck) from core_vehicles.getVehicleList. The window lets you spawn a vehicle at the camera position/orientation ('Select Vehicle' window), choose a point on the terrain (wheel = 5° rotation) then line up all the vehicles of the list there (spaced 10 m apart), and delete everything ('Despawn All').
--- Access: extension `editor_vehicleEditor_liveEditor_veVehicleSpawner`: `extensions.load("editor_vehicleEditor_liveEditor_veVehicleSpawner")`, then the global `editor_vehicleEditor_liveEditor_veVehicleSpawner`
---@class editor_vehicleEditor_liveEditor_veVehicleSpawner
---@field menuEntry string 'Other/Vehicle Spawner'.
editor_vehicleEditor_liveEditor_veVehicleSpawner = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:172
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onDeserialized(data) end

--- Called at editor initialization: fills vehsList with the first 20 Car/Truck vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:152
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onEditorInitialized() end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:166
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onSerialize() end

--- Called every frame: draws the window, the start markers and the vehicle selection window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:113
function editor_vehicleEditor_liveEditor_veVehicleSpawner.onUpdate() end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veVehicleSpawner.lua:148
function editor_vehicleEditor_liveEditor_veVehicleSpawner.open() end


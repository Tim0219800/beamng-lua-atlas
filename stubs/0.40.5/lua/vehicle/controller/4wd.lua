---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/4wd.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that gives the driver control of the selectable 4WD: 4WD shaft (connected/disconnected), range box (high/low) and differentials. It acts either via `driveModes` controllers (if their names are listed in the jbeam), or directly via the `powertrain` API for old vehicles. It writes `electrics.values.mode4WD` and `modeRangeBox` (1 or 0) and adds entries to the radial menu.
--- Access: controller `4wd` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_4wd
---@field relevantDevice string "transfercase": name of the powertrain device used for the call order.
---@field type string "auxiliary".
local controller_4wd = {}

--- Restores the 4WD and range modes from the serialize data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/4wd.lua:81
---@param data table|nil Data returned by serialize.
function controller_4wd.deserialize(data) end

--- Finds the powertrain devices (`shaftName`, `rangeBoxName`), initializes the electrics values and adds the radial menu entries (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/4wd.lua:92
---@param jbeamData table Controller jbeam data.
function controller_4wd.init(jbeamData) end

--- Finds the driveModes controllers named in `driveModesRangeNames`, `driveModesTransfercaseNames` and `driveModesDifferentialNames` (those that exist).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/4wd.lua:171
---@param jbeamData table Controller jbeam data.
function controller_4wd.initLastStage(jbeamData) end

--- Returns the saved state: {mode4WD, modeRange}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/4wd.lua:74
---@return table  {mode4WD = string|nil, modeRange = string|nil}.
function controller_4wd.serialize() end

--- Forces the 4WD shaft mode, unless it is physically disconnected.
---Source: lua/vehicle/controller/4wd.lua:68
---@param mode string "connected" or "disconnected".
function controller_4wd.set4WDMode(mode) end

--- Forces the range box mode (powertrain.setDeviceMode). No effect if there is no range box.
---Source: lua/vehicle/controller/4wd.lua:49
---@param mode string "low" or "high" (values seen in the code).
function controller_4wd.setRangeMode(mode) end

--- Switches to the next mode of the transfer driveModes controllers; otherwise toggles the 4WD shaft, unless it is physically disconnected (`isPhysicallyDisconnected`).
---Source: lua/vehicle/controller/4wd.lua:55
function controller_4wd.toggle4WD() end

--- Switches to the next mode of each differential driveModes controller; otherwise calls powertrain.toggleDefaultDiffs().
---Source: lua/vehicle/controller/4wd.lua:24
function controller_4wd.toggleDiffs() end

--- Switches to the next mode of the range driveModes controllers; otherwise toggles the range box mode via powertrain.toggleDeviceMode.
---Source: lua/vehicle/controller/4wd.lua:36
function controller_4wd.toggleRange() end

--- Every frame: writes electrics.values.modeRangeBox (1 if low range) and mode4WD (1 if shaft connected).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/4wd.lua:19
---@param dt number Time step in seconds (unused).
function controller_4wd.updateGFX(dt) end

return controller_4wd

---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/virtualInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_virtualInput`: creation of virtual input devices (axes, buttons, POV) via the C++ VirtualInputManager and emission of events on them. A modder uses it to inject commands (steering wheel, pedals, buttons) as if a real controller were plugged in; the events go through the normal bindings system under the device name 'vinput<instance>'.
--- Access: extension `core_input_virtualInput`: `extensions.load("core_input_virtualInput")`, then the global `core_input_virtualInput`
---@class core_input_virtualInput
core_input_virtualInput = {}

--- Registers a virtual device with the VirtualInputManager and stores it in M.devices.
---Source: lua/ge/extensions/core/input/virtualInput.lua:9
---@param productName string Displayed product name.
---@param vidpid string Vendor/product identifier; used to find the device with getDeviceInfo.
---@param axes integer Number of axes (inferred from code).
---@param buttons integer Number of buttons (inferred from code).
---@param povs integer Number of POVs/hats (inferred from code).
---@return integer|nil  Instance number (>= 0); nil if the manager is absent or the instance < 0 (error logged).
---@return table|nil  {productName, vidpid, axes, buttons, povs}.
function core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs) end

--- Unregisters the device 'vinput<deviceInstance>' and removes it from M.devices.
---Source: lua/ge/extensions/core/input/virtualInput.lua:26
---@param deviceInstance integer Instance returned by createDevice.
function core_input_virtualInput.deleteDevice(deviceInstance) end

--- Sends a virtual device event to the engine (mgr:emitEvent('vinput', ...)). Does nothing if the manager is absent.
---Source: lua/ge/extensions/core/input/virtualInput.lua:48
---@param deviceInstance integer Device instance.
---@param objType any Input object type (axis, button, POV): engine value.
---@param objectInstance integer Index of the axis/button/POV.
---@param action any Action type (engine value).
---@param val number Event value.
function core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val) end

--- Looks up an already created virtual device by its vidpid.
---Source: lua/ge/extensions/core/input/virtualInput.lua:38
---@param vidpid string Identifier searched for.
---@return integer|nil  Instance, or nil if none.
---@return table|nil  Device info.
function core_input_virtualInput.getDeviceInfo(vidpid) end


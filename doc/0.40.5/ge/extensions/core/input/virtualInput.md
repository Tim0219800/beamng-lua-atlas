# `core_input_virtualInput`

*File: `lua/ge/extensions/core/input/virtualInput.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_virtualInput`: `extensions.load("core_input_virtualInput")`, then the global `core_input_virtualInput`

GE extension `core_input_virtualInput`: creation of virtual input devices (axes, buttons, POV) via the C++ VirtualInputManager and emission of events on them. A modder uses it to inject commands (steering wheel, pedals, buttons) as if a real controller were plugged in; the events go through the normal bindings system under the device name 'vinput<instance>'.

## Example

```lua
local inst = core_input_virtualInput.createDevice('MyPad', 'abcd1234', 2, 4, 0)
-- objType/action: values expected by the engine (not defined in this file)
core_input_virtualInput.emit(inst, objType, 0, action, 0.5)
core_input_virtualInput.deleteDevice(inst)
```

## Notes

- The valid values of objType and action for emit are defined on the C++ side (not visible in this file); val is a number.
- Events are timestamped with os.clockhp().
- The error message of deleteDevice says 'Unable to create virtual device': copy-paste in the game code, it really is a deletion.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs)` | Registers a virtual device with the VirtualInputManager and stores it in M.devices. | 9 |
| `core_input_virtualInput.deleteDevice(deviceInstance)` | Unregisters the device 'vinput<deviceInstance>' and removes it from M.devices. | 26 |
| `core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val)` | Sends a virtual device event to the engine (mgr:emitEvent('vinput', ...)). Does nothing if the manager is absent. | 48 |
| `core_input_virtualInput.getDeviceInfo(vidpid)` | Looks up an already created virtual device by its vidpid. | 38 |

### Parameter details

#### `core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs)`

Registers a virtual device with the VirtualInputManager and stores it in M.devices.

- `productName` (*string*) : Displayed product name.
- `vidpid` (*string*) : Vendor/product identifier; used to find the device with getDeviceInfo.
- `axes` (*integer*) : Number of axes (inferred from code).
- `buttons` (*integer*) : Number of buttons (inferred from code).
- `povs` (*integer*) : Number of POVs/hats (inferred from code).
- **returns**: integer|nil Instance number (>= 0); nil if the manager is absent or the instance < 0 (error logged).
- **returns**: table|nil {productName, vidpid, axes, buttons, povs}.

#### `core_input_virtualInput.deleteDevice(deviceInstance)`

Unregisters the device 'vinput<deviceInstance>' and removes it from M.devices.

- `deviceInstance` (*integer*) : Instance returned by createDevice.

#### `core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val)`

Sends a virtual device event to the engine (mgr:emitEvent('vinput', ...)). Does nothing if the manager is absent.

- `deviceInstance` (*integer*) : Device instance.
- `objType` (*any*) : Input object type (axis, button, POV): engine value.
- `objectInstance` (*integer*) : Index of the axis/button/POV.
- `action` (*any*) : Action type (engine value).
- `val` (*number*) : Event value.

#### `core_input_virtualInput.getDeviceInfo(vidpid)`

Looks up an already created virtual device by its vidpid.

- `vidpid` (*string*) : Identifier searched for.
- **returns**: integer|nil Instance, or nil if none.
- **returns**: table|nil Device info.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/virtualInput.lua`.*

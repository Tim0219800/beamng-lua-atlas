# `core_cameraModes_relative`

*File: `lua/ge/extensions/core/cameraModes/relative.lua` · VM: Game Engine (GE) · 404 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/relative")` (file under extensions/ but not a regular extension)

"Vehicle-relative" free camera (disabled by default): a flying camera whose position is expressed in the vehicle's frame (ref/left/back nodes), so it accompanies the moving vehicle. Keyboard/mouse movement and look (speed x5 far from the vehicle), manual zoom, 10 memorizable position/rotation/FOV slots (shortcut keys, "Relative Camera" radial menu), attached point light (0 / 500 / 2500 / 5000 lm) and nearClip presets (level, 0.5 mm, 1 cm, 10 cm). Can be preinitialized by named slots defined in the jbeam (numbered elements with .name). Returns a constructor.

## Notes

- Creates on demand a PointLight object 'relativecameralight' (canSave = false, radius 20 m) in scenetree.
- If the ref/left/back nodes are missing, uses nodes 0, 1, 2 (debug log). After a vehicle model change, the camera is recomputed one frame later.
- The extracted page says hotkey(modifier) but the code is hotkey(hotkey, modifier); modifier 0 = load the slot, 1 = save it. loadSlot accepts a slot number or name.
- The light is turned off (storeLightInfo) when the camera loses focus and restored (restoreLightInfo) when it regains it.

## Class `C`

Relative mode. Fields: pos (vec3 vehicle frame), rot (vec3 degrees), slots, lightIntensity, nearClip (nil = level), manualzoom, camMaxDist.

The module returns a constructor: `local obj = require("core_cameraModes_relative")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_updateLight(intensity)` | Applies an intensity (>= 0) to the camera light, creating it if needed. | 48 |
| `C:deserialize(s)` | Restores the state from serialize. | 202 |
| `C:hotkey(hotkey, modifier)` | Slot keyboard shortcut; ignored without focus. | 236 |
| `C:init()` | Default values (resetCameraOnVehicleReset = false, disabledByDefault, canUseVehicleTriggerCrosshair) then onVehicleCameraConfigChanged and reset. | 23 |
| `C:listParams()` | UI settings: light, nearClip, slots, fov. | 214 |
| `C:loadSlot(slot)` | Loads a slot; UI message if empty. | 159 |
| `C:onCameraChanged(focused)` | Hook: on focus gain, adds the menus and turns the light back on; on loss, turns the light off. | 250 |
| `C:onVehicleCameraConfigChanged()` | Hook: guarantees refNodes (default 0,1,2) and schedules the camera recomputation. | 39 |
| `C:reset()` | Returns to the initial position and rotation and recreates the smoothers. | 259 |
| `C:restoreLightInfo()` | Restores the light stored by storeLightInfo. | 143 |
| `C:saveSlot(slot)` | Saves position, rotation and FOV in the given slot. | 150 |
| `C:sendMenus()` | Adds the quickAccess radial menu entries (light, nearClip, slots) while the camera has focus. | 64 |
| `C:serialize()` | State for video stream views: pos, rot, fov, light, nearClip. | 192 |
| `C:setFOV(fov)` | Sets the manual zoom FOV. | 178 |
| `C:setMaxDistance(d)` | Limits the distance from the ref node. | 269 |
| `C:setOffset(pos)` | Sets the camera position in the vehicle frame. | 186 |
| `C:setParam(key, value)` | Changes light, nearClip, fov or slots (saves or loads the given slot). | 226 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Sets the vehicle's reference nodes. | 389 |
| `C:setRotation(rot)` | Sets the camera rotation. | 182 |
| `C:storeLightInfo()` | Stores the intensity and turns the light off. | 245 |
| `C:update(data)` | Integrates the inputs, moves the camera in the vehicle frame and writes data.res (pos, rot, nearClip); positions the light. | 273 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/relative.lua`.*

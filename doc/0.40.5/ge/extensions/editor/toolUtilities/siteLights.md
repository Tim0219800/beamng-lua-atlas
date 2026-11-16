# `editor_toolUtilities_siteLights`

*File: `lua/ge/extensions/editor/toolUtilities/siteLights.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteLights`: `extensions.load("editor_toolUtilities_siteLights")`, then the global `editor_toolUtilities_siteLights`

A single place that turns a light record into a scene object, for all tools of the suite. Each light is a night light as soon as it is placed: dark by day, lit after dusk, switched by the environment (core_environment). Provides creation (spawn), update (apply), a flag to ask the environment to rescan the scene again (markDirty) and a lightweight loop to call every frame (flush) that keeps new lights in sync with day and night.

## Example

```lua
local lights = extensions.editor_toolUtilities_siteLights
local obj = lights.spawn(folder, 'MyLamp_1', {px = x, py = y, pz = z + 6, glow = lights.TONES.warm, radius = 18, brightness = 2})
-- every frame of the tool:
lights.flush()
```

## Notes

- Light record: { px, py, pz, glow or col ({r,g,b}), brightness, radius } for a bulb (PointLight); plus { dx, dy, dz, cone } for a spotlight (SpotLight). The class is fixed at creation and must match the record. cone defaults to 70 degrees, inner angle = 0.6 * cone, the range comes from radius (range field).
- A record with always = true is lit day and night (a tunnel is dark at noon) and excluded from any day/night switching.
- Lights are created with canSave = false and castShadows = false; a light without always starts off (isEnabled false) with nightLight = 1 and is entrusted to the environment.
- The environment rescan walks the whole scene (seconds on an urban map): markDirty without an object waits for settleMs = 250 ms of calm; with an object, it is put in the current day/night state without a rescan and followed every 500 ms (followMs).
- A nil name leaves the light unnamed, which registers it about 3 ms faster; the environment's dusk pass finds them by id, so it still switches them. An existing light of the same name is deleted before creation.
- If the environment has been left without a scan (Lua reload), flush detects it (night but lights not enabled, on two consecutive checks) and requests a rescan again.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteLights.apply(obj, lt)` | Adjusts an existing light from a record: radius (or range and angles for a spotlight), brightness, color, shadows disabled, position, and rotation toward (dx, dy, dz) for a spotlight. | 108 |
| `editor_toolUtilities_siteLights.flush()` | To be called every frame by each tool that creates lights. Cheap as long as nothing is due: performs the deferred rescan, follows the environment's day/night state (core_environment.getLightState) and switches (setLightEnabled, or instance color for an emissive lens) the marked objects. | 57 |
| `editor_toolUtilities_siteLights.markDirty(obj)` | Signals that a light is new (with obj: it will be put in the current day/night state) or that a full scene rescan is due (without obj: done after a 250 ms pause). Deleting a light needs no rescan: the environment ignores those that have vanished. | 49 |
| `editor_toolUtilities_siteLights.spawn(folder, name, lt)` | Creates a light object for a record (SpotLight if it carries a direction, otherwise PointLight), registers it under name and adds it to folder. Returns nil if creation fails. Unless always, the light is entrusted to the environment via markDirty. | 135 |

### Parameter details

#### `editor_toolUtilities_siteLights.apply(obj, lt)`

Adjusts an existing light from a record: radius (or range and angles for a spotlight), brightness, color, shadows disabled, position, and rotation toward (dx, dy, dz) for a spotlight.

- `obj` (*userdata*) : PointLight or SpotLight object.
- `lt` (*table*) : Light record.

#### `editor_toolUtilities_siteLights.markDirty(obj)`

Signals that a light is new (with obj: it will be put in the current day/night state) or that a full scene rescan is due (without obj: done after a 250 ms pause). Deleting a light needs no rescan: the environment ignores those that have vanished.

- `obj` (*userdata|nil*) : New light or light element.

#### `editor_toolUtilities_siteLights.spawn(folder, name, lt)`

Creates a light object for a record (SpotLight if it carries a direction, otherwise PointLight), registers it under name and adds it to folder. Returns nil if creation fails. Unless always, the light is entrusted to the environment via markDirty.

- `folder` (*userdata|nil*) : Parent scene group.
- `name` (*string|nil*) : Object name (nil = unnamed).
- `lt` (*table*) : Light record.
- **returns**: userdata|nil Created light object.

## Fields

| Field | Type | Description |
|---|---|---|
| `TONES` | table<string, number[]> | Named tints: warm {1.00, 0.72, 0.34} (sodium), white {1.00, 0.95, 0.88}, cool {0.78, 0.87, 1.00} (metal halide). Prevents two neighboring sites from being lit in different colors. |

## Calls into the engine (C++)

- `core_environment.` `getLightState`, `refreshnightLightsObjects`
- `obj:` `getField`, `isSubClassOf`, `postApply`, `preApply`, `registerObject`, `setField`, `setLightEnabled`, `setPosition`, `updateInstanceRenderData`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteLights.lua`.*

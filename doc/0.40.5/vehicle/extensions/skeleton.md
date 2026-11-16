# `skeleton`

*File: `lua/vehicle/extensions/skeleton.lua` · VM: Vehicle · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `skeleton`: `extensions.load (vehicle VM)("skeleton")`, then the global `skeleton`

Minimal vehicle extension template, and an extension actually used: main.lua always loads it (extensions.load("skeleton")) at the end of vehicle initialization. Lifecycle: the extension manager loads it, calls onExtensionLoaded(), and if that returns false the extension is unloaded immediately (its hooks will never be called); otherwise it stays active and receives the global hooks (here onDebugDraw, called every debug frame by main.lua). Convention: an extension exposes its hooks in the table M (onExtensionLoaded, onInit, onReset, updateGFX, onDebugDraw, onExtensionUnloaded…) and returns M.
This one draws the vehicle's beams and nodes to help get started in jbeam when there is no flexbody.

## Example

```lua
-- skeleton of a vehicle extension
local M = {}
local function onExtensionLoaded()
  if not v.data.nodes then return false end -- false = unload itself
end
local function updateGFX(dt) end
M.onExtensionLoaded = onExtensionLoaded
M.updateGFX = updateGFX
return M
```

## Notes

- Unloads itself (returns false) if v.data.beams or v.data.nodes is nil, if v.data.information.showSkeleton is defined and false, or if the vehicle has non-empty flexbodies. It therefore only stays for vehicles without a visible mesh and whose information.showSkeleton is not disabled.
- Return value of onExtensionLoaded: `false` = unload; `true` or nil = keep (extensions.lua only tests res == false).
- Drawing is disabled when bdebug.isEnabled() is true to avoid a conflict with debug mode.
- Colors: beams (44,71,112,230) thickness 0.01; nodes (170,57,57,230) radius 0.03; collision triangles via drawColTris.

## Functions

| Function | Description | Line |
|---|---|---|
| `skeleton.onDebugDraw(focusPos)` | Hook called every frame by main.lua (extensions.hook('onDebugDraw', focusPos)). Draws all beams (drawBeam3d), all nodes (drawNodeSphere) and the collision triangles, unless beam debug (bdebug) is active. *(internal)* *(hook)* | 24 |
| `skeleton.onExtensionLoaded()` | Hook called right after the extension loads. Returns false to unload itself (no beams/nodes, showSkeleton false, or flexbodies present), true otherwise. *(internal)* *(hook)* | 11 |

### Parameter details

#### `skeleton.onDebugDraw(focusPos)`

Hook called every frame by main.lua (extensions.hook('onDebugDraw', focusPos)). Draws all beams (drawBeam3d), all nodes (drawNodeSphere) and the collision triangles, unless beam debug (bdebug) is active.

- `focusPos` (*vec3*) : Camera focus position (unused).

#### `skeleton.onExtensionLoaded()`

Hook called right after the extension loads. Returns false to unload itself (no beams/nodes, showSkeleton false, or flexbodies present), true otherwise.

- **returns**: boolean false = unload the extension, true = keep it.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/skeleton.lua`.*

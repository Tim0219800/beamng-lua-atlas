# `editor_crawlEditor_input`

*File: `lua/ge/extensions/editor/crawlEditor/input.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_crawlEditor_input`: `extensions.load("editor_crawlEditor_input")`, then the global `editor_crawlEditor_input`

Crawl editor mouse helper: on each updateMouseInfo call, computes the camera-mouse ray, the raycast on the scene (forest disabled during the cast) and the left button click/hold/release states. The other crawlEditor files read the result via getMouseInfo().

## Notes

- Fields of the mouseInfo table: camPos, ray, rayDir, rayCast, valid, down, hold, up, closestNodeHovered, and _downPos/_downNormal, _holdPos/_holdNormal, _upPos/_upNormal (vec3 from rayCast.pos and rayCast.normal).
- down/hold/up are forced to false when the raycast hits nothing; otherwise they are also false if imgui captures the mouse (WantCaptureMouse).
- getMouseInfo() returns nil as long as updateMouseInfo has never been called.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_crawlEditor_input.getMouseInfo()` | Returns the current mouseInfo table. | 45 |
| `editor_crawlEditor_input.updateMouseInfo()` | Updates the mouseInfo table (camera position, mouse ray, raycast, left button states). Disables then re-enables forest collision around the raycast. | 10 |

### Parameter details

#### `editor_crawlEditor_input.getMouseInfo()`

Returns the current mouseInfo table.

- **returns**: table|nil mouseInfo, or nil before the first updateMouseInfo

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/input.lua`.*

# `flowgraph_nodes_environment_getPhotomode`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getPhotomode.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getPhotomode")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Photomode" (category provider, author BeamNG, tags photomode/photo/camera/screenshot/capture). Outputs a bool "value": true if photo mode is open, read from the global variable photoModeOpen.

## Notes

- Depends on a global variable (photoModeOpen); it is nil if photo mode has never been initialized.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, copies photoModeOpen to the value output. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getPhotomode.lua`.*

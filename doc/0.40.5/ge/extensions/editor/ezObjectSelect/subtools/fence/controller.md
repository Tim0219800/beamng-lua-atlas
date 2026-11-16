# `editor_ezObjectSelect_subtools_fence_controller`

*File: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_subtools_fence_controller`: `extensions.load("editor_ezObjectSelect_subtools_fence_controller")`, then the global `editor_ezObjectSelect_subtools_fence_controller`

ImGui panel of the "Fence" sub-tool of Easy Object Select. Lets you choose the fence mesh (Asset Browser selection or object selected in Easy Select), set the anchor matching distance (0.05 to 5 m) and the "No overlap" option, then start Select Fence, and, once the mode is active, confirm (Exit Fence Mode), cancel (Cancel Fence) or delete (Delete Fence) the fence. Delegates all the logic to fence/session.

## Notes

- Exit Fence Mode and Delete Fence are disabled when the session has reached its safety limit (isCapped).
- The panel state (chosen asset, distance, noOverlap, message) is local to the module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_controller.cancel()` | Cancels the current fence session (restores the original pieces). | 155 |
| `editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options)` | Draws the sub-tool panel and handles clicks on its buttons (calls fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap). | 28 |
| `editor_ezObjectSelect_subtools_fence_controller.isModeActive()` | Indicates whether fence mode is active. | 159 |
| `editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput)` | Passes the frame to fenceSession.update (mouse/keyboard input, preview, drawing). | 151 |

### Parameter details

#### `editor_ezObjectSelect_subtools_fence_controller.drawWorkspace(options)`

Draws the sub-tool panel and handles clicks on its buttons (calls fenceSession.begin / exitAndCommit / cancel / deleteAndCommit / setNoOverlap).

- `options` (*table|nil*) : canEnter (boolean): if false, Select Fence is disabled.

#### `editor_ezObjectSelect_subtools_fence_controller.isModeActive()`

Indicates whether fence mode is active.

- **returns**: boolean true if a session is active.

#### `editor_ezObjectSelect_subtools_fence_controller.update(canAcceptInput)`

Passes the frame to fenceSession.update (mouse/keyboard input, preview, drawing).

- `canAcceptInput` (*boolean*) : true if the view can receive input.
- **returns**: boolean true if a session is active.

## Calls into the engine (C++)

- `obj:` `getField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/controller.lua`.*

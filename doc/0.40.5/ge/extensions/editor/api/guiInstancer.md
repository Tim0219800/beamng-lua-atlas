# `editor_api_guiInstancer`

*File: `lua/ge/extensions/editor/api/guiInstancer.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/guiInstancer")` (file under extensions/ but not a regular extension)

Small editor utility class that manages a list of instances of a GUI window (e.g. several copies of the same panel). Each instance is a `{ locked = false }` table stored in `instances` with an integer index. The module returns a constructor with no arguments that creates the object and calls `init`.

## Example

```lua
local instancer = require("editor/api/guiInstancer")()
local idx = instancer:addInstance()
instancer:removeInstance(idx)
```

## Notes

- `nextInstanceIndex` is reset to 1 when the instances table is empty at the time of `addInstance`.
- `removeInstance` only sets the slot to nil: indices are not shifted.

## Class `C`

Object returned by the module constructor. Fields: `instances` (table index -> {locked}), `nextInstanceIndex` (integer).

The module returns a constructor: `local obj = require("editor_api_guiInstancer")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addInstance()` | Adds an instance `{ locked = false }` and returns its index. Restarts at 1 if no instance exists. | 12 |
| `C:deserialize(name, state)` | Restores `instances` and `nextInstanceIndex` from `state[name]` if it exists (defaults `{}` and 1). | 29 |
| `C:init()` | Initializes `instances` to empty and `nextInstanceIndex` to 1. Called by the constructor. | 7 |
| `C:removeInstance(instanceIndex)` | Removes the instance at the given index (sets the slot to nil). | 21 |
| `C:serialize(name, state)` | Writes `{ instances, nextInstanceIndex }` into `state[name]` for saving the editor state. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/guiInstancer.lua`.*

# `flowgraph_nodes_career_onTestDriveChanged`

*File: `lua/ge/extensions/flowgraph/nodes/career/onTestDriveChanged.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onTestDriveChanged")` (file under extensions/ but not a regular extension)

Flowgraph node "On Testdrive Changed" (category repeat_instant, ui color/icon). Detects the start (onTestDriveStarted hook) and the end after the fade (onTestDriveEndedAfterFade) of a vehicle test drive in career. Impulse outputs: started and ended.

## Notes

- The node's description is "TBD" and that of the ended pin is copied from started ("when the vehicle is spawned").
- work() sets back to false only started; ended stays true after an event.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 21 |
| `C:onTestDriveEndedAfterFade(data)` | Hook: raises ended. | 37 |
| `C:onTestDriveStarted(data)` | Hook: raises started. | 33 |
| `C:work(args)` | Every frame: started to false, applies then clears the flags. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onTestDriveChanged.lua`.*

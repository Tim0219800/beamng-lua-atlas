# `flowgraph_nodes_career_menuClosed`

*File: `lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/menuClosed")` (file under extensions/ but not a regular extension)

Flowgraph node "Menu Closed" (category repeat_instant, ui color/icon). One-frame impulse on the menuClosed output when a menu has been closed and the player is back in game (onUIPlayStateChanged hook with enteredPlay true).

## Notes

- Its in-game description is "Util Helper for Garage tutorial" (copy-paste).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 19 |
| `C:onUIPlayStateChanged(enteredPlay)` | Hook: if the player has returned to the play state, raises the menuClosed flag. | 31 |
| `C:work(args)` | Every frame: menuClosed to false, applies then clears the flags. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua`.*

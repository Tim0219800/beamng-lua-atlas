# `gameplay_traffic_roles_empty`

*File: `lua/ge/extensions/gameplay/traffic/roles/empty.lua` · VM: Game Engine (GE) · 17 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/roles/empty")` (file under extensions/ but not a regular extension)

Minimal traffic role ("empty"). It inherits from baseRole but empties the actions table: no extra action or specific AI is applied to the vehicle. Useful for a traffic vehicle you want to leave completely passive.

## Notes

- The module returns a constructor: require('/lua/ge/extensions/gameplay/traffic/baseRole')(C, ...) wraps class C.
- init copies the baseActions of baseRole into self.actions then sets self.baseActions to nil.

## Class `C`

Role class, completed by baseRole.

The module returns a constructor: `local obj = require("gameplay_traffic_roles_empty")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Called when the role is created. Copies the base actions (self.baseActions) into self.actions, then removes self.baseActions; no role-specific action is added. | 9 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/roles/empty.lua`.*

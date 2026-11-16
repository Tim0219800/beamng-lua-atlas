# `flowgraph_nodes_gameplay_rally_fireRallyEvent`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Fire Rally Event" (category once_instant, tag rally). Fires a rally event: calls extensions.hook('on' .. eventType, {show = show}) and guihooks.trigger(eventType, {show = show}). Inputs: eventType (string, event name without the "on" prefix) and show (bool, default true, show the corresponding UI).

## Notes

- If eventType is nil, the concatenation 'on'..nil causes a Lua error.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls the extension hook and the guihook corresponding to eventType with {show = ...}. | 20 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `on`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/fireRallyEvent.lua`.*

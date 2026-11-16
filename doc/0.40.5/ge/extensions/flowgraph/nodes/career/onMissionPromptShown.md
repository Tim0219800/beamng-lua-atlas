# `flowgraph_nodes_career_onMissionPromptShown`

*File: `lua/ge/extensions/flowgraph/nodes/career/onMissionPromptShown.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onMissionPromptShown")` (file under extensions/ but not a regular extension)

Flowgraph node "On Poi Prompt Shown" (category repeat_instant, ui color/icon). Detects that the player has stopped at a point of interest and the prompt (missions, dealership, garage, refueling) is shown. One-frame impulse outputs: shownPrompt (prompt shown, including garage and fuel) and openedMenu (mission list sent to the UI).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 22 |
| `C:onActivityAcceptUpdate(data)` | Hook: raises shownPrompt. | 36 |
| `C:onAvailableMissionsSentToUi(data)` | Hook: raises openedMenu. | 40 |
| `C:work(args)` | Every frame: sets both outputs back to false, applies and clears the flags. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onMissionPromptShown.lua`.*

# `flowgraph_nodes_gameplay_rally_rallyStageCountdownSetup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Stage Countdown Setup" (category once_instant, tag rally, no pin). Prepares the rally countdown UI flow before the stage fade-in: loads the rally loop extension if needed, clears the rally manager's split times (clearSplitTimes), reads the countdown settings (StagedCountdownUtils.getStageCountdownSettings, defaults duration 3 and 3 announcements max) then fires the onRallyDataUpdated hook with the inactive state and countdownData {countdown = duration, state = 'waiting'}.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Executes the preparation described above only once. | 34 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageCountdownSetup.lua`.*

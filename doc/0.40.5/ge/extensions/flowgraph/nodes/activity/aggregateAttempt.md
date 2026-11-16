# `flowgraph_nodes_activity_aggregateAttempt`

*File: `lua/ge/extensions/flowgraph/nodes/activity/aggregateAttempt.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/aggregateAttempt")` (file under extensions/ but not a regular extension)

Flowgraph node "Aggregate Attempt" (category once_p_duration, tags activity/mission). Integrates an attempt into the mission's progression (gameplay_missions_progress.aggregateAttempt), saves the data outside career, stops the AI recording and computes the outro text of the highest unlocked default star. Inputs: "attempt" (attemptData), "progressKey" (string, otherwise currentProgressKey then the mission's defaultProgressKey). Outputs: "change" (table), "outroText", "outroTranslation" (translationObject table {txt, context}), "newBestType" (bool, hidden); custom output pins receive the fields of aggregateChange with the same name.

## Notes

- Does nothing without an associated activity (self.mgr.activity is nil).
- Outside career, calls gameplay_missions_progress.saveMissionSaveData for the mission; in career, saving is left to career mode.
- The outro text first takes careerSetup.starOutroTexts then defaultStarOutroTexts; 'noStarExists' is used when no default star exists or is unlocked.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 28 |
| `C:workOnce()` | Aggregates the attempt, saves if outside career, stops the AI recording (aiRecording module), computes outroText/outroTranslation and fills change and the custom output pins. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/aggregateAttempt.lua`.*

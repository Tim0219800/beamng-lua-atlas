# `gameplay_rally_loop_roadSectionPenaltyKeeper`

*File: `lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/loop/roadSectionPenaltyKeeper")` (file under extensions/ but not a regular extension)

Monitors the road sections of a rally loop: if the player triggers too many route recalculations within a time window (leaves the road section route), a "liaison_deviation" penalty is recorded with the manager. Penalties escalate: 30 s, 60 s, 120 s, 180 s.

## Notes

- Constants: window RECALC_TIME_WINDOW = 10 s, threshold RECALC_THRESHOLD = 5 recalculations, MAX_VIOLATIONS = 1.
- With MAX_VIOLATIONS = 1, onUpdate triggers only one violation per instance (condition violationCount < 1), so in practice only the 30 s penalty is applied; the 60/120/180 s tiers are never reached by onUpdate.
- The module returns a constructor: require('gameplay_rally_loop_roadSectionPenaltyKeeper')(manager). Time comes from manager.clock.

## Class `C`

Road section penalty detector. Fields: manager, recalcCount, violationCount, lastCheckTime.

The module returns a constructor: `local obj = require("gameplay_rally_loop_roadSectionPenaltyKeeper")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:createPenaltyData()` | Increments violationCount and returns the penalty data {type = 'liaison_deviation', amount, data = {violationNumber, recalcCount}} with amount = 30, 60, 120 then 180 s. | 37 |
| `C:init(manager)` | Stores the manager and resets the counters. Called by the constructor. | 20 |
| `C:onUpdate()` | Called every frame by the manager. Every 10 s (manager.clock time), if recalcCount > 5 and violationCount < MAX_VIOLATIONS, calls manager:recordRouteRecalcPenalty(createPenaltyData()) and resets recalcCount to 0. | 58 |
| `C:registerRecalc()` | Increments the route recalculation counter; call it on each detected route recalculation. | 33 |
| `C:reset()` | Resets recalcCount and violationCount to 0. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua`.*

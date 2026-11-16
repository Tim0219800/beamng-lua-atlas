# `gameplay_drift_stallingSystem`

*File: `lua/ge/extensions/gameplay/drift/stallingSystem.lua` · VM: Game Engine (GE) · 186 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_stallingSystem`: `extensions.load("gameplay_drift_stallingSystem")`, then the global `gameplay_drift_stallingSystem`

Anti-repetition system of the "Gymkhana" challenge mode: it keeps the history of figures (normal drifts and stunt zones) and computes a multiplier (stallingValue, between 0.5 and 1) that reduces the score when the player repeats the same figure. Loaded by gameplay_drift_general when the challenge mode is "Gymkhana". Also contains a debug imgui window.

## Notes

- Settings: minStallingValue 0.5, maxStallingValue 1, history considered = last 10 figures. Normal drift (stuntId 0): +0.35 on figure change, -0.15 beyond 5 repetitions. Stunt zone: +1, -0.6 beyond 1 repetition.
- The multiplier stays at 1 as long as the history contains fewer than 2 entries or fewer than 2 different figures.
- The multiplier equals score/maxPossibleScore clamped; if maxPossibleScore stays at 0, the division gives NaN/inf before clamping (math.max/min).
- The variable stuntZonesCount is reset to -1 but is never used elsewhere (dead code).

**Dependencies (loaded first):** `gameplay_drift_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_stallingSystem.calculateScore(score)` | Applies the stalling multiplier to a score. | 118 |
| `gameplay_drift_stallingSystem.getDriftDebugInfo()` | Returns {default=true, canBeChanged=true} for the drift debug window. | 173 |
| `gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting)` | Hook: when the player starts drifting, adds a drift (stuntId 0) to the history and recomputes the multiplier. *(internal)* *(hook)* | 132 |
| `gameplay_drift_stallingSystem.onUpdate()` | Called every frame: displays the "Drift stalling system" debug window if enabled. *(internal)* *(hook)* | 169 |
| `gameplay_drift_stallingSystem.processStuntZone(stuntZoneId)` | Adds a stunt zone to the history (type "stuntZone") and recomputes the multiplier. | 122 |
| `gameplay_drift_stallingSystem.reset()` | Clears the history and resets the multiplier to 1. | 40 |

### Parameter details

#### `gameplay_drift_stallingSystem.calculateScore(score)`

Applies the stalling multiplier to a score.

- `score` (*number*) : Raw score.
- **returns**: number score * stallingValue.

#### `gameplay_drift_stallingSystem.getDriftDebugInfo()`

Returns {default=true, canBeChanged=true} for the drift debug window.

- **returns**: table {default = true, canBeChanged = true}

#### `gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting)`

Hook: when the player starts drifting, adds a drift (stuntId 0) to the history and recomputes the multiplier.

- `isDrifting` (*boolean*) : true at the start of a drift.

#### `gameplay_drift_stallingSystem.processStuntZone(stuntZoneId)`

Adds a stunt zone to the history (type "stuntZone") and recomputes the multiplier.

- `stuntZoneId` (*integer*) : Zone identifier; a non-zero value distinguishes it from normal drifts.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, loaded beforehand. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/stallingSystem.lua`.*

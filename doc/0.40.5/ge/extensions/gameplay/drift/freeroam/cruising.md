# `gameplay_drift_freeroam_cruising`

*File: `lua/ge/extensions/gameplay/drift/freeroam/cruising.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_freeroam_cruising`: `extensions.load("gameplay_drift_freeroam_cruising")`, then the global `gameplay_drift_freeroam_cruising`

Detects in free roaming the switch to drift "cruising" mode: when the player chains enough drifts (or does a very long drift), the drift context goes from "inFreeroam" to "inFreeroamCruising" (which shows the drift interface) then goes back to "inFreeroam" after a few seconds without drifting. Reads gameplay_drift_drift and drives gameplay_drift_general.setContext.

## Notes

- Hardcoded thresholds: drift >= 1.5 s with at least 3 chained drifts, or drift >= 3.2 s; the drift must not have ended within 25 m of its starting point (otherwise it is a donut, not cruising); the interface is disabled after 3 s without drifting.
- The end countdown uses dtSim (simulated time), so it is slowed/frozen with slow motion or pause.
- The onDriftFreeroamCruisingStarted hook is emitted with no argument when switching to cruising.
- The local function getGC (profiler garbage) is not exported: dead code.

**Dependencies (loaded first):** `gameplay_drift_general`, `gameplay_drift_drift`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: tests the start of cruising (detectStart) then its end (detectEnd). If general debug is active, measures the cost with a LuaProfiler. *(internal)* *(hook)* | 46 |

### Parameter details

#### `gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: tests the start of cruising (detectStart) then its end (detectEnd). If general debug is active, measures the cost with a LuaProfiler.

- `dtReal` (*number*) : Real time delta in seconds (unused).
- `dtSim` (*number*) : Simulated time delta in seconds, used for the end countdown.
- `dtRaw` (*number*) : Raw time delta in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general and gameplay_drift_drift, loaded beforehand. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftFreeroamCruisingStarted` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/freeroam/cruising.lua`.*

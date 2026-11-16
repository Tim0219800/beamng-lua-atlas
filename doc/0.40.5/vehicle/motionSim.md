# `motionSim`

*File: `lua/vehicle/motionSim.lua` · VM: Vehicle · 8 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("motionSim")`

Obsolete file kept for compatibility: require('motionSim') only logs an error (points to https://go.beamng.com/protocols, the telemetry/motion simulator protocol system), prints a stack trace (debug.tracesimple) to find the faulty code, and returns an empty table.

## Notes

- No function or field: any access to a function of this module will give nil. Use the protocols system (module `protocols`) instead.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/motionSim.lua`.*

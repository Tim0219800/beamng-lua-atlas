# `outsim`

*File: `lua/vehicle/extensions/outsim.lua` · VM: Vehicle · 7 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `outsim`: `extensions.load (vehicle VM)("outsim")`, then the global `outsim`

Obsolete file: it only writes an error to the log (with the call trace) saying that something tried to use the old outsim extension, and returns an empty table. The OutSim protocol is handled elsewhere (see https://go.beamng.com/protocols and the protocols module).

## Notes

- The module returns {}: any function called on it will be nil.
- The log error occurs when the file is loaded.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/outsim.lua`.*

# `outgauge`

*File: `lua/vehicle/extensions/outgauge.lua` · VM: Vehicle · 7 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `outgauge`: `extensions.load (vehicle VM)("outgauge")`, then the global `outgauge`

Obsolete file: it only writes an error to the log (with the call trace) saying that something tried to use the old outgauge extension, and returns an empty table. The OutGauge protocol is handled elsewhere (see https://go.beamng.com/protocols and the protocols module).

## Notes

- The module returns {}: any function called on it will be nil.
- The log error occurs when the file is loaded (require/extensions.load).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/outgauge.lua`.*

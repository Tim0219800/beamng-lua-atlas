# `powertrain_hydraulicWinch`

*File: `lua/vehicle/powertrain/hydraulicWinch.lua` · VM: Vehicle · 1 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `hydraulicWinch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Empty file (0 bytes) in BeamNG.drive 0.40.5. It defines no `new`, field or function. Using a `hydraulicWinch` component in the `powertrain` jbeam would make the module load fail (require returns true instead of a table, so the call to `new` would fail). No other Lua file of the game references `hydraulicWinch`.

## Notes

- Bug / leftover: file present but empty. For a real winch, see electricWinch (prototype) or linearActuator, hydraulicCylinder, hydraulicPump.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/hydraulicWinch.lua`.*

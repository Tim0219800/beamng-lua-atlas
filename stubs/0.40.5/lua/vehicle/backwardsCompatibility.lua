---@meta
-- tim19Atlas stub generated from lua/vehicle/backwardsCompatibility.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Converts old vehicle data (v.data) to the current format at initialization: old drivetrain (engine/differentials) to a powertrain, hard-coded ESC (escConfig) to an 'esc' controller, and heuristic trailer detection to limit ignition levels. A modder does not need to call it: it serves old vehicles/mods whose jbeam has not been migrated. It modifies v.data in place.
--- Access: global `backwardsCompatibility`
---@class backwardsCompatibility
backwardsCompatibility = {}

--- Applies all backward-compatibility conversions to v.data (ESC, drivetrain, trailer ignition states). Called by vehicle loading before systems are initialized.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/backwardsCompatibility.lua:393
function backwardsCompatibility.init() end


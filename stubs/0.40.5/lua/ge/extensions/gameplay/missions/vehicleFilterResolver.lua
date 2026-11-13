---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_vehicleFilterResolver` : `extensions.load("gameplay_missions_vehicleFilterResolver")`, puis la globale `gameplay_missions_vehicleFilterResolver`
---@class gameplay_missions_vehicleFilterResolver
gameplay_missions_vehicleFilterResolver = {}

--- Returns true if `filterData` has any filter, manual addition, or manual removal
---  that would meaningfully constrain the eligible vehicle set.
---Source : lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:172
---@param filterData any
function gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData) end

--- Resolves the given `filterData` into a flat list of `{model, config, name}` entries.
---  Always returns a table (possibly empty). Honors base filter, probability settings,
---  manual additions, manual removals, maxVehicles, and auxiliary/trailer flags.
---Source : lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:189
---@param filterData any
function gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData) end


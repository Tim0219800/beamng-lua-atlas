---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/rentals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unfinished draft of a vehicle rental system in career: most functions contain only comments, and the hooks (onExtensionLoaded, onSaveCurrentProfile, onUpdate) are commented out. Only isRenting is exported.
--- Access: extension `career_modules_rentals`: `extensions.load("career_modules_rentals")`, then the global `career_modules_rentals`
---@class career_modules_rentals
career_modules_rentals = {}

--- UI API: indicates whether a rental vehicle is in progress (currRentalVeh not nil).
---Source: lua/ge/extensions/career/modules/rentals.lua:42
---@return boolean  Always false as it stands.
function career_modules_rentals.isRenting() end


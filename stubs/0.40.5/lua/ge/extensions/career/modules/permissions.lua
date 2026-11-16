---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/permissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career permissions system. An action (tag such as vehicleModification, vehicleSelling, interactRefuel, recoveryTowToRoad...) can be allowed, warning, forbidden or hidden. The module decides nothing itself: it emits the onCheckPermission(tags, permissions, additionalData) hook and keeps the most restrictive answer given by extensions (e.g. an activity in progress).
--- Access: extension `career_modules_permissions`: `extensions.load("career_modules_permissions")`, then the global `career_modules_permissions`
---@class career_modules_permissions
career_modules_permissions = {}

--- Queries the extensions via the onCheckPermission hook and returns the most restrictive permission for the given tags.
---Source: lua/ge/extensions/career/modules/permissions.lua:41
---@param tags string|string[] A tag or a list of tags (a string is wrapped in a table).
---@param additionalData any Data passed as is to the hook.
---@return {allow: boolean, permission: string, label: any, type: string, penalty: any}  Retained status; type is "text".
function career_modules_permissions.getStatusForTag(tags, additionalData) end


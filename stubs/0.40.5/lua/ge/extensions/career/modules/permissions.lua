---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/permissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de permissions de la carrière. Une action (tag comme vehicleModification, vehicleSelling, interactRefuel, recoveryTowToRoad…) peut être allowed, warning, forbidden ou hidden. Le module ne décide rien lui-même : il émet le hook onCheckPermission(tags, permissions, additionalData) et garde la réponse la plus restrictive donnée par les extensions (par ex. une activité en cours).
--- Accès : extension `career_modules_permissions` : `extensions.load("career_modules_permissions")`, puis la globale `career_modules_permissions`
---@class career_modules_permissions
career_modules_permissions = {}

--- Interroge les extensions via le hook onCheckPermission et renvoie la permission la plus restrictive pour les tags donnés.
---Source : lua/ge/extensions/career/modules/permissions.lua:41
---@param tags string|string[] Un tag ou une liste de tags (une chaîne est encapsulée dans une table).
---@param additionalData any Données transmises telles quelles au hook.
---@return {allow: boolean, permission: string, label: any, type: string, penalty: any}  Statut retenu ; type vaut "text".
function career_modules_permissions.getStatusForTag(tags, additionalData) end


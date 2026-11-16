---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Migration of the "sidecar" files of the dynamic decal textures. Upgrades a sidecar from version 1 to version 2: removes the path field and replaces the (obsolete) sdf type with the boolean isSdfCompatible.
--- Access: extension `editor_api_dynamicDecals_sidecarFileMigration`: `extensions.load("editor_api_dynamicDecals_sidecarFileMigration")`, then the global `editor_api_dynamicDecals_sidecarFileMigration`
---@class editor_api_dynamicDecals_sidecarFileMigration
editor_api_dynamicDecals_sidecarFileMigration = {}

--- Modifies the table in place: if data.version == 1, upgrades it to version 2 (path = nil, isSdfCompatible = (type == sdf)).
---Source: lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua:34
---@param data table Decoded sidecar content
function editor_api_dynamicDecals_sidecarFileMigration.migrate(data) end


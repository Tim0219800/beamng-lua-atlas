---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Migration des fichiers « sidecar » des textures de decals dynamiques. Passe un sidecar de la version 1 à la version 2 : supprime le champ path et remplace le type sdf (obsolète) par le booléen isSdfCompatible.
--- Accès : extension `editor_api_dynamicDecals_sidecarFileMigration` : `extensions.load("editor_api_dynamicDecals_sidecarFileMigration")`, puis la globale `editor_api_dynamicDecals_sidecarFileMigration`
---@class editor_api_dynamicDecals_sidecarFileMigration
editor_api_dynamicDecals_sidecarFileMigration = {}

--- Modifie la table en place : si data.version == 1, la passe en version 2 (path = nil, isSdfCompatible = (type == sdf)).
---Source : lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua:34
---@param data table Contenu du sidecar décodé
function editor_api_dynamicDecals_sidecarFileMigration.migrate(data) end


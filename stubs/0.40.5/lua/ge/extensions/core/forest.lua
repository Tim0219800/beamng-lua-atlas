---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/forest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_forest` : fournit un accès mis en cache à l'objet `Forest` de la scène (la forêt/végétation instanciée du niveau). Un moddeur l'utilise pour obtenir cet objet sans refaire une recherche dans la scène.
--- Accès : extension `core_forest` : `extensions.load("core_forest")`, puis la globale `core_forest`
---@class core_forest
core_forest = {}

--- Renvoie l'objet Forest de la scène (premier de classe 'Forest'), avec cache de son id.
---Source : lua/ge/extensions/core/forest.lua:9
---@return userdata|nil  Objet Forest, nil s'il n'y en a pas dans le niveau.
function core_forest.getForestObject() end


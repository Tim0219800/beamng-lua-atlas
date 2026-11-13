---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/documentationHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite extension de l'éditeur qui ajoute à la table globale `editor` deux fonctions pour ouvrir la documentation en ligne de BeamNG dans le navigateur. Les autres outils de l'éditeur s'en servent pour leurs boutons d'aide.
--- Accès : extension `editor_documentationHelper` : `extensions.load("editor_documentationHelper")`, puis la globale `editor_documentationHelper`
---@class editor_documentationHelper
editor_documentationHelper = {}

--- Hook appelé par l'éditeur quand il est initialisé. Installe editor.openHelp et editor.openCodingHelp.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/documentationHelper.lua:16
function editor_documentationHelper.onEditorInitialized() end

--- Fonctions ajoutées à la table globale `editor` par onEditorInitialized.
---@class editor_documentationHelper_editor
local editor_documentationHelper_editor = {}

--- Ouvre dans le navigateur la référence d'API de l'éditeur : https://documentation.beamng.com/world_editor/api_reference/<page>.html.
---Source : lua/ge/extensions/editor/documentationHelper.lua:12
---@param contextPageName string|nil Nom de la page sans extension ; « index » si nil.
function editor_documentationHelper_editor.openCodingHelp(contextPageName) end

--- Ouvre dans le navigateur https://documentation.beamng.com/world_editor/<page>.html.
---Source : lua/ge/extensions/editor/documentationHelper.lua:8
---@param contextPageName string|nil Nom de la page sans extension ; « index » si nil.
function editor_documentationHelper_editor.openHelp(contextPageName) end


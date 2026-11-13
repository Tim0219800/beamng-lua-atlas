---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/logHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'éditeur qui affiche dans la barre de menu principale de l'éditeur le compteur d'erreurs (rouge, suffixe E) et d'avertissements (jaune, suffixe W) du log de développement, via Lua:getDevLogStats().
--- Accès : extension `editor_logHelper` : `extensions.load("editor_logHelper")`, puis la globale `editor_logHelper`
---@class editor_logHelper
editor_logHelper = {}

--- Hook de dessin de la barre de menu principale. Écrit « LogStats: » puis le nombre d'erreurs et d'avertissements s'ils sont supérieurs à 0. Ne fait rien si Lua.getDevLogStats n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/logHelper.lua:9
---@param windowSize table Taille de la fenêtre (non utilisée : la ligne SameLine est commentée).
function editor_logHelper.onEditorMainMenuBar(windowSize) end


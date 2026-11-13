---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug « General > Filter Debug » : fenêtre ImGui où l'on colle un JSON de filtre de concessionnaire (filter avec whiteList/blackList, subFilters avec probability…) ; le JSON est décodé à chaque modification, le filtre est appliqué (via util/configListGenerator) et le résultat est affiché en tableau. Utile pour régler les filtres de véhicules d'un concessionnaire.
--- Accès : extension `career_modules_debug_dealershipFilterDebug` : `extensions.load("career_modules_debug_dealershipFilterDebug")`, puis la globale `career_modules_debug_dealershipFilterDebug`
---@class career_modules_debug_dealershipFilterDebug
---@field debugName string 'General > Filter Debug'.
---@field debugOrder number Ordre de tri dans la fenêtre de debug (11).
career_modules_debug_dealershipFilterDebug = {}

--- Dessine la fenêtre 'Filter Debug Input' (zone de texte JSON, statut 'All Good :)' ou 'Decoding Error') puis les résultats du filtre.
---Source : lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua:101
function career_modules_debug_dealershipFilterDebug.drawDebugMenu() end

--- Affiche l'outil hors carrière : M.onUpdate = drawDebugMenu puis extensions.hookUpdate('onUpdate').
---Source : lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua:218
function career_modules_debug_dealershipFilterDebug.show() end


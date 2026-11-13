---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/timer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la bibliothèque tierce Copas : minuteries (ponctuelles ou récurrentes) exécutées dans le répartiteur Copas. timer.new arme immédiatement un timer qui appellera callback(timer_obj, params) après le délai. Le module renvoie la table timer.
--- Accès : `require("libs/copas/copas/timer")`
---@class libs_copas_copas_timer
---@field __index table Métatable des objets timer.
local libs_copas_copas_timer = {}

--- Annule un timer actif (retire sa coroutine du répartiteur).
---Source : lua/common/libs/copas/copas/timer.lua:49
---@param self table Le timer (timer:cancel())
---@return table|nil  Le timer, ou nil + erreur si déjà annulé
function libs_copas_copas_timer.cancel(self) end

--- Crée et arme un timer.
---Source : lua/common/libs/copas/copas/timer.lua:72
---@param opts table {delay (s), callback, recurring?, params?, initial_delay? (défaut delay)}
---@return table  Objet timer
function libs_copas_copas_timer.new(opts) end

return libs_copas_copas_timer

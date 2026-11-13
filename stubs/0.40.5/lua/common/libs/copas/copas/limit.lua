---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/limit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la bibliothèque tierce Copas : limite le nombre de tâches exécutées simultanément. Chaque tâche ajoutée est planifiée tout de suite s'il y a de la place (sinon mise en file) ; wait permet d'attendre la fin de toutes. Le module renvoie { new = new }.
--- Accès : `require("libs/copas/copas/limit")`
---@class libs_copas_copas_limit
local libs_copas_copas_limit = {}

--- Crée un exécuteur de tâches avec au plus maxt tâches simultanées.
---Source : lua/common/libs/copas/copas/limit.lua:121
---@param maxt integer|nil Maximum de tâches simultanées (défaut 99999)
---@return table  Exécuteur avec addthread, removethread, next, wait
function libs_copas_copas_limit.new(maxt) end

--- Liste chaînée interne servant de file d'attente des tâches.
---@class libs_copas_copas_limit_ll
local libs_copas_copas_limit_ll = {}

--- Crée une liste vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas/limit.lua:57
function libs_copas_copas_limit_ll.new() end

--- Retire et renvoie le premier élément (nil si vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas/limit.lua:28
function libs_copas_copas_limit_ll:pop() end

--- Ajoute un élément en fin de liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas/limit.lua:20
---@param item any Élément
function libs_copas_copas_limit_ll:push(item) end

--- Retire un élément donné de la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas/limit.lua:41
---@param item any Élément
function libs_copas_copas_limit_ll:remove(item) end

return libs_copas_copas_limit

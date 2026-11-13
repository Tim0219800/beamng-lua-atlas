---@meta
-- tim19Atlas stub generated from lua/common/luaProfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du profileur (objet renvoyé par LuaProfiler).
---@class luaProfiler_C
local luaProfiler_C = {}

--- À appeler après chaque section de code à mesurer : enregistre le temps et la mémoire depuis le dernier start/add sous le nom `section`, puis relance le chronomètre. Journalise une erreur si start() n'a pas été appelé.
---Source : lua/common/luaProfiler.lua:49
---@param section string|nil nom de la section (nil = seulement réinitialiser le chronomètre)
function luaProfiler_C:add(section) end

--- Termine la frame : calcule les statistiques et écrit dans le log la ligne TOTAL puis une ligne par section (mémoire, durée, éventuel écart à la moyenne, graphique). Réinitialise ensuite le chronomètre et les sections.
---Source : lua/common/luaProfiler.lua:191
---@param compute boolean|nil false = ne rien calculer ni afficher
---@param dt number|nil pas de temps pour la moyenne/détection de pics (active la détection)
---@param threshold number|nil durée minimale pour afficher, défaut 0
---@return number|nil  temps total des sections de la frame (nil si compute == false)
function luaProfiler_C:finish(compute, dt, threshold) end

--- Comme finish mais renvoie un rapport sérialisable au lieu d'écrire dans le log : {title, detectPeaks, threshold, peakDetected, shouldOutput, total = {time, garbage, stats}, sections = [{section, runs, time, garbage, peakDetected, shouldOutput, graph, stats}]}.
---Source : lua/common/luaProfiler.lua:222
---@param dt number|nil pas de temps pour la détection de pics
---@param threshold number|nil durée minimale
---@return table  rapport
function luaProfiler_C:finishToTable(dt, threshold) end

--- Constructeur : mémorise le titre.
---Source : lua/common/luaProfiler.lua:44
---@param title string|nil titre
function luaProfiler_C:init(title) end

--- Démarre (ou réinitialise) le chronomètre et le compteur de mémoire. À appeler une fois par fonction indépendante à profiler (sans appelant commun avec une autre déjà profilée).
---Source : lua/common/luaProfiler.lua:183
function luaProfiler_C:start() end

--- Fonction GLOBALE : crée un profileur (objet de classe C) et appelle son init avec les arguments donnés.
---Source : lua/common/luaProfiler.lua:229
---@param ... any
---@return table  profileur avec méthodes start, add, finish, finishToTable
function LuaProfiler(...) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/hints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les indices (hints) du mode de livraison libre : chaque hint de la livraison (id, targetAreaIds, message, subtext) s'affiche comme message dans la liste de tâches (SetTasklistTask) tant que le joueur se trouve dans l'une de ses zones cibles (zone, location ou parkingSpot), puis disparaît (DiscardTasklistItem) quand il en sort. Appelé par gameplay_freeformDelivery_freeformDelivery, pas par le moteur.
--- Accès : extension `gameplay_freeformDelivery_hints` : `extensions.load("gameplay_freeformDelivery_hints")`, puis la globale `gameplay_freeformDelivery_hints`
---@class gameplay_freeformDelivery_hints
gameplay_freeformDelivery_hints = {}

--- Retire tous les hints affichés de la tasklist et oublie la livraison active.
---Source : lua/ge/extensions/gameplay/freeformDelivery/hints.lua:179
function gameplay_freeformDelivery_hints.cleanup() end

--- Initialise les hints à partir de delivery.hints et mémorise la livraison active. Logge le nombre de hints chargés.
---Source : lua/ge/extensions/gameplay/freeformDelivery/hints.lua:92
---@param delivery table Livraison chargée (hints, targetAreas, sites).
function gameplay_freeformDelivery_hints.setup(delivery) end

--- À appeler à chaque frame : affiche les hints dont une zone cible contient le joueur et masque les autres. Sans effet si aucune livraison n'est active ou si la position du joueur est inconnue.
---Source : lua/ge/extensions/gameplay/freeformDelivery/hints.lua:128
---@param dtReal number Delta temps réel (inutilisé).
---@param dtSim number Delta temps simulé (inutilisé).
---@param dtRaw number Delta temps brut (inutilisé).
---@param profiler table|nil LuaProfiler facultatif pour mesurer les sections.
function gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler) end


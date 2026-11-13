---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur renvoyé par le constructeur du module.
---@class gameplay_rally_driveline_rallyRouteTracker
local gameplay_rally_driveline_rallyRouteTracker = {}

--- Accepte ou refuse une projection selon les sauts maximaux vers l'avant/arrière par rapport à la distance courante (toujours acceptée si allowJump ou premier calcul).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:202
---@param projection table|nil Projection candidate.
---@param allowJump boolean|nil true pour ignorer les limites.
---@return boolean  true si acceptée.
function gameplay_rally_driveline_rallyRouteTracker:_acceptProjection(projection, allowJump) end

--- Diagnostic : renvoie la fenêtre de segments examinée par la projection locale ({firstIdx, lastIdx}) ou {fullSearch=true}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:238
---@param segmentIdx integer|nil Segment précédent.
---@param forceFullSearch boolean|nil Recherche complète.
---@return table  Fenêtre.
function gameplay_rally_driveline_rallyRouteTracker:_computeDebugWindow(segmentIdx, forceFullSearch) end

--- Enregistre le point de sortie de route (distToTarget, routePos, vehiclePos, lateralDist, segmentIdx) au passage en 'offRoute' et fixe la distance de récupération.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:220
---@param pos vec3 Position du véhicule.
---@param projection table Projection courante.
function gameplay_rally_driveline_rallyRouteTracker:_snapshotDeparture(pos, projection) end

--- Mémorise le dernier point récupérable (distToTarget et position sur la route) et calcule recoveryDistToTarget = distToTarget + recul, plafonné au début de la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:212
---@param pos vec3 Position du véhicule.
---@param projection table Projection courante.
function gameplay_rally_driveline_rallyRouteTracker:_updateRecoveryCandidate(pos, projection) end

--- Demi-largeur actuelle du corridor.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:186
---@return number  Mètres.
function gameplay_rally_driveline_rallyRouteTracker:getCorridorWidth() end

--- Table d'options en cours (partagée, pas une copie).
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:190
---@return table  Options.
function gameplay_rally_driveline_rallyRouteTracker:getOptions() end

--- Distance restante jusqu'à l'arrivée où replacer le véhicule : point de départ de la sortie de route (si hors route) ou dernier point récupérable, plus un recul, plafonné au début de la route.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:334
---@param backoffDistance number|nil Recul en mètres (3 m par défaut).
---@return number|nil  distToTarget de récupération.
function gameplay_rally_driveline_rallyRouteTracker:getRecoveryDistToTarget(backoffDistance) end

--- Instantané de l'état du suiveur : state, segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, offRouteDistance, onRouteDistance, lastRecoverable*, recoveryDistToTarget, departure, projectionSource ('local', 'full', 'held'), localCandidate, fullCandidate, window, searchBehind, searchAhead.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:347
---@return table  État.
function gameplay_rally_driveline_rallyRouteTracker:getState() end

--- Mémorise la route, fusionne les options avec les valeurs par défaut et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:134
---@param path table[] Points de la route statique.
---@param options table|nil Options remplaçant les défauts.
function gameplay_rally_driveline_rallyRouteTracker:init(path, options) end

--- Projette une position sur la route sans modifier l'état : recherche complète si options.forceFullSearch, sinon locale autour du segment courant.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:194
---@param pos vec3 Position.
---@param options table|nil {forceFullSearch = boolean}.
---@return table|nil  {segmentIdx, xnorm, distSq, lateralDist, distToTarget, routePos}.
function gameplay_rally_driveline_rallyRouteTracker:project(pos, options) end

--- Remet à zéro l'état de suivi. Si une position est donnée, fait immédiatement un update avec recherche complète et saut autorisé.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:142
---@param pos vec3|nil Position initiale.
function gameplay_rally_driveline_rallyRouteTracker:reset(pos) end

--- Règle la demi-largeur du corridor (offRouteDistance, bornée à [0,1 ; 15] m) et le seuil de retour (onRouteDistance = offRouteDistance - 0,1).
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:178
---@param width number Demi-largeur en mètres.
function gameplay_rally_driveline_rallyRouteTracker:setCorridorWidth(width) end

--- Active la capture de diagnostic (calcul d'une projection complète supplémentaire à chaque update).
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:169
---@param enabled boolean true pour activer.
function gameplay_rally_driveline_rallyRouteTracker:setDebugCapture(enabled) end

--- Remplace la route suivie et réinitialise l'état.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:173
---@param path table[] Nouveaux points.
function gameplay_rally_driveline_rallyRouteTracker:setPath(path) end

--- Met à jour le suivi avec la position du véhicule : projection (locale puis complète si besoin), mise à jour de segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, puis de l'état onRoute/offRoute avec hystérésis. Renvoie la projection retenue (ou la dernière si la nouvelle est refusée).
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:249
---@param pos vec3 Position du véhicule.
---@param updateOptions table|nil {allowJump, forceFullSearch}.
---@return table|nil  Projection, nil si pos est nil ou projection impossible.
function gameplay_rally_driveline_rallyRouteTracker:update(pos, updateOptions) end


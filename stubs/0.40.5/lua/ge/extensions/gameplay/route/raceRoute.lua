---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/route/raceRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Itinéraire de course. Champs : path, removeFirst, useMapPathfinding, closeDistSquared, originalFixedPositions, dirMult, callbacks, trackingMutationEnabled, done, plus les paramètres de recherche (cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ).
---@class gameplay_route_raceRoute
local gameplay_route_raceRoute = {}

--- Recalcule distToTarget de chaque point.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:132
---@return number  Longueur totale en mètres.
function gameplay_route_raceRoute:calcDistance() end

--- Vide le chemin (sans toucher à originalFixedPositions).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:347
function gameplay_route_raceRoute:clear() end

--- Position du premier point fixed du chemin.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:352
---@return vec3|nil  Position, nil si aucun.
function gameplay_route_raceRoute:getNextFixedWP() end

--- Cherche le segment le plus proche d'une position (seuil 15 m).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:434
---@param currentPos vec3 Position à tester.
---@return integer  Indice du segment, 0 si hors chemin.
---@return number  Distance minimale au chemin en mètres.
function gameplay_route_raceRoute:getPositionOffset(currentPos) end

--- Constructeur avec options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:13
---@param removeFirst boolean|nil true (défaut) : le premier point n'est pas fixe. false : il est marqué fixed.
---@param useMapPathfinding boolean|nil true (défaut) : utilise le navgraph ; false : relie simplement les positions.
---@param closeDistSquared number|nil Distance au carré (m2) sous laquelle deux points sont fusionnés ; défaut 1.
---@param logTag string|nil Sans effet réel (voir notes).
function gameplay_route_raceRoute:init(removeFirst, useMapPathfinding, closeDistSquared, logTag) end

--- Reconstruit le chemin depuis startPos en repassant par tous les points fixed restants, puis émet onRecalculatedRoute('raceRoute').
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:358
---@param startPos vec3 Nouveau départ.
function gameplay_route_raceRoute:recalculateRoute(startPos) end

--- Comme recalculateRoute mais part des points fixes d'origine (non raccourcis). Un point d'origine est gardé si le callback shouldPointBeFixedForRecalc renvoie true, et le dernier point est toujours gardé. Émet onRecalculatedRoute('raceRoute').
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:389
---@param startPos vec3 Nouveau départ.
function gameplay_route_raceRoute:recalculateRouteWithOriginalPositions(startPos) end

--- Fixe les paramètres de recherche du navgraph.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:64
---@param cutOffDrivability number|nil Seuil de praticabilité.
---@param dirMult number|nil Multiplicateur de sens ; défaut 1e3.
---@param penaltyAboveCutoff number|nil Pénalité au-dessus du seuil.
---@param penaltyBelowCutoff number|nil Pénalité en dessous du seuil.
---@param wD number|nil Poids de distance (déduit du nom).
---@param wZ number|nil Poids d'altitude (déduit du nom).
function gameplay_route_raceRoute:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Si false, updatePathForPos ne modifie plus le chemin (ni recalcul ni raccourcissement) et renvoie seulement l'offset.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:45
---@param enabled boolean Autorise la mutation du chemin.
function gameplay_route_raceRoute:setTrackingMutationEnabled(enabled) end

--- Itinéraire entre deux positions.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:143
---@param fromPos vec3 Départ.
---@param toPos vec3 Arrivée.
function gameplay_route_raceRoute:setupPath(fromPos, toPos) end

--- Construit le chemin pour une liste de positions simples (les enveloppe en {pos=...} puis appelle setupPathMultiWithMetadata).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:163
---@param positions vec3[] Positions à relier.
function gameplay_route_raceRoute:setupPathMulti(positions) end

--- Ajoute au chemin les nœuds du navgraph entre waypoints donnés (map.getPath).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:147
---@param wpList string[] Noms de nœuds du navgraph.
function gameplay_route_raceRoute:setupPathMultiWaypoints(wpList) end

--- Construit le chemin pour des positions avec métadonnées optionnelles. Chaque arrivée devient un point fixed qui garde sa metadata ; les points trop proches sont fusionnés (callback onMetadataMerge possible) ; les extrémités sont ajustées ; onPointProcessed est appelé pour chaque point ; les points fixes d'origine sont mémorisés au premier appel.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:183
---@param positions table[] Liste de {pos = vec3, wp = string|nil, metadata = any}. Seul pos est requis.
function gameplay_route_raceRoute:setupPathMultiWithMetadata(positions) end

--- Supprime les points avant l'indice idx.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:459
---@param idx integer Indice du segment courant.
function gameplay_route_raceRoute:shortenPath(idx) end

--- Point situé à stepDist mètres plus loin sur la route (même logique que route.lua).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:106
---@param stepDist number Distance à avancer (m).
---@param reset boolean|nil true pour repartir du début.
---@return table|nil  {n1, n2, idx, pos, xnorm}, nil si moins de 2 points.
function gameplay_route_raceRoute:stepAhead(stepDist, reset) end

--- Suit la caméra (core_camera.getPosition).
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:473
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_raceRoute:trackCamera() end

--- Suit une position quelconque.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:474
---@param pos vec3 Position.
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_raceRoute:trackPosition(pos) end

--- Suit un véhicule.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:472
---@param veh table Objet véhicule.
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_raceRoute:trackVehicle(veh) end

--- Met à jour la route pour une position : recalcule si on est hors chemin (>= 15 m), raccourcit le chemin et ajuste le premier point (en remettant sa metadata à nil). Sans mutation autorisée, ne fait que calculer l'offset.
---Source : lua/ge/extensions/gameplay/route/raceRoute.lua:477
---@param pos vec3 Position actuelle.
---@return integer|nil  Indice du segment.
---@return number|nil  Distance au chemin.
function gameplay_route_raceRoute:updatePathForPos(pos) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/markers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module du mode livraison libre (freeformDelivery) qui affiche les repères visuels des zones cibles : décalques au sol pour les places de parking (couleur selon l'état de stationnement), sphères/rectangles de debug pour les lieux, zones et places, et les marqueurs d'attention 3D de la route active. Il est piloté par freeformDelivery (setup, update chaque frame, cleanup).
--- Accès : extension `gameplay_freeformDelivery_markers` : `extensions.load("gameplay_freeformDelivery_markers")`, puis la globale `gameplay_freeformDelivery_markers`
---@class gameplay_freeformDelivery_markers
gameplay_freeformDelivery_markers = {}

--- Vide les marqueurs, décalques et caches, oublie la livraison active et détruit les marqueurs de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/markers.lua:435
function gameplay_freeformDelivery_markers.cleanup() end

--- Cache les marqueurs de route (principal, zone, parking) sans les détruire.
---Source : lua/ge/extensions/gameplay/freeformDelivery/markers.lua:230
function gameplay_freeformDelivery_markers.hideRouteMarker() end

--- Crée (en remplaçant les précédents) le marqueur d'attention de la route à la position donnée, plus éventuellement un marqueur de zone et un marqueur de place de parking, puis les affiche.
---Source : lua/ge/extensions/gameplay/freeformDelivery/markers.lua:176
---@param pos vec3 Position du marqueur principal (relevée de 2 m).
---@param zone table|nil Données de checkpoint de zone passées à setToCheckpoint du marqueur de zone.
---@param parkingSpot table|nil Données de place de parking passées au marqueur de parking.
---@return boolean  false si pos est nil ou si le marqueur n'a pas pu être créé, sinon true.
function gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot) end

--- Mémorise la livraison active, crée un marqueur par zone cible (targetAreas) retrouvée dans delivery.sites, prépare les données de décalque des places de parking et pré-calcule quels véhicules sont associés à quelle place via les goals de type placement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/markers.lua:242
---@param delivery table Données de la livraison (goals, targetAreas, sites, vehicles).
function gameplay_freeformDelivery_markers.setup(delivery) end

--- Appelée chaque frame : met à jour l'état de stationnement des places, dessine les repères de debug, ajoute les décalques au sol via Engine.Render.DynamicDecalMgr.addDecals et met à jour les marqueurs de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/markers.lua:292
---@param dtReal number Delta temps réel en secondes.
---@param dtSim number Delta temps de simulation en secondes.
---@param dtRaw number Delta temps brut (non utilisé directement).
---@param profiler table|nil Profileur optionnel (méthode add) pour mesurer les sections.
function gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler) end


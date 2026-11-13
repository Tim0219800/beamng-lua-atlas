---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module du mode de livraison libre (freeformDelivery) qui rassemble les statistiques affichées à la fin d'une livraison : temps écoulé, avancement des objectifs (via gameplay_freeformDelivery_goals.getProgress) et dégâts de chaque véhicule de la livraison (lus dans map.objects). Ne contient pas d'interface : il ne fait que construire la table de résultats.
--- Accès : extension `gameplay_freeformDelivery_endScreen` : `extensions.load("gameplay_freeformDelivery_endScreen")`, puis la globale `gameplay_freeformDelivery_endScreen`
---@class gameplay_freeformDelivery_endScreen
gameplay_freeformDelivery_endScreen = {}

--- Construit la table de statistiques de fin de livraison : durée (brute et formatée par gameplay_freeformDelivery_utils.formatTime), nombre d'objectifs total/complétés/requis/requis complétés, dégâts par véhicule (vehData.damage) et indicateur allRequiredComplete.
---Source : lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua:8
---@param delivery table Données de la livraison chargée (liste vehicles avec id et name).
---@param startTime number Instant de début en secondes, mesuré avec os.clock().
---@return table|nil  {time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, vehicleDamages = {[deliveryId] = {name, damage}}, allRequiredComplete}, ou nil en cas d'erreur.
function gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime) end


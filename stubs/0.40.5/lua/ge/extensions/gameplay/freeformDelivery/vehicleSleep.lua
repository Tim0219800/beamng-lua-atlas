---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la livraison libre qui endort (setActive(0)) les véhicules de livraison éloignés de la caméra et du véhicule du joueur, et les réveille à l'approche, pour économiser du temps de simulation. Seuls les véhicules ayant un sleepDistance valide dans leur définition sont gérés.
--- Accès : extension `gameplay_freeformDelivery_vehicleSleep` : `extensions.load("gameplay_freeformDelivery_vehicleSleep")`, puis la globale `gameplay_freeformDelivery_vehicleSleep`
---@class gameplay_freeformDelivery_vehicleSleep
gameplay_freeformDelivery_vehicleSleep = {}

--- Réactive tous les véhicules suivis et vide le suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:128
function gameplay_freeformDelivery_vehicleSleep.cleanup() end

--- Renvoie un tableau trié par id avec, pour chaque véhicule suivi, l'état de sommeil et les distances (utile pour l'affichage de debug).
---Source : lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:112
---@return table[]  Entrées {id, sleeping, sleepDistance, wakeDistance, cameraDistance, playerVehicleDistance}.
function gameplay_freeformDelivery_vehicleSleep.getDebugData() end

--- Normalise sleepDistance/wakeDistance dans delivery.vehicles et enregistre les véhicules concernés (actifs au départ, setActive(1)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:47
---@param delivery table Données de livraison avec le tableau vehicles.
function gameplay_freeformDelivery_vehicleSleep.setup(delivery) end

--- Appelée chaque frame : mesure les distances caméra/joueur de chaque véhicule suivi et bascule son état actif/endormi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:74
function gameplay_freeformDelivery_vehicleSleep.update() end


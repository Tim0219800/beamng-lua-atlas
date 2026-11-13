---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partFocusCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_partFocusCamera` : pilote le mode caméra caché 'partFocus' depuis le menu de pièces. À partir des pièces sélectionnées, calcule une boîte englobante (taille d'après les meshes, position d'après les noeuds jbeam, qui suivent le véhicule en direct), règle la distance de la caméra pour la cadrer (FOV 35°, marge 1,2) et la déplace en douceur. Les demandes attendent 0,5 s que la sélection se stabilise, sauf option immediate. Rend la caméra au joueur quand la sélection reste vide.
--- Accès : extension `core_vehicle_partFocusCamera` : `extensions.load("core_vehicle_partFocusCamera")`, puis la globale `core_vehicle_partFocusCamera`
---@class core_vehicle_partFocusCamera
---@field debugDrawPivot boolean false par défaut ; true marque le centre de la boîte d'une sphère.
---@field dependencies string[] {'core_vehicle_configTarget'}
---@field onExtensionUnloaded function Alias de clear.
---@field onSerialize function Alias de clear.
---@field updateInterval number Intervalle de remesure de la boîte, en secondes (0.1).
core_vehicle_partFocusCamera = {}

--- Annule les demandes, quitte le mode partFocus (retour à la caméra précédente, 'orbit' par défaut) et retire l'action map PartCamera.
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:354
function core_vehicle_partFocusCamera.clear() end

--- Renvoie et remet à zéro les crans de zoom accumulés (appelée par le mode caméra).
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:437
---@return number  crans accumulés
function core_vehicle_partFocusCamera.consumeZoomSteps() end

--- Demande à la caméra de cadrer un ensemble de pièces. Les demandes identiques répétées sont ignorées (pas de redémarrage du délai). Une liste vide revient à release().
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:312
---@param inVehId integer véhicule
---@param partNames table<string, boolean> [chemin de pièce] = true
---@param selectedMeshes table|nil meshes des pièces (fournis par core_vehicle_partmgmt), utilisés pour mesurer la taille
---@param playerId integer|nil joueur dont la caméra est pilotée
---@param cameraOptions table|nil voir notes : immediate, focusOffsetUp, distanceMultiplier, preserveDistance
function core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions) end

--- Indique si la caméra de pièces est active (un véhicule est cadré).
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:429
---@return boolean  true si active
function core_vehicle_partFocusCamera.isActive() end

--- Hook par frame : décompte le délai d'attente (temps réel, car le menu de configuration tourne souvent en pause) puis applique la demande ou libère la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:477
---@param dtReal number temps réel écoulé (s)
function core_vehicle_partFocusCamera.onUpdate(dtReal) end

--- Hook : la cible de configuration change ; libère la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:515
function core_vehicle_partFocusCamera.onVehicleConfigTargetChanged() end

--- Hook : le véhicule cadré est détruit ; libère la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:497
---@param destroyedId integer véhicule
function core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId) end

--- Hook : le véhicule est remis à zéro ; force une remesure immédiate de la boîte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:490
---@param resettedId integer véhicule
function core_vehicle_partFocusCamera.onVehicleResetted(resettedId) end

--- Hook : le véhicule cadré est recréé ; garde la dernière pose de caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:503
---@param spawnedId integer véhicule
function core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId) end

--- Hook : le joueur piloté quitte le véhicule cadré ; libère la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:509
---@param oldId integer ancien véhicule
---@param newId integer nouveau véhicule
---@param player integer joueur
function core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player) end

--- Rend la caméra au joueur une fois que la sélection reste vide pendant settleDelay (0,5 s), ou immédiatement.
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:343
---@param immediate boolean|nil true : libère tout de suite (clear)
function core_vehicle_partFocusCamera.release(immediate) end

--- Appelée par le mode caméra partFocus à chaque frame : remesure périodiquement la boîte, reconstruit la boîte en repère monde, la dessine et fixe le point de visée de la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:446
---@param dt number temps écoulé (s)
---@param cam table|nil objet mode caméra (setRef, setDefaultDistance, retarget)
function core_vehicle_partFocusCamera.updateTarget(dt, cam) end

--- Ajoute des crans de molette (zoom) à appliquer par le mode caméra.
---Source : lua/ge/extensions/core/vehicle/partFocusCamera.lua:433
---@param value number nombre de crans (signe = sens)
function core_vehicle_partFocusCamera.zoomStep(value) end


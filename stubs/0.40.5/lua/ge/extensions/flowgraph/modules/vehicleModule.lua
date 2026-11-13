---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/vehicleModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du module véhicule (mgr.modules.vehicle). Tables internes : vehicles (id -> données : id, ready, internalName, couplerOffset, couplerTags, dontDelete, storedEnergyStorage…), sortedIds (ids triés), couplings (id -> {autreId = true}).
---@class flowgraph_modules_vehicleModule_C
local flowgraph_modules_vehicleModule_C = {}

--- Enregistre les décalages d'attelage reçus (vec3, nom, tag) pour un véhicule et les trie par priorité de tag puis par nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:135
---@param id integer id du véhicule
---@param off table nom d'attelage -> position
---@param tag string tag d'attelage
function flowgraph_modules_vehicleModule_C:addCouplerOffset(id, off, tag) end

--- Déclare un véhicule non créé par le flowgraph mais à suivre ; il est marqué dontDelete (non supprimé à l'arrêt).
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:27
---@param veh userdata objet véhicule
---@param moreData table|nil champs supplémentaires fusionnés dans les données
function flowgraph_modules_vehicleModule_C:addForeignVehicle(veh, moreData) end

--- Commence à suivre un véhicule (ignoré s'il l'est déjà). Si le véhicule est prêt, appelle readyUpVehicle.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:33
---@param veh userdata objet véhicule
---@param moreData table|nil champs supplémentaires (ex. dontDelete, ignoreReadyUp)
function flowgraph_modules_vehicleModule_C:addVehicle(veh, moreData) end

--- Vide vehicles, sortedIds et couplings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:16
function flowgraph_modules_vehicleModule_C:clear() end

--- Mémorise la blacklist de gameplay_walk et l'état de core_trailerRespawn pour les restaurer à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:150
function flowgraph_modules_vehicleModule_C:executionStarted() end

--- Appelée à l'arrêt du graphe : supprime les véhicules non dontDelete, restaure l'énergie des autres, la blacklist de marche et core_trailerRespawn, puis clear().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:195
function flowgraph_modules_vehicleModule_C:executionStopped() end

--- Copie profonde de la liste triée des ids de véhicules suivis.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:22
---@return integer[]  ids de véhicules
function flowgraph_modules_vehicleModule_C:getSpawnedVehicles() end

--- Renvoie les données suivies d'un véhicule, ou une table vide.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:58
---@param id integer id du véhicule
---@return table  données du véhicule
function flowgraph_modules_vehicleModule_C:getVehicle(id) end

--- Cherche l'id d'un véhicule d'après son nom interne exact.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:62
---@param name string nom interne
---@return integer  id, ou -1 si introuvable
function flowgraph_modules_vehicleModule_C:getVehicleIdByInternalName(name) end

--- Renvoie les ids dont le nom interne correspond au motif (string.find, donc motif Lua).
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:71
---@param name string motif Lua
---@return integer[]  ids correspondants
function flowgraph_modules_vehicleModule_C:getVehiclesIdByInternalNameMatch(name) end

--- Crée les tables internes puis appelle clear().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:8
function flowgraph_modules_vehicleModule_C:init() end

--- Indique si le modèle du véhicule a le Body Style « Bus ».
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:281
---@param id integer id du véhicule
---@return boolean|nil  true/false, nil si id absent
function flowgraph_modules_vehicleModule_C:isBus(id) end

--- Indique si la porte du bus est ouverte (valeur en cache 'dooropen' == 1).
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:272
---@param id integer id du bus
---@return boolean  true si ouverte
function flowgraph_modules_vehicleModule_C:isBusDoorOpen(id) end

--- Indique si le bus est agenouillé (valeur en cache 'kneel' == 1).
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:271
---@param id integer id du bus
---@return boolean  true si agenouillé
function flowgraph_modules_vehicleModule_C:isBusKneel(id) end

--- Indique si le véhicule est attelé à au moins un autre.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:243
---@param id integer id du véhicule
---@return any  valeur non nil (truthy) si attelé, sinon nil
function flowgraph_modules_vehicleModule_C:isCoupled(id) end

--- Indique si le véhicule est attelé au véhicule other.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:244
---@param id integer id du véhicule
---@param other integer id de l'autre véhicule
---@return boolean|nil  true si attelé, sinon nil
function flowgraph_modules_vehicleModule_C:isCoupledTo(id, other) end

--- Hook : enregistre l'attelage entre deux véhicules (dans les deux sens).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:234
---@param objId1 integer premier véhicule
---@param objId2 integer second véhicule
---@param nodeId integer noeud d'attelage (non utilisé)
---@param obj2nodeId integer noeud d'attelage du second (non utilisé)
function flowgraph_modules_vehicleModule_C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook : supprime l'attelage entre deux véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:238
---@param objId1 integer premier véhicule
---@param objId2 integer second véhicule
---@param nodeId integer non utilisé
---@param obj2nodeId integer non utilisé
function flowgraph_modules_vehicleModule_C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId) end

--- Appelée à chaque frame : repère les véhicules devenus prêts et appelle readyUpVehicle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:81
function flowgraph_modules_vehicleModule_C:onUpdate() end

--- Hook appelé quand un véhicule est réinitialisé ; relaie à activity:onVehicleReset(id) si l'activité existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:289
---@param id integer id du véhicule
function flowgraph_modules_vehicleModule_C:onVehicleResetted(id) end

--- Marque le véhicule prêt ; sauf ignoreReadyUp, active le suivi mapmgr (via le module level, éventuellement différé) et demande les décalages d'attelage pour chaque tag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:105
---@param id integer id du véhicule
function flowgraph_modules_vehicleModule_C:readyUpVehicle(id) end

--- Demande à core_vehicleBridge d'être notifié des changements de « kneel » et « dooropen » du véhicule.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:263
---@param id integer id du bus
function flowgraph_modules_vehicleModule_C:registerBusChangeNotification(id) end

--- Ne fait rien : le corps (envoi bus_onTriggerTick) est commenté.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:247
---@param id integer id du véhicule
function flowgraph_modules_vehicleModule_C:requestBusData(id) end

--- Envoie au bus l'évènement bus_onSetStopRequest (demande d'arrêt).
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:274
---@param id integer id du bus
---@param data table données de la demande d'arrêt
function flowgraph_modules_vehicleModule_C:requestBusStop(id, data) end

--- Définit dontDelete pour un véhicule suivi ; s'il est dans un prefab, demande au module prefab de le dépaqueter avant suppression.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:170
---@param id integer id du véhicule
---@param keep boolean true pour ne pas le supprimer à l'arrêt
function flowgraph_modules_vehicleModule_C:setKeepVehicle(id, keep) end

--- Demande et mémorise l'énergie des réservoirs du véhicule, pour la restaurer à l'arrêt (s'il n'est pas supprimé). Log W si le véhicule n'est pas suivi.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:155
---@param id integer id du véhicule
function flowgraph_modules_vehicleModule_C:storeFuelAmount(id) end

--- Envoie au véhicule l'évènement bus_onRouteChange avec les données d'affichage de ligne.
---Source : lua/ge/extensions/flowgraph/modules/vehicleModule.lua:255
---@param id integer id du bus
---@param data table données sérialisées envoyées au contrôleur
function flowgraph_modules_vehicleModule_C:updateBusDisplayData(id, data) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/trailerRespawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_trailerRespawn` : mémorise quels véhicules tractent quelle remorque (registre `trailerReg`) à partir des évènements d'attelage, et replace la remorque derrière le véhicule tracteur quand celui-ci est remis à zéro (reset) ou réactivé. Dépend de core_vehicles (vehsCouplerOffset, vehsCouplerTags, couplerTagsOptions) et de spawn.placeTrailer. Utile pour interroger la composition d'un train routier (getVehicleTrain, getVehicleTrainHead).
--- Accès : extension `core_trailerRespawn` : `extensions.load("core_trailerRespawn")`, puis la globale `core_trailerRespawn`
---@class core_trailerRespawn
---@field debugEnabled boolean false par défaut ; l'affichage debug des noeuds d'attelage (debugUpdate) n'est pas branché (M.onPreRender est commenté).
---@field dependencies string[] {'core_vehicleBridge'}
core_trailerRespawn = {}

--- Si le tag du coupleur est de type 'autoCouple' (core_vehicles.couplerTagsOptions), lance beamstate.activateAutoCoupling(tag) sur le tracteur.
---Source : lua/ge/extensions/core/trailerRespawn.lua:187
---@param vehId integer tracteur
function core_trailerRespawn.coupleTrailer(vehId) end

--- Remonte les attelages pour trouver le véhicule qui n'est pas une remorque et qui tracte la chaîne contenant vehId.
---Source : lua/ge/extensions/core/trailerRespawn.lua:103
---@param vehId integer véhicule de départ
---@return integer|false  identifiant du premier véhicule non-remorque, false si la chaîne ne contient que des remorques
function core_trailerRespawn.getAttachedNonTrailer(vehId) end

--- Renvoie le type d'un véhicule ('Car', 'Trailer', 'Prop'…), d'après sa config (aggregates.Type) ou, à défaut, le Type de son modèle.
---Source : lua/ge/extensions/core/trailerRespawn.lua:88
---@param objId integer identifiant du véhicule
---@return string  type
function core_trailerRespawn.getConfigType(objId) end

--- Renvoie la variable `enabled` du module (voir notes : n'est pas mise à jour par setEnabled).
---Source : lua/ge/extensions/core/trailerRespawn.lua:251
---@return boolean  true tant que resetData/onDeserialized ne l'ont pas changé
function core_trailerRespawn.getEnabled() end

--- Renvoie le véhicule qui tracte vehId (celui dont la remorque enregistrée est vehId).
---Source : lua/ge/extensions/core/trailerRespawn.lua:47
---@param vehId integer identifiant de la remorque
---@return integer|nil  identifiant du tracteur, nil s'il n'y en a pas
function core_trailerRespawn.getPreviousAttachedVehicleId(vehId) end

--- Renvoie le registre interne trailerReg (pas une copie).
---Source : lua/ge/extensions/core/trailerRespawn.lua:31
---@return table<integer, {trailerId: integer, trailerNode: integer, node: integer}>  [idTracteur] = infos d'attelage
function core_trailerRespawn.getTrailerData() end

--- Renvoie tous les véhicules reliés à vehId, vers l'avant et vers l'arrière.
---Source : lua/ge/extensions/core/trailerRespawn.lua:64
---@param vehId integer véhicule de départ
---@param res table|nil table accumulatrice (usage interne, laisser nil)
---@param forward boolean|nil true : seulement vers le tracteur ; false : seulement vers les remorques ; nil : les deux
---@return table<integer, boolean>  ensemble [vehId] = true
function core_trailerRespawn.getVehicleTrain(vehId, res, forward) end

--- Remonte la chaîne d'attelages jusqu'au premier véhicule (tête du train).
---Source : lua/ge/extensions/core/trailerRespawn.lua:55
---@param vehId integer véhicule de départ
---@return integer  identifiant de la tête de train (vehId lui-même s'il n'est pas tracté)
function core_trailerRespawn.getVehicleTrainHead(vehId) end

--- Indique si trailerId fait partie de la chaîne tractée par vehId.
---Source : lua/ge/extensions/core/trailerRespawn.lua:243
---@param vehId integer tracteur
---@param trailerId integer remorque recherchée
---@return boolean  true si relié (directement ou en chaîne)
function core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId) end

--- Hook : un attelage se ferme. Enregistre le sens tracteur/remorque dans trailerReg (le non-remorque tracte), ignore les Props et les boucles, puis émet onTrailerAttached(objId1, objId2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:130
---@param objId1 integer premier véhicule
---@param objId2 integer second véhicule
---@param nodeId integer noeud du premier
---@param obj2nodeId integer noeud du second
function core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook : un attelage s'ouvre. Ne retire l'enregistrement que si breakForce est 0 (détachement volontaire), avec un délai d'une frame (job) pour ne pas empêcher le reset de la remorque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:148
---@param objId1 integer premier véhicule
---@param objId2 integer second véhicule
---@param nodeId integer noeud du premier
---@param obj2nodeId integer noeud du second
---@param breakForce number|nil force de rupture ; ignoré si nil ou > 0
function core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- Hook : restaure le registre et réapplique setEnabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:19
---@param data table données de onSerialize
function core_trailerRespawn.onDeserialized(data) end

--- Hook : sauvegarde le registre et l'état activé avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:12
---@return table  {trailerReg, enabled}
function core_trailerRespawn.onSerialize() end

--- Hook : un véhicule est activé/désactivé. Aligne l'état actif de sa remorque et, à l'activation, la replace derrière lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:158
---@param vehId integer véhicule
---@param active boolean nouvel état
function core_trailerRespawn.onVehicleActiveChanged(vehId, active) end

--- Hook : un véhicule est détruit ; efface ses enregistrements d'attelage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:212
---@param vehId integer véhicule
function core_trailerRespawn.onVehicleDestroyed(vehId) end

--- Hook : un véhicule est remis à zéro ; replace sa remorque derrière lui (désactivé en multijoueur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:203
---@param vehId integer véhicule
function core_trailerRespawn.onVehicleResetted(vehId) end

--- Hook : un véhicule apparaît ; efface ses anciens enregistrements d'attelage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trailerRespawn.lua:198
---@param vehId integer véhicule
function core_trailerRespawn.onVehicleSpawned(vehId) end

--- Replace la remorque enregistrée de vehId derrière lui (spawn.placeTrailer, d'après les décalages de coupleurs).
---Source : lua/ge/extensions/core/trailerRespawn.lua:178
---@param vehId integer tracteur
function core_trailerRespawn.placeTrailer(vehId) end

--- Vide le registre des remorques et réactive le système.
---Source : lua/ge/extensions/core/trailerRespawn.lua:25
function core_trailerRespawn.resetData() end

--- Active ou désactive l'enregistrement des attelages (remplace onCouplerAttached/onCouplerDetached par la fonction vide nop si false).
---Source : lua/ge/extensions/core/trailerRespawn.lua:233
---@param enabled boolean état voulu
function core_trailerRespawn.setEnabled(enabled) end


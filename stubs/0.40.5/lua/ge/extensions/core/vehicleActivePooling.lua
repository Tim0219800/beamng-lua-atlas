---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleActivePooling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicleActivePooling` : gère des « pools » de véhicules dont seule une partie est active (visible et simulée) à la fois, pour limiter la charge (trafic, véhicules garés…). Un pool (classe VehPool) garde deux listes (activeVehs, inactiveVehs), une limite maxActiveAmount, un mode distance (activation selon la distance à la caméra) et un fondu (fade) des meshes. L'état actif d'un véhicule est celui de l'objet (`obj:setActive(0|1)`).
--- Accès : extension `core_vehicleActivePooling` : `extensions.load("core_vehicleActivePooling")`, puis la globale `core_vehicleActivePooling`
---@class core_vehicleActivePooling
---@field logErrors boolean false par défaut ; si true, les avertissements (véhicule déjà actif, limite atteinte…) sont logués.
core_vehicleActivePooling = {}

--- Crée un pool, l'enregistre et émet onVehiclePoolAdded(id).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:394
---@param data table|nil {id?, name?, activeVehs?, inactiveVehs?, maxActiveAmount?} ; name par défaut 'pool<id>'
---@return VehPool  le pool créé
function core_vehicleActivePooling.createPool(data) end

--- Appelle VehPool:deletePool() sur chaque pool (supprime leurs véhicules inactifs) puis vide la table.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:428
function core_vehicleActivePooling.deleteAllPools() end

--- Retire le pool de la table des pools (sans supprimer de véhicules ni émettre de hook ; voir notes).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:401
---@param id integer identifiant du pool
function core_vehicleActivePooling.deletePool(id) end

--- Renvoie la table de tous les pools (pas une copie).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:424
---@return table<integer, VehPool>  [id] = pool
function core_vehicleActivePooling.getAllPools() end

--- Trouve un pool par son nom.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:405
---@param name string|nil nom du pool
---@return VehPool|nil  pool trouvé
function core_vehicleActivePooling.getPool(name) end

--- Trouve un pool par son id.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:420
---@param id integer|nil identifiant
---@return VehPool|nil  pool trouvé
function core_vehicleActivePooling.getPoolById(id) end

--- Trouve le pool contenant un véhicule.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:412
---@param vehId integer identifiant du véhicule
---@return VehPool|nil  pool
---@return boolean|nil  true si le véhicule y est actif
function core_vehicleActivePooling.getPoolOfVeh(vehId) end

--- Hook : fin du niveau ; supprime tous les pools (deleteAllPools).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:447
function core_vehicleActivePooling.onClientEndMission() end

--- Hook : recrée les pools à partir des données sérialisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:490
---@param data table[] données de onSerialize
function core_vehicleActivePooling.onDeserialized(data) end

--- Hook : sérialise tous les pools avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:481
---@return table[]  données des pools
function core_vehicleActivePooling.onSerialize() end

--- Hook appelé à chaque frame : applique le mode distance (activateByDistanceTo) et fait progresser les fondus de fadeQueue avec dtSim / fadeDuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:451
---@param dt number temps réel écoulé (s)
---@param dtSim number temps de simulation écoulé (s)
function core_vehicleActivePooling.onUpdate(dt, dtSim) end

--- Hook : l'état actif d'un véhicule change ; met à jour les listes de tous les pools qui le contiennent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:435
---@param vehId integer véhicule
---@param active boolean nouvel état
function core_vehicleActivePooling.onVehicleActiveChanged(vehId, active) end

--- Hook : un véhicule est détruit ; le retire de tous les pools.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:441
---@param vehId integer véhicule
function core_vehicleActivePooling.onVehicleDestroyed(vehId) end

--- Pool de véhicules créé par createPool. Les méthodes s'appellent avec `:` (pool:insertVeh(id)).
---@class core_vehicleActivePooling_VehPool
local core_vehicleActivePooling_VehPool = {}

--- Texte '[id] active: {...}, inactive: {...}'.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:34
---@return string  description
function core_vehicleActivePooling_VehPool:__tostring() end

--- Interne : met à jour les listes quand l'état actif d'un véhicule a changé (appelé par onVehicleActiveChanged). Ne pas appeler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:305
---@param vehId integer véhicule
---@param activate boolean nouvel état
function core_vehicleActivePooling_VehPool:_setVeh(vehId, activate) end

--- Désactive les véhicules actifs plus loin que dist + buffer et active les inactifs plus proches que dist (le buffer évite les basculements rapides).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:368
---@param pos vec3|nil position de référence ; défaut = caméra
---@param dist number|nil distance (m) ; défaut = activeDistance
---@param buffer number|nil marge de désactivation (m) ; défaut 10
function core_vehicleActivePooling_VehPool:activateByDistanceTo(pos, dist, buffer) end

--- Renvoie true si la limite de véhicules actifs est atteinte (compte les actifs du pool, ou de la scène si useSceneVehiclesCap).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:121
---@return boolean  limite atteinte
function core_vehicleActivePooling_VehPool:checkActiveLimit() end

--- Vide toutes les listes du pool sans toucher aux véhicules.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:133
function core_vehicleActivePooling_VehPool:clearPool() end

--- Désactive un véhicule de ce pool et active un véhicule d'un autre pool.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:167
---@param otherPool VehPool|nil autre pool ; nil ou même pool = cycle
---@param vehId1 integer|nil véhicule de ce pool à désactiver
---@param vehId2 integer|nil véhicule de l'autre pool à activer
---@return integer|false  vehId1 (ou false)
---@return integer|nil  vehId2
function core_vehicleActivePooling_VehPool:crossCycle(otherPool, vehId1, vehId2) end

--- Désactive un véhicule actif et en active un inactif du même pool (la limite est ignorée pendant l'opération).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:153
---@param vehId1 integer|nil véhicule à désactiver ; défaut = 1er actif
---@param vehId2 integer|nil véhicule à activer ; défaut = 1er inactif
---@return integer|false  vehId1 (ou false si impossible)
---@return integer|nil  vehId2
function core_vehicleActivePooling_VehPool:cycle(vehId1, vehId2) end

--- Supprime le pool ; sauf si keepVehicles, supprime aussi les véhicules inactifs. Émet onVehiclePoolRemoved(id).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:141
---@param keepVehicles boolean|nil true : ne supprime aucun véhicule
function core_vehicleActivePooling_VehPool:deletePool(keepVehicles) end

--- Programme un fondu vers opaque. Si le véhicule est inactif et updateActiveStatePostFade est true, l'active d'abord.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:192
---@param vehId integer véhicule du pool
---@return boolean  true si programmé
function core_vehicleActivePooling_VehPool:fadeInVeh(vehId) end

--- Programme un fondu vers transparent (véhicule actif requis). Avec updateActiveStatePostFade, il est désactivé en fin de fondu.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:212
---@param vehId integer véhicule du pool
---@return boolean  true si programmé
function core_vehicleActivePooling_VehPool:fadeOutVeh(vehId) end

--- Augmente ou diminue directement l'alpha des meshes du véhicule de `dt` (clampé 0..1). À utiliser à chaque frame pour un fondu progressif.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:181
---@param vehId integer véhicule du pool et actif
---@param dt number variation d'alpha (négatif pour disparaître)
---@return number  nouvel alpha, -1 si le véhicule n'est pas dans le pool ou inactif
function core_vehicleActivePooling_VehPool:fadeVeh(vehId, dt) end

--- Nombre total de véhicules actifs de la scène (tous pools confondus), véhicules garés exclus sauf si 'PropParked' est demandé.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:108
---@param vehTypes string[]|nil types de véhicules à compter ; nil = défaut
---@return integer  nombre
function core_vehicleActivePooling_VehPool:getSceneActiveAmount(vehTypes) end

--- Liste de tous les ids du pool (actifs d'abord).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:388
---@return integer[]  ids
function core_vehicleActivePooling_VehPool:getVehs() end

--- Ajoute un véhicule au pool ; il est actif si l'objet est actif et que la limite le permet, sinon inactif (et désactivé via obj:setActive).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:234
---@param vehId integer véhicule existant, pas déjà dans ce pool
---@param forceInsert boolean|nil relever la limite si nécessaire
---@return boolean  true si inséré
function core_vehicleActivePooling_VehPool:insertVeh(vehId, forceInsert) end

--- Constructeur (utiliser plutôt createPool). Initialise listes, limites et valeurs par défaut, et garantit un id unique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:38
---@param data table|nil id, name, activeVehs, inactiveVehs, maxActiveAmount
---@return VehPool  nouveau pool
function core_vehicleActivePooling_VehPool:new(data) end

--- Copie les champs de data dans le pool.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:100
---@param data table|nil données
function core_vehicleActivePooling_VehPool:onDeserialized(data) end

--- Renvoie les données du pool à sauvegarder.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:81
---@return table  données
function core_vehicleActivePooling_VehPool:onSerialize() end

--- Retire un véhicule du pool (sans le supprimer).
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:259
---@param vehId integer véhicule
---@return boolean  true si retiré
function core_vehicleActivePooling_VehPool:removeVeh(vehId) end

--- Active (dans la limite de maxActiveAmount) ou désactive tous les véhicules du pool.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:282
---@param activate boolean true pour activer, false pour désactiver
---@return boolean  true si au moins un véhicule est concerné
function core_vehicleActivePooling_VehPool:setAllVehs(activate) end

--- Fixe la limite de véhicules actifs et désactive l'excédent s'il y en a.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:348
---@param amount integer|nil nouvelle limite ; nil la conserve
function core_vehicleActivePooling_VehPool:setMaxActiveAmount(amount) end

--- Active ou désactive un véhicule du pool en respectant la limite.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:326
---@param vehId integer véhicule du pool
---@param activate boolean état voulu
---@param forceInsert boolean|nil relever la limite si elle est atteinte
---@return boolean  true si l'état a changé
function core_vehicleActivePooling_VehPool:setVeh(vehId, activate, forceInsert) end

--- Vérifie si un véhicule actif de plus est autorisé ; avec forceInsert, augmente maxActiveAmount de 1 au lieu de refuser.
---Source : lua/ge/extensions/core/vehicleActivePooling.lua:220
---@param vehId integer véhicule (non utilisé dans le calcul)
---@param forceInsert boolean|nil forcer en relevant la limite
---@return boolean  true si autorisé
function core_vehicleActivePooling_VehPool:tryInsertActiveVeh(vehId, forceInsert) end


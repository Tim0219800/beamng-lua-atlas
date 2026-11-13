---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/couplerCameraModifier.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quand le véhicule du joueur 0 est attelé à une remorque (distance entre les deux véhicules entre 1 et 15 m, l'un des deux de type « Trailer »), cette extension verrouille leurs caméras orbit, règle leur distance à (d1+d2)/1.5+1 et recentre la caméra du joueur sur le milieu de l'attelage à chaque image. À la séparation, au rechargement ou si l'écart devient trop grand, les caméras orbit sont restaurées. Active seulement si le réglage settings « couplerCameraModifier » est vrai (sinon onExtensionLoaded renvoie false).
--- Accès : extension `core_couplerCameraModifier` : `extensions.load("core_couplerCameraModifier")`, puis la globale `core_couplerCameraModifier`
---@class core_couplerCameraModifier
---@field dependencies string[] {"core_trailerRespawn"} : chargé avant (fournit getConfigType).
core_couplerCameraModifier = {}

--- Dit si deux véhicules forment un attelage voisin avec remorque : ids différents, au moins l'un de type « Trailer » (core_trailerRespawn.getConfigType) et distance comprise entre 1 et 15 m.
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:19
---@param objId1_ integer id du premier véhicule
---@param objId2_ integer id du second véhicule
---@return boolean  true si c'est un attelage avec remorque
function core_couplerCameraModifier.checkForTrailer(objId1_, objId2_) end

--- Hook : deux véhicules s'attellent ; si l'un est le véhicule du joueur 0 et que checkForTrailer est vrai, démarre le suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:107
---@param objId1_ integer id véhicule 1
---@param objId2_ integer id véhicule 2
function core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_) end

--- Hook : appelé pour tout détachement dans le monde ; arrête le suivi seulement s'il concerne la paire suivie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:118
---@param objId1_ integer id véhicule 1
---@param objId2_ integer id véhicule 2
function core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_) end

--- Hook : restaure objId1, objId2, detached.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:215
---@param data table|nil table renvoyée par onSerialize
function core_couplerCameraModifier.onDeserialized(data) end

--- Hook : si le réglage couplerCameraModifier est actif, prend en charge un attelage déjà existant du véhicule du joueur 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:102
function core_couplerCameraModifier.onExtensionLoaded() end

--- Hook : restaure les caméras orbit d'origine (restoreOriginalCamera).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:52
function core_couplerCameraModifier.onExtensionUnloaded() end

--- Hook : sauvegarde objId1, objId2, detached.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:207
---@return table  données à sérialiser
function core_couplerCameraModifier.onSerialize() end

--- Hook par image : calcule la position moyenne des deux caméras orbit et applique setTargetMode(vid, 'notCenter') + setRef(vid, milieu, gauche, arrière) au véhicule du joueur ; restaure si les caméras sont plus éloignées que la somme des distances orbit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:125
function core_couplerCameraModifier.onUpdate() end

--- Hook : si un des véhicules suivis est remplacé, arrête le suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:201
---@param vehId integer id du véhicule
function core_couplerCameraModifier.onVehicleSpawned(vehId) end

--- Hook : le joueur change de véhicule ; cherche un attelage pour le nouveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/couplerCameraModifier.lua:197
---@param oldId integer ancien id
---@param newId integer nouvel id
---@param player integer numéro de joueur (non utilisé)
function core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/lawnMower.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tondeuse à gazon pilotée par les props JBeam (côté GE uniquement). Il cherche dans le JBeam analysé de chaque véhicule les props portant l'option mowerRadius et, tant que le plateau de coupe est bas et à plat au-dessus d'un terrain, coupe l'herbe dans le masque de surface partagé (util_surfaceMaskWheels) en traçant un disque puis des segments, et lance des particules de brins d'herbe sur les matériaux de terrain dont le nom contient « grass ». Aucun Lua côté véhicule n'est nécessaire. La partie JBeam déclare "gameEngineExtensions": {"util_lawnMower": true} pour charger l'extension automatiquement.
--- Accès : extension `util_lawnMower` : `extensions.load("util_lawnMower")`, puis la globale `util_lawnMower`
---@class util_lawnMower
---@field dependencies string[] Extensions requises : util_surfaceMaskWheels (service de masque) et core_vehicle_manager (données JBeam analysées)
---@field enabled boolean Active ou non la coupe ; true après onExtensionLoaded
util_lawnMower = {}

--- Hook appelé au démarrage d'un niveau : vide les caches de cellules coupées, de matériaux d'herbe et d'objet terrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:233
function util_lawnMower.onClientStartMission() end

--- Hook de désérialisation après rechargement : restaure l'état enabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:264
---@param data table|nil Données renvoyées par onSerialize
function util_lawnMower.onDeserialized(data) end

--- Appelé au chargement : active la tondeuse et scanne les véhicules déjà présents.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:244
function util_lawnMower.onExtensionLoaded() end

--- Hook appelé chaque frame avant le rendu : si activé et si des tondeuses existent, centre le clipmap du masque et fait couper chaque tondeuse (toutes les 0,05 s). Supprime l'état des véhicules disparus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:164
---@param dtReal number Delta de temps réel en secondes
---@param dtSim number Delta de temps de simulation en secondes (prioritaire pour le chronomètre)
function util_lawnMower.onPreRender(dtReal, dtSim) end

--- Hook de sérialisation avant un rechargement d'extensions : sauvegarde l'état enabled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:260
---@return table  {enabled = boolean}
function util_lawnMower.onSerialize() end

--- Hook appelé quand un véhicule est détruit : oublie ses tondeuses.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:239
---@param vehId integer Identifiant du véhicule
function util_lawnMower.onVehicleDestroyed(vehId) end

--- Hook appelé quand un véhicule apparaît (ou est réapparu après un changement de pièce) : relit ses props JBeam à la recherche de mowerRadius.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/lawnMower.lua:229
---@param vehId integer Identifiant du véhicule
function util_lawnMower.onVehicleSpawned(vehId) end

--- Active ou désactive la coupe et remet le chronomètre à zéro.
---Source : lua/ge/extensions/util/lawnMower.lua:251
---@param enabled boolean true pour activer
function util_lawnMower.setEnabled(enabled) end

--- Inverse l'état activé/désactivé.
---Source : lua/ge/extensions/util/lawnMower.lua:256
function util_lawnMower.toggle() end


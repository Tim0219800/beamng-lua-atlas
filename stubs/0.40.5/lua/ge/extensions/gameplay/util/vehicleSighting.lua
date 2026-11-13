---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/vehicleSighting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détermine si un observateur (la caméra du joueur ou un véhicule) peut « voir » un véhicule cible. La portée dépend de l'angle : portée maximale (80 m) droit devant, portée minimale (5 m) hors du cône périphérique (90°), interpolée entre les deux. Un rayon optionnel vérifie l'absence d'obstacle.
--- Accès : extension `gameplay_util_vehicleSighting` : `extensions.load("gameplay_util_vehicleSighting")`, puis la globale `gameplay_util_vehicleSighting`
---@class gameplay_util_vehicleSighting
gameplay_util_vehicleSighting = {}

--- Teste si la caméra du joueur voit le véhicule cible (position et direction de core_camera).
---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:46
---@param targetVehId integer Id du véhicule cible.
---@param params table|nil Réglages, voir checkSighting.
---@return boolean  false si core_camera ou le véhicule n'existe pas.
function gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params) end

--- Teste si un véhicule voit un autre véhicule (position et direction avant de l'observateur).
---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:59
---@param observerVehId integer Id de l'observateur.
---@param targetVehId integer Id de la cible.
---@param params table|nil Réglages, voir checkSighting.
---@return boolean  false si l'un des véhicules n'existe pas.
function gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params) end

--- Test de visibilité générique à partir de positions : distance, angle par rapport à la direction d'observation, puis rayon d'occultation.
---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:12
---@param observerPos vec3 Position de l'observateur.
---@param observerDir vec3 Direction de regard normalisée.
---@param targetPos vec3 Position de la cible.
---@param params table maxDistDirectSight, minDistPeriphSight, periphSightAngle, needDirectVisualContact (table obligatoire).
---@return boolean  true si la cible est visible.
function gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/speedCameraOverlay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit les données affichées par la surcouche « radar / caméra de vitesse » du mode photo : carte courante, nom du lieu, heure du niveau, plaque d'immatriculation du véhicule joueur, limitation de vitesse de la route la plus proche et position. Tout est lu en lecture seule avec des accès protégés (pcall) : aucune valeur n'est modifiée.
--- Accès : extension `ui_photomode_speedCameraOverlay` : `extensions.load("ui_photomode_speedCameraOverlay")`, puis la globale `ui_photomode_speedCameraOverlay`
---@class ui_photomode_speedCameraOverlay
ui_photomode_speedCameraOverlay = {}

--- Construit la table de données de la surcouche. Les chaînes absentes valent "", levelTime vaut {} si l'heure est indisponible, roadDistance/speedLimit/position valent nil si inconnus.
---Source : lua/ge/extensions/ui/photomode/speedCameraOverlay.lua:129
---@return table  {mapId=string, mapName=string, locationName=string (zone de gameplay_city de plus haute priorité, sinon mapName), levelTime={time,year,month,day} issu de core_environment.getTimeOfDay, licensePlate=string, roadDistance=number|nil (distance à la route la plus proche), speedLimit=number|nil, position={x,y,z}|nil}.
function ui_photomode_speedCameraOverlay.getData() end


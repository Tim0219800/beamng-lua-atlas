---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/vehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessine les marqueurs de véhicules de la mini-carte : le joueur (véhicule, piéton à pied ou caméra libre) et les autres véhicules actifs (trafic, voitures garées, police, véhicules utilisables ou non). Le module minimap lui transmet son état de dessin via setMinimapState puis appelle drawPlayer et drawOtherVehicles à chaque frame. Chargé par require, il s'appuie sur ui_apps_minimap_utils et le td:vehicleMarker de la minimap.
--- Accès : extension `ui_apps_minimap_vehicles` : `extensions.load("ui_apps_minimap_vehicles")`, puis la globale `ui_apps_minimap_vehicles`
---@class ui_apps_minimap_vehicles
ui_apps_minimap_vehicles = {}

--- Dessine tous les autres véhicules actifs visibles selon les réglages de debug (trafic, garés, police active, utilisables, inutilisables).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/vehicles.lua:153
---@param dtReal number Temps réel écoulé (non utilisé).
---@param dtSim number Temps de simulation écoulé (non utilisé).
function ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim) end

--- Dessine le marqueur du joueur (véhicule ou piéton) et, en caméra libre, le repère de caméra. Calcule aussi une échelle dynamique (plus grande à vitesse élevée) renvoyée à l'appelant ; renvoie nil s'il n'y a pas de véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/vehicles.lua:56
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@return number|nil  Échelle ajustée du marqueur joueur.
function ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim) end

--- Reçoit de la minimap principale tout l'état de dessin (taille, centre, caméra, échelle, objet de dessin, réglages de debug, direction de la caméra, dpi) et récupère la palette et la transformation monde-carte courantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/vehicles.lua:31
---@param w number Largeur de la carte en pixels.
---@param h number Hauteur de la carte en pixels.
---@param cx number Centre X.
---@param cy number Centre Y.
---@param cp vec3 Position de la caméra.
---@param cr quat Rotation de la caméra.
---@param cri quat Rotation inverse de la caméra.
---@param s number Échelle de la carte.
---@param si number Inverse de l'échelle.
---@param textureDraw table Objet de dessin (vehicleMarker, line…).
---@param debugSettingsObj table Réglages de debug (drawPlayer, drawTrafficVehicles, drawParkedVehicles, drawOtherVehicles, drawUnusableVehicles, drawActivePoliceVehicles, lookaheadEnabled, lookaheadValue).
---@param cameraLookObj vec3 Direction de regard de la caméra.
---@param dpiValue number|nil Facteur dpi, multiplié par la globale globalDpi si elle existe.
function ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue) end


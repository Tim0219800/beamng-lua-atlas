---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/beamNavigator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui affiche une carte de navigation en direct sur un écran du véhicule. Il crée une texture HTML (module `htmlTexture`) sur un matériau d'écran, demande au jeu la carte du tableau de bord (`ui_uinavi.requestVehicleDashboardMap`) et lui envoie 15 fois par seconde la position, l'orientation, la vitesse et l'allumage du véhicule, tant qu'un joueur est assis.
--- Accès : contrôleur `beamNavigator` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_beamNavigator
---@field reset function nop : évite de rappeler init au reset du véhicule.
---@field type string "auxiliary".
local controller_beamNavigator = {}

--- Crée la texture HTML de l'écran, demande la carte au jeu et affiche l'image de démarrage si `bootscreenImage` est fournie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/beamNavigator.lua:40
---@param jbeamData table Données jbeam du contrôleur.
function controller_beamNavigator.init(jbeamData) end

--- Envoie les données GPS à la texture HTML à 15 Hz quand un joueur est assis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/beamNavigator.lua:21
---@param dt number Pas de temps en secondes.
function controller_beamNavigator.updateGFX(dt) end

return controller_beamNavigator

---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/rimPullControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de « rim pull » (commande de traction sur jante, ex. engins ferroviaires/tracteurs) : un axe d'entrée input.rimPull (0..1) réduit progressivement l'embrayage de la turbine du convertisseur de couple (de 1 à 0.2 entre 0 et 0.5) puis ajoute du frein (de 0 à 1 entre 0.5 et 1). Il s'exécute avant vehicleController (defaultOrder 40) pour modifier input.brake avant son utilisation.
--- Accès : contrôleur `powertrainControl/rimPullControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_powertrainControl_rimPullControl
---@field defaultOrder number Ordre d'exécution (40).
---@field type string "auxiliary".
local controller_powertrainControl_rimPullControl = {}

--- Récupère le convertisseur de couple (jbeam torqueConverterName).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/rimPullControl.lua:34
---@param jbeamData table Données jbeam du contrôleur.
function controller_powertrainControl_rimPullControl.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/rimPullControl.lua:31
---@param jbeamData table Données jbeam.
function controller_powertrainControl_rimPullControl.reset(jbeamData) end

--- Chaque frame : convertit input.rimPull en consigne d'embrayage de turbine et en frein additionnel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/rimPullControl.lua:16
---@param dt number Pas de temps en secondes.
function controller_powertrainControl_rimPullControl.updateGFX(dt) end

return controller_powertrainControl_rimPullControl

---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/liftAxleControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de relevage d'essieu pneumatique (remorques/camions). Deux modes : « lift » (essieu relevé : airbags de levage gonflés, airbags principaux vidés) et « drop » (essieu posé : l'inverse), pilotés via deux contrôleurs d'actuateurs (airbags). En mode drop, la pression d'alimentation maximale des airbags principaux peut être changée dynamiquement (charge portée par l'essieu). Publie les pressions moyennes relatives et le mode dans electrics.values.
--- Accès : contrôleur `pneumatics/liftAxleControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_liftAxleControl
---@field type string "auxiliary".
local controller_pneumatics_liftAxleControl = {}

--- État sauvegardable : mode, pression maximale d'alimentation, taux de variation (clés préfixées par le nom du contrôleur).
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:115
---@return table  Table d'état.
function controller_pneumatics_liftAxleControl.getState() end

--- Lit les clés jbeam, noms de groupes d'airbags et noms d'electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:77
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_liftAxleControl.init(jbeamData) end

--- Récupère les deux contrôleurs d'actuateurs puis passe en mode « lift ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:95
---@param jbeamData table Données jbeam.
function controller_pneumatics_liftAxleControl.initLastStage(jbeamData) end

--- Met le taux de variation de pression d'alimentation à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:73
---@param jbeamData table Données jbeam.
function controller_pneumatics_liftAxleControl.reset(jbeamData) end

--- Fixe la pression maximale d'alimentation des airbags principaux (Pa absolus), appliquée en mode drop.
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:65
---@param maxSupplyPressure number Pression en Pa.
function controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure) end

--- Fixe la vitesse de variation de cette pression maximale (Pa/s, signée).
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:69
---@param maxSupplyPressureChangeRate number Variation en Pa/s.
function controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate) end

--- Choisit le mode « lift » ou « drop » et ouvre/ferme les vannes des deux groupes d'airbags en conséquence.
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:46
---@param mode string "lift" ou "drop".
function controller_pneumatics_liftAxleControl.setMode(mode) end

--- Restaure pression, taux et mode (valeurs NaN ignorées).
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:122
---@param data table|nil Table produite par getState.
function controller_pneumatics_liftAxleControl.setState(data) end

--- Bascule entre drop et lift.
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:57
function controller_pneumatics_liftAxleControl.toggleMode() end

--- Chaque frame : applique la pression d'alimentation maximale en mode drop, la fait évoluer et met à jour les electrics de pressions et de mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/liftAxleControl.lua:32
---@param dt number Pas de temps en secondes.
function controller_pneumatics_liftAxleControl.updateGFX(dt) end

return controller_pneumatics_liftAxleControl

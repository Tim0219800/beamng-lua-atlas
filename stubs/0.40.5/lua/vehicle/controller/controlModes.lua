---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/controlModes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui remappe les entrées du conducteur (direction, accélérateur, frein, ou accélérateur-frein combiné) vers des valeurs `electrics.values` personnalisées, selon un « mode de contrôle » choisi (par exemple pour piloter une grue ou des vérins). Chaque mode liste les electrics actifs ; chaque electric est configuré avec une entrée source, des lissages, une vitesse et des bornes. Ajoute un menu radial pour choisir le mode.
--- Accès : contrôleur `controlModes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_controlModes
---@field controlModeIndex integer|nil Index du mode actif (1 = premier) ; nil avant init.
---@field controlModeName string|nil Nom du mode actif ; nil avant init.
---@field type string "auxiliary".
local controller_controlModes = {}

--- Renvoie l'index de mode actif sous la clé `<nom>_modeIndex`.
---Source : lua/vehicle/controller/controlModes.lua:123
---@return table  Table d'état.
function controller_controlModes.getState() end

--- Lit les modes et la configuration depuis le jbeam, crée les lisseurs, met les electrics à 0 et enregistre le menu radial (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/controlModes.lua:65
---@param jbeamData table Données jbeam du contrôleur.
function controller_controlModes.init(jbeamData) end

--- Choisit le mode par son index (ignoré si inexistant) et affiche son nom sauf si silent.
---Source : lua/vehicle/controller/controlModes.lua:38
---@param index integer Index du mode (1 = premier).
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_controlModes.setControlModeIndex(index, silent) end

--- Définit une entrée personnalisée utilisable dans `config.input`.
---Source : lua/vehicle/controller/controlModes.lua:61
---@param name string Nom d'entrée.
---@param value number Valeur de l'entrée.
function controller_controlModes.setInputValue(name, value) end

--- Restaure l'index de mode s'il est valide (silencieusement).
---Source : lua/vehicle/controller/controlModes.lua:128
---@param data table|nil Table d'état.
function controller_controlModes.setState(data) end

--- Décale l'index de mode de `value` avec retour circulaire (au-delà du dernier : premier ; en dessous du premier : dernier).
---Source : lua/vehicle/controller/controlModes.lua:50
---@param value integer +1 ou -1 en pratique.
function controller_controlModes.toggleControlMode(value) end

--- Chaque frame : lit les entrées et fait évoluer les electrics du mode actif (intégration lissée bornée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/controlModes.lua:25
---@param dt number Pas de temps en secondes.
function controller_controlModes.updateGFX(dt) end

return controller_controlModes

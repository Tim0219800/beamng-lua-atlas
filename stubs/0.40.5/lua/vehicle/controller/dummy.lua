---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/dummy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur principal (type "main") minimal pour les véhicules sans moteur (remorques, objets). Il fournit l'API obligatoire d'un contrôleur principal (changements de rapport, démarreur, etc., tous en nop) et écrit chaque image des valeurs electrics neutres : throttle, brake, clutch issus des entrées, gear "N", gearIndex 0, rpm/fuel/températures à 0, ignition false, gearboxMode "none".
--- Accès : contrôleur `dummy` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_dummy
---@field brake number 0.
---@field clutchRatio number 0.
---@field cycleGearboxModes function nop.
---@field drivingAggression number 0.
---@field engineInfo table Tableau d'info moteur de 21 valeurs statiques (voir notes).
---@field fireEngineTemperature number 0.
---@field init function nop.
---@field sendTorqueData function nop.
---@field setEngineIgnition function nop.
---@field setFreeze function nop.
---@field setGearboxMode function nop.
---@field setStarter function nop.
---@field shiftDown function nop.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop.
---@field shiftingAggression number 0.
---@field throttle number 0.
---@field type string "main".
---@field vehicleActivated function nop.
local controller_dummy = {}

--- Chaque image : copie les entrées throttle/brake/clutch (bornées 0..1) dans electrics.values et force les autres valeurs à leur état neutre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/dummy.lua:42
---@param dt number Pas de temps (s).
function controller_dummy.updateGFX(dt) end

return controller_dummy

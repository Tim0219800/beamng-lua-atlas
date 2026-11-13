---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/beaconSpin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire minimal qui anime les éléments rotatifs d'une rampe lumineuse : tant que `electrics.values.lightbar` est supérieur à 0, il fait tourner une valeur electrics (angle en degrés, modulo 360) ; sinon il la remet à 0.
--- Accès : contrôleur `beaconSpin` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_beaconSpin
---@field type string "auxiliary".
local controller_beaconSpin = {}

--- Lit `spinSpeed` et `electricsName` et initialise la valeur electrics à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/beaconSpin.lua:17
---@param jbeamData table Données jbeam du contrôleur.
function controller_beaconSpin.init(jbeamData) end

--- Chaque frame : avance l'angle de dt × spinSpeed (modulo 360) si la rampe est active, sinon met la valeur à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/beaconSpin.lua:13
---@param dt number Pas de temps en secondes.
function controller_beaconSpin.updateGFX(dt) end

return controller_beaconSpin

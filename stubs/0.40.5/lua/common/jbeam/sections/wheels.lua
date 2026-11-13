---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Répartiteur de la construction des roues lors du chargement d'un véhicule jbeam. Il parcourt les sections de roues du véhicule (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) dans cet ordre, appelle pour chaque roue le gestionnaire du type (fichier jbeam/sections/wheelTypes/<section>.lua) qui crée nœuds, poutres et triangles, puis range toutes les roues dans vehicle.wheels avec un identifiant wheelID. processRotators ajoute ensuite les rotators (roues sans pneu) et renumérote les roues. Appelé par le chargeur jbeam, pas par un mod courant.
--- Accès : globale `wheels`
---@class wheels
wheels = {}

--- Ajoute les rotators (vehicle.rotators) comme roues supplémentaires (wheelID, jbeamUtils.addRotator), retire les roues sans nœuds et renumérote vehicle.wheels / cid.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheels.lua:105
---@param vehicle table données du véhicule
function wheels.processRotators(vehicle) end

--- Construit toutes les roues du véhicule : réinitialise vehicle.wheels, traite chaque section de roues non vide via le gestionnaire du type de roue (require chargé à la demande puis mis en cache), assigne wheelID et range le résultat dans vehicle.wheels.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheels.lua:81
---@param vehicle table données du véhicule en cours de construction (nodes, beams, maxIDs, sections de roues, flexbodies…)
---@return boolean  toujours true
function wheels.processWheels(vehicle) end


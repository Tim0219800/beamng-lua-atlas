---@meta
-- tim19Atlas stub generated from lua/vehicle/jbeam/stage2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Deuxième étape du chargement d'un véhicule, côté VM véhicule : prend les données jbeam déjà assemblées par le jeu (stage 1, dans la VM du jeu) et les « pousse » dans la physique C++ en appelant obj:setNode, obj:setBeam, obj:setWheel, obj:addRail, obj:addSlidenode, obj:setTorsionbar, obj:setTriangle, obj:setReferenceNodes puis obj:finishLoading. main.lua le charge en globale `v` (v = require('jbeam/stage2')) : après loadVehicleStage2, `v.data` contient les données du véhicule (nodes, beams, wheels, hydros, powertrain, refNodes, input, information…), et `v.config` la configuration (pièces, peintures, additionalVehicleData…). C'est donc la source de toutes les lectures de jbeam par les autres modules.
--- Accès : globale `v`
---@class v
v = {}

--- Envoie les données jbeam à la physique (noeuds, poutres, roues, rails, slidenodes, torsions, triangles, noeuds de référence) puis publie v.data et v.config. Appelée une fois par main.lua:init avec les données de spawn décodées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/jbeam/stage2.lua:590
---@param vdataStage1 table Table de spawn {vdata = données jbeam assemblées, config = configuration du véhicule}.
---@return table|nil  vdata (les données du véhicule) en cas de succès ; nil si vdata n'est pas une table.
function v.loadVehicleStage2(vdataStage1) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions d'affichage imgui partagées par l'inspecteur de transmission du Vehicle Editor (vePowerTrain). Elles montrent les données jbeam d'un périphérique (arbre récursif) et ses données live (vitesses angulaires, couples, rapports, embrayage…), avec des champs spécifiques selon le type de device (combustionEngine, differential, shaft, manualGearbox, frictionClutch, torqueConverter, automaticGearbox, cvtGearbox, dctGearbox).
--- Accès : extension `editor_vehicleEditor_api_powerTrainUtils` : `extensions.load("editor_vehicleEditor_api_powerTrainUtils")`, puis la globale `editor_vehicleEditor_api_powerTrainUtils`
---@class editor_vehicleEditor_api_powerTrainUtils
editor_vehicleEditor_api_powerTrainUtils = {}

--- Affiche les données live communes : inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia.
---Source : lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:102
---@param device table Données live sérialisées du device.
function editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device) end

--- Affiche en deux colonnes les champs live propres au type du device (par exemple engineLoad pour un moteur, diffAngle/outputAV2/outputTorque2 pour un différentiel, clutchAngle/lockSpring pour un embrayage).
---Source : lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:11
---@param deviceType string Type du device (device.type).
---@param device table Données live sérialisées du device.
function editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device) end

--- Affecte la globale `vEditor` à l'instance donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:133
---@param editorInstance table Instance de l'éditeur (normalement editor_veMain).
function editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance) end

--- Affiche dans un nœud d'arbre 'All jbeam data' toutes les données jbeam du device vEditor.vdata.powertrain[deviceID].
---Source : lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:126
---@param deviceID integer Index du device dans vdata.powertrain (0-based).
function editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID) end


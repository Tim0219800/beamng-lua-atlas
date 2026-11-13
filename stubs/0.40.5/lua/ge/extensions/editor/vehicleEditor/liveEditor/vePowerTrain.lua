---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Powertrain' (Powertrain Inspector) du Vehicle Editor live. Chaque frame elle demande au véhicule powertrain.serializeDevicesInfo() (stocké dans vEditor.powertrainDevices), propose un combo des devices triés par nom, puis affiche leurs données jbeam et leurs données live grâce à powerTrainUtils. Dépend de editor_veMain.
--- Accès : extension `editor_vehicleEditor_liveEditor_vePowerTrain` : `extensions.load("editor_vehicleEditor_liveEditor_vePowerTrain")`, puis la globale `editor_vehicleEditor_liveEditor_vePowerTrain`
---@class editor_vehicleEditor_liveEditor_vePowerTrain
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Powertrain Inspector'.
editor_vehicleEditor_liveEditor_vePowerTrain = {}

--- Restaure windowOpen et devicePtr (nom non standard).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:74
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data) end

--- Appelé à l'activation de l'éditeur : force le recalcul de la liste de devices.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:96
function editor_vehicleEditor_liveEditor_vePowerTrain.onEditorActivated() end

--- Renvoie {windowOpen, devicePtr}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:67
---@return table  {windowOpen = boolean, devicePtr = integer}
function editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize() end

--- Appelé chaque frame : demande les infos de devices au véhicule et dessine le combo, les données jbeam et les données live.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:20
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt) end

--- Au changement de véhicule, si l'éditeur est actif, vide la liste de devices et force le recalcul de la liste de noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:90
---@param oldVehicle integer ID de l'ancien véhicule.
---@param newVehicle integer ID du nouveau véhicule.
---@param player integer Index du joueur.
function editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:79
function editor_vehicleEditor_liveEditor_vePowerTrain.open() end


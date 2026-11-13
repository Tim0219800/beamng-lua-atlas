---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Vehicle Aero Debug' du Vehicle Editor live. Active l'extension véhicule `aeroDebug` (extensions.aeroDebug.enable()), lit getAeroData() et affiche la force et le moment aérodynamiques totaux (repère monde et repère véhicule), puis la déportance (downforce) des essieux avant/arrière. Permet d'associer les 4 roues (FL, FR, RL, RR) via des combos ; un remplissage automatique est tenté si les noms de roues sont FL/FR/RL/RR. Dépend de editor_veMain.
--- Accès : extension `editor_vehicleEditor_liveEditor_veAeroDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veAeroDebug`
---@class editor_vehicleEditor_liveEditor_veAeroDebug
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Aero Debug'.
editor_vehicleEditor_liveEditor_veAeroDebug = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:175
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data) end

--- Appelé à l'entrée dans l'éditeur (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:166
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated() end

--- Appelé à la sortie de l'éditeur : désactive aeroDebug sur le véhicule courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:160
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated() end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:169
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize() end

--- Appelé chaque frame : active/interroge aeroDebug sur le véhicule et dessine les tableaux de forces et la configuration des essieux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:61
---@param dt number Delta temps.
function editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt) end

--- Désactive aeroDebug sur l'ancien véhicule et remet à zéro les données aéro et l'initialisation des combos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:150
---@param oldVehicle integer ID de l'ancien véhicule.
---@param newVehicle integer ID du nouveau véhicule.
---@param player integer Index du joueur.
function editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:145
function editor_vehicleEditor_liveEditor_veAeroDebug.open() end


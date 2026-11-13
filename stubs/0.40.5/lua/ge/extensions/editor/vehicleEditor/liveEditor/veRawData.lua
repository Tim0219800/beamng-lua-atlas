---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Raw Vehicle Data' du Vehicle Editor live : affiche sous forme d'arbre imgui récursif toute la table vEditor.vehData (données du véhicule courant, dont vdata jbeam) via imguiUtils.addRecursiveTreeTable. Utile à un moddeur pour inspecter la structure jbeam résolue.
--- Accès : extension `editor_vehicleEditor_liveEditor_veRawData` : `extensions.load("editor_vehicleEditor_liveEditor_veRawData")`, puis la globale `editor_vehicleEditor_liveEditor_veRawData`
---@class editor_vehicleEditor_liveEditor_veRawData
---@field menuEntry string 'Raw Vehicle Data' : libellé du menu lu par editor_veMain.
editor_vehicleEditor_liveEditor_veRawData = {}

--- Restaure l'état d'ouverture de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:36
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data) end

--- Renvoie {windowOpen} pour restaurer l'état après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:30
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veRawData.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre et l'arbre des données si elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:15
function editor_vehicleEditor_liveEditor_veRawData.onUpdate() end

--- Ouvre la fenêtre (utilisé par le menu du Vehicle Editor).
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:26
function editor_vehicleEditor_liveEditor_veRawData.open() end


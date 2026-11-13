---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre 'Lights Debug' du Vehicle Editor live. Dessine avec debugDrawer les props lumineux du véhicule (vdata.props dont mesh vaut SPOTLIGHT ou POINTLIGHT) : pour un spot, une sphère, une ligne de direction de longueur lightRange et une pointe de flèche ; pour un point de lumière, une sphère et une sphère translucide de rayon lightRange. Options : spots, points, X-Ray (sans test de profondeur), noms, vecteurs unitaires (longueur 1).
--- Accès : extension `editor_vehicleEditor_liveEditor_veLightsDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veLightsDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veLightsDebug`
---@class editor_vehicleEditor_liveEditor_veLightsDebug
---@field menuEntry string 'Lights Debug'.
editor_vehicleEditor_liveEditor_veLightsDebug = {}

--- Restaure l'état d'ouverture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:147
---@param data table Table de onSerialize.
function editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data) end

--- Renvoie {windowOpen}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:141
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize() end

--- Appelé chaque frame : dessine la fenêtre avec les cases à cocher.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:123
function editor_vehicleEditor_liveEditor_veLightsDebug.onUpdate() end

--- Hook émis par editor_veMain à chaque frame de rendu : dessine les spots et points lumineux des props du véhicule si la fenêtre est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:32
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Ouvre la fenêtre.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:137
function editor_vehicleEditor_liveEditor_veLightsDebug.open() end


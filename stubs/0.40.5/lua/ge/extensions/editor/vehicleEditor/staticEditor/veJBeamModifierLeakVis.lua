---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « JBeam Modifier Leaking Visualizer » du Static Editor. En JBeam, un modificateur (par exemple beamSpring, nodeWeight, frictionCoef) posé dans une ligne reste actif pour les lignes suivantes, même dans les parties suivantes d'un véhicule (il « fuit »). Cet outil analyse les parties du véhicule chargé dans l'ordre de chargement, avec leurs données AST, calcule quels modificateurs fuient d'une partie à l'autre dans chaque section, et les affiche dans un tableau (sections en boutons, parties en lignes, modificateurs en colonnes). Les sections qui fuient sont colorées en rouge. Une case « Ignore Default Values » (EXPERIMENTAL) ignore les valeurs égales aux valeurs par défaut du moteur (table modifiersDefaultValues codée en dur).
--- Accès : extension `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`
---@class editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis
---@field menuEntry string Texte de l'entrée du menu Apps : « JBeam Modifier Leaking Visualizer ».
editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis = {}

--- Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1091
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data) end

--- Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1085
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize() end

--- Hook d'extension appelé à chaque frame : dessine le bouton « Start Analysis », la case des valeurs par défaut, les boutons de section et le tableau des modificateurs quand la fenêtre est ouverte et qu'un véhicule est chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:904
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onUpdate() end

--- Ouvre la fenêtre de l'application (windowOpen[0] = true).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1081
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « JBeam Table Visualizer » du Static Editor de l'éditeur de véhicule. Elle charge un fichier .jbeam choisi via un sélecteur de fichier, cherche récursivement les tables de nombres qui peuvent être tracées en courbe (par exemple les courbes de couple ou de torque d'un moteur), et les affiche avec plotHelperUtil (courbe de Catmull-Rom, mise à l'échelle auto). Un bouton Refresh relit le fichier sur le disque.
--- Accès : extension `editor_vehicleEditor_staticEditor_veJBeamTableVis` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamTableVis")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamTableVis`
---@class editor_vehicleEditor_staticEditor_veJBeamTableVis
---@field menuEntry string Texte de l'entrée du menu Apps : « JBeam Table Visualizer ».
editor_vehicleEditor_staticEditor_veJBeamTableVis = {}

--- Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:190
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data) end

--- Hook appelé avant un rechargement Lua : sauvegarde l'état ouvert/fermé de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:184
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize() end

--- Hook d'extension appelé à chaque frame : si la fenêtre est ouverte et qu'un véhicule est chargé dans l'éditeur, dessine le bouton d'ouverture de fichier, la liste des données traçables, le bouton Refresh et le graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:136
---@param dt number delta de temps (s), transmis au tracé
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt) end

--- Ouvre la fenêtre de l'application (windowOpen[0] = true). Appelée par le menu Apps du Static Editor.
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:180
function editor_vehicleEditor_staticEditor_veJBeamTableVis.open() end


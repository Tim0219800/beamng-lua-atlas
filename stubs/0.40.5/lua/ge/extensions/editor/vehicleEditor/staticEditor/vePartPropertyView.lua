---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Part Properties » du Static Editor. Elle affiche dans un inspecteur générique les propriétés scalaires (hors tables) de la table sélectionnée dans l'éditeur (vEditor.propertyTableEditTarget), et écrit directement les modifications dans cette table. Les nombres sont éditables en float, les booléens en case à cocher, le reste en chaîne.
--- Accès : extension `editor_vehicleEditor_staticEditor_vePartPropertyView` : `extensions.load("editor_vehicleEditor_staticEditor_vePartPropertyView")`, puis la globale `editor_vehicleEditor_staticEditor_vePartPropertyView`
---@class editor_vehicleEditor_staticEditor_vePartPropertyView
---@field menuEntry string Texte de l'entrée du menu Apps : « Part Properties ».
editor_vehicleEditor_staticEditor_vePartPropertyView = {}

--- Hook de l'éditeur appelé à chaque frame : reconstruit la liste de champs quand la cible d'édition change, puis dessine l'inspecteur générique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:39
function editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor) et crée l'inspecteur générique avec son setter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:55
function editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorInitialized() end

--- Affiche la fenêtre « Part Properties » (editor.showWindow).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:51
function editor_vehicleEditor_staticEditor_vePartPropertyView.open() end


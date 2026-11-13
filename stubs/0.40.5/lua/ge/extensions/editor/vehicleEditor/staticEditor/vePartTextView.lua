---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Part Text View » du Static Editor. Elle affiche le fichier JBeam de la partie sélectionnée comme une suite de nœuds d'arbre syntaxique (AST, bibliothèque json-ast) colorés (chaînes, commentaires, listes, objets), avec numéros de ligne et défilement automatique vers les nœuds sélectionnés ailleurs dans l'éditeur. Un double-clic sur un nœud chaîne, nombre ou booléen l'édite (fenêtre modale « Edit Node »). Le menu propose Reload, Save, Close et Delete.
--- Accès : extension `editor_vehicleEditor_staticEditor_vePartTextView` : `extensions.load("editor_vehicleEditor_staticEditor_vePartTextView")`, puis la globale `editor_vehicleEditor_staticEditor_vePartTextView`
---@class editor_vehicleEditor_staticEditor_vePartTextView
---@field menuEntry string Texte de l'entrée du menu Apps : « Part Text View ».
editor_vehicleEditor_staticEditor_vePartTextView = {}

--- Hook de l'éditeur appelé à chaque frame : charge la partie sélectionnée, dessine la barre de menu, les infos du fichier (dates de création et de modification), le tableau de nœuds AST et la fenêtre modale d'édition. Sans effet sans véhicule ni partie sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:175
function editor_vehicleEditor_staticEditor_vePartTextView.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor) et la fenêtre modale « editASTNode ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:327
function editor_vehicleEditor_staticEditor_vePartTextView.onEditorInitialized() end

--- Affiche la fenêtre « Part Text View » (editor.showWindow).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:323
function editor_vehicleEditor_staticEditor_vePartTextView.open() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Part Tree » du Static Editor. Elle lit le fichier JBeam de la partie sélectionnée, le parse en AST (json-ast, avec les données Lua dans ast.transient.luaData / luaDataRaw) et l'affiche en arbre (clé, valeur, éléments). Pour chaque table, on peut la sélectionner (met en surbrillance les nœuds AST correspondants dans Part Text View), la masquer, ou l'envoyer dans Part Properties. Elle dessine aussi les nodes et beams de la partie dans la vue de rendu statique (debugDrawer) et permet de les picker à la souris (Maj pour multi-sélection) ; les nœuds référencés mais définis dans d'autres parties sont retrouvés et dessinés en bleu transparent (« virtuels »). Un bouton « Spawn » ré-instancie le véhicule avec la partie sélectionnée comme partie principale.
--- Accès : extension `editor_vehicleEditor_staticEditor_vePartTree` : `extensions.load("editor_vehicleEditor_staticEditor_vePartTree")`, puis la globale `editor_vehicleEditor_staticEditor_vePartTree`
---@class editor_vehicleEditor_staticEditor_vePartTree
---@field menuEntry string Texte de l'entrée du menu Apps : « Part Tree ».
editor_vehicleEditor_staticEditor_vePartTree = {}

--- Hook de l'éditeur appelé à chaque frame : charge l'AST de la partie sélectionnée, dessine l'arbre et appelle le rendu/picking des nodes et beams dans la vue statique. Sans effet sans véhicule, vehData ou partie sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:560
function editor_vehicleEditor_staticEditor_vePartTree.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation : enregistre la fenêtre (500x400, outil vehicleEditor).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:662
function editor_vehicleEditor_staticEditor_vePartTree.onEditorInitialized() end

--- Hook d'extension appelé quand un fichier surveillé change sur le disque. Si c'est le fichier JBeam actuellement chargé, invalide l'AST (ast = nil, vEditor.ast = nil) pour le relire au prochain frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:666
---@param filename string chemin du fichier modifié
---@param type string type de changement (non utilisé)
function editor_vehicleEditor_staticEditor_vePartTree.onFileChanged(filename, type) end

--- Affiche la fenêtre « Part Tree » (editor.showWindow).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:658
function editor_vehicleEditor_staticEditor_vePartTree.open() end


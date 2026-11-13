---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « JBeam Beautifier » du Static Editor. Elle reformate des fichiers .jbeam (un fichier ou un dossier entier) en alignant en colonnes les tableaux des sections choisies (beams, nodes, quads, slots, slots2, triangles), avec option d'alignement de la ligne d'en-tête et d'arrondi des nombres (0 à 5 décimales). Elle travaille sur l'AST du fichier (json-ast) et ne modifie que les espaces et, si demandé, l'arrondi.
--- Accès : extension `editor_vehicleEditor_staticEditor_veJBeamBeautifier` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamBeautifier")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamBeautifier`
---@class editor_vehicleEditor_staticEditor_veJBeamBeautifier
---@field menuEntry string Texte de l'entrée du menu Apps : « JBeam Beautifier ».
editor_vehicleEditor_staticEditor_veJBeamBeautifier = {}

--- Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:432
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data) end

--- Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:426
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize() end

--- Hook d'extension appelé à chaque frame : dessine la fenêtre (sections à traiter, réglages, sélection de dossier/fichier, bouton de lancement) quand elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:361
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onUpdate() end

--- Ouvre la fenêtre de l'application (windowOpen[0] = true).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:422
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.open() end


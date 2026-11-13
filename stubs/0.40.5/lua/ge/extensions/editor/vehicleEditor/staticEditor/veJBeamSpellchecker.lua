---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « JBeam Spellchecker » du Static Editor. Le bouton « Start Analysis » parcourt tous les fichiers *.jbeam du dossier vehicles et vérifie que les modificateurs (options en ligne ou lignes d'options en dictionnaire) utilisés dans les sections flexbodies, props, nodes, beams, triangles, hydros, torsionbars, torsionHydros et variables font partie d'une liste blanche codée en dur dans le fichier. Tout modificateur inconnu est signalé par un log d'erreur « Section: X Modifier: 'Y' not valid! » avec le chemin du fichier.
--- Accès : extension `editor_vehicleEditor_staticEditor_veJBeamSpellchecker` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamSpellchecker")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`
---@class editor_vehicleEditor_staticEditor_veJBeamSpellchecker
---@field menuEntry string Texte de l'entrée du menu Apps : « JBeam Spellchecker ».
editor_vehicleEditor_staticEditor_veJBeamSpellchecker = {}

--- Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:473
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data) end

--- Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:467
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize() end

--- Hook d'extension appelé à chaque frame : dessine la fenêtre avec le bouton « Start Analysis » quand elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:450
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onUpdate() end

--- Ouvre la fenêtre de l'application (windowOpen[0] = true).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:463
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open() end


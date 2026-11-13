---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « JBeam Variables Checker » du Static Editor. Le bouton « Start Analysis » parcourt tous les dossiers de véhicules, lit leurs fichiers .pc (configurations) et .jbeam, et vérifie que les valeurs des variables (par défaut dans le JBeam et valeurs imposées par les .pc) respectent les bornes min/max de la variable. Les valeurs hors limites sont signalées dans la console avec un avertissement (log W) indiquant où la variable et la valeur sont définies.
--- Accès : extension `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker` : `extensions.load("editor_vehicleEditor_staticEditor_veJBeamVariablesChecker")`, puis la globale `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`
---@class editor_vehicleEditor_staticEditor_veJBeamVariablesChecker
---@field menuEntry string Texte de l'entrée du menu Apps : « JBeam Variables Checker ».
editor_vehicleEditor_staticEditor_veJBeamVariablesChecker = {}

--- Hook appelé après un rechargement Lua : restaure l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:127
---@param data table table produite par onSerialize
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data) end

--- Hook appelé avant un rechargement Lua : sauvegarde l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:121
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize() end

--- Hook d'extension appelé à chaque frame : dessine la fenêtre avec le bouton « Start Analysis » quand elle est ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:102
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onUpdate() end

--- Ouvre la fenêtre de l'application (windowOpen[0] = true).
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:117
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open() end


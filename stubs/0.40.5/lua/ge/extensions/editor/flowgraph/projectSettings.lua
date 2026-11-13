---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/projectSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'projectSettings', windowDescription 'Project Settings').
---@class editor_flowgraph_projectSettings_C
local editor_flowgraph_projectSettings_C = {}

--- Hook de désérialisation de la fenêtre : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/projectSettings.lua:123
---@param data table Données restaurées (ignorées).
function editor_flowgraph_projectSettings_C:_onDeserialized(data) end

--- Hook de sérialisation de la fenêtre : vide, rien n'est sauvegardé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/projectSettings.lua:119
---@param data table Table de sauvegarde (inchangée).
function editor_flowgraph_projectSettings_C:_onSerialize(data) end

--- Mémorise le manager et prépare les champs ImGui (nom 64 car., auteurs 128 car., pointeur de difficulté) à partir de mgr.name, mgr.authors et mgr.difficulty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/projectSettings.lua:14
---@param mgr table Manager flowgraph courant.
function editor_flowgraph_projectSettings_C:attach(mgr) end

--- Dessine les champs du projet et les boutons Save / Save as.... Save appelle fgEditor.save(), Save as ouvre le dialogue de fichier puis fgEditor.saveAsFile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/projectSettings.lua:25
function editor_flowgraph_projectSettings_C:draw() end

--- Enregistre la fenêtre dans l'éditeur (150x300, masquée par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/projectSettings.lua:21
function editor_flowgraph_projectSettings_C:init() end


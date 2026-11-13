---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/layers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau Layers. Champs : missionEditor, mission, inputs (tampons de texte imgui par layer).
---@class editor_missionEditor_layers
local editor_missionEditor_layers = {}

--- Recrée les tampons de texte imgui (im.ArrayChar de 1024) à partir de layer.dir pour chaque layer.
---Source : lua/ge/extensions/editor/missionEditor/layers.lua:19
function editor_missionEditor_layers:createInputFields() end

--- Dessine la liste des layers avec boutons haut/bas, champ de chemin, dossier, sélecteur, suppression et ajout. Applique les déplacements à la fin de la frame et met mission._dirty à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/layers.lua:29
function editor_missionEditor_layers:draw() end

--- Constructeur : mémorise missionEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/layers.lua:10
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_layers:init(missionEditor) end

--- Définit la mission courante et recrée les champs de saisie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/layers.lua:14
---@param mission table Mission dont mission.layers est édité.
function editor_missionEditor_layers:setMission(mission) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/prefabs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau. Champs : missionEditor, mission, filenames (tampons imgui), prefabsRequireCollisionReload.
---@class editor_missionEditor_prefabs
local editor_missionEditor_prefabs = {}

--- Dessine la liste des prefabs (suppression, chemin, sélecteur, état, spawn), le bouton « Add » et la case « Requires collision reload ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/prefabs.lua:22
function editor_missionEditor_prefabs:draw() end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/prefabs.lua:7
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_prefabs:init(missionEditor) end

--- Définit la mission et recrée les tampons de texte depuis mission.prefabs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/prefabs.lua:13
---@param mission table Mission courante.
function editor_missionEditor_prefabs:setMission(mission) end


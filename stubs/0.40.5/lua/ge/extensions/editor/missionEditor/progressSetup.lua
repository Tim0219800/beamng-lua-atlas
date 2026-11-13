---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet. Champs : missionEditor, mission, progressSetup, rawEditPerMission.
---@class editor_missionEditor_progressSetup
local editor_missionEditor_progressSetup = {}

--- Dessine l'en-tête avec la case Raw puis la vue de progression ou l'éditeur JSON brut (Edit / Finish Editing / Cancel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSetup.lua:45
function editor_missionEditor_progressSetup:draw() end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSetup.lua:24
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_progressSetup:init(missionEditor) end

--- Définit la mission courante et charge progressSetup pour son type.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSetup.lua:33
---@param mission table Mission courante.
function editor_missionEditor_progressSetup:setMission(mission) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/issues.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau Issues. Champs : missionEditor, mission, issues = {list = {...}}.
---@class editor_missionEditor_issues
local editor_missionEditor_issues = {}

--- Recalcule tous les problèmes : pour chaque mission, appelle setMission sur missionTypeWindow puis getMissionIssues(mission) sur chaque fenêtre qui le définit. Remplit issue.label, severity, idx, missionId, missionType, level, availability, et pour la mission _issueList (importantCount, highestSeverity, icon, color).
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:188
---@param missionList table[] Liste des missions.
---@param windows table[] Panneaux de l'éditeur pouvant avoir getMissionIssues.
---@param missionTypeWindow table Panneau genericTypeData, dont setMission est appelé pour chaque mission.
function editor_missionEditor_issues:calculateMissionIssues(missionList, windows, missionTypeWindow) end

--- Affiche, pour la mission courante, la liste à puces des labels de problèmes (ou « No Issues! »). Ne fait rien si mission._issueList n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:22
function editor_missionEditor_issues:draw() end

--- Dessine la fenêtre « mission_issues » : menu d'actions de masse et tableau à 7 colonnes (#, Type, Mission, MissionType, Level, Availability, Label). Cliquer sur une mission l'ouvre dans l'éditeur (setMissionById). Respecte la préférence missionEditor.general.shortIds.
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:107
function editor_missionEditor_issues:drawIssuesWindow() end

--- Constructeur : mémorise missionEditor et initialise issues.list.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:13
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_issues:init(missionEditor) end

--- Définit la mission courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:18
---@param mission table Mission affichée.
function editor_missionEditor_issues:setMission(mission) end

--- Affiche la fenêtre d'éditeur « mission_issues ».
---Source : lua/ge/extensions/editor/missionEditor/issues.lua:182
function editor_missionEditor_issues:showIssuesWindow() end


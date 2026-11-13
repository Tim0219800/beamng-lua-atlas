---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/startTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau. Champs : missionEditor, name = 'StartTrigger', mission, fields, sortedLevels (niveaux triés).
---@class editor_missionEditor_startTrigger
local editor_missionEditor_startTrigger = {}

--- Dessine le combo de type de déclencheur puis l'éditeur du type choisi (niveau, position, rayon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/startTrigger.lua:158
function editor_missionEditor_startTrigger:draw() end

--- Renvoie l'assistant de transformation si le niveau courant est celui du déclencheur.
---Source : lua/ge/extensions/editor/missionEditor/startTrigger.lua:203
---@return table|nil  Assistant transformUtil (pos, rot, scl), ou nil dans un autre niveau.
function editor_missionEditor_startTrigger:getStartTriggerTransform() end

--- Constructeur : liste et trie les niveaux (getAllLevelIdentifiers).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/startTrigger.lua:136
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_startTrigger:init(missionEditor) end

--- Définit la mission, réinitialise les champs, arrête le gizmo et le repositionne si le déclencheur est de type coordinates.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/startTrigger.lua:147
---@param mission table Mission courante.
function editor_missionEditor_startTrigger:setMission(mission) end


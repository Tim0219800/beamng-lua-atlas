---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressMulti.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet. Champs : missionEditor, tabName = 'Progress Multi', mission, missionInstance, formattedSaveData, currentProgressKey.
---@class editor_missionEditor_progressMulti
local editor_missionEditor_progressMulti = {}

--- Affiche le combo de clé de progression et le tableau d'agrégats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressMulti.lua:46
function editor_missionEditor_progressMulti:draw() end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressMulti.lua:25
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_progressMulti:init(missionEditor) end

--- Définit la mission courante, recharge les données de progression formatées et choisit la clé de progression (currentProgressKey, defaultProgressKey ou 'default').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressMulti.lua:34
---@param mission table Mission courante.
function editor_missionEditor_progressMulti:setMission(mission) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/progressSingle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet. Champs : missionEditor, tabName = 'Progress Single', mission, missionInstance, formattedSaveData, currentProgressKey.
---@class editor_missionEditor_progressSingle
local editor_missionEditor_progressSingle = {}

--- Dessine l'en-tête (case Raw, bouton Reload) puis drawProgress ou l'éditeur JSON brut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSingle.lua:105
function editor_missionEditor_progressSingle:draw() end

--- Affiche le nombre d'étoiles débloquées, la clé de progression par défaut, un combo de clés et le tableau des tentatives (ou un dump brut si aucune tentative n'est disponible).
---Source : lua/ge/extensions/editor/missionEditor/progressSingle.lua:46
function editor_missionEditor_progressSingle:drawProgress() end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSingle.lua:25
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_progressSingle:init(missionEditor) end

--- Définit la mission courante, son instance et les données de progression formatées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/progressSingle.lua:34
---@param mission table Mission courante.
function editor_missionEditor_progressSingle:setMission(mission) end


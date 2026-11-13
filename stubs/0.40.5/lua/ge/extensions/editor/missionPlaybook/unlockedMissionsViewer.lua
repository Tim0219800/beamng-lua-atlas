---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Playbook Unlocked Missions Viewer » associée à editor_missionPlaybook. Après chaque étape du playbook, elle classe les missions de carrière en trois listes (startable, visible, invisible) d'après gameplay_missions_unlocks.isMissionStartable / isMissionVisible et les range dans resultData.unlockedMissions. La fenêtre affiche trois colonnes pour la page courante et met en vert les missions devenues démarrables à cette étape (unlockChange.byId).
--- Accès : extension `editor_missionPlaybook_unlockedMissionsViewer` : `extensions.load("editor_missionPlaybook_unlockedMissionsViewer")`, puis la globale `editor_missionPlaybook_unlockedMissionsViewer`
---@class editor_missionPlaybook_unlockedMissionsViewer
---@field onEditorRegisterPreferences any
editor_missionPlaybook_unlockedMissionsViewer = {}

--- Hook d'éditeur appelé à chaque frame : dessine les trois colonnes de missions pour book.results[book.page].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:13
function editor_missionPlaybook_unlockedMissionsViewer.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu « Missions ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:54
function editor_missionPlaybook_unlockedMissionsViewer.onEditorInitialized() end

--- Hook émis après chaque instruction du playbook : ajoute resultData.unlockedMissions = {startable, visible, invisible} (listes d'ids).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:59
---@param resultData table Résultat de l'étape, modifié sur place.
function editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData) end

--- Affiche les fenêtres « Mission Playbook » et « Playbook Unlocked Missions Viewer ».
---Source : lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua:49
function editor_missionPlaybook_unlockedMissionsViewer.show() end


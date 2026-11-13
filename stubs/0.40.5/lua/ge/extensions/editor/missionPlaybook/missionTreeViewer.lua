---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Playbook Mission Tree Viewer » associée à editor_missionPlaybook. Elle dessine, avec l'éditeur de nœuds du flowgraph (ui_flowgraph_editor), l'arbre de déblocage des missions de carrière : un nœud par mission (showInCareer), placé selon la profondeur forwardInfo.depth, relié aux missions qu'elle débloque (forwardIds). La couleur indique l'état (vert démarrable, jaune visible, rouge sinon) et des icônes d'étoiles montrent les étoiles débloquées à l'étape courante du playbook (étoile pleine, vide, ou « stars » pour débloquée à cette étape).
--- Accès : extension `editor_missionPlaybook_missionTreeViewer` : `extensions.load("editor_missionPlaybook_missionTreeViewer")`, puis la globale `editor_missionPlaybook_missionTreeViewer`
---@class editor_missionPlaybook_missionTreeViewer
---@field nodes table[] Nœuds générés : {id, name, missionId, pos}.
---@field nodesByMId table<string, table> Nœuds indexés par id de mission.
---@field onEditorRegisterPreferences any
editor_missionPlaybook_missionTreeViewer = {}

--- Hook d'éditeur appelé à chaque frame : crée (une fois) un contexte d'éditeur de nœuds dédié, dessine les nœuds et les liens puis restaure le contexte précédent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:183
function editor_missionPlaybook_missionTreeViewer.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu « Missions ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:229
function editor_missionPlaybook_missionTreeViewer.onEditorInitialized() end

--- Hook émis après chaque instruction du playbook : ajoute à resultData les étoiles débloquées par mission (unlockedStars) et celles débloquées à cette étape (unlockedThisStep).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:234
---@param resultData table Résultat de l'étape, modifié sur place.
function editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData) end

--- Affiche les fenêtres « Mission Playbook » et « Playbook Mission Tree Viewer ».
---Source : lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua:224
function editor_missionPlaybook_missionTreeViewer.show() end


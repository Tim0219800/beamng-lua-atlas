---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Playbook Attribute Viewer » associée à editor_missionPlaybook. À chaque étape du playbook, elle enregistre les attributs du joueur (career_modules_playerAttributes.getAllAttributes : valeur, niveau de branche, progression vers le niveau suivant) dans resultData.attributes. La fenêtre affiche pour la page courante un tableau Key / Value / Tier / Change (vert pour une hausse, rouge pour une baisse) et une courbe de l'évolution des attributs (hors « money ») via plotHelperUtil.
--- Accès : extension `editor_missionPlaybook_attributeViewer` : `extensions.load("editor_missionPlaybook_attributeViewer")`, puis la globale `editor_missionPlaybook_attributeViewer`
---@class editor_missionPlaybook_attributeViewer
---@field onEditorRegisterPreferences any
editor_missionPlaybook_attributeViewer = {}

--- Hook d'éditeur appelé à chaque frame : dessine le tableau et le graphique des attributs pour book.results[book.page].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:17
---@param dt number Durée de la frame en secondes (passée au tracé).
function editor_missionPlaybook_attributeViewer.onEditorGui(dt) end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500), l'entrée de menu « Missions » et crée l'utilitaire de tracé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:97
function editor_missionPlaybook_attributeViewer.onEditorInitialized() end

--- Hook émis par editor_missionPlaybook après chaque instruction : ajoute resultData.attributes = {clé = {value, level, curLvlProgress, neededForNext}}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:103
---@param resultData table Résultat de l'étape, modifié sur place.
function editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData) end

--- Affiche les fenêtres « Mission Playbook » et « Playbook Attribute Viewer ».
---Source : lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua:87
function editor_missionPlaybook_attributeViewer.show() end


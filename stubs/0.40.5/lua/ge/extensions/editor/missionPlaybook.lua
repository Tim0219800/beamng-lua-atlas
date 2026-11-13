---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'éditeur « Mission Playbook » (menu Missions). Un playbook est une liste d'instructions (book.instructions) rejouées sur un slot de carrière pour tester le déblocage des missions : chaque instruction missionAttempt donne une mission et les étoiles obtenues, et est exécutée via gameplay_missions_progress.generateAttempt. Après chaque étape, le hook onPlaybookLogAfterStep est émis pour que les visionneuses (attributs, missions débloquées, arbre) enregistrent leur état dans book.results. La fenêtre permet de sauver/charger un playbook (.missionPlaybook.json, dossier missionPlaybooks/), de rejouer sur le slot courant ou un slot vide (playbookTestingSlot) et de générer automatiquement des playbooks (toutes missions, par tier, par branche, étoiles par défaut ou bonus).
--- Accès : extension `editor_missionPlaybook` : `extensions.load("editor_missionPlaybook")`, puis la globale `editor_missionPlaybook`
---@class editor_missionPlaybook
---@field book table Livre courant : {page = integer, instructions = table[], results = table[]}. Sérialisé par onSerialize.
---@field dependencies string[] Extensions chargées avant : gameplay_missions_missions et les trois visionneuses du playbook.
editor_missionPlaybook = {}

--- Dessine le curseur de page (1 à #book.results) et la case « Condensed ». Appelée par onEditorGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:430
function editor_missionPlaybook.drawBookViewer() end

--- Restaure book et condensed après un rechargement des extensions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:454
---@param data table|nil Données renvoyées par onSerialize.
function editor_missionPlaybook.onDeserialized(data) end

--- Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Mission Playbook » (menus File, Util, Run, Generate, liste des instructions avec boutons Up/Down/Remove hors mode condensé, bouton « Add... »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:251
function editor_missionPlaybook.onEditorGui() end

--- Hook appelé quand l'éditeur est initialisé : enregistre la fenêtre (1500x700) et l'entrée de menu « Missions ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:408
function editor_missionPlaybook.onEditorInitialized() end

--- Hook d'enregistrement des préférences d'éditeur ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:415
---@param prefsRegistry table Registre de préférences.
function editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry) end

--- Appelé lors du rechargement des extensions Lua : renvoie {book, condensed} pour sauvegarder l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionPlaybook.lua:446
---@return table  Données à conserver.
function editor_missionPlaybook.onSerialize() end

--- Affiche la fenêtre « Mission Playbook ».
---Source : lua/ge/extensions/editor/missionPlaybook.lua:403
function editor_missionPlaybook.show() end


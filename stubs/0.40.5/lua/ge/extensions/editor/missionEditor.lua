---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Mission Editor » du world editor pour créer et modifier les missions du jeu (info.json de chaque dossier de mission). Elle liste les missions avec filtres (niveau courant, procédurales, carrière, freeroam), recherche et regroupement (niveau, type, date, branche), et propose le menu File (nouvelle mission, sauvegarde, suppression). Elle instancie les sous-fenêtres du dossier missionEditor/ (general, conditions, careerSetup, additionalAttributes, startTrigger, layers, setupModules, genericTypeData, objectives, progressSingle, progressMulti, playbookUtils, issues, previewChecker) et délègue l'édition de chaque section. Dépend de gameplay_missions_missions.
--- Accès : extension `editor_missionEditor` : `extensions.load("editor_missionEditor")`, puis la globale `editor_missionEditor`
---@class editor_missionEditor
---@field dependencies string[] {'gameplay_missions_missions'} : extension chargée avant celle-ci.
editor_missionEditor = {}

--- Simule un clic sur une mission : elle sera sélectionnée à la prochaine image.
---Source : lua/ge/extensions/editor/missionEditor.lua:1730
---@param m table Données de mission (élément de getMissionList).
function editor_missionEditor.clickMission(m) end

--- Renvoie l'assistant d'édition du type de mission courant, uniquement si la fenêtre est visible et qu'une mission est chargée ; sinon nil.
---Source : lua/ge/extensions/editor/missionEditor.lua:1752
---@return table|nil  Résultat de missionTypeWindow:getCurrentEditorHelper().
function editor_missionEditor.getCurrentEditorHelperWhenActive() end

--- Renvoie la liste des données de missions chargée par l'éditeur (gameplay_missions_missions.getFilesData), ou nil si elle n'a pas encore été chargée.
---Source : lua/ge/extensions/editor/missionEditor.lua:1729
---@return table[]|nil  Missions, chacune avec id, name, missionFolder, _dirty, etc.
function editor_missionEditor.getMissionList() end

--- Renvoie la sous-fenêtre des données propres au type de mission (genericTypeData).
---Source : lua/ge/extensions/editor/missionEditor.lua:1733
---@return table  Objet fenêtre, table vide avant le premier affichage.
function editor_missionEditor.getMissionTypeWindow() end

--- Renvoie la mission actuellement cliquée. Malgré le nom, c'est la table de la mission (clickedMission) et non son id.
---Source : lua/ge/extensions/editor/missionEditor.lua:1786
---@return table|nil  Données de la mission cliquée.
function editor_missionEditor.getSelectedMissionId() end

--- Renvoie la sous-fenêtre de l'éditeur de déclencheur de départ (startTrigger).
---Source : lua/ge/extensions/editor/missionEditor.lua:1732
---@return table|nil  Objet fenêtre, nil avant le premier affichage.
function editor_missionEditor.getStartTriggerWindow() end

--- Hook appelé pour chaque ligne de la console du jeu ; n'affiche que print(timer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1782
---@param timer number Horodatage du message.
---@param lvl string Niveau (non utilisé).
---@param origin string Origine (non utilisée).
---@param line string Texte (non utilisé).
function editor_missionEditor.onConsoleLog(timer, lvl, origin, line) end

--- Hook de désérialisation : réélit la dernière mission (setMissionById) et force l'ouverture de l'arbre et de l'onglet mémorisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1711
---@param data table|nil Données de onSerialize.
function editor_missionEditor.onDeserialized(data) end

--- Hook appelé à chaque image par le world editor : dessine la fenêtre Mission Editor (barre de menu, liste, onglets de la mission, fenêtre des problèmes) et traite les clics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1074
function editor_missionEditor.onEditorGui() end

--- Hook d'initialisation du world editor : enregistre les fenêtres mission_editor (1500x700) et mission_issues (700x700), l'entrée de menu « Mission Editor » (groupe Missions), charge le filtre et restaure showWindows depuis les préférences.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1673
function editor_missionEditor.onEditorInitialized() end

--- Hook : enregistre la catégorie de préférences missionEditor.general (groupFilter, showWindows, shortIds, alwaysShowScreenshots).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1689
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_missionEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook de sérialisation d'extension : mémorise l'id de la dernière mission affichée et le dernier onglet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor.lua:1703
---@return table  {lastSelectedMissionId, lastTabItemShown}.
function editor_missionEditor.onSerialize() end

--- Recharge tout le système de missions (gameplay_missions_missions.reloadCompleteMissionSystem), relit la liste, retrouve la mission précédemment affichée, remet à jour les sous-fenêtres et réapplique filtre, recherche et regroupement.
---Source : lua/ge/extensions/editor/missionEditor.lua:1758
function editor_missionEditor.reloadMissionSystem() end

--- Sélectionne la mission d'id donné et ouvre l'arbre. Charge la liste si nécessaire. Avec instant, les sous-fenêtres sont aussitôt mises à jour (setMission). Ne fait rien si l'id n'existe pas.
---Source : lua/ge/extensions/editor/missionEditor.lua:1734
---@param id string Identifiant de la mission.
---@param instant boolean|nil true pour appliquer immédiatement aux sous-fenêtres.
function editor_missionEditor.setMissionById(id, instant) end

--- Ouvre la fenêtre « mission_editor » (editor.showWindow) et recharge le filtre de regroupement enregistré.
---Source : lua/ge/extensions/editor/missionEditor.lua:1668
function editor_missionEditor.show() end


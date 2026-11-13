---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire partagé qui applique à un projet flowgraph les variables de la mission sélectionnée dans le Mission Editor (missionTypeData), et vérifie si un projet correspond à la mission. Utilisé par la fenêtre Task Manager et l'éditeur principal avant de lancer un projet.
--- Accès : extension `editor_flowgraph_missionVariableHelper` : `extensions.load("editor_flowgraph_missionVariableHelper")`, puis la globale `editor_flowgraph_missionVariableHelper`
---@class editor_flowgraph_missionVariableHelper
editor_flowgraph_missionVariableHelper = {}

--- Copie les variables de missionTypeData de la mission sélectionnée vers le projet, puis injecte l'ID du véhicule joueur dans les variables de nom connu. Journalise le type de correspondance (avertissement si le projet n'appartient pas à la mission, mais applique quand même).
---Source : lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:77
---@param mgr table Manager flowgraph cible.
---@param logTag string|nil Étiquette de log (défaut "missionVariableHelper").
---@return boolean  true si au moins une variable a été appliquée ou injectée ; false sinon (éditeur de missions absent, aucune mission, aucune variable).
function editor_flowgraph_missionVariableHelper.applyMissionVariablesToManager(mgr, logTag) end

--- Compare le chemin du fichier du projet (savedDir + savedFilename, .flow.json ajouté si absent) au chemin flowgraph de la mission (fgPath, ou celui de l'instance de mission), après normalisation (/, sans / initial, minuscules).
---Source : lua/ge/extensions/editor/flowgraph/missionVariableHelper.lua:17
---@param mgr table|nil Manager flowgraph.
---@param selectedMission table|nil Mission sélectionnée (id, fgPath, missionType).
---@return string  "exact", "missionTypeMain" (flowgraph principal gameplay/missiontypes/<type>/<type>.flow.json), "sameMissionType", "differentMissionType" ou "noMission".
---@return string  Chemin normalisé du projet.
---@return string  Chemin normalisé de la mission.
function editor_flowgraph_missionVariableHelper.checkMissionMatch(mgr, selectedMission) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-fenêtre de la section General, créée par le constructeur renvoyé par le module.
---@class editor_missionEditor_general
local editor_missionEditor_general = {}

--- Dessine les champs Name et Description et leurs icônes de traduction ; enregistre les modifications dans la mission à la fin de l'édition.
---Source : lua/ge/extensions/editor/missionEditor/general.lua:52
function editor_missionEditor_general:draw() end

--- Appelle setMission puis renvoie les problèmes : nom manquant (error), description manquante (error), nom sans traduction (warning), description sans traduction (warning).
---Source : lua/ge/extensions/editor/missionEditor/general.lua:22
---@param m table Données de mission.
---@return table[]  Éléments {label, severity}.
function editor_missionEditor_general:getMissionIssues(m) end

--- Constructeur : mémorise la référence au missionEditor et prépare les champs recommandés (attributs recommandés de gameplay_missions_missions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/general.lua:11
---@param missionEditor table Module editor_missionEditor.
function editor_missionEditor_general:init(missionEditor) end

--- Sélectionne la mission à éditer : crée les tampons du nom et de la description et efface les traductions en cache.
---Source : lua/ge/extensions/editor/missionEditor/general.lua:40
---@param mission table Données de mission.
function editor_missionEditor_general:setMission(mission) end


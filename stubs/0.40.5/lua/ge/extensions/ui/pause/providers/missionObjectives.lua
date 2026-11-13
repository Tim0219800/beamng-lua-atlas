---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/missionObjectives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour les objectifs de la mission en cours. Il se contente de renvoyer le résultat de gameplay_missions_missionScreen.getPauseMissionObjectivesData().
--- Accès : extension `ui_pause_providers_missionObjectives` : `extensions.load("ui_pause_providers_missionObjectives")`, puis la globale `ui_pause_providers_missionObjectives`
---@class ui_pause_providers_missionObjectives
---@field dependencies string[] {"gameplay_missions_missionScreen"}
ui_pause_providers_missionObjectives = {}

--- Renvoie les données d'objectifs de mission pour le menu pause (fournies par gameplay_missions_missionScreen). Le contexte est ignoré.
---Source : lua/ge/extensions/ui/pause/providers/missionObjectives.lua:11
---@param context table Contexte du menu pause (non utilisé).
---@return any  Données renvoyées par getPauseMissionObjectivesData.
function ui_pause_providers_missionObjectives.getData(context) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fine couche autour de gameplay/rally/voicepack pour les réglages utilisateur d'une mission de rallye : construit le réglage « pack de voix » d'une étape ou d'une boucle, et mémorise le choix de l'utilisateur dans la liste des packs récemment utilisés (MRU). Le choix est stocké dans les réglages utilisateur sous la clé `rallyVoicepackPick`. Toute la logique est déléguée à voicepack.lua.
--- Accès : extension `gameplay_rally_voicepackMissionSettings` : `extensions.load("gameplay_rally_voicepackMissionSettings")`, puis la globale `gameplay_rally_voicepackMissionSettings`
---@class gameplay_rally_voicepackMissionSettings
gameplay_rally_voicepackMissionSettings = {}

--- Construit le réglage utilisateur « pack de voix » pour une mission de type boucle (délègue à voicepack.buildLoopMissionUserSetting).
---Source : lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:19
---@param missionTypeData table Données du type de mission boucle.
---@return table  Définition du réglage utilisateur.
function gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData) end

--- Construit le réglage utilisateur « pack de voix » pour une étape (délègue à voicepack.buildMissionUserSetting).
---Source : lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:15
---@param missionDir string Dossier de la mission.
---@param missionId string Identifiant de la mission.
---@return table  Définition du réglage utilisateur (telle que renvoyée par voicepack).
function gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId) end

--- Ajoute le choix de pack (userSettings.rallyVoicepackPick) au MRU des missions boucle via voicepack.addLoopMissionSettingToMRU.
---Source : lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:29
---@param missionTypeData table Données du type de mission boucle.
---@param userSettings table|nil Réglages utilisateur.
function gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings) end

--- Lit le choix de pack dans userSettings.rallyVoicepackPick et l'ajoute au MRU de la mission. Ne fait rien si aucun choix n'est valide ou si le choix est de type 'preferences'.
---Source : lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:23
---@param userSettings table|nil Réglages utilisateur de la mission.
---@param missionDir string Dossier de la mission.
---@param missionId string Identifiant de la mission.
function gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId) end


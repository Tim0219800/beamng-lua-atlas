---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Thin layer around gameplay/rally/voicepack for the user settings of a rally mission: builds the "voice pack" setting of a stage or a loop, and stores the user's choice in the most recently used (MRU) pack list. The choice is stored in the user settings under the key `rallyVoicepackPick`. All logic is delegated to voicepack.lua.
--- Access: extension `gameplay_rally_voicepackMissionSettings`: `extensions.load("gameplay_rally_voicepackMissionSettings")`, then the global `gameplay_rally_voicepackMissionSettings`
---@class gameplay_rally_voicepackMissionSettings
gameplay_rally_voicepackMissionSettings = {}

--- Builds the "voice pack" user setting for a loop-type mission (delegates to voicepack.buildLoopMissionUserSetting).
---Source: lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:19
---@param missionTypeData table Loop mission type data.
---@return table  User setting definition.
function gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData) end

--- Builds the "voice pack" user setting for a stage (delegates to voicepack.buildMissionUserSetting).
---Source: lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:15
---@param missionDir string Mission folder.
---@param missionId string Mission identifier.
---@return table  User setting definition (as returned by voicepack).
function gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId) end

--- Adds the pack choice (userSettings.rallyVoicepackPick) to the loop missions' MRU via voicepack.addLoopMissionSettingToMRU.
---Source: lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:29
---@param missionTypeData table Loop mission type data.
---@param userSettings table|nil User settings.
function gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings) end

--- Reads the pack choice from userSettings.rallyVoicepackPick and adds it to the mission's MRU. Does nothing if no choice is valid or if the choice is of type 'preferences'.
---Source: lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua:23
---@param userSettings table|nil Mission user settings.
---@param missionDir string Mission folder.
---@param missionId string Mission identifier.
function gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId) end


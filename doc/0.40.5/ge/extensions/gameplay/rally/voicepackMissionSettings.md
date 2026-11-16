# `gameplay_rally_voicepackMissionSettings`

*File: `lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_voicepackMissionSettings`: `extensions.load("gameplay_rally_voicepackMissionSettings")`, then the global `gameplay_rally_voicepackMissionSettings`

Thin layer around gameplay/rally/voicepack for the user settings of a rally mission: builds the "voice pack" setting of a stage or a loop, and stores the user's choice in the most recently used (MRU) pack list. The choice is stored in the user settings under the key `rallyVoicepackPick`. All logic is delegated to voicepack.lua.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData)` | Builds the "voice pack" user setting for a loop-type mission (delegates to voicepack.buildLoopMissionUserSetting). | 19 |
| `gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId)` | Builds the "voice pack" user setting for a stage (delegates to voicepack.buildMissionUserSetting). | 15 |
| `gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings)` | Adds the pack choice (userSettings.rallyVoicepackPick) to the loop missions' MRU via voicepack.addLoopMissionSettingToMRU. | 29 |
| `gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId)` | Reads the pack choice from userSettings.rallyVoicepackPick and adds it to the mission's MRU. Does nothing if no choice is valid or if the choice is of type 'preferences'. | 23 |

### Parameter details

#### `gameplay_rally_voicepackMissionSettings.buildLoopSetting(missionTypeData)`

Builds the "voice pack" user setting for a loop-type mission (delegates to voicepack.buildLoopMissionUserSetting).

- `missionTypeData` (*table*) : Loop mission type data.
- **returns**: table User setting definition.

#### `gameplay_rally_voicepackMissionSettings.buildStageSetting(missionDir, missionId)`

Builds the "voice pack" user setting for a stage (delegates to voicepack.buildMissionUserSetting).

- `missionDir` (*string*) : Mission folder.
- `missionId` (*string*) : Mission identifier.
- **returns**: table User setting definition (as returned by voicepack).

#### `gameplay_rally_voicepackMissionSettings.rememberLoopPick(missionTypeData, userSettings)`

Adds the pack choice (userSettings.rallyVoicepackPick) to the loop missions' MRU via voicepack.addLoopMissionSettingToMRU.

- `missionTypeData` (*table*) : Loop mission type data.
- `userSettings` (*table|nil*) : User settings.

#### `gameplay_rally_voicepackMissionSettings.rememberStagePick(userSettings, missionDir, missionId)`

Reads the pack choice from userSettings.rallyVoicepackPick and adds it to the mission's MRU. Does nothing if no choice is valid or if the choice is of type 'preferences'.

- `userSettings` (*table|nil*) : Mission user settings.
- `missionDir` (*string*) : Mission folder.
- `missionId` (*string*) : Mission identifier.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/voicepackMissionSettings.lua`.*

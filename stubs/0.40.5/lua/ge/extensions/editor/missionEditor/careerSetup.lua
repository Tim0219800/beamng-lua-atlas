---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/careerSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career setup sub-window.
---@class editor_missionEditor_careerSetup
local editor_missionEditor_careerSetup = {}

--- Draws a small "..." dropdown of the possible attribute keys.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:71
---@return string|nil  Key chosen during this frame, otherwise nil.
function editor_missionEditor_careerSetup:attributeDropdown() end

--- Draw entry point: calls drawCareerSetup.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:240
function editor_missionEditor_careerSetup:draw() end

--- Draws the area for adding a reward (key field, + button, choice list) and the copy and paste buttons of the rewards list.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:119
---@param key string Key of the rewards list.
---@param rewards table Rewards list to complete.
function editor_missionEditor_careerSetup:drawAddReward(key, rewards) end

--- Draws the text field for a reward's attribute key with the choice list; updates re.attributeKey and marks the mission _dirty.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:91
---@param re table Reward entry (attributeKey, rewardAmount).
---@param idx integer Index of the reward (used to name the buffer).
---@param key string Key of the rewards list.
function editor_missionEditor_careerSetup:drawAttributeInput(re, idx, key) end

--- Draws the main table: Freeroam and Career checkboxes, Skill list and Entry Fee; each modification writes into mission.careerSetup and marks _dirty.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:197
function editor_missionEditor_careerSetup:drawCareerSetup() end

--- Draws the editing of the mission's registration fees (one line per fee with a "Rem" button to remove it).
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:168
function editor_missionEditor_careerSetup:drawEntryFee() end

--- Draws the integer field for the reward amount; writes re.rewardAmount and re._originalRewardAmount and marks the mission _dirty.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:108
---@param re table Reward entry.
---@param idx integer Index of the reward.
---@param key string Key of the rewards list.
function editor_missionEditor_careerSetup:drawRewardAmount(re, idx, key) end

--- Calls setMission then returns the list of issues (always empty).
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:44
---@param m table Mission data.
---@return table[]  Empty list.
function editor_missionEditor_careerSetup:getMissionIssues(m) end

--- Constructor: loads career_branches and builds the attribute lists (attributeOptions) and skill lists (skillOptions, sorted, with "(none)").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:20
---@param missionEditor table editor_missionEditor module.
function editor_missionEditor_careerSetup:init(missionEditor) end

--- Selects the mission: reads careerSetup (showInCareer, showInFreeroam), gets the star keys, clears the buffers and links the mission type's edit helper to the "mission" container.
---Source: lua/ge/extensions/editor/missionEditor/careerSetup.lua:50
---@param mission table Mission data.
function editor_missionEditor_careerSetup:setMission(mission) end


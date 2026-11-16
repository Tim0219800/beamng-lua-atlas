---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/objectives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the Objectives panel. Fields: missionEditor, mission, missionInstance (gameplay_missions_missions.getMissionById), careerSetup, attributeOptions, skillOptions, copiedStars (clipboard per mission type), starKeysSorted.
---@class editor_missionEditor_objectives
local editor_missionEditor_objectives = {}

--- Small "..." combo listing attributeOptions.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:171
---@return string|nil  Attribute key chosen this frame, otherwise nil.
function editor_missionEditor_objectives:attributeDropdown() end

--- Draws the "Career Setup" header (Raw checkbox, copy/paste of the configuration per mission type) then drawCareerSetup or the raw JSON editor of mission.careerSetup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:505
function editor_missionEditor_objectives:draw() end

--- Controls for adding a reward (text, combo, +) and copy/paste buttons for the rewards.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:219
---@param key string Star key.
---@param rewards table[]|nil Current rewards list.
---@return table[]|nil  New list if it changed, otherwise nil.
function editor_missionEditor_objectives:drawAddReward(key, rewards) end

--- Text field + combo for a reward's attributeKey; updates re.attributeKey.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:191
---@param re table Reward {attributeKey, rewardAmount}.
---@param idx integer Index of the reward.
---@param key string Star key.
function editor_missionEditor_objectives:drawAttributeInput(re, idx, key) end

--- Draws the whole configuration: list of stars with checkboxes, slot, type editor, rewards, ending texts, then summary (default stars, bonus, reward totals).
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:371
function editor_missionEditor_objectives:drawCareerSetup() end

--- Combo to choose which active star occupies the given default star slot. Not called in this file.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:148
---@param defaultIndex integer Slot number (1 to 3).
function editor_missionEditor_objectives:drawDefaultStar(defaultIndex) end

--- Edit row for a star's ending text (or "noStarUnlocked"), with status icons for the default translation and the current translation.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:328
---@param key string Star key or "noStarUnlocked".
function editor_missionEditor_objectives:drawOutroText(key) end

--- Integer field for rewardAmount; also remembers _originalRewardAmount.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:208
---@param re table Reward.
---@param idx integer Index of the reward.
---@param key string Star key.
function editor_missionEditor_objectives:drawRewardAmount(re, idx, key) end

--- Displays and edits a star's rewards list (deletion via "Rem" button, addition).
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:268
---@param key string Star key.
function editor_missionEditor_objectives:drawStarRewards(key) end

--- Calls setMission(m) then returns the mission's star, text and reward issues.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:46
---@param m table Mission to check.
---@return table[]  List of elements {label, severity}.
function editor_missionEditor_objectives:getMissionIssues(m) end

--- Returns the star's translated label (_tr), handling labels as a function, a string or a table {txt}.
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:133
---@param key string Star key.
---@return string  Translated label, or empty string.
function editor_missionEditor_objectives:getStarLabel(key) end

--- Constructor: loads career_branches and builds the attributeOptions and skillOptions lists (branches with isSkill).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:20
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_objectives:init(missionEditor) end

--- Sets the current mission, gets its game instance, the sorted star keys and the mission type's editor (setContainer(mission, 'mission')).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:113
---@param mission table Edited mission.
function editor_missionEditor_objectives:setMission(mission) end

--- Combo to place the star as "Bonus Star" or as "Default Star N".
---Source: lua/ge/extensions/editor/missionEditor/objectives.lua:300
---@param key string Star key.
function editor_missionEditor_objectives:starSlotSelector(key) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/additionalAttributes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Additional information sub-window.
---@class editor_missionEditor_additionalAttributes
local editor_missionEditor_additionalAttributes = {}

--- Draws the fields Author, Date (with "Now" button), As Scenario, DEV Mission, the additional attributes dropdowns, Group Id and Group Label.
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:74
function editor_missionEditor_additionalAttributes:draw() end

--- Calls setMission then returns this section's issues (difficulty, author, date, group label translation, DEV mission in release).
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:43
---@param m table Mission data.
---@return table[]  Elements {label, severity}.
function editor_missionEditor_additionalAttributes:getMissionIssues(m) end

--- Constructor: remembers missionEditor, names the section "AdditionalInfo" and loads the additional attributes and their sorted keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:14
---@param missionEditor table editor_missionEditor module.
function editor_missionEditor_additionalAttributes:init(missionEditor) end

--- Opens the "timeUpdaterForMissions" popup.
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:198
function editor_missionEditor_additionalAttributes:openTimeUpdater() end

--- Selects the mission: finds its instance (gameplay_missions_missions.getMissionById) and creates the buffers for Group Id, Group Label, author and date.
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:29
---@param mission table Mission data.
function editor_missionEditor_additionalAttributes:setMission(mission) end

--- Draws the bulk update popup: you choose an "After" date and a "Set To" date, the list of affected missions is displayed (a click removes one), and "Update Affected Missions" writes the new date into each mission, marking it _dirty. The popup's data is cleared when it closes.
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:213
function editor_missionEditor_additionalAttributes:timeUpdaterPopup() end

--- Computes, only once, the mission's readable date (format YYYY-MM-DD hh:mm:ss) and caches it.
---Source: lua/ge/extensions/editor/missionEditor/additionalAttributes.lua:39
function editor_missionEditor_additionalAttributes:updateDateHumanReadable() end


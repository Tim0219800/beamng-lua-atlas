---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recceSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Settings object returned by the constructor.
---@class gameplay_rally_recceSettings
local gameplay_rally_recceSettings = {}

--- Resets last_mission_ids, last_load_states and corner_call_style_name to the default values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:23
function gameplay_rally_recceSettings:_reset() end

--- List of the available corner call style names.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:90
---@return string[]  Style names
function gameplay_rally_recceSettings:cornerCallStyleNames() end

--- Name of the first style in the corner angles' pacenoteStyles, or the default value (nil) if there is no data.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:79
---@return string|nil  Style name
function gameplay_rally_recceSettings:defaultCornerCallStyleName() end

--- Returns the style table matching the current name in pacenoteStyles.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:128
---@return table|nil  Style, or nil if not found
function gameplay_rally_recceSettings:getCornerCallStyle() end

--- Name of the current corner call style.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:125
---@return string|nil  Style name
function gameplay_rally_recceSettings:getCornerCallStyleName() end

--- Last load state for a level.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:117
---@param level string Level name
---@return any  Stored state or nil
function gameplay_rally_recceSettings:getLastLoadState(level) end

--- Last mission id for a level.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:109
---@param level string Level name
---@return string|nil  Mission id
function gameplay_rally_recceSettings:getLastMissionId(level) end

--- Sets the file path (recce.json) and resets to the default values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:17
function gameplay_rally_recceSettings:init() end

--- Resets, loads the corner angles then reads recce.json and deserializes it.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:38
---@return boolean  false if the path is nil, the file absent or unreadable
function gameplay_rally_recceSettings:load() end

--- Loads the corner angle data via rallyUtil.loadCornerAnglesFile; corner_angles_data stays nil on failure.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:29
function gameplay_rally_recceSettings:loadCornerAngles() end

--- Applies the data read from the file; missing fields take their default value (style: first available style).
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:98
---@param data table|nil JSON content
function gameplay_rally_recceSettings:onDeserialized(data) end

--- Returns the table to save (last_mission_ids, last_load_states, corner_call_style_name).
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:69
---@return table  Serializable data
function gameplay_rally_recceSettings:onSerialize() end

--- Writes the serialized settings to recce.json (jsonWriteFile, pretty format).
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:64
function gameplay_rally_recceSettings:save() end

--- Sets the corner call style and saves.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:121
---@param style_name string Style name
function gameplay_rally_recceSettings:setCornerCallStyleName(style_name) end

--- Stores the last load state for a level and saves.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:113
---@param level string Level name
---@param state any State to store (inferred from code: free value)
function gameplay_rally_recceSettings:setLastLoadState(level, state) end

--- Stores the last mission id for a level and saves.
---Source: lua/ge/extensions/gameplay/rally/recceSettings.lua:105
---@param level string Level name
---@param id string Mission id
function gameplay_rally_recceSettings:setLastMissionId(level, id) end


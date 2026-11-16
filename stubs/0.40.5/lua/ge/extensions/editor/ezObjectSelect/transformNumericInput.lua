---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small keyboard numeric input buffer for the transform operations of Easy Object Select (as in Blender: typing "2.5" during a move). Reads digit keys (top row and numpad), decimal point/comma, minus (flips the sign) and backspace via ImGui, and maintains a string in a state {text, active}.
--- Access: extension `editor_ezObjectSelect_transformNumericInput`: `extensions.load("editor_ezObjectSelect_transformNumericInput")`, then the global `editor_ezObjectSelect_transformNumericInput`
---@class editor_ezObjectSelect_transformNumericInput
editor_ezObjectSelect_transformNumericInput = {}

--- Clears the text and deactivates the input.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:30
---@param state table State created by newState.
function editor_ezObjectSelect_transformNumericInput.clear(state) end

--- Creates an empty input state.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:26
---@return table  {text = "", active = false}.
function editor_ezObjectSelect_transformNumericInput.newState() end

--- Processes the keys pressed this frame: digits, a single decimal point (prefixed with a 0 if the text is empty or "-"), minus that toggles the sign, backspace.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:40
---@param state table Input state, modified in place.
---@param ignoreTopRowFour boolean|nil If true, ignores the top row key 4 for this frame (useful when it is used for something else).
---@return boolean  true if the text changed.
function editor_ezObjectSelect_transformNumericInput.update(state, ignoreTopRowFour) end

--- Converts the entered text to a number.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformNumericInput.lua:77
---@param state table Input state.
---@return number|nil  Value, or nil if inactive, empty, "-" or ".".
function editor_ezObjectSelect_transformNumericInput.value(state) end


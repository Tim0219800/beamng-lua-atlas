---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatPlayerMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_multiseatPlayerMarkers`: reads and writes the 'multiseatTags' setting that controls the display of player markers (tags) in local multiplayer. Three modes: 'always', 'smart' (default) and 'never'. Old boolean values are converted (true becomes 'smart', false becomes 'never').
--- Access: extension `core_multiseatPlayerMarkers`: `extensions.load("core_multiseatPlayerMarkers")`, then the global `core_multiseatPlayerMarkers`
---@class core_multiseatPlayerMarkers
core_multiseatPlayerMarkers = {}

--- Returns the current mode of the multiseatTags setting (default 'smart'), normalizing it and fixing the setting if needed.
---Source: lua/ge/extensions/core/multiseatPlayerMarkers.lua:19
---@return string  'always', 'smart' or 'never'.
function core_multiseatPlayerMarkers.getMode() end

--- Indicates whether markers are active, i.e. whether the normalized mode is not 'never'.
---Source: lua/ge/extensions/core/multiseatPlayerMarkers.lua:32
---@param mode string|boolean|nil Mode to test.
---@return boolean  true except for 'never'.
function core_multiseatPlayerMarkers.isEnabled(mode) end

--- Converts a setting value into a valid mode: true becomes 'smart', false becomes 'never', 'always'/'smart'/'never' stay, any other value becomes 'smart'.
---Source: lua/ge/extensions/core/multiseatPlayerMarkers.lua:13
---@param mode string|boolean|nil Value to normalize.
---@return string  'always', 'smart' or 'never'.
function core_multiseatPlayerMarkers.normalize(mode) end

--- Normalizes then saves the mode in the multiseatTags setting.
---Source: lua/ge/extensions/core/multiseatPlayerMarkers.lua:26
---@param mode string|boolean|nil Desired mode.
---@return string  The mode actually saved.
function core_multiseatPlayerMarkers.setMode(mode) end


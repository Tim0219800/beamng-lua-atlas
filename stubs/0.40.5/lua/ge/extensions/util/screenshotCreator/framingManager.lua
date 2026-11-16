---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/framingManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of the screenshot creator's framing modes. It collects the modes by broadcasting the onScreenshotCreatorCollectFramingModes hook (each mode is a table {id, label, order, resolve, ...}), keeps the chosen mode (default "procedural") and delegates the camera computation to mode.resolve(context). It serializes the chosen mode to survive extension reloads.
--- Access: extension `util_screenshotCreator_framingManager`: `extensions.load("util_screenshotCreator_framingManager")`, then the global `util_screenshotCreator_framingManager`
---@class util_screenshotCreator_framingManager
util_screenshotCreator_framingManager = {}

--- Restores the selected mode from a saved state (keys selectedModeId, framingModeId or old skipCustomCameras); falls back to "procedural" if invalid. Aliases: migrateLegacyState, onDeserialized.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil Saved state.
function util_screenshotCreator_framingManager.deserialize(data) end

--- Alias of getSelected.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Mode id.
function util_screenshotCreator_framingManager.get() end

--- Returns the id of the selected mode ("procedural" if the stored mode no longer exists). Aliases: get, getSelectedModeId.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Mode id.
function util_screenshotCreator_framingManager.getSelected() end

--- Alias of getSelected.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:54
---@return string  Mode id.
function util_screenshotCreator_framingManager.getSelectedModeId() end

--- Returns the sorted list of valid framing modes collected by the hook. Alias: listModes.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:50
---@return table[]  Modes {id, label, order, resolve, ...}.
function util_screenshotCreator_framingManager.list() end

--- Alias of list.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:50
---@return table[]  Framing modes.
function util_screenshotCreator_framingManager.listModes() end

--- Alias of deserialize (migration of old states).
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil Saved state.
function util_screenshotCreator_framingManager.migrateLegacyState(data) end

--- Hook called after reload with the serialized state; identical to deserialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:88
---@param data table|nil Saved state.
function util_screenshotCreator_framingManager.onDeserialized(data) end

--- Serialization hook before extension reload; identical to serialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:84
---@return table  {selectedModeId}.
function util_screenshotCreator_framingManager.onSerialize() end

--- Computes the framing camera with the given mode (or the selected mode). resolve(context) can be called with modeId omitted: if the first argument is a table and the second is nil, it is taken as the context.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:66
---@param modeId string|table|nil Mode id, or the context directly.
---@param context table Framing context passed to mode.resolve (vehicle, resolution, fov…).
---@return table|nil  Mode result (pos, rot, ...).
---@return string|nil  Error: unknown mode or context that is not a table.
function util_screenshotCreator_framingManager.resolve(modeId, context) end

--- Returns the state to save: {selectedModeId = ...}. Alias of onSerialize.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:84
---@return table  {selectedModeId = string}.
function util_screenshotCreator_framingManager.serialize() end

--- Alias of setSelected.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Mode id.
---@return boolean  Success.
---@return string|nil  Error.
function util_screenshotCreator_framingManager.set(modeId) end

--- Selects the framing mode by its id. Aliases: set, setSelectedModeId.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Id of a registered mode.
---@return boolean  true if the mode was selected.
---@return string|nil  "Unknown framing mode: …" on failure.
function util_screenshotCreator_framingManager.setSelected(modeId) end

--- Alias of setSelected.
---Source: lua/ge/extensions/util/screenshotCreator/framingManager.lua:58
---@param modeId string Mode id.
---@return boolean  Success.
---@return string|nil  Error.
function util_screenshotCreator_framingManager.setSelectedModeId(modeId) end


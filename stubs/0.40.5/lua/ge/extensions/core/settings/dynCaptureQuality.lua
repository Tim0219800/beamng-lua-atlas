---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/dynCaptureQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quality presets for dynamic vehicle captures: dynamic reflections (cubemap) and dynamic mirrors. Each function applies a level by writing the $pref::BeamNGVehicle::dynamicReflection::* or dynamicMirrors::* variables in VariableRegistry. The code comment says it restores the Normal/High/Ultra settings of 0.39.
--- Access: extension `core_settings_dynCaptureQuality`: `extensions.load("core_settings_dynCaptureQuality")`, then the global `core_settings_dynCaptureQuality`
---@class core_settings_dynCaptureQuality
---@field mirrorLevels table<string, table> Per level: enabled (boolean), textureSize (128 to 1024), detail (0 to 0.75), distance (50 to 300). No facesPerUpdate.
---@field reflectionLevels table<string, table> Per level: enabled (boolean), textureSize (128 to 1024), facesPerUpdate (1 or 2), detail (0 to 0.75), distance (50 to 300).
core_settings_dynCaptureQuality = {}

--- Applies a dynamic mirrors level: writes enabled, textureSize, detail and distance to $pref::BeamNGVehicle::dynamicMirrors::*.
---Source: lua/ge/extensions/core/settings/dynCaptureQuality.lua:36
---@param level string Key of mirrorLevels (Disabled, Lowest, Low, Normal, High, Ultra).
function core_settings_dynCaptureQuality.applyMirrors(level) end

--- Applies a dynamic reflections level: writes enabled, textureSize, facesPerUpdate, detail and distance to $pref::BeamNGVehicle::dynamicReflection::*.
---Source: lua/ge/extensions/core/settings/dynCaptureQuality.lua:26
---@param level string Key of reflectionLevels (Disabled, Lowest, Low, Normal, High, Ultra).
function core_settings_dynCaptureQuality.applyReflection(level) end


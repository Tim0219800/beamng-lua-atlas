---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/clusteredQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quality presets for "clustered" lighting (grouped local lights) and their shadows. Each level (Lowest, Low, Normal, High, Ultra) sets properties of the global engine object ClusterShading. Used by the graphics settings system (graphic.lua); a modder can call applyLevel directly.
--- Access: extension `core_settings_clusteredQuality`: `extensions.load("core_settings_clusteredQuality")`, then the global `core_settings_clusteredQuality`
---@class core_settings_clusteredQuality
---@field qualityLevels table<string, table> Presets by level name. Each entry contains minLightScreenSize (minimum screen size of a light, fraction), lightFlares (boolean), shadowMaxCasters (max number of lights casting a shadow), shadowFallbackFrames (number of frames), shadowOversample (oversampling factor), shadowBubble (factor). Levels: Lowest, Low, Normal, High, Ultra.
core_settings_clusteredQuality = {}

--- Copies the preset of the requested level into the ClusterShading properties (minLightScreenSize, lightFlares, shadowMaxCasters, shadowFallbackFrames, shadowOversample, shadowBubble).
---Source: lua/ge/extensions/core/settings/clusteredQuality.lua:50
---@param level string Level name: Lowest, Low, Normal, High or Ultra.
function core_settings_clusteredQuality.applyLevel(level) end


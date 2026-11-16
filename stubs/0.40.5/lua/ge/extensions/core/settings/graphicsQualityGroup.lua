---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/graphicsQualityGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quality group. Instance fields: currentQualityLevel (string, "" at start), qualityLevels (copy of group.qualityLevels), name (string, 'unnamed_quality_group' by default), onApply (module function, nop otherwise).
---@class core_settings_graphicsQualityGroup
local core_settings_graphicsQualityGroup = {}

--- For each key/value pair of the preset, reads VariableRegistry.get(key), compares by tostring, then VariableRegistry.set(key, value). If at least one value changed, calls self:onApply().
---Source: lua/ge/extensions/core/settings/graphicsQualityGroup.lua:36
---@param qualityLevel table Table VariableRegistry key -> value.
function core_settings_graphicsQualityGroup:apply(qualityLevel) end

--- Applies the named level (via apply) then stores it as the current level. Does nothing if levelString is nil.
---Source: lua/ge/extensions/core/settings/graphicsQualityGroup.lua:20
---@param levelString string|nil Level name, key of qualityLevels.
function core_settings_graphicsQualityGroup:applyLevel(levelString) end

--- Returns the preset table of the current level.
---Source: lua/ge/extensions/core/settings/graphicsQualityGroup.lua:28
---@param levelString any Ignored.
---@return table|nil  Current preset.
function core_settings_graphicsQualityGroup:getCurrentLevel(levelString) end

--- Returns the name of the current level.
---Source: lua/ge/extensions/core/settings/graphicsQualityGroup.lua:32
---@return string  Level name, "" if none applied.
function core_settings_graphicsQualityGroup:getCurrentLevelId() end

--- Constructor called by the factory: require(qualityLevelsFilename) then copies qualityLevels and gets onApply. Without a file name, the group is empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphicsQualityGroup.lua:7
---@param qualitiyLevelsFilename string|nil Name of the module to load (require path or extension name).
---@param groupName string|nil Group name.
function core_settings_graphicsQualityGroup:init(qualitiyLevelsFilename, groupName) end


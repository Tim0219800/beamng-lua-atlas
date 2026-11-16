---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/selectabilityPresets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages "selectability" presets of object types in the world editor: which object classes (TSStatic, Prefab, BeamNGVehicle...) can be clicked/selected. Presets: current, all, staticsAndProps (BeamNGVehicle, Prefab, PrefabInstance, TSStatic), default (mask captured at the first initialization). It reads/writes via editor.getObjectTypeSelectable / setObjectTypeSelectable and the gizmos.visualization.selectable preference. A tool can temporarily take control of the mask with beginScope/endScope.
--- Access: extension `editor_api_selectabilityPresets`: `extensions.load("editor_api_selectabilityPresets")`, then the global `editor_api_selectabilityPresets`
---@class editor_api_selectabilityPresets
editor_api_selectabilityPresets = {}

--- Applies a preset (all, staticsAndProps or default) to the selectability mask. If persist is true and no scope is active, also saves the mask in the preferences.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:72
---@param presetId string 'all', 'staticsAndProps' or 'default' ('current' is refused).
---@param persist boolean|nil Save to the gizmos.visualization.selectable preference (and to disk if saveVisualizationSettings is active).
---@param owner table|nil Scope owner: must match the current owner if a scope is active.
---@return boolean  true if applied, false if unknown preset/'current' or scope held by another.
function editor_api_selectabilityPresets.applyPreset(presetId, persist, owner) end

--- Temporarily takes control of the mask: saves the current mask and preferences then applies the preset, without persisting it. If the scope already exists, returns whether the owner is the same.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:83
---@param owner table Table identifying the caller (compared by identity).
---@param presetId string 'all', 'staticsAndProps' or 'default'.
---@param ownerLabel string|nil Name displayed in drawControls ("X is temporarily controlling this mask").
---@return boolean  true if the scope is active for this owner.
function editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel) end

--- Draws in ImGui the "Presets" button row: All, Statics and Props, Restore Default (with persistence). Disabled during a scope, with a text indicating who controls the mask. To be called from an editor window.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:163
function editor_api_selectabilityPresets.drawControls() end

--- Ends the scope: restores the saved mask, preferences and active preset, then saves the preferences if saveVisualizationSettings is active.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:102
---@param owner table Must be the scope owner.
---@return boolean  true if restored, false if there is no scope or another owner.
function editor_api_selectabilityPresets.endScope(owner) end

--- Returns the id of the active preset.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:155
---@return string  'current', 'all', 'staticsAndProps' or 'default'.
function editor_api_selectabilityPresets.getActivePresetId() end

--- Returns the displayable label of the active preset.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:159
---@return string  E.g. 'Statics and Props'.
function editor_api_selectabilityPresets.getActivePresetLabel() end

--- Returns the owner of the active scope, or nil.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:120
---@return table|nil  scope owner.
function editor_api_selectabilityPresets.getScopeOwner() end

--- Captures the current selectability mask as the "default" mask if not already captured. Called automatically by the other functions.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:68
function editor_api_selectabilityPresets.initialize() end

--- Indicates whether a temporary scope is active.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:124
---@return boolean  true if a scope is active.
function editor_api_selectabilityPresets.isScoped() end

--- Marks the active preset as 'current' (mask modified by hand). No effect during a scope.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:128
---@return boolean  false if a scope is active, otherwise true.
function editor_api_selectabilityPresets.markCurrent() end

--- Compares the actual mask to the all, staticsAndProps, default presets and sets activePresetId to the first that matches, otherwise 'current'.
---Source: lua/ge/extensions/editor/api/selectabilityPresets.lua:134
---@return boolean  false if a scope is active, otherwise true.
function editor_api_selectabilityPresets.syncActivePresetFromMask() end


# `editor_api_selectabilityPresets`

*File: `lua/ge/extensions/editor/api/selectabilityPresets.lua` · VM: Game Engine (GE) · 191 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_selectabilityPresets`: `extensions.load("editor_api_selectabilityPresets")`, then the global `editor_api_selectabilityPresets`

Manages "selectability" presets of object types in the world editor: which object classes (TSStatic, Prefab, BeamNGVehicle...) can be clicked/selected. Presets: current, all, staticsAndProps (BeamNGVehicle, Prefab, PrefabInstance, TSStatic), default (mask captured at the first initialization). It reads/writes via editor.getObjectTypeSelectable / setObjectTypeSelectable and the gizmos.visualization.selectable preference. A tool can temporarily take control of the mask with beginScope/endScope.

## Example

```lua
local sp = extensions.editor_api_selectabilityPresets
local owner = {}
if sp.beginScope(owner, 'staticsAndProps', 'My tool') then
  -- ... work ...
  sp.endScope(owner)
end
```

## Notes

- The module uses the global editor (not declared locally) and worldEditorCppApi.getObjectClassNames() for the class list.
- The 'current' preset is not applicable: applyPreset and beginScope return false for it.
- During a scope, applyPreset with a different owner is refused, markCurrent and syncActivePresetFromMask return false, and the drawControls buttons are disabled.
- The 'default' preset is the mask captured on the first call of initialize (so the state at the time of first use, not a fixed value).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_selectabilityPresets.applyPreset(presetId, persist, owner)` | Applies a preset (all, staticsAndProps or default) to the selectability mask. If persist is true and no scope is active, also saves the mask in the preferences. | 72 |
| `editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel)` | Temporarily takes control of the mask: saves the current mask and preferences then applies the preset, without persisting it. If the scope already exists, returns whether the owner is the same. | 83 |
| `editor_api_selectabilityPresets.drawControls()` | Draws in ImGui the "Presets" button row: All, Statics and Props, Restore Default (with persistence). Disabled during a scope, with a text indicating who controls the mask. To be called from an editor window. | 163 |
| `editor_api_selectabilityPresets.endScope(owner)` | Ends the scope: restores the saved mask, preferences and active preset, then saves the preferences if saveVisualizationSettings is active. | 102 |
| `editor_api_selectabilityPresets.getActivePresetId()` | Returns the id of the active preset. | 155 |
| `editor_api_selectabilityPresets.getActivePresetLabel()` | Returns the displayable label of the active preset. | 159 |
| `editor_api_selectabilityPresets.getScopeOwner()` | Returns the owner of the active scope, or nil. | 120 |
| `editor_api_selectabilityPresets.initialize()` | Captures the current selectability mask as the "default" mask if not already captured. Called automatically by the other functions. | 68 |
| `editor_api_selectabilityPresets.isScoped()` | Indicates whether a temporary scope is active. | 124 |
| `editor_api_selectabilityPresets.markCurrent()` | Marks the active preset as 'current' (mask modified by hand). No effect during a scope. | 128 |
| `editor_api_selectabilityPresets.syncActivePresetFromMask()` | Compares the actual mask to the all, staticsAndProps, default presets and sets activePresetId to the first that matches, otherwise 'current'. | 134 |

### Parameter details

#### `editor_api_selectabilityPresets.applyPreset(presetId, persist, owner)`

Applies a preset (all, staticsAndProps or default) to the selectability mask. If persist is true and no scope is active, also saves the mask in the preferences.

- `presetId` (*string*) : 'all', 'staticsAndProps' or 'default' ('current' is refused).
- `persist` (*boolean|nil*) : Save to the gizmos.visualization.selectable preference (and to disk if saveVisualizationSettings is active).
- `owner` (*table|nil*) : Scope owner: must match the current owner if a scope is active.
- **returns**: boolean true if applied, false if unknown preset/'current' or scope held by another.

#### `editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel)`

Temporarily takes control of the mask: saves the current mask and preferences then applies the preset, without persisting it. If the scope already exists, returns whether the owner is the same.

- `owner` (*table*) : Table identifying the caller (compared by identity).
- `presetId` (*string*) : 'all', 'staticsAndProps' or 'default'.
- `ownerLabel` (*string|nil*) : Name displayed in drawControls ("X is temporarily controlling this mask").
- **returns**: boolean true if the scope is active for this owner.

#### `editor_api_selectabilityPresets.endScope(owner)`

Ends the scope: restores the saved mask, preferences and active preset, then saves the preferences if saveVisualizationSettings is active.

- `owner` (*table*) : Must be the scope owner.
- **returns**: boolean true if restored, false if there is no scope or another owner.

#### `editor_api_selectabilityPresets.getActivePresetId()`

Returns the id of the active preset.

- **returns**: string 'current', 'all', 'staticsAndProps' or 'default'.

#### `editor_api_selectabilityPresets.getActivePresetLabel()`

Returns the displayable label of the active preset.

- **returns**: string E.g. 'Statics and Props'.

#### `editor_api_selectabilityPresets.getScopeOwner()`

Returns the owner of the active scope, or nil.

- **returns**: table|nil scope owner.

#### `editor_api_selectabilityPresets.isScoped()`

Indicates whether a temporary scope is active.

- **returns**: boolean true if a scope is active.

#### `editor_api_selectabilityPresets.markCurrent()`

Marks the active preset as 'current' (mask modified by hand). No effect during a scope.

- **returns**: boolean false if a scope is active, otherwise true.

#### `editor_api_selectabilityPresets.syncActivePresetFromMask()`

Compares the actual mask to the all, staticsAndProps, default presets and sets activePresetId to the first that matches, otherwise 'current'.

- **returns**: boolean false if a scope is active, otherwise true.

## Calls into the engine (C++)

- `worldEditorCppApi.` `getObjectClassNames`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/selectabilityPresets.lua`.*

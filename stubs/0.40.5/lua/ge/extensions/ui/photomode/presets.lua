---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of photo mode presets, of three types: camera, scene and effects. Each type is stored in a JSON file under settings/photomode/presets/ (camera.json, scene.json, effects.json); the state is captured or applied by the modules ui_photomode_camera, _scene and _effects. The module also manages a temporary "Defaults" preset (state captured at the start of the session) and the temporary presets provided by these modules.
--- Access: extension `ui_photomode_presets`: `extensions.load("ui_photomode_presets")`, then the global `ui_photomode_presets`
---@class ui_photomode_presets
---@field dependencies table<integer, string> Extensions loaded before: ui_photomode_camera, ui_photomode_scene, ui_photomode_effects.
ui_photomode_presets = {}

--- Applies a preset by identifier (default, temporary or from the file) via the relevant module's applyPresetState.
---Source: lua/ge/extensions/ui/photomode/presets.lua:275
---@param presetType string "camera", "scene" or "effects".
---@param presetId string Preset identifier, or "__defaults".
---@param options table|nil Options passed to applyPresetState ({} by default).
---@return table  {preset, state} or {ok=false, reason}.
function ui_photomode_presets.applyPreset(presetType, presetId, options) end

--- Directly applies a preset payload (for example imported from a capture's metadata), without going through storage.
---Source: lua/ge/extensions/ui/photomode/presets.lua:398
---@param presetType string "camera", "scene" or "effects".
---@param payload table Preset table; if it contains a data field, that is what is applied, otherwise the whole table.
---@return table  {state} or {ok=false, reason}.
function ui_photomode_presets.applyPresetPayload(presetType, payload) end

--- Captures, for each preset type, the current default state (captureDefaultPresetState of the relevant module). Serves as the content of the "Defaults" preset. To be called at the start of a photo session.
---Source: lua/ge/extensions/ui/photomode/presets.lua:129
function ui_photomode_presets.captureSessionDefaultPresets() end

--- Deletes a preset from the file; for the default preset or a temporary preset, only hides it.
---Source: lua/ge/extensions/ui/photomode/presets.lua:320
---@param presetType string "camera", "scene" or "effects".
---@param presetId string Preset identifier.
---@return table  {presets} (updated list) or {ok=false, reason}.
function ui_photomode_presets.deletePreset(presetType, presetId) end

--- Enables the inclusion of the module's temporary presets (getTemporaryPresetList) for this type, then returns the full list.
---Source: lua/ge/extensions/ui/photomode/presets.lua:228
---@param presetType string "camera", "scene" or "effects".
---@return table  {presets=table[]} or {ok=false, reason, presets={}}.
function ui_photomode_presets.discoverTemporaryPresets(presetType) end

--- Captures the current state of the three modules as a bundle intended for a screenshot's metadata.
---Source: lua/ge/extensions/ui/photomode/presets.lua:462
---@return table  {schemaVersion=1, camera={version,type,data}, scene={...}, effects={...}}.
function ui_photomode_presets.getScreenshotPresetBundle() end

--- Lists the presets of a type: the default preset (if not hidden), the temporary presets already discovered, then those from the file available in the current level.
---Source: lua/ge/extensions/ui/photomode/presets.lua:213
---@param presetType string "camera", "scene" or "effects".
---@return table  {presets=table[]} or {ok=false, reason, presets={}}.
function ui_photomode_presets.listPresets(presetType) end

--- Renames a preset saved in the file and updates updatedAt.
---Source: lua/ge/extensions/ui/photomode/presets.lua:373
---@param presetType string "camera", "scene" or "effects".
---@param presetId string Preset identifier.
---@param name string New name.
---@return table  {preset, presets} or {ok=false, reason}.
function ui_photomode_presets.renamePreset(presetType, presetId, name) end

--- Resets the temporary state: discovered presets, hidden presets and the session's captured default states.
---Source: lua/ge/extensions/ui/photomode/presets.lua:58
function ui_photomode_presets.resetTemporaryPresets() end

--- Captures the current state of the module of the given type (capturePresetState) and saves it as a new preset at the head of the file.
---Source: lua/ge/extensions/ui/photomode/presets.lua:245
---@param presetType string "camera", "scene" or "effects".
---@param name string Preset name.
---@param options table|nil Options passed to capturePresetState ({} by default).
---@return table  {preset, presets} or {ok=false, reason}.
function ui_photomode_presets.saveCurrentPreset(presetType, name, options) end

--- Saves a preset bundle: for each of camera, scene, effects present in the bundle, calls savePresetPayload with the name "<prefix> <type>". Stops at the first failure.
---Source: lua/ge/extensions/ui/photomode/presets.lua:436
---@param bundle table Table {camera=..., scene=..., effects=...}.
---@param namePrefix string Name prefix.
---@param origin any Provenance passed to each preset.
---@return table  {imported={camera=preset, scene=preset, effects=preset}} or {ok=false, reason}.
function ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin) end

--- Saves a given payload (without capturing the current state) as a new preset at the head of the file.
---Source: lua/ge/extensions/ui/photomode/presets.lua:415
---@param presetType string "camera", "scene" or "effects".
---@param name string Preset name.
---@param payload table Preset data (data field or whole table).
---@param origin any Provenance stored in the preset's origin field (inferred from code).
---@return table  {preset, presets} or {ok=false, reason}.
function ui_photomode_presets.savePresetPayload(presetType, name, payload, origin) end


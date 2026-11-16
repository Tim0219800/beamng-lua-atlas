---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/postFxPersistence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Disk save and reload of the photo mode post-processing effects state (depth of field, motion blur, specular occlusion, SSAO/SSR/reflections/mirrors quality, occupant visibility). The file is used to restore the player's original settings after a photo session. The values read are normalized (booleans, numbers, strings) and unknown fields are ignored.
--- Access: extension `ui_photomode_postFxPersistence`: `extensions.load("ui_photomode_postFxPersistence")`, then the global `ui_photomode_postFxPersistence`
---@class ui_photomode_postFxPersistence
---@field RESTORE_STATE_FILE string Relative path of the save file: "settings/photomodePostFxRestoreState.json".
ui_photomode_postFxPersistence = {}

--- Reads the save file and returns the normalized effects state, or nil if the file is missing, unreadable or has no known field.
---Source: lua/ge/extensions/ui/photomode/postFxPersistence.lua:145
---@return table|nil  Normalized effects state.
function ui_photomode_postFxPersistence.loadRestoreState() end

--- Normalizes the effects table then writes it to RESTORE_STATE_FILE. Returns nil, false if the table is not valid or contains no known field.
---Source: lua/ge/extensions/ui/photomode/postFxPersistence.lua:137
---@param effectsState table Effects table (fields listed in the notes); unknown fields are ignored.
---@return table|nil  Normalized state, or nil if there is nothing to save.
---@return boolean  true if the file write succeeded (an error is logged otherwise).
function ui_photomode_postFxPersistence.saveRestoreState(effectsState) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/preview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Preview / playback" part of photo mode. It adds the full photo mode state (camera, scene, effects, advanced render, capture) and the presets to a capture's metadata, then lets you replay a capture from this metadata: loading the level if needed, placing the free camera, FOV and time of day. It can also open a preview's share URL in the browser.
--- Access: extension `ui_photomode_preview`: `extensions.load("ui_photomode_preview")`, then the global `ui_photomode_preview`
---@class ui_photomode_preview
---@field dependencies table<integer, string> Extensions loaded before: ui_photomode_shared, _camera, _scene, _effects, _advancedRender, _capture, _presets.
ui_photomode_preview = {}

--- Completes a capture's metadata table with metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) and metadata.photomodePresets (preset bundle). Does nothing if the photo session is not active or if metadata is not a table.
---Source: lua/ge/extensions/ui/photomode/preview.lua:226
---@param metadata table Table modified in place.
function ui_photomode_preview.collectScreenshotMetadata(metadata) end

--- Called every frame by the photo mode loop (update hook); applies the pending preview playback (switch to free camera, setPosRot, setFOV, setTimeOfDay) when the conditions are met. The time arguments are not used.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/preview.lua:286
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
function ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw) end

--- Opens a preview's share URL in the web browser, if the media action "preview.openShareUrl" is enabled.
---Source: lua/ge/extensions/ui/photomode/preview.lua:195
---@param shareUrl string URL to open; empty or nil gives reason="share_url_missing".
---@return table  {ok=true} or {ok=false, reason=...}.
function ui_photomode_preview.openPreviewShareUrl(shareUrl) end

--- Prepares the playback of a capture from its metadata. Requires an active photo session. If the level is different, triggers its loading immediately; otherwise puts the payload on hold for handleUpdate.
---Source: lua/ge/extensions/ui/photomode/preview.lua:241
---@param openMap table Opening metadata {level, camPos, camRot, fov, timeOfDay}.
---@return table  {ok=true, level=string, requiresGameStatePlay=true} or {ok=false, reason=...}.
function ui_photomode_preview.playPreviewFromMetadata(openMap) end


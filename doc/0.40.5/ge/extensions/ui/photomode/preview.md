# `ui_photomode_preview`

*File: `lua/ge/extensions/ui/photomode/preview.lua` · VM: Game Engine (GE) · 292 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_preview`: `extensions.load("ui_photomode_preview")`, then the global `ui_photomode_preview`

"Preview / playback" part of photo mode. It adds the full photo mode state (camera, scene, effects, advanced render, capture) and the presets to a capture's metadata, then lets you replay a capture from this metadata: loading the level if needed, placing the free camera, FOV and time of day. It can also open a preview's share URL in the browser.

## Notes

- The playback functions return tables {ok=false, reason="..."} on failure (reasons: share_url_missing, browser_unavailable, open_web_failed, session_inactive, preview_metadata_invalid, preview_level_missing, extensions_load_unavailable, loadMapCmd_load_failed, loadMapCmd_unavailable, loadMapCmd_set_failed, camera_api_unavailable, camera_set_failed).
- Playback in the same level is not immediate: the payload is stored in ui_photomode_shared.S.pendingPreviewPlayback and applied by handleUpdate once the photo session is closed and the game state is neither empty nor "menu". For another level, core_loadMapCmd.set(payload, false) is called right away (the module is set to manual unload).
- Minor game bug: logTag is not declared locally in this file; the log("E", logTag, ...) calls therefore use a probably nil global (the message is logged without a valid tag).
- The expected opening metadata field (openMap): level (required), camPos (3 numbers), camRot (4 numbers, quaternion), fov (> 0), timeOfDay.

**Dependencies (loaded first):** `ui_photomode_shared`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_presets`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_preview.collectScreenshotMetadata(metadata)` | Completes a capture's metadata table with metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) and metadata.photomodePresets (preset bundle). Does nothing if the photo session is not active or if metadata is not a table. | 226 |
| `ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw)` | Called every frame by the photo mode loop (update hook); applies the pending preview playback (switch to free camera, setPosRot, setFOV, setTimeOfDay) when the conditions are met. The time arguments are not used. *(internal)* | 286 |
| `ui_photomode_preview.openPreviewShareUrl(shareUrl)` | Opens a preview's share URL in the web browser, if the media action "preview.openShareUrl" is enabled. | 195 |
| `ui_photomode_preview.playPreviewFromMetadata(openMap)` | Prepares the playback of a capture from its metadata. Requires an active photo session. If the level is different, triggers its loading immediately; otherwise puts the payload on hold for handleUpdate. | 241 |

### Parameter details

#### `ui_photomode_preview.collectScreenshotMetadata(metadata)`

Completes a capture's metadata table with metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) and metadata.photomodePresets (preset bundle). Does nothing if the photo session is not active or if metadata is not a table.

- `metadata` (*table*) : Table modified in place.

#### `ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw)`

Called every frame by the photo mode loop (update hook); applies the pending preview playback (switch to free camera, setPosRot, setFOV, setTimeOfDay) when the conditions are met. The time arguments are not used.

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).

#### `ui_photomode_preview.openPreviewShareUrl(shareUrl)`

Opens a preview's share URL in the web browser, if the media action "preview.openShareUrl" is enabled.

- `shareUrl` (*string*) : URL to open; empty or nil gives reason="share_url_missing".
- **returns**: table {ok=true} or {ok=false, reason=...}.

#### `ui_photomode_preview.playPreviewFromMetadata(openMap)`

Prepares the playback of a capture from its metadata. Requires an active photo session. If the level is different, triggers its loading immediately; otherwise puts the payload on hold for handleUpdate.

- `openMap` (*table*) : Opening metadata {level, camPos, camRot, fov, timeOfDay}.
- **returns**: table {ok=true, level=string, requiresGameStatePlay=true} or {ok=false, reason=...}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_photomode_shared, _camera, _scene, _effects, _advancedRender, _capture, _presets. |

**Loads extensions:** `core_loadMapCmd`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/preview.lua`.*

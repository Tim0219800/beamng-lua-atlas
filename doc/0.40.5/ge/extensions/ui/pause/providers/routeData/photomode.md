# `ui_pause_providers_routeData_photomode`

*File: `lua/ge/extensions/ui/pause/providers/routeData/photomode.lua` · VM: Game Engine (GE) · 146 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_photomode`: `extensions.load("ui_pause_providers_routeData_photomode")`, then the global `ui_pause_providers_routeData_photomode`

Pause menu data provider for the photo mode page. It returns the payload provided by ui_pause_photomode.getRoutePayload(), or failing that a fallback payload (contractVersion 6) where all sections and functions are disabled (camera, scene, effects, capture, upload, Steam, etc.) and where supersampling is 1 with limits from 1 to 24.

## Notes

- The fallback payload also describes the capture limits: superSampling and downscaleLevel from 1 to 24 (step 1), warning threshold 9.

**Dependencies (loaded first):** `ui_pause_photomode`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_photomode.getPhotomodeData()` | Returns {mainPanelContent = {}, photomode = payload}, where payload comes from ui_pause_photomode.getRoutePayload() if available, otherwise the fallback payload. | 133 |

### Parameter details

#### `ui_pause_providers_routeData_photomode.getPhotomodeData()`

Returns {mainPanelContent = {}, photomode = payload}, where payload comes from ui_pause_photomode.getRoutePayload() if available, otherwise the fallback payload.

- **returns**: table Photomode route data.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_photomode"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/photomode.lua`.*

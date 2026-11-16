# `htmlTexture`

*File: `lua/vehicle/htmlTexture.lua` · VM: Vehicle · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("htmlTexture")`

Helper to display a web page (HTML/JS) on a vehicle texture (dashboard screen, display). `create` or `new` creates a web view (obj:createWebView) bound to a material/texture tag; `call` or the callJS method then run a JavaScript function in that page with JSON-encoded data. To be used from a vehicle controller or extension.

## Example

```lua
local htmlTexture = require('htmlTexture')
local screen = htmlTexture.new('@dashScreen', 'local://local/vehicles/mycar/dash.html', 512, 256, 30)
screen:callJS('setSpeed', {kmh = 90})
-- or without an object:
htmlTexture.create('@dashScreen', uri, 512, 256, nil, 'automatic')
htmlTexture.call('@dashScreen', 'setSpeed', {kmh = 90})
```

## Notes

- usagemode: nil or 'automatic' (id 1, continuous refresh, fps = fps or 25 by default), 'once' (id 0, rendered once, fps forced to 0), 'manual' (id 2, rendered on demand, fps forced to 0). Any other value leaves the id at 0 but keeps fps as is.
- The JS code executed is the string `jsMethod(<JSON of data>)`: jsMethod must be the name of an existing global JavaScript function (or path) in the page; data is encoded with jsonEncode.
- Objects created by new have the fields webViewTag, uri, width, height, fps, usageModeID and the methods callJS(jsMethod, data) and streamJS(streamName, jsMethod, data) (JS stream queue via obj:queueWebViewStreamJS).
- The code comment says that create can only be used for one's own vehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `htmlTexture.call(webViewTag, jsMethod, data)` | Queues the execution of `jsMethod(<JSON>)` in the web view identified by its tag (obj:queueWebViewJS). | 38 |
| `htmlTexture.create(webViewTag, uri, width, height, fps, usagemode)` | Creates a web view without returning an object (same usagemode logic as new). Intended for the owning vehicle. | 45 |
| `htmlTexture.new(webViewTag, uri, width, height, fps, usagemode)` | Creates a web view and returns a convenience object with the methods callJS and streamJS. | 17 |

### Parameter details

#### `htmlTexture.call(webViewTag, jsMethod, data)`

Queues the execution of `jsMethod(<JSON>)` in the web view identified by its tag (obj:queueWebViewJS).

- `webViewTag` (*string*) : Tag of the web view.
- `jsMethod` (*string*) : Name of the JavaScript function to call.
- `data` (*any*) : Argument encoded as JSON (jsonEncode).

#### `htmlTexture.create(webViewTag, uri, width, height, fps, usagemode)`

Creates a web view without returning an object (same usagemode logic as new). Intended for the owning vehicle.

- `webViewTag` (*string*) : Tag of the web texture.
- `uri` (*string*) : Address of the HTML page.
- `width` (*integer*) : Width in pixels.
- `height` (*integer*) : Height in pixels.
- `fps` (*number|nil*) : Frames per second (25 by default in automatic mode).
- `usagemode` (*string|nil*) : 'automatic' (default), 'once' or 'manual'.

#### `htmlTexture.new(webViewTag, uri, width, height, fps, usagemode)`

Creates a web view and returns a convenience object with the methods callJS and streamJS.

- `webViewTag` (*string*) : Identifier/tag of the material's web texture.
- `uri` (*string*) : Address of the HTML page to display.
- `width` (*integer*) : Texture width in pixels.
- `height` (*integer*) : Texture height in pixels.
- `fps` (*number|nil*) : Frames per second (automatic mode only, 25 by default).
- `usagemode` (*string|nil*) : 'automatic' (default), 'once' or 'manual'.
- **returns**: table Object {webViewTag, uri, width, height, fps, usageModeID} with callJS(jsMethod, data) and streamJS(streamName, jsMethod, data).

## Calls into the engine (C++)

- `obj:` `createWebView`, `queueWebViewJS`, `queueWebViewStreamJS`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/htmlTexture.lua`.*

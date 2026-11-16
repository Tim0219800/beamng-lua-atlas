---@meta
-- tim19Atlas stub generated from lua/vehicle/htmlTexture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper to display a web page (HTML/JS) on a vehicle texture (dashboard screen, display). `create` or `new` creates a web view (obj:createWebView) bound to a material/texture tag; `call` or the callJS method then run a JavaScript function in that page with JSON-encoded data. To be used from a vehicle controller or extension.
--- Access: `require("htmlTexture")`
---@class htmlTexture
local htmlTexture = {}

--- Queues the execution of `jsMethod(<JSON>)` in the web view identified by its tag (obj:queueWebViewJS).
---Source: lua/vehicle/htmlTexture.lua:38
---@param webViewTag string Tag of the web view.
---@param jsMethod string Name of the JavaScript function to call.
---@param data any Argument encoded as JSON (jsonEncode).
function htmlTexture.call(webViewTag, jsMethod, data) end

--- Creates a web view without returning an object (same usagemode logic as new). Intended for the owning vehicle.
---Source: lua/vehicle/htmlTexture.lua:45
---@param webViewTag string Tag of the web texture.
---@param uri string Address of the HTML page.
---@param width integer Width in pixels.
---@param height integer Height in pixels.
---@param fps number|nil Frames per second (25 by default in automatic mode).
---@param usagemode string|nil 'automatic' (default), 'once' or 'manual'.
function htmlTexture.create(webViewTag, uri, width, height, fps, usagemode) end

--- Creates a web view and returns a convenience object with the methods callJS and streamJS.
---Source: lua/vehicle/htmlTexture.lua:17
---@param webViewTag string Identifier/tag of the material's web texture.
---@param uri string Address of the HTML page to display.
---@param width integer Texture width in pixels.
---@param height integer Texture height in pixels.
---@param fps number|nil Frames per second (automatic mode only, 25 by default).
---@param usagemode string|nil 'automatic' (default), 'once' or 'manual'.
---@return table  Object {webViewTag, uri, width, height, fps, usageModeID} with callJS(jsMethod, data) and streamJS(streamName, jsMethod, data).
function htmlTexture.new(webViewTag, uri, width, height, fps, usagemode) end

return htmlTexture

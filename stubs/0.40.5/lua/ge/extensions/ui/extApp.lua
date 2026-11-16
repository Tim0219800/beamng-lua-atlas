---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/extApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Web/WebSocket server to display the game's interface on an external device (phone). On load, it starts via utils/wsUtils a server on port 8084 (protocol 'bng-ext-app-v1', page /ui/entrypoints/main/index.html), over HTTPS/WSS so that the phone's motion sensors are accessible, and publishes the URL to the UI via guihooks.trigger('externalUIURL', url). Usage: extensions.load('ui_extApp').
--- Access: extension `ui_extApp`: `extensions.load("ui_extApp")`, then the global `ui_extApp`
---@class ui_extApp
ui_extApp = {}

--- Load hook: creates or gets the WebSocket/HTTPS server, logs the URL and publishes it to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/extApp.lua:26
function ui_extApp.onExtensionLoaded() end

--- Unload hook: destroys the server (BNGWebWSServer.destroy) and clears the URL on the UI side.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/extApp.lua:32
function ui_extApp.onExtensionUnloaded() end

--- Per-frame hook: reads the events from the WebSocket peers, decodes the JSON messages of type 'D' and passes them to _handleData (which logs an error because everything is handled in C++).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/extApp.lua:45
function ui_extApp.onUpdate() end

--- Sends the server URL back to the UI (guihooks.trigger('externalUIURL', url)). Alias of updateUIData.
---Source: lua/ge/extensions/ui/extApp.lua:21
function ui_extApp.requestUIData() end


---@meta
-- tim19Atlas stub generated from lua/ge/client/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Initialization of the graphics client (port of Torque's client.cs). initClient prepares rendering (postFx, renderManager, lighting systems), creates the GameViewportCtrl "OnlyGui" and CefGui "maincef" controls (web interface), loads the datablocks (core/art/datablocks, art, assets) then shows the main menu. reloadClient only reloads the lighting systems and post-effects.
--- Access: `require("client/init")`
---@class client_init
local client_init = {}

--- Full client initialization sequence: base rendering, GUI controls, datablocks, audioData.cs if it exists, then loadMainMenu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/init.lua:164
function client_init.initClient() end

--- Shows the "OnlyGui" control as the canvas content (main menu), if both objects exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/init.lua:89
function client_init.loadMainMenu() end

--- Reloads the lighting systems and post-effects (reloadLightingSystems, reloadPostEffects), useful after a graphics configuration change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/init.lua:193
function client_init.reloadClient() end

return client_init

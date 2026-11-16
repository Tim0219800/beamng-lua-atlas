---@meta
-- tim19Atlas stub generated from lua/ge/client/lighting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chooses and activates the game's light manager. It loads all init.lua files from the subfolders of lua/ge/client/lighting/ (advanced, basic, shadowMaps), then first tries $pref::lightManager, otherwise goes through the names of the defaultLightManagerNames setting. If none works, the game exits with "Failed to set a light manager!".
--- Access: `require("client/lighting")`
---@class client_lighting
local client_lighting = {}

--- Loads the lighting modules and activates a light manager via setLightManager; exits the game with an error message if none is usable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting.lua:61
function client_lighting.initLightingSystems() end

--- Same logic as initLightingSystems, called by reloadClient.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/lighting.lua:7
function client_lighting.reloadLightingSystems() end

return client_lighting

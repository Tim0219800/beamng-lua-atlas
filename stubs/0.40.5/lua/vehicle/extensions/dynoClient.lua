---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dynoClient.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle-side dynamometer (dyno) client: after initDyno, it sends every frame the engine speed, the engaged gear and the transmission ratios to an HTML texture (JUI) belonging to the dyno object, via queueJSUITexture executed in the GE Lua.
--- Access: extension `dynoClient`: `extensions.load (vehicle VM)("dynoClient")`, then the global `dynoClient`
---@class dynoClient
dynoClient = {}

--- Stores the dyno object and its texture, then sends it a 'client_init' initialization message. Without an object identifier, does nothing.
---Source: lua/vehicle/extensions/dynoClient.lua:16
---@param _dynoObjectID integer Identifier of the dynamometer object.
---@param _textureName string Name of the JUI texture on this object.
function dynoClient.initDyno(_dynoObjectID, _textureName) end

--- Called every frame: sends 'client_data' to the dyno if initDyno has been called.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dynoClient.lua:36
---@param dt number Time step in seconds (unused).
function dynoClient.updateGFX(dt) end


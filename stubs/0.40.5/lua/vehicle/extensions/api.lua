---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/api.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle extension that starts a small local HTTP/JSON server (utils/httpJsonServer) on localhost:23512 when the extension loads. It answers two routes: v1/ping and v1/getData (nodes, beams and triangles of the vehicle, for an external editor). The extension is loaded per vehicle; the server is started only once in this VM.
--- Access: extension `api`: `extensions.load (vehicle VM)("api")`, then the global `api`
---@class api
api = {}

--- Called when the extension loads: starts the JSON HTTP server once on localhost:23512 with the internal request handler.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/api.lua:108
function api.onExtensionLoaded() end

--- Hook called when the vehicle is loaded; empty body (debug code commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/api.lua:125
function api.onVehicleLoaded() end

--- Called every frame: processes the HTTP server's pending connections.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/api.lua:129
function api.updateGFX() end


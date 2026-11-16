# `api`

*File: `lua/vehicle/extensions/api.lua` · VM: Vehicle · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `api`: `extensions.load (vehicle VM)("api")`, then the global `api`

Vehicle extension that starts a small local HTTP/JSON server (utils/httpJsonServer) on localhost:23512 when the extension loads. It answers two routes: v1/ping and v1/getData (nodes, beams and triangles of the vehicle, for an external editor). The extension is loaded per vehicle; the server is started only once in this VM.

## Example

```lua
-- external request: POST/GET http://localhost:23512/v1/ping  ->  {"ok": true}
-- http://localhost:23512/v1/getData -> [nodes, beams, tris]
```

## Notes

- v1/getData format: array {nodes, beams, tris}. nodes[k] = {cid, {x, y, z}, nodeWeight} (nodes without wheelTreadBeamDeform); beams[k] = {cid, {id1, id2}, beamSpring, beamDamp} (beams without wheelID); tris[k] = {{id1, id2, id3}} (triangles having a cid).
- The port (23512) and host (localhost) are hardcoded; a request without uri returns nil (HTTP 500 error).
- The server is processed in updateGFX (httpJsonServer.update): it only answers once per frame, and only as long as the extension is loaded.
- onExtensionLoaded writes an error-level log ('INIT WEBSERVER TO PORT ...') even in normal operation.
- jsonRequest (HTTP POST client with body data=<json>) is defined but never called or exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `api.onExtensionLoaded()` | Called when the extension loads: starts the JSON HTTP server once on localhost:23512 with the internal request handler. *(internal)* *(hook)* | 108 |
| `api.onVehicleLoaded()` | Hook called when the vehicle is loaded; empty body (debug code commented out). *(internal)* *(hook)* | 125 |
| `api.updateGFX()` | Called every frame: processes the HTTP server's pending connections. *(internal)* | 129 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/api.lua`.*

# `libs_copas_copas_http`

*File: `lua/common/libs/copas/copas/http.lua` · VM: Common (GE + vehicle) · 414 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/http")`

HTTP submodule of the third-party Copas library: full copy of LuaSocket's HTTP/1.1 client (Diego Nehab) modified to handle https, http/https redirects and asynchronous Copas sockets. Defines copas.http; copas.http.request(url[, body]) returns body, code, headers, status. To be called from a Copas coroutine.

## Example

```lua
copas.addthread(function()
  local body, code = copas.http.request("http://example.org/")
end)
```

## Notes

- With a string URL: GET (or POST if body is given, content-type application/x-www-form-urlencoded); returns body, code, headers, status, or nil + error.
- With a table, the advanced request accepts url, method, headers, source, sink, create, etc. (as in LuaSocket).
- The first parseRequest defines target (table receiving the body chunks) and sink.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_http.open(reqt)` | Low-level API: creates the socket (reqt:create()), sets the timeout, connects to reqt.host:reqt.port and returns an HTTP connection object. | 121 |
| `libs_copas_copas_http.parseRequest(u, b)` | Converts the short form into an advanced request table with a target field (results); if a body is given: POST method, content-length and content-type headers. | 380 |

### Parameter details

#### `libs_copas_copas_http.open(reqt)`

Low-level API: creates the socket (reqt:create()), sets the timeout, connects to reqt.host:reqt.port and returns an HTTP connection object.

- `reqt` (*table*) : Request with host, port, create
- **returns**: table Connection object

#### `libs_copas_copas_http.parseRequest(u, b)`

Converts the short form into an advanced request table with a target field (results); if a body is given: POST method, content-length and content-type headers.

- `u` (*string*) : URL
- `b` (*string|nil*) : POST body
- **returns**: table Request table

## Fields

| Field | Type | Description |
|---|---|---|
| `PORT` | integer | Default HTTP port, 80. |
| `SSLOPTIONS` | string | Default SSL options, "all". |
| `SSLPORT` | integer | Default HTTPS port, 443. |
| `SSLPROTOCOL` | string | Default SSL protocol, "tlsv1_2". |
| `SSLVERIFY` | string | Certificate verification, "none" by default (not verified). |
| `TIMEOUT` | number | Connection timeout, 60 s. |
| `USERAGENT` | string | User-Agent field sent, value of socket._VERSION. |
| `request` | function | request(url_or_table, body): sends an HTTP/HTTPS request (protected by socket.protect). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/http.lua`.*

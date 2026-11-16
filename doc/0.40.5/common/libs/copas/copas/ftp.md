# `libs_copas_copas_ftp`

*File: `lua/common/libs/copas/copas/ftp.lua` · VM: Common (GE + vehicle) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/ftp")`

FTP submodule of the third-party Copas library: identical to LuaSocket's socket.ftp, but uses asynchronous Copas sockets (copas.wrap). Defines copas.ftp with get, put and command. The constants PORT, TIMEOUT, PASSWORD and USER are redirected to the original socket.ftp module when assigned.

## Notes

- Bug: parseRequest builds the table t but does not return it (no `return t`); get/put called with a string URL therefore receive nil. The table form (get{...}/put{...}) works.
- get and put are wrapped by socket.protect.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_ftp.command(cmdt)` | Sends a raw FTP command (like socket.ftp.command) with a Copas socket. | 90 |
| `libs_copas_copas_ftp.parseRequest(u, body)` | Converts the short form into the advanced form: with body it is a PUT (source = body), otherwise a GET with a target field receiving the result. | 57 |

### Parameter details

#### `libs_copas_copas_ftp.command(cmdt)`

Sends a raw FTP command (like socket.ftp.command) with a Copas socket.

- `cmdt` (*table*) : LuaSocket command table

#### `libs_copas_copas_ftp.parseRequest(u, body)`

Converts the short form into the advanced form: with body it is a PUT (source = body), otherwise a GET with a target field receiving the result.

- `u` (*string*) : ftp://... URL
- `body` (*string|nil*) : Content to send (PUT)

## Fields

| Field | Type | Description |
|---|---|---|
| `get` | function | Downloads a file: get(url_or_table). In string form, returns the concatenated content. |
| `put` | function | Uploads a file: put(url_or_table, body). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/ftp.lua`.*

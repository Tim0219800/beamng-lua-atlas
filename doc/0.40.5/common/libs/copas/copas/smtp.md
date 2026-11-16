# `libs_copas_copas_smtp`

*File: `lua/common/libs/copas/copas/smtp.lua` · VM: Common (GE + vehicle) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/smtp")`

SMTP submodule of the third-party Copas library: identical to LuaSocket's socket.smtp but with asynchronous Copas sockets. Defines copas.smtp; the constants PORT, SERVER, TIMEOUT, DOMAIN and TIMEZONE are redirected to socket.smtp when assigned, other reads fall back to socket.smtp.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_smtp.send(mailt)` | Sends an email like socket.smtp.send, using a Copas socket by default for mailt.create. | 29 |

### Parameter details

#### `libs_copas_copas_smtp.send(mailt)`

Sends an email like socket.smtp.send, using a Copas socket by default for mailt.create.

- `mailt` (*table*) : LuaSocket message table (from, rcpt, source, server, ...)
- **returns**: any Result of socket.smtp.send (1 or nil + error)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/smtp.lua`.*

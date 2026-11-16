# `libs_luasocket_socket_mbox`

*File: `lua/common/libs/luasocket/socket/mbox.lua` · VM: Common (GE + vehicle) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/mbox")`

LuaSocket mbox mailbox parser: splits an mbox file into messages, separates headers and body, interprets the headers and the sender address. E-mail utility with no direct link to the game.

## Example

```lua
local mbox = require('libs/luasocket/socket/mbox')
local messages = mbox.parse(contenuMbox)
print(messages[1].headers.subject, messages[1].body)
```

## Notes

- Bug: split_mbox assigns the global 'mbox' (variable without local), which creates/overwrites _G.mbox on each call; moreover, if 'module' exists, the module is also published in the global mbox.
- The header names from parse_headers are lowercased; repeated headers are joined with ', '.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_mbox.parse(mbox_s)` | Parses a whole mbox file: list of messages {headers, body}. | 77 |
| `libs_luasocket_socket_mbox.parse_from(from)` | Extracts name and address from a 'From' field of the form 'Name <address>' (or a plain address). | 51 |
| `libs_luasocket_socket_mbox.parse_header(header_s)` | Splits a 'Name: value' header line. | 29 |
| `libs_luasocket_socket_mbox.parse_headers(headers_s)` | Parses a header block into a table name (lowercase) -> value. | 36 |
| `libs_luasocket_socket_mbox.parse_message(message_s)` | Parses a message: returns {headers = table of parsed headers, body = body}. | 85 |
| `libs_luasocket_socket_mbox.split_headers(headers_s)` | Splits a header block into lines, unfolding continuation lines. | 21 |
| `libs_luasocket_socket_mbox.split_mbox(mbox_s)` | Splits an mbox file into raw messages, separated by 'From ...' lines preceded by an empty line. | 63 |
| `libs_luasocket_socket_mbox.split_message(message_s)` | Splits a message into headers and body (first empty line). Converts CRLF to LF. | 7 |

### Parameter details

#### `libs_luasocket_socket_mbox.parse(mbox_s)`

Parses a whole mbox file: list of messages {headers, body}.

- `mbox_s` (*string*) : Mbox contents.
- **returns**: table[] Messages.

#### `libs_luasocket_socket_mbox.parse_from(from)`

Extracts name and address from a 'From' field of the form 'Name <address>' (or a plain address).

- `from` (*string*) : Value of the From field.
- **returns**: string Name (the address if empty, quotes removed).
- **returns**: string Address.

#### `libs_luasocket_socket_mbox.parse_header(header_s)`

Splits a 'Name: value' header line.

- `header_s` (*string*) : Header line.
- **returns**: string|nil Name.
- **returns**: string|nil Value.

#### `libs_luasocket_socket_mbox.parse_headers(headers_s)`

Parses a header block into a table name (lowercase) -> value.

- `headers_s` (*string*) : Raw headers.
- **returns**: table<string, string> Headers.

#### `libs_luasocket_socket_mbox.parse_message(message_s)`

Parses a message: returns {headers = table of parsed headers, body = body}.

- `message_s` (*string*) : Raw message.
- **returns**: table Message.

#### `libs_luasocket_socket_mbox.split_headers(headers_s)`

Splits a header block into lines, unfolding continuation lines.

- `headers_s` (*string*) : Raw headers.
- **returns**: string[] One string per header.

#### `libs_luasocket_socket_mbox.split_mbox(mbox_s)`

Splits an mbox file into raw messages, separated by 'From ...' lines preceded by an empty line.

- `mbox_s` (*string*) : Contents of the mbox file.
- **returns**: string[] Raw messages.

#### `libs_luasocket_socket_mbox.split_message(message_s)`

Splits a message into headers and body (first empty line). Converts CRLF to LF.

- `message_s` (*string*) : Raw message.
- **returns**: string Raw headers (empty string if there are none).
- **returns**: string Body.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/mbox.lua`.*

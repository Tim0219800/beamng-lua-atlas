# `libs_luamqtt_mqtt_tools`

*File: `lua/common/libs/luamqtt/mqtt/tools.lua` · VM: Common (GE + vehicle) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/tools")`

Two small luamqtt utilities: string-to-hexadecimal conversion and integer division. Used by protocol.lua and for debugging.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_tools.div(x, y)` | Integer division: math.floor(x / y). | 28 |
| `libs_luamqtt_mqtt_tools.hex(str)` | Encodes each byte of the string as two uppercase hexadecimal digits. | 19 |

### Parameter details

#### `libs_luamqtt_mqtt_tools.div(x, y)`

Integer division: math.floor(x / y).

- `x` (*number*) : Dividend.
- `y` (*number*) : Divisor.
- **returns**: integer Quotient rounded down.

#### `libs_luamqtt_mqtt_tools.hex(str)`

Encodes each byte of the string as two uppercase hexadecimal digits.

- `str` (*string*) : Source string.
- **returns**: string Hexadecimal string.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/tools.lua`.*

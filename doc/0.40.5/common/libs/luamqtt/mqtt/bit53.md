# `libs_luamqtt_mqtt_bit53`

*File: `lua/common/libs/luamqtt/mqtt/bit53.lua` · VM: Common (GE + vehicle) · 19 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/bit53")`

Fallback implementation of a few BitOp functions (lshift, rshift, bor, band) with Lua 5.3's native operators (<<, >>, |, &). Loaded by bitwrap only if the interpreter is neither Lua 5.1/LuaJIT nor Lua 5.2. In BeamNG (LuaJIT) it is never loaded.

## Notes

- Do not load it under LuaJIT: the Lua 5.3 bitwise operator syntax is not valid there and would cause a compile error.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_bit53.band(x1, x2)` | Bitwise AND. | 13 |
| `libs_luamqtt_mqtt_bit53.bor(x1, x2)` | Bitwise OR. | 10 |
| `libs_luamqtt_mqtt_bit53.lshift(x, n)` | Left shift. | 4 |
| `libs_luamqtt_mqtt_bit53.rshift(x, n)` | Right shift. | 7 |

### Parameter details

#### `libs_luamqtt_mqtt_bit53.band(x1, x2)`

Bitwise AND.

- `x1` (*integer*) : Value.
- `x2` (*integer*) : Value.
- **returns**: integer x1 & x2.

#### `libs_luamqtt_mqtt_bit53.bor(x1, x2)`

Bitwise OR.

- `x1` (*integer*) : Value.
- `x2` (*integer*) : Value.
- **returns**: integer x1 | x2.

#### `libs_luamqtt_mqtt_bit53.lshift(x, n)`

Left shift.

- `x` (*integer*) : Value.
- `n` (*integer*) : Number of bits.
- **returns**: integer x << n.

#### `libs_luamqtt_mqtt_bit53.rshift(x, n)`

Right shift.

- `x` (*integer*) : Value.
- `n` (*integer*) : Number of bits.
- **returns**: integer x >> n.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/bit53.lua`.*

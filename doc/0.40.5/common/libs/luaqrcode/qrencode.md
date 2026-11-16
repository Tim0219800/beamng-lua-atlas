# `libs_luaqrcode_qrencode`

*File: `lua/common/libs/luaqrcode/qrencode.lua` · VM: Common (GE + vehicle) · 1259 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luaqrcode/qrencode")`

luaqrcode (Patrick Gundlach / speedata, BSD 3-clause license): pure-Lua QR code generator. It picks the smallest version (1 to 40) and the mode (numeric, alphanumeric, binary), encodes the data, computes the Reed-Solomon error correction, generates the 8 masks and keeps the one with the lowest penalty. It draws nothing: it returns a matrix of modules that the modder displays themselves (for example in UI or a texture).

## Example

```lua
local qr = require('libs/luaqrcode/qrencode')
local ok, matrix = qr.qrcode('https://beamng.com')
if ok then
  for x = 1, #matrix do for y = 1, #matrix do
    local noir = matrix[x][y] > 0
  end end
end
```

## Notes

- Matrix values: positive = black module, negative = white module (1/-1 for data, 2/-2 for mandatory patterns). The matrix is indexed matrix[x][y], 1-based, square of size 4 * version + 17; [1][1] is top left.
- qrcode returns (true, matrix) on success, (false, message) if the arranged data is not a multiple of 8 bits; other failure cases (text too long for version 40, etc.) may raise an error (inferred from code).
- The mode parameter is not implemented: passing it triggers assert(false, 'not implemented') in get_version_eclevel_mode_bistringlength. The mode is chosen automatically: numeric if only digits, alphanumeric for [0-9A-Z $%*./:+-], otherwise binary.
- ec_level error correction levels: 1 to 4 (L, M, Q, H). Without a value, the function takes the highest level that fits in the smallest version.
- The file contains an 'if testing' block that exports internal functions if the global testing is defined; otherwise only qrcode is exported.
- Uses the 'bit' module (LuaJIT BitOp).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luaqrcode_qrencode.qrcode(str, ec_level, mode)` | Generates the QR code of a string: determines version, error correction level and mode, encodes the data, adds the error correction, then picks the lowest-penalty mask. | 1220 |

### Parameter details

#### `libs_luaqrcode_qrencode.qrcode(str, ec_level, mode)`

Generates the QR code of a string: determines version, error correction level and mode, encodes the data, adds the error correction, then picks the lowest-penalty mask.

- `str` (*string*) : Text to encode.
- `ec_level` (*integer|nil*) : Requested error correction level, 1 to 4 (L, M, Q, H). Optional.
- `mode` (*integer|nil*) : Not implemented: do not provide it (causes an assertion).
- **returns**: boolean true if generation succeeded.
- **returns**: table<integer, table<integer, integer>>|string Matrix [x][y] of modules (positive = black), or error message if the first return value is false.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luaqrcode/qrencode.lua`.*

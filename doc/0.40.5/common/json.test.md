# `json_test`

*File: `lua/common/json.test.lua` · VM: Common (GE + vehicle) · 223 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("json.test")`

Unit tests of BeamNG's json module (require('json')). Each testXxx(ctx) function receives a test context with assertEqual(a, b, message) and assertNear(a, b, tolerance, message); they check JSON/SJSON decoding (comments, optional commas, numbers, Infinity, escapes, top-level assignments without braces, input from string.buffer), errors on invalid input, and the encode/decode round trip (including vec3 and quat). Useful to a modder to know what the parser accepts.

## Notes

- These are tests: they are not used in normal gameplay; the test runner (not read here) calls each function with ctx.
- The parser accepts missing commas, // and /* */ comments but not nested comments or a lone '/'.
- json.decode(nil) returns nil; json.decode(123) (non-string) and invalid JSON raise an error (checked with pcall).
- vec3 and quat encoded as JSON are decoded as tables with x, y, z fields (and w for quat).

## Functions

| Function | Description | Line |
|---|---|---|
| `json_test.testJsonDecodeArrayString(ctx)` | Decodes a simple JSON array. *(internal)* | 28 |
| `json_test.testJsonDecodeComments(ctx)` | Tests comment handling in objects and arrays. *(internal)* | 85 |
| `json_test.testJsonDecodeEscapes(ctx)` | Tests decoding of string escape sequences. *(internal)* | 103 |
| `json_test.testJsonDecodeFromBuffer(ctx)` | Tests decoding from a string.buffer instance. *(internal)* | 37 |
| `json_test.testJsonDecodeInfinityTokens(ctx)` | Tests the Infinity spellings accepted by the SJSON parser. *(internal)* | 121 |
| `json_test.testJsonDecodeInvalidInputType(ctx)` | Checks that json.decode(123) raises an error. *(internal)* | 194 |
| `json_test.testJsonDecodeInvalidNumberTokens(ctx)` | Checks the rejection of malformed numbers/Infinity. *(internal)* | 129 |
| `json_test.testJsonDecodeInvalidString(ctx)` | Checks that invalid text ("{bad") raises an error. *(internal)* | 186 |
| `json_test.testJsonDecodeMalformedCases(ctx)` | List of malformed cases (missing ":", missing closing, unterminated string, invalid true/false/null tokens, invalid exponent, nested comments) that must all fail. *(internal)* | 202 |
| `json_test.testJsonDecodeMissingCommasAccepted(ctx)` | Checks that the parser tolerates omitted commas. *(internal)* | 65 |
| `json_test.testJsonDecodeNil(ctx)` | Checks that json.decode(nil) returns nil. *(internal)* | 14 |
| `json_test.testJsonDecodeNumbers(ctx)` | Tests the accepted number variants. *(internal)* | 112 |
| `json_test.testJsonDecodeObjectString(ctx)` | Decodes a simple JSON object and checks the fields. *(internal)* | 19 |
| `json_test.testJsonDecodeSjsonFeatures(ctx)` | Tests the SJSON-like features expected by the BeamNG parser. *(internal)* | 47 |
| `json_test.testJsonDecodeTopLevelAssignments(ctx)` | Checks the top-level key/value format without braces. *(internal)* | 76 |
| `json_test.testJsonEncodeDecodeRoundtrip(ctx)` | Encode/decode round trip of a nested structure (number, string, boolean, array, object). *(internal)* | 167 |
| `json_test.testJsonEncodeDecodeVec3Quat(ctx)` | Checks that vec3 and quat survive encode then decode (tables x,y,z[,w], tolerance 1e-6). *(internal)* | 145 |

### Parameter details

#### `json_test.testJsonDecodeArrayString(ctx)`

Decodes a simple JSON array.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeComments(ctx)`

Tests comment handling in objects and arrays.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeEscapes(ctx)`

Tests decoding of string escape sequences.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeFromBuffer(ctx)`

Tests decoding from a string.buffer instance.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeInfinityTokens(ctx)`

Tests the Infinity spellings accepted by the SJSON parser.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeInvalidInputType(ctx)`

Checks that json.decode(123) raises an error.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeInvalidNumberTokens(ctx)`

Checks the rejection of malformed numbers/Infinity.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeInvalidString(ctx)`

Checks that invalid text ("{bad") raises an error.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeMalformedCases(ctx)`

List of malformed cases (missing ":", missing closing, unterminated string, invalid true/false/null tokens, invalid exponent, nested comments) that must all fail.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeMissingCommasAccepted(ctx)`

Checks that the parser tolerates omitted commas.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeNil(ctx)`

Checks that json.decode(nil) returns nil.

- `ctx` (*table*) : Test context (assertEqual, assertNear).

#### `json_test.testJsonDecodeNumbers(ctx)`

Tests the accepted number variants.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeObjectString(ctx)`

Decodes a simple JSON object and checks the fields.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeSjsonFeatures(ctx)`

Tests the SJSON-like features expected by the BeamNG parser.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonDecodeTopLevelAssignments(ctx)`

Checks the top-level key/value format without braces.

- `ctx` (*table*) : Test context.

#### `json_test.testJsonEncodeDecodeRoundtrip(ctx)`

Encode/decode round trip of a nested structure (number, string, boolean, array, object).

- `ctx` (*table*) : Test context.

#### `json_test.testJsonEncodeDecodeVec3Quat(ctx)`

Checks that vec3 and quat survive encode then decode (tables x,y,z[,w], tolerance 1e-6).

- `ctx` (*table*) : Test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/json.test.lua`.*

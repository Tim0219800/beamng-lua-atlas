---@meta
-- tim19Atlas stub generated from lua/common/json.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of BeamNG's json module (require('json')). Each testXxx(ctx) function receives a test context with assertEqual(a, b, message) and assertNear(a, b, tolerance, message); they check JSON/SJSON decoding (comments, optional commas, numbers, Infinity, escapes, top-level assignments without braces, input from string.buffer), errors on invalid input, and the encode/decode round trip (including vec3 and quat). Useful to a modder to know what the parser accepts.
--- Access: `require("json.test")`
---@class json_test
local json_test = {}

--- Decodes a simple JSON array.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:28
---@param ctx table Test context.
function json_test.testJsonDecodeArrayString(ctx) end

--- Tests comment handling in objects and arrays.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:85
---@param ctx table Test context.
function json_test.testJsonDecodeComments(ctx) end

--- Tests decoding of string escape sequences.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:103
---@param ctx table Test context.
function json_test.testJsonDecodeEscapes(ctx) end

--- Tests decoding from a string.buffer instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:37
---@param ctx table Test context.
function json_test.testJsonDecodeFromBuffer(ctx) end

--- Tests the Infinity spellings accepted by the SJSON parser.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:121
---@param ctx table Test context.
function json_test.testJsonDecodeInfinityTokens(ctx) end

--- Checks that json.decode(123) raises an error.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:194
---@param ctx table Test context.
function json_test.testJsonDecodeInvalidInputType(ctx) end

--- Checks the rejection of malformed numbers/Infinity.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:129
---@param ctx table Test context.
function json_test.testJsonDecodeInvalidNumberTokens(ctx) end

--- Checks that invalid text ("{bad") raises an error.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:186
---@param ctx table Test context.
function json_test.testJsonDecodeInvalidString(ctx) end

--- List of malformed cases (missing ":", missing closing, unterminated string, invalid true/false/null tokens, invalid exponent, nested comments) that must all fail.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:202
---@param ctx table Test context.
function json_test.testJsonDecodeMalformedCases(ctx) end

--- Checks that the parser tolerates omitted commas.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:65
---@param ctx table Test context.
function json_test.testJsonDecodeMissingCommasAccepted(ctx) end

--- Checks that json.decode(nil) returns nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:14
---@param ctx table Test context (assertEqual, assertNear).
function json_test.testJsonDecodeNil(ctx) end

--- Tests the accepted number variants.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:112
---@param ctx table Test context.
function json_test.testJsonDecodeNumbers(ctx) end

--- Decodes a simple JSON object and checks the fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:19
---@param ctx table Test context.
function json_test.testJsonDecodeObjectString(ctx) end

--- Tests the SJSON-like features expected by the BeamNG parser.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:47
---@param ctx table Test context.
function json_test.testJsonDecodeSjsonFeatures(ctx) end

--- Checks the top-level key/value format without braces.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:76
---@param ctx table Test context.
function json_test.testJsonDecodeTopLevelAssignments(ctx) end

--- Encode/decode round trip of a nested structure (number, string, boolean, array, object).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:167
---@param ctx table Test context.
function json_test.testJsonEncodeDecodeRoundtrip(ctx) end

--- Checks that vec3 and quat survive encode then decode (tables x,y,z[,w], tolerance 1e-6).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/json.test.lua:145
---@param ctx table Test context.
function json_test.testJsonEncodeDecodeVec3Quat(ctx) end

return json_test

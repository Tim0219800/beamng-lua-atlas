---@meta
-- tim19Atlas stub generated from lua/common/json.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("json.test")`
---@class json_test
local json_test = {}

--- Tests decoding a plain JSON array string.
---Source : lua/common/json.test.lua:28
---@param ctx any
function json_test.testJsonDecodeArrayString(ctx) end

--- Tests comment handling in both object and array contexts.
---Source : lua/common/json.test.lua:85
---@param ctx any
function json_test.testJsonDecodeComments(ctx) end

--- Tests string escape decoding.
---Source : lua/common/json.test.lua:103
---@param ctx any
function json_test.testJsonDecodeEscapes(ctx) end

--- Tests decode path that takes a string.buffer instance.
---Source : lua/common/json.test.lua:37
---@param ctx any
function json_test.testJsonDecodeFromBuffer(ctx) end

--- Tests Infinity spellings accepted by SJSON parser.
---Source : lua/common/json.test.lua:121
---@param ctx any
function json_test.testJsonDecodeInfinityTokens(ctx) end

--- Tests invalid input type raises an error.
---Source : lua/common/json.test.lua:194
---@param ctx any
function json_test.testJsonDecodeInvalidInputType(ctx) end

--- Tests malformed number/Infinity tokens rejected by parser rules.
---Source : lua/common/json.test.lua:129
---@param ctx any
function json_test.testJsonDecodeInvalidNumberTokens(ctx) end

--- Tests invalid text returns an error via pcall.
---Source : lua/common/json.test.lua:186
---@param ctx any
function json_test.testJsonDecodeInvalidString(ctx) end

--- Tests malformed JSON/SJSON inputs fail decoding.
---Source : lua/common/json.test.lua:202
---@param ctx any
function json_test.testJsonDecodeMalformedCases(ctx) end

--- Tests permissive parsing where commas may be omitted.
---Source : lua/common/json.test.lua:65
---@param ctx any
function json_test.testJsonDecodeMissingCommasAccepted(ctx) end

--- Tests decode(nil) returns nil.
---Source : lua/common/json.test.lua:14
---@param ctx any
function json_test.testJsonDecodeNil(ctx) end

--- Tests number parsing variants supported by the parser.
---Source : lua/common/json.test.lua:112
---@param ctx any
function json_test.testJsonDecodeNumbers(ctx) end

--- Tests decoding a plain JSON object string.
---Source : lua/common/json.test.lua:19
---@param ctx any
function json_test.testJsonDecodeObjectString(ctx) end

--- Tests SJSON-like features expected by BeamNG parser.
---Source : lua/common/json.test.lua:47
---@param ctx any
function json_test.testJsonDecodeSjsonFeatures(ctx) end

--- Tests top-level key/value format without surrounding braces.
---Source : lua/common/json.test.lua:76
---@param ctx any
function json_test.testJsonDecodeTopLevelAssignments(ctx) end

--- Tests encode/decode roundtrip for nested values.
---Source : lua/common/json.test.lua:167
---@param ctx any
function json_test.testJsonEncodeDecodeRoundtrip(ctx) end

--- Tests encode/decode behavior for BeamNG special cdata-like types.
---Source : lua/common/json.test.lua:145
---@param ctx any
function json_test.testJsonEncodeDecodeVec3Quat(ctx) end

return json_test

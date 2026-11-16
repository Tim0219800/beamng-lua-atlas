---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson/decoder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lunajson: JSON decoder. The module returns a factory `newdecoder()`; each call creates an independent decoding context and returns the function `decode(json, pos?, nullv?, arraylen?)`. The decoder handles numbers (integers and floats), strings with escapes and Unicode surrogate pairs, and limits the nesting depth to 1000.
--- Access: `require("libs/lunajson/lunajson/decoder")`
---@class libs_lunajson_lunajson_decoder
local libs_lunajson_lunajson_decoder = {}


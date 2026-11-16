---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson/encoder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lunajson: JSON encoder. The module returns a factory `newencoder()`; each call creates an independent context and returns the function `encode(value, nullv?)`, which serializes booleans, numbers, strings and tables (array or object, automatic detection) into a compact JSON string.
--- Access: `require("libs/lunajson/lunajson/encoder")`
---@class libs_lunajson_lunajson_encoder
local libs_lunajson_lunajson_encoder = {}


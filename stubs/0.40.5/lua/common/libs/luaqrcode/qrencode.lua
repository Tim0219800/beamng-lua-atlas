---@meta
-- tim19Atlas stub generated from lua/common/libs/luaqrcode/qrencode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luaqrcode (Patrick Gundlach / speedata, BSD 3-clause license): pure-Lua QR code generator. It picks the smallest version (1 to 40) and the mode (numeric, alphanumeric, binary), encodes the data, computes the Reed-Solomon error correction, generates the 8 masks and keeps the one with the lowest penalty. It draws nothing: it returns a matrix of modules that the modder displays themselves (for example in UI or a texture).
--- Access: `require("libs/luaqrcode/qrencode")`
---@class libs_luaqrcode_qrencode
local libs_luaqrcode_qrencode = {}

--- Generates the QR code of a string: determines version, error correction level and mode, encodes the data, adds the error correction, then picks the lowest-penalty mask.
---Source: lua/common/libs/luaqrcode/qrencode.lua:1220
---@param str string Text to encode.
---@param ec_level integer|nil Requested error correction level, 1 to 4 (L, M, Q, H). Optional.
---@param mode integer|nil Not implemented: do not provide it (causes an assertion).
---@return boolean  true if generation succeeded.
---@return table<integer, table<integer, integer>>|string  Matrix [x][y] of modules (positive = black), or error message if the first return value is false.
function libs_luaqrcode_qrencode.qrcode(str, ec_level, mode) end

return libs_luaqrcode_qrencode

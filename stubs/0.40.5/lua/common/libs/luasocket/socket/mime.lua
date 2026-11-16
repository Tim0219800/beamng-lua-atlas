---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/mime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua layer of the LuaSocket MIME module (Diego Nehab, RFC 2045-2049): base64 and quoted-printable encoding and decoding, line wrapping, line-ending normalization, dot-stuffing (SMTP). Builds LTN12 filters on top of the native functions of the 'mime.core' module (b64, unb64, qp, unqp, wrp, qpwrp, eol, dot).
--- Access: `require("libs/luasocket/socket/mime")`
---@class libs_luasocket_socket_mime
---@field decode function decode(name, opt1, opt2) -> ltn12 decoding filter chosen from decodet.
---@field decodet table<string, function> Decoding filter factories ('base64', 'quoted-printable').
---@field encode function encode(name, opt1, opt2) -> ltn12 encoding filter chosen from encodet.
---@field encodet table<string, function> Encoding filter factories ('base64', 'quoted-printable'; in 'binary' mode qp uses =0D=0A).
---@field wrap function wrap(name, length) -> ltn12 line-wrapping filter chosen from wrapt.
---@field wrapt table<string, function> Line-wrapping filter factories ('text', 'base64', 'default', 'quoted-printable').
local libs_luasocket_socket_mime = {}

--- Creates a filter that normalizes line endings to the given marker (via mime.eol).
---Source: lua/common/libs/luasocket/socket/mime.lua:81
---@param marker string|nil Desired line ending (e.g. '\r\n').
---@return function  LTN12 filter.
function libs_luasocket_socket_mime.normalize(marker) end

--- Creates a 'dot-stuffing' filter (doubles the dots at the start of a line, for SMTP) via mime.dot.
---Source: lua/common/libs/luasocket/socket/mime.lua:86
---@return function  LTN12 filter.
function libs_luasocket_socket_mime.stuff() end

return libs_luasocket_socket_mime

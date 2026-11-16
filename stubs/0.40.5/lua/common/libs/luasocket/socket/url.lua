---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/url.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party LuaSocket library (Diego Nehab), version "URL 1.0.3": parsing, building and resolving relative URLs according to RFC 2396. Useful for splitting a URL into scheme/authority/userinfo/host/port/path/params/query/fragment, rebuilding it, encoding/decoding reserved characters (%XX) and handling path segments.
--- Access: `require("libs/luasocket/socket/url")`
---@class libs_luasocket_socket_url
---@field _VERSION string Module version: "URL 1.0.3".
local libs_luasocket_socket_url = {}

--- Builds an absolute URL from a base URL and a relative URL (RFC 2396).
---Source: lua/common/libs/luasocket/socket/url.lua:221
---@param base_url string|table Base URL (string or table from parse).
---@param relative_url string|table Relative URL (string or table from parse).
---@return string  Corresponding absolute URL.
function libs_luasocket_socket_url.absolute(base_url, relative_url) end

--- Rebuilds a URL from a table of the type returned by parse; components containing reserved characters are protected.
---Source: lua/common/libs/luasocket/socket/url.lua:185
---@param parsed table URL parts.
---@return string  Built URL.
function libs_luasocket_socket_url.build(parsed) end

--- Rebuilds a path from its segments, escaping protected characters.
---Source: lua/common/libs/luasocket/socket/url.lua:281
---@param parsed table Path segments (as returned by parse_path).
---@param unsafe boolean|nil If true, the segments are not protected before building.
---@return string  Built path.
function libs_luasocket_socket_url.build_path(parsed, unsafe) end

--- Encodes a binary string by replacing each non-alphanumeric byte with its %XX representation.
---Source: lua/common/libs/luasocket/socket/url.lua:30
---@param s string String to encode.
---@return string  Escaped string.
function libs_luasocket_socket_url.escape(s) end

--- Splits a URL into a table with the fields scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (only those present are filled). The leading '/' of the path is part of path.
---Source: lua/common/libs/luasocket/socket/url.lua:126
---@param url string URL to parse.
---@param default table|nil Default values copied into the result before parsing.
---@return table|nil  URL parts, or nil and "invalid url".
function libs_luasocket_socket_url.parse(url, default) end

--- Splits a path into (decoded) segments; a path starting with '/' gives an is_absolute field.
---Source: lua/common/libs/luasocket/socket/url.lua:260
---@param path string URL path.
---@return table  List of segments (one per entry).
function libs_luasocket_socket_url.parse_path(path) end

--- Decodes the %XX sequences of a string into bytes.
---Source: lua/common/libs/luasocket/socket/url.lua:73
---@param s string Escaped string.
---@return string  Decoded string.
function libs_luasocket_socket_url.unescape(s) end

return libs_luasocket_socket_url

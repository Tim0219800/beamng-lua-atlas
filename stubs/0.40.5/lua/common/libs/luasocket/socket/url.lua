---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/url.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- URI parsing, composition and relative URL resolution
---  LuaSocket toolkit.
---  Author: Diego Nehab
---  Declare module
--- Accès : `require("libs/luasocket/socket/url")`
---@class libs_luasocket_socket_url
---@field _VERSION string
local libs_luasocket_socket_url = {}

--- Builds a absolute URL from a base and a relative URL according to RFC 2396
---  Input
---    base_url
---    relative_url
---  Returns
---    corresponding absolute url
---Source : lua/common/libs/luasocket/socket/url.lua:221
---@param base_url any
---@param relative_url any
function libs_luasocket_socket_url.absolute(base_url, relative_url) end

--- Rebuilds a parsed URL from its components.
---  Components are protected if any reserved or unallowed characters are found
---  Input
---    parsed: parsed URL, as returned by parse
---  Returns
---    a stringing with the corresponding URL
---Source : lua/common/libs/luasocket/socket/url.lua:185
---@param parsed any
function libs_luasocket_socket_url.build(parsed) end

--- Builds a path component from its segments, escaping protected characters.
---  Input
---    parsed: path segments
---    unsafe: if true, segments are not protected before path is built
---  Returns
---    path: corresponding path stringing
---Source : lua/common/libs/luasocket/socket/url.lua:281
---@param parsed any
---@param unsafe any
function libs_luasocket_socket_url.build_path(parsed, unsafe) end

--- Encodes a string into its escaped hexadecimal representation
---  Input
---    s: binary string to be encoded
---  Returns
---    escaped representation of string binary
---Source : lua/common/libs/luasocket/socket/url.lua:30
---@param s any
function libs_luasocket_socket_url.escape(s) end

--- Parses a url and returns a table with all its parts according to RFC 2396
---  The following grammar describes the names given to the URL parts
---  <url> ::= <scheme>://<authority>/<path>;<params>?<query>#<fragment>
---  <authority> ::= <userinfo>@<host>:<port>
---  <userinfo> ::= <user>[:<password>]
---  <path> :: = {<segment>/}<segment>
---  Input
---    url: uniform resource locator of request
---    default: table with default values for each field
---  Returns
---    table with the following fields, where RFC naming conventions have
---    been preserved:
---      scheme, authority, userinfo, user, password, host, port,
---      path, params, query, fragment
---  Obs:
---    the leading '/' in {/<path>} is considered part of <path>
---Source : lua/common/libs/luasocket/socket/url.lua:126
---@param url any
---@param default any
function libs_luasocket_socket_url.parse(url, default) end

--- Breaks a path into its segments, unescaping the segments
---  Input
---    path
---  Returns
---    segment: a table with one entry per segment
---Source : lua/common/libs/luasocket/socket/url.lua:260
---@param path any
function libs_luasocket_socket_url.parse_path(path) end

--- Encodes a string into its escaped hexadecimal representation
---  Input
---    s: binary string to be encoded
---  Returns
---    escaped representation of string binary
---Source : lua/common/libs/luasocket/socket/url.lua:73
---@param s any
function libs_luasocket_socket_url.unescape(s) end

return libs_luasocket_socket_url

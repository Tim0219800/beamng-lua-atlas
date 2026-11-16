---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/mbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaSocket mbox mailbox parser: splits an mbox file into messages, separates headers and body, interprets the headers and the sender address. E-mail utility with no direct link to the game.
--- Access: `require("libs/luasocket/socket/mbox")`
---@class libs_luasocket_socket_mbox
local libs_luasocket_socket_mbox = {}

--- Parses a whole mbox file: list of messages {headers, body}.
---Source: lua/common/libs/luasocket/socket/mbox.lua:77
---@param mbox_s string Mbox contents.
---@return table[]  Messages.
function libs_luasocket_socket_mbox.parse(mbox_s) end

--- Extracts name and address from a 'From' field of the form 'Name <address>' (or a plain address).
---Source: lua/common/libs/luasocket/socket/mbox.lua:51
---@param from string Value of the From field.
---@return string  Name (the address if empty, quotes removed).
---@return string  Address.
function libs_luasocket_socket_mbox.parse_from(from) end

--- Splits a 'Name: value' header line.
---Source: lua/common/libs/luasocket/socket/mbox.lua:29
---@param header_s string Header line.
---@return string|nil  Name.
---@return string|nil  Value.
function libs_luasocket_socket_mbox.parse_header(header_s) end

--- Parses a header block into a table name (lowercase) -> value.
---Source: lua/common/libs/luasocket/socket/mbox.lua:36
---@param headers_s string Raw headers.
---@return table<string, string>  Headers.
function libs_luasocket_socket_mbox.parse_headers(headers_s) end

--- Parses a message: returns {headers = table of parsed headers, body = body}.
---Source: lua/common/libs/luasocket/socket/mbox.lua:85
---@param message_s string Raw message.
---@return table  Message.
function libs_luasocket_socket_mbox.parse_message(message_s) end

--- Splits a header block into lines, unfolding continuation lines.
---Source: lua/common/libs/luasocket/socket/mbox.lua:21
---@param headers_s string Raw headers.
---@return string[]  One string per header.
function libs_luasocket_socket_mbox.split_headers(headers_s) end

--- Splits an mbox file into raw messages, separated by 'From ...' lines preceded by an empty line.
---Source: lua/common/libs/luasocket/socket/mbox.lua:63
---@param mbox_s string Contents of the mbox file.
---@return string[]  Raw messages.
function libs_luasocket_socket_mbox.split_mbox(mbox_s) end

--- Splits a message into headers and body (first empty line). Converts CRLF to LF.
---Source: lua/common/libs/luasocket/socket/mbox.lua:7
---@param message_s string Raw message.
---@return string  Raw headers (empty string if there are none).
---@return string  Body.
function libs_luasocket_socket_mbox.split_message(message_s) end

return libs_luasocket_socket_mbox

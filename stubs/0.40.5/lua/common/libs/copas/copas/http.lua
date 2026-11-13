---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/http.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Full copy of the LuaSocket code, modified to include
---  https and http/https redirects, and Copas async enabled.
---  HTTP/1.1 client support for the Lua language.
---  LuaSocket toolkit.
---  Author: Diego Nehab
---  Declare module and import dependencies
--- Accès : `require("libs/copas/copas/http")`
---@class libs_copas_copas_http
---@field PORT number
---@field SSLOPTIONS string
---@field SSLPORT number
---@field SSLPROTOCOL string
---@field SSLVERIFY string
---@field TIMEOUT number
---@field USERAGENT any
---@field request any
local libs_copas_copas_http = {}

---Source : lua/common/libs/copas/copas/http.lua:121
---@param reqt any
function libs_copas_copas_http.open(reqt) end

--- parses a shorthand form into the advanced table form.
---  adds field `target` to the table. This will hold the return values.
---Source : lua/common/libs/copas/copas/http.lua:380
---@param u any
---@param b any
function libs_copas_copas_http.parseRequest(u, b) end

return libs_copas_copas_http

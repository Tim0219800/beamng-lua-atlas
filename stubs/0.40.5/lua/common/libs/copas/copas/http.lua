---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/http.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- HTTP submodule of the third-party Copas library: full copy of LuaSocket's HTTP/1.1 client (Diego Nehab) modified to handle https, http/https redirects and asynchronous Copas sockets. Defines copas.http; copas.http.request(url[, body]) returns body, code, headers, status. To be called from a Copas coroutine.
--- Access: `require("libs/copas/copas/http")`
---@class libs_copas_copas_http
---@field PORT integer Default HTTP port, 80.
---@field SSLOPTIONS string Default SSL options, "all".
---@field SSLPORT integer Default HTTPS port, 443.
---@field SSLPROTOCOL string Default SSL protocol, "tlsv1_2".
---@field SSLVERIFY string Certificate verification, "none" by default (not verified).
---@field TIMEOUT number Connection timeout, 60 s.
---@field USERAGENT string User-Agent field sent, value of socket._VERSION.
---@field request function request(url_or_table, body): sends an HTTP/HTTPS request (protected by socket.protect).
local libs_copas_copas_http = {}

--- Low-level API: creates the socket (reqt:create()), sets the timeout, connects to reqt.host:reqt.port and returns an HTTP connection object.
---Source: lua/common/libs/copas/copas/http.lua:121
---@param reqt table Request with host, port, create
---@return table  Connection object
function libs_copas_copas_http.open(reqt) end

--- Converts the short form into an advanced request table with a target field (results); if a body is given: POST method, content-length and content-type headers.
---Source: lua/common/libs/copas/copas/http.lua:380
---@param u string URL
---@param b string|nil POST body
---@return table  Request table
function libs_copas_copas_http.parseRequest(u, b) end

return libs_copas_copas_http

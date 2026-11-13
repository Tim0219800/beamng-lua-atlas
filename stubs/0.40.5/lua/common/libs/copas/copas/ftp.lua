---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/ftp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- identical to the socket.ftp module except that it uses
---  async wrapped Copas sockets
--- Accès : `require("libs/copas/copas/ftp")`
---@class libs_copas_copas_ftp
---@field get any
---@field put any
local libs_copas_copas_ftp = {}

---Source : lua/common/libs/copas/copas/ftp.lua:90
---@param cmdt any
function libs_copas_copas_ftp.command(cmdt) end

--- parses a simple form into the advanced form
---  if `body` is provided, a PUT, otherwise a GET.
---  If GET, then a field `target` is added to store the results
---Source : lua/common/libs/copas/copas/ftp.lua:57
---@param u any
---@param body any
function libs_copas_copas_ftp.parseRequest(u, body) end

return libs_copas_copas_ftp

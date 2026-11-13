---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée de la bibliothèque tierce lua-websockets (Gerhard Lipp, licence MIT), implémentation WebSocket (RFC 6455) en Lua pur. Ce module regroupe les sous-modules client et server (chargés à la demande) et les constantes d'opcodes de trame. Il est chargé via require('libs/lua-websockets/websocket').
--- Accès : `require("libs/lua-websockets/websocket")`
---@class libs_lua_websockets_websocket
---@field BINARY integer Opcode 2 : message binaire.
---@field CLOSE integer Opcode 8 : fermeture de la connexion.
---@field CONTINUATION integer Opcode 0 : trame de continuation d'un message fragmenté.
---@field PING integer Opcode 9 : ping.
---@field PONG integer Opcode 10 : pong.
---@field TEXT integer Opcode 1 : message texte.
---@field client table Table paresseuse (voir websocket/client.lua) : client.new / client.sync (backend synchrone), client.copas, client.ev.
---@field server table Table paresseuse (voir websocket/server.lua) : server.copas, server.ev.
local libs_lua_websockets_websocket = {}

return libs_lua_websockets_websocket

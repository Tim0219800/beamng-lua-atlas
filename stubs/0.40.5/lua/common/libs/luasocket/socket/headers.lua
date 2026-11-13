---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/headers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table de mise en forme canonique des noms d'en-têtes (MIME/HTTP) de LuaSocket : associe un nom en minuscules à sa forme usuelle (par ex. 'content-type' -> 'Content-Type'). Le module s'enregistre aussi dans socket.headers. Utilisé par socket.http lors de l'envoi des en-têtes de requête.
--- Accès : `require("libs/luasocket/socket/headers")`
---@class libs_luasocket_socket_headers
---@field canonic table<string, string> Noms d'en-têtes en minuscules vers leur capitalisation canonique ; un nom absent de la table est envoyé tel quel.
local libs_luasocket_socket_headers = {}

return libs_luasocket_socket_headers

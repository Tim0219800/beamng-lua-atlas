---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/ftp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module FTP de la bibliothèque tierce Copas : identique à socket.ftp de LuaSocket, mais utilise des sockets Copas asynchrones (copas.wrap). Définit copas.ftp avec get, put et command. Les constantes PORT, TIMEOUT, PASSWORD et USER sont redirigées vers le module socket.ftp d'origine quand on les affecte.
--- Accès : `require("libs/copas/copas/ftp")`
---@class libs_copas_copas_ftp
---@field get function Télécharge un fichier : get(url_ou_table). En forme chaîne, renvoie le contenu concaténé.
---@field put function Envoie un fichier : put(url_ou_table, body).
local libs_copas_copas_ftp = {}

--- Envoie une commande FTP brute (comme socket.ftp.command) avec un socket Copas.
---Source : lua/common/libs/copas/copas/ftp.lua:90
---@param cmdt table Table de commande LuaSocket
function libs_copas_copas_ftp.command(cmdt) end

--- Convertit la forme courte en forme avancée : avec body c'est un PUT (source = body), sinon un GET avec champ target recevant le résultat.
---Source : lua/common/libs/copas/copas/ftp.lua:57
---@param u string URL ftp://…
---@param body string|nil Contenu à envoyer (PUT)
function libs_copas_copas_ftp.parseRequest(u, body) end

return libs_copas_copas_ftp

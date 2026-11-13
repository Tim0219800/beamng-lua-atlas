---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/smtp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module SMTP de la bibliothèque tierce Copas : identique à socket.smtp de LuaSocket mais avec des sockets Copas asynchrones. Définit copas.smtp ; les constantes PORT, SERVER, TIMEOUT, DOMAIN et TIMEZONE sont redirigées vers socket.smtp quand on les affecte, les autres lectures retombent sur socket.smtp.
--- Accès : `require("libs/copas/copas/smtp")`
---@class libs_copas_copas_smtp
local libs_copas_copas_smtp = {}

--- Envoie un courriel comme socket.smtp.send, en utilisant par défaut un socket Copas pour mailt.create.
---Source : lua/common/libs/copas/copas/smtp.lua:29
---@param mailt table Table de message LuaSocket (from, rcpt, source, server, …)
---@return any  Résultat de socket.smtp.send (1 ou nil + erreur)
function libs_copas_copas_smtp.send(mailt) end

return libs_copas_copas_smtp

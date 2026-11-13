---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/ev_common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions communes aux backends client_ev et server_ev de lua-websockets (boucle d'événements lua-ev) : envoi asynchrone avec tampon et lecture/décodage de trames WebSocket sur un socket. Nécessite le module 'ev' (non fourni par le jeu).
--- Accès : globale `message_io`, `send_io_stop`
---@class message_io
message_io = {}

--- Prépare l'envoi asynchrone sur un socket : crée un IO d'écriture ev et renvoie deux fonctions, send_async(data, on_sent, on_err) qui ajoute les données au tampon et renvoie le nombre d'octets en attente, et stop() qui arrête l'IO et vide le tampon. on_sent reçoit les données envoyées ; on_err reçoit l'erreur.
---Source : lua/common/libs/lua-websockets/websocket/ev_common.lua:21
---@param sock table Socket luasocket.
---@param loop table Boucle ev (défaut ev.Loop.default).
---@return function  send_async(data, on_sent, on_err).
---@return function  stop().
function message_io.async_send(sock, loop) end

--- Surveille la lecture d'un socket, reconstitue les trames WebSocket (via frame.decode), concatène les fragments et appelle on_message pour chaque message complet. Appelle on_error à la déconnexion ou à une erreur autre que timeout.
---Source : lua/common/libs/lua-websockets/websocket/ev_common.lua:99
---@param sock table Socket luasocket avec descripteur valide.
---@param loop table Boucle ev.
---@param on_message function fonction(message, opcode).
---@param on_error function fonction(err, io, sock).
---@return table  L'IO ev de lecture (arrêt avec :stop(loop)).
function message_io.message_io(sock, loop, on_message, on_error) end


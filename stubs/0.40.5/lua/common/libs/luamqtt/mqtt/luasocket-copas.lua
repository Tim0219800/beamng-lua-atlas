---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket-copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Connecteur réseau luamqtt pour luasocket combiné à copas (E/S coopératives dans des coroutines). Même interface que le connecteur luasocket (connect, shutdown, send, receive, settimeout) mais send et receive passent par copas.send/copas.receive. À passer dans l'argument connector du client MQTT.
--- Accès : `require("libs/luamqtt/mqtt/luasocket-copas")`
---@class libs_luamqtt_mqtt_luasocket_copas
local libs_luamqtt_mqtt_luasocket_copas = {}

--- Ouvre la connexion TCP via socket.connect et la stocke dans conn.sock.
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:13
---@param conn table host, port.
---@return boolean  Succès.
---@return string|nil  Erreur.
function libs_luamqtt_mqtt_luasocket_copas.connect(conn) end

--- Reçoit size octets via copas.receive.
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:34
---@param conn table Connexion.
---@param size integer Octets.
function libs_luamqtt_mqtt_luasocket_copas.receive(conn, size) end

--- Envoie via copas.send.
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:28
---@param conn table Connexion.
---@param data string Données.
---@param i integer|nil Début.
---@param j integer|nil Fin.
function libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j) end

--- Mémorise le délai dans conn.timeout et passe le socket en non bloquant.
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:40
---@param conn table Connexion.
---@param timeout number Secondes.
function libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout) end

--- Appelle conn.sock:shutdown().
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:23
---@param conn table Connexion.
function libs_luamqtt_mqtt_luasocket_copas.shutdown(conn) end

return libs_luamqtt_mqtt_luasocket_copas

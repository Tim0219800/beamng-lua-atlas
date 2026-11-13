---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ngxsocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Connecteur réseau luamqtt pour OpenResty/nginx (ngx.socket.tcp). Inutilisable dans BeamNG : le fichier lit la globale ngx à son chargement, qui n'existe pas dans le jeu. Même interface que les autres connecteurs.
--- Accès : `require("libs/luamqtt/mqtt/ngxsocket")`
---@class libs_luamqtt_mqtt_ngxsocket
local libs_luamqtt_mqtt_ngxsocket = {}

--- Ouvre un socket ngx, se connecte à conn.host:conn.port (timeout très long), fait sslhandshake si conn.secure, stocke dans conn.sock.
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:12
---@param conn table host, port, secure.
---@return boolean  Succès.
---@return string|nil  Erreur.
function libs_luamqtt_mqtt_ngxsocket.connect(conn) end

--- Reçoit size octets.
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:41
---@param conn table Connexion.
---@param size integer Octets.
function libs_luamqtt_mqtt_ngxsocket.receive(conn, size) end

--- Envoie les données (sous-chaîne i..j si i est donné).
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:32
---@param conn table Connexion.
---@param data string Données.
---@param i integer|nil Début.
---@param j integer|nil Fin.
function libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j) end

--- Règle le délai du socket.
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:46
---@param conn table Connexion.
---@param timeout number|nil Secondes.
function libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout) end

--- Ferme le socket.
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:27
---@param conn table Connexion.
function libs_luamqtt_mqtt_ngxsocket.shutdown(conn) end

return libs_luamqtt_mqtt_ngxsocket

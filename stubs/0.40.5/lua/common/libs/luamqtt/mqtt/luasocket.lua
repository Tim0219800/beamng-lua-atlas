---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Connecteur réseau par défaut de luamqtt, basé sur luasocket. Il manipule une table de connexion 'conn' (host, port, sock, timeout) créée par le client MQTT. Chaque fonction prend conn en premier argument ; les erreurs sont renvoyées sous la forme false, 'texte'.
--- Accès : globale `connector`
---@class connector
connector = {}

--- Ouvre une connexion TCP vers conn.host:conn.port via socket.connect et stocke le socket dans conn.sock.
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:11
---@param conn table Table de connexion (host, port).
---@return boolean  true si connecté, false sinon.
---@return string|nil  Message d'erreur.
function connector.connect(conn) end

--- Reçoit exactement size octets (conn.sock:receive).
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:33
---@param conn table Connexion.
---@param size integer Octets à lire.
---@return string|nil  Données.
---@return string|nil  Erreur, ex. 'timeout' ou 'closed'.
function connector.receive(conn, size) end

--- Envoie des données (conn.sock:send).
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:26
---@param conn table Connexion.
---@param data string Données.
---@param i integer|nil Début de sous-chaîne.
---@param j integer|nil Fin de sous-chaîne.
---@return integer|nil  Index du dernier octet envoyé.
---@return string|nil  Erreur.
function connector.send(conn, data, i, j) end

--- Mémorise conn.timeout et règle le délai total du socket (mode 't').
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:44
---@param conn table Connexion.
---@param timeout number|nil Secondes.
function connector.settimeout(conn, timeout) end

--- Ferme la connexion par conn.sock:shutdown().
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:21
---@param conn table Connexion.
function connector.shutdown(conn) end


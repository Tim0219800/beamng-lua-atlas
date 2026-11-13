---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Connecteur réseau luamqtt pour connexions TLS : ouvre un socket TCP via le connecteur luasocket puis l'enveloppe avec ssl.wrap (module luasec ou compatible, nom conn.ssl_module, 'ssl' par défaut) et réalise la poignée de main. send, receive et settimeout sont ceux de luasocket.
--- Accès : globale `connector`
---@class connector
connector = {}

--- Connexion TCP + TLS. Remplace conn.sock par le socket sécurisé.
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:13
---@param conn table host, port, secure_params, ssl_module.
---@return boolean  Succès.
---@return string|nil  Erreur.
function connector.connect(conn) end

--- Identique à luasocket.receive. (assignée dynamiquement)
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connexion.
---@param size integer Octets.
function connector.receive(conn, size) end

--- Identique à luasocket.send. (assignée dynamiquement)
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connexion.
---@param data string Données.
---@param i integer|nil Début.
---@param j integer|nil Fin.
function connector.send(conn, data, i, j) end

--- Identique à luasocket.settimeout. (assignée dynamiquement)
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connexion.
---@param timeout number|nil Secondes.
function connector.settimeout(conn, timeout) end

--- Ferme la connexion avec conn.sock:close().
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:44
---@param conn table Connexion.
function connector.shutdown(conn) end


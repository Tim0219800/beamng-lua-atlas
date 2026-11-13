---@meta
-- tim19Atlas stub generated from lua/common/utils/wsUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils pour les WebSockets du moteur (BNGWebWSServer / BNGWSClient). Fournit createOrGetWS qui crée (ou récupère) un serveur WebSocket et choisit l'adresse IP à donner aux clients, en testant par un aller-retour réel quelles cartes réseau sont joignables. Se charge avec require('utils/wsUtils'). Utilisé par les extensions qui exposent des données à des outils externes.
--- Accès : `require("utils/wsUtils")`
---@class utils_wsUtils
local utils_wsUtils = {}

--- Crée ou récupère un serveur WebSocket (BNGWebWSServer.getOrCreate), détermine l'adresse que les clients doivent utiliser, et active éventuellement les flux de données (server:enableDataStreams).
---Source : lua/common/utils/wsUtils.lua:92
---@param listenAddr string Adresse d'écoute : '0.0.0.0'/'any' (réseau local) ou 'localhost'/127.0.0.1
---@param port integer Port du serveur
---@param path string Chemin WebSocket
---@param protocolName string Nom du protocole WebSocket
---@param redirPage string|nil Page vers laquelle rediriger les requêtes HTTP simples (transmis au moteur)
---@param enableDataStreams boolean|nil true par défaut (nil) : active enableDataStreams sur le serveur
---@param useTLS boolean|nil Seul true active TLS
---@return userdata  Serveur BNGWebWSServer
---@return string  Adresse recommandée pour les clients
function utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS) end

return utils_wsUtils

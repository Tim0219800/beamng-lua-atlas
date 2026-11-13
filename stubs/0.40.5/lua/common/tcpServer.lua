---@meta
-- tim19Atlas stub generated from lua/common/tcpServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur TCP non bloquant servant aux outils externes (chaîne d'outils d'édition, scripts). Utilise ASIO via createNetworkServer s'il est disponible, sinon LuaSocket. Les messages sont des charges JSON précédées d'un en-tête fixe de 8 octets. Un moddeur l'utilise pour dialoguer avec un programme externe : on crée un serveur puis on appelle receiveData() à chaque frame.
--- Accès : `require("tcpServer")`
---@class tcpServer
local tcpServer = {}

--- Interne : accumule les octets reçus d'une connexion dans un tampon, extrait les messages complets (en-tête valide, longueur, terminateur nul), décode le JSON (jsonDecode) et ajoute {connection, données} à res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/tcpServer.lua:141
---@param self any
---@param connection table connexion
---@param dataRaw string octets reçus
---@param res table liste de résultats à compléter
function tcpServer._onDataRaw(self, connection, dataRaw, res) end

--- Ferme toutes les connexions et le socket serveur (LuaSocket) ou détruit le serveur ASIO (destroyNetworkServer), et vide les tampons.
---Source : lua/common/tcpServer.lua:251
---@param self any
function tcpServer.destroy(self) end

--- Crée un serveur TCP écoutant sur le port donné (appel `TCPServer:new(host, port)`). Choisit ASIO si createNetworkServer existe, sinon LuaSocket non bloquant. Renvoie false si LuaSocket ne peut pas se lier.
---Source : lua/common/tcpServer.lua:88
---@param self any
---@param listenHost string adresse d'écoute (LuaSocket), par ex. 'localhost'
---@param port integer port TCP
---@return table|boolean  objet serveur, ou false en cas d'échec
function tcpServer.new(self, listenHost, port) end

--- À appeler régulièrement. Accepte les nouvelles connexions, lit les données disponibles, extrait les messages complets. Renvoie une liste d'entrées {connection, message}.
---Source : lua/common/tcpServer.lua:186
---@param self any
---@return table[]  liste de {connection, message | 'disconnect'[, erreur]}
function tcpServer.receiveData(self) end

--- Envoie un message JSON (en-tête BN01 + taille + JSON + '\0') sur une connexion. Si recData.context existe, il est copié dans sendData.context pour la réponse (puis retiré de sendData).
---Source : lua/common/tcpServer.lua:123
---@param self any
---@param connection table connexion (premier élément d'une entrée de receiveData)
---@param sendData table message à encoder en JSON
---@param recData table|nil message reçu auquel on répond (pour recopier context)
function tcpServer.send(self, connection, sendData, recData) end

return tcpServer

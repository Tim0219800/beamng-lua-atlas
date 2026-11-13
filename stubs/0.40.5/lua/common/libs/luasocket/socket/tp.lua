---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/tp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce LuaSocket (Diego Nehab) : sous-système commun aux protocoles texte SMTP/FTP (« Telnet-like Protocol »). `connect` ouvre une connexion TCP et renvoie un objet dont les méthodes lisent les réponses du serveur à code numérique à trois chiffres (réponses multilignes comprises) et envoient des commandes. Utilisé par socket.smtp.
--- Accès : `require("libs/luasocket/socket/tp")`
---@class libs_luasocket_socket_tp
---@field TIMEOUT number Délai par défaut des opérations réseau en secondes (60).
local libs_luasocket_socket_tp = {}

--- Crée un socket (create ou socket.tcp), fixe le délai, se connecte et renvoie l'objet de contrôle. En cas d'échec, ferme le socket et renvoie nil et l'erreur.
---Source : lua/common/libs/luasocket/socket/tp.lua:114
---@param host string Hôte du serveur.
---@param port integer Port du serveur.
---@param timeout number|nil Délai en secondes ; défaut TIMEOUT.
---@param create function|nil Fabrique de socket ; défaut socket.tcp.
---@return table|nil  Objet de contrôle du protocole, ou nil.
---@return string|nil  Message d'erreur.
function libs_luasocket_socket_tp.connect(host, port, timeout, create) end

return libs_luasocket_socket_tp

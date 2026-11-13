---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée de la bibliothèque tierce luamqtt (xHasKx, version 3.4.3 d'après le champ _VERSION), client MQTT 3.1.1 et 5.0 en Lua pur. Le module renvoie la table 'mqtt' avec les constantes de version, la création de client, et des boucles d'exécution (ioloop partagé ou synchrone). Utile à un moddeur qui veut échanger avec un broker MQTT depuis le jeu.
--- Accès : globale `luamqtt_VERSION`
---@class luamqtt_VERSION
---@field get_ioloop function Alias de ioloop.get : renvoie l'instance d'ioloop par défaut (créée si besoin).
luamqtt_VERSION = {}

--- Crée un client MQTT (équivalent de mqtt.client.create).
---Source : lua/common/libs/luamqtt/mqtt/init.lua:43
---@param ... table Table d'arguments de client_mt:__init (uri, clean, version, id, username, password, secure, will, keep_alive, reconnect, connector, ssl_module).
---@return table  Instance de client MQTT.
function luamqtt_VERSION.client(...) end

--- Ajoute les clients (ou fonctions de boucle) à l'ioloop par défaut, lance start_connecting() sur chaque client, puis exécute l'ioloop tant qu'il reste au moins un client.
---Source : lua/common/libs/luamqtt/mqtt/init.lua:55
---@param ... table|function Clients MQTT ou fonctions appelées à chaque itération.
function luamqtt_VERSION.run_ioloop(...) end

--- Boucle synchrone pour un seul client : ouvre la connexion puis itère tant que cl.connection existe. Pas de reconnexion ni de keep_alive.
---Source : lua/common/libs/luamqtt/mqtt/init.lua:71
---@param cl table Client MQTT.
---@return boolean|nil  false et le message d'erreur en cas d'échec.
function luamqtt_VERSION.run_sync(cl) end


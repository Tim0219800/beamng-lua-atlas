---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/client.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client MQTT (3.1.1 ou 5.0) de la bibliothèque luamqtt. Gère la connexion à un broker via un connecteur (luasocket par défaut), l'envoi/réception de paquets, publish/subscribe/unsubscribe, les acquittements QoS 1 et 2, le keep_alive (PINGREQ), la reconnexion automatique et des événements utilisateur enregistrés avec on(). Le client est piloté soit par un ioloop (ioloop.lua), soit en synchrone (mqtt.run_sync).
--- Accès : `require("libs/luamqtt/mqtt/client")`
---@class libs_luamqtt_mqtt_client
local libs_luamqtt_mqtt_client = {}

--- Crée, initialise et renvoie une instance de client MQTT. Si un ioloop par défaut existe déjà et tourne, le client y est ajouté et la connexion démarre.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1197
---@param ... table Table d'arguments de client_mt:__init.
---@return table  Instance client_mt.
function libs_luamqtt_mqtt_client.create(...) end

--- Instance de client MQTT renvoyée par create. Champs notables : args (arguments validés), handlers (callbacks par événement), connection (table de connexion, nil si déconnecté).
---@class libs_luamqtt_mqtt_client_client_mt
local libs_luamqtt_mqtt_client_client_mt = {}

--- Appelé par le ramasse-miettes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1183
function libs_luamqtt_mqtt_client_client_mt:__gc() end

--- Valide les arguments de création (uri 'hôte[:port]', clean, version 4/5, id, username, password, secure, will{topic,payload,qos,retain}, keep_alive, reconnect, connector, ssl_module, properties, user_properties) et initialise les handlers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:87
---@param args table Arguments de création.
function libs_luamqtt_mqtt_client_client_mt:__init(args) end

--- Représentation texte du client.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1178
function libs_luamqtt_mqtt_client_client_mt:__tostring() end

--- Applique le délai réseau de l'ioloop à une connexion déjà établie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1054
function libs_luamqtt_mqtt_client_client_mt:_apply_network_timeout() end

--- Construit conn.secure_params d'après les arguments de création.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1121
---@param args any
---@param conn any
function libs_luamqtt_mqtt_client_client_mt._apply_secure(args, conn) end

--- Attribue le prochain identifiant de paquet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:866
---@param pargs any
function libs_luamqtt_mqtt_client_client_mt:_assign_packet_id(pargs) end

--- Effectue une itération d'E/S : réception du paquet suivant et déclenchement des événements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:948
---@param recv any
function libs_luamqtt_mqtt_client_client_mt:_io_iteration(recv) end

--- Une itération d'E/S appelée par l'ioloop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:891
function libs_luamqtt_mqtt_client_client_mt:_ioloop_iteration() end

--- Remplit conn.host et conn.port d'après args.uri (port 1883, ou 8883 en sécurisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1102
---@param args any
---@param conn any
function libs_luamqtt_mqtt_client_client_mt._parse_uri(args, conn) end

--- Reçoit un paquet de la connexion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1164
function libs_luamqtt_mqtt_client_client_mt:_receive_packet() end

--- Envoie un paquet sur la connexion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:1140
---@param packet any
function libs_luamqtt_mqtt_client_client_mt:_send_packet(packet) end

--- Une itération d'E/S appelée par la boucle synchrone (mqtt.run_sync).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:881
function libs_luamqtt_mqtt_client_client_mt:_sync_iteration() end

--- Acquitte un message PUBLISH reçu (PUBACK, ou PUBREC pour QoS 2).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:492
---@param msg table Paquet PUBLISH reçu.
---@param rc integer Code de raison (MQTT 5, défaut 0).
---@param properties table Propriétés.
---@param user_properties table Propriétés utilisateur.
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge(msg, rc, properties, user_properties) end

--- Envoie PUBCOMP (dernière phase d'un échange QoS 2).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:820
---@param packet_id integer Identifiant de paquet.
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge_pubcomp(packet_id) end

--- Envoie PUBREL (deuxième phase d'un échange QoS 2).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:797
---@param packet_id integer Identifiant de paquet.
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge_pubrel(packet_id) end

--- Envoie un paquet AUTH (MQTT 5.0).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:602
---@param rc integer Code de raison (défaut 0).
---@param properties table Propriétés.
---@param user_properties table Propriétés utilisateur.
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:auth(rc, properties, user_properties) end

--- Ferme immédiatement la connexion réseau, sans DISCONNECT. Déclenche l'événement close ; peut programmer une reconnexion si reconnect est actif.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:636
---@param reason string|nil Texte de la raison.
function libs_luamqtt_mqtt_client_client_mt:close_connection(reason) end

--- Envoie DISCONNECT au broker puis ferme la connexion.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:563
---@param rc integer Code de raison MQTT 5 (défaut 0).
---@param properties table Propriétés.
---@param user_properties table Propriétés utilisateur.
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:disconnect(rc, properties, user_properties) end

--- Appelle les handlers enregistrés pour un événement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luamqtt/mqtt/client.lua:842
---@param event string Nom de l'événement.
---@param ... any Arguments transmis aux handlers.
function libs_luamqtt_mqtt_client_client_mt:handle(event, ...) end

--- Retire un handler d'un événement.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:268
---@param event string Nom de l'événement.
---@param func function Handler à retirer.
function libs_luamqtt_mqtt_client_client_mt:off(event, func) end

--- Ajoute des handlers d'événements : on(nom, fonction) ou on({nom1 = f1, nom2 = f2}). Lève une erreur si le nom d'événement est invalide.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:234
---@param ... string|table, function|nil (event_name, function) ou table d'événements.
function libs_luamqtt_mqtt_client_client_mt:on(...) end

--- Ouvre la connexion réseau vers le broker via le connecteur.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:710
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:open_connection() end

--- Publie un message.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:425
---@param args table topic, payload, qos (défaut 0), retain (défaut false), dup (défaut false), properties, user_properties, callback (appelé à l'acquittement).
---@return boolean|integer  true ou identifiant de paquet ; false et message en cas d'échec.
function libs_luamqtt_mqtt_client_client_mt:publish(args) end

--- Envoie le paquet CONNECT sur la connexion ouverte.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:751
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:send_connect() end

--- Envoie un PINGREQ (keep_alive).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:685
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:send_pingreq() end

--- Associe ou dissocie (nil) le client d'un ioloop ; appelé par ioloop:add/remove.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:790
---@param loop table|nil Instance ioloop.
function libs_luamqtt_mqtt_client_client_mt:set_ioloop(loop) end

--- Démarre la connexion au broker (ouverture réseau puis CONNECT).
---Source : lua/common/libs/luamqtt/mqtt/client.lua:663
---@return boolean  true, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:start_connecting() end

--- S'abonne à un topic. Renvoie l'identifiant de paquet SUBSCRIBE ; le callback est appelé quand l'abonnement est confirmé.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:296
---@param args table topic, qos (défaut 0), no_local / retain_as_published / retain_handling / properties / user_properties (MQTT 5 seulement), callback.
---@return integer|boolean  Identifiant de paquet, ou false et message d'erreur.
function libs_luamqtt_mqtt_client_client_mt:subscribe(args) end

--- Se désabonne d'un topic ; callback appelé quand le broker confirme.
---Source : lua/common/libs/luamqtt/mqtt/client.lua:364
---@param args table topic, properties, user_properties, callback.
---@return integer|boolean  Identifiant de paquet, ou false et message.
function libs_luamqtt_mqtt_client_client_mt:unsubscribe(args) end

return libs_luamqtt_mqtt_client

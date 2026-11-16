# `libs_luamqtt_mqtt_client`

*Fichier : `lua/common/libs/luamqtt/mqtt/client.lua` · VM : Commun (GE + véhicule) · 1209 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/client")`

Client MQTT (3.1.1 ou 5.0) de la bibliothèque luamqtt. Gère la connexion à un broker via un connecteur (luasocket par défaut), l'envoi/réception de paquets, publish/subscribe/unsubscribe, les acquittements QoS 1 et 2, le keep_alive (PINGREQ), la reconnexion automatique et des événements utilisateur enregistrés avec on(). Le client est piloté soit par un ioloop (ioloop.lua), soit en synchrone (mqtt.run_sync).

## Exemple

```lua
local client = require('libs/luamqtt/mqtt/client')
local cl = client.create({uri = 'broker.local:1883', clean = true, id = 'beamng'})
cl:on('message', function(msg, c) print(msg.topic, msg.payload) end)
cl:on('connect', function(pkt, c) c:subscribe({topic = 'test/#'}) end)
require('libs/luamqtt/mqtt/ioloop').get():add(cl); cl:start_connecting()
```

## Remarques

- Événements acceptés par on() : connect, subscribe, unsubscribe, message, acknowledge, error, close, auth. Un autre nom lève une erreur.
- Signatures des handlers : connect(packet, client), subscribe(packet, client), unsubscribe(packet, client), message(packet, client), acknowledge(packet, client), auth(packet, client), error(err, client[, packet]), close(conn, client).
- Arguments de création (clés autorisées uniquement) : uri, clean (obligatoires), version (4 ou 5), id, username, password, secure, will, keep_alive (défaut 60 s), properties, user_properties, reconnect, connector, ssl_module. Une clé inconnue lève une erreur.
- Sans id fourni, un identifiant aléatoire 'luamqtt-v<version>-<hex>' est généré.
- Les fonctions d'erreur réseau renvoient false et un message ; les arguments de mauvais type lèvent une exception.
- Les méthodes préfixées par _ sont internes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_client.create(...)` | Crée, initialise et renvoie une instance de client MQTT. Si un ioloop par défaut existe déjà et tourne, le client y est ajouté et la connexion démarre. | 1197 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_client.create(...)`

Crée, initialise et renvoie une instance de client MQTT. Si un ioloop par défaut existe déjà et tourne, le client y est ajouté et la connexion démarre.

- `...` (*table*) : Table d'arguments de client_mt:__init.
- **renvoie** : table Instance client_mt.

## Classe `client_mt`

Instance de client MQTT renvoyée par create. Champs notables : args (arguments validés), handlers (callbacks par événement), connection (table de connexion, nil si déconnecté).

| Méthode | Description | Ligne |
|---|---|---|
| `client_mt:__gc()` | Appelé par le ramasse-miettes. | 1183 |
| `client_mt:__init(args)` | Valide les arguments de création (uri 'hôte[:port]', clean, version 4/5, id, username, password, secure, will{topic,payload,qos,retain}, keep_alive, reconnect, connector, ssl_module, properties, user_properties) et initialise les handlers. | 87 |
| `client_mt:__tostring()` | Représentation texte du client. | 1178 |
| `client_mt:_apply_network_timeout()` | Applique le délai réseau de l'ioloop à une connexion déjà établie. | 1054 |
| `client_mt._apply_secure(args, conn)` | Construit conn.secure_params d'après les arguments de création. | 1121 |
| `client_mt:_assign_packet_id(pargs)` | Attribue le prochain identifiant de paquet. | 866 |
| `client_mt:_io_iteration(recv)` | Effectue une itération d'E/S : réception du paquet suivant et déclenchement des événements. | 948 |
| `client_mt:_ioloop_iteration()` | Une itération d'E/S appelée par l'ioloop. | 891 |
| `client_mt._parse_uri(args, conn)` | Remplit conn.host et conn.port d'après args.uri (port 1883, ou 8883 en sécurisé). | 1102 |
| `client_mt:_receive_packet()` | Reçoit un paquet de la connexion. | 1164 |
| `client_mt:_send_packet(packet)` | Envoie un paquet sur la connexion. | 1140 |
| `client_mt:_sync_iteration()` | Une itération d'E/S appelée par la boucle synchrone (mqtt.run_sync). | 881 |
| `client_mt:acknowledge(msg, rc, properties, user_properties)` | Acquitte un message PUBLISH reçu (PUBACK, ou PUBREC pour QoS 2). | 492 |
| `client_mt:acknowledge_pubcomp(packet_id)` | Envoie PUBCOMP (dernière phase d'un échange QoS 2). | 820 |
| `client_mt:acknowledge_pubrel(packet_id)` | Envoie PUBREL (deuxième phase d'un échange QoS 2). | 797 |
| `client_mt:auth(rc, properties, user_properties)` | Envoie un paquet AUTH (MQTT 5.0). | 602 |
| `client_mt:close_connection(reason)` | Ferme immédiatement la connexion réseau, sans DISCONNECT. Déclenche l'événement close ; peut programmer une reconnexion si reconnect est actif. | 636 |
| `client_mt:disconnect(rc, properties, user_properties)` | Envoie DISCONNECT au broker puis ferme la connexion. | 563 |
| `client_mt:handle(event, ...)` | Appelle les handlers enregistrés pour un événement. | 842 |
| `client_mt:off(event, func)` | Retire un handler d'un événement. | 268 |
| `client_mt:on(...)` | Ajoute des handlers d'événements : on(nom, fonction) ou on({nom1 = f1, nom2 = f2}). Lève une erreur si le nom d'événement est invalide. | 234 |
| `client_mt:open_connection()` | Ouvre la connexion réseau vers le broker via le connecteur. | 710 |
| `client_mt:publish(args)` | Publie un message. | 425 |
| `client_mt:send_connect()` | Envoie le paquet CONNECT sur la connexion ouverte. | 751 |
| `client_mt:send_pingreq()` | Envoie un PINGREQ (keep_alive). | 685 |
| `client_mt:set_ioloop(loop)` | Associe ou dissocie (nil) le client d'un ioloop ; appelé par ioloop:add/remove. | 790 |
| `client_mt:start_connecting()` | Démarre la connexion au broker (ouverture réseau puis CONNECT). | 663 |
| `client_mt:subscribe(args)` | S'abonne à un topic. Renvoie l'identifiant de paquet SUBSCRIBE ; le callback est appelé quand l'abonnement est confirmé. | 296 |
| `client_mt:unsubscribe(args)` | Se désabonne d'un topic ; callback appelé quand le broker confirme. | 364 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/client.lua`.*

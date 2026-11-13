# `libs_luamqtt_mqtt_protocol4`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol4.lua` · VM : Commun (GE + véhicule) · 428 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol4")`

Implémentation du protocole MQTT 3.1.1 de luamqtt : construction (make_packet) et analyse (parse_packet) des paquets. Chargé par client.lua quand la version 4 est utilisée (défaut).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol4.make_packet(args)` | Construit un paquet à partir d'une table d'arguments dont le champ type est un packet_type (CONNECT, PUBLISH, SUBSCRIBE…). | 280 |
| `libs_luamqtt_mqtt_protocol4.parse_packet(read_func)` | Analyse un paquet reçu à l'aide de read_func. | 313 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_protocol4.make_packet(args)`

Construit un paquet à partir d'une table d'arguments dont le champ type est un packet_type (CONNECT, PUBLISH, SUBSCRIBE…).

- `args` (*table*) : type et champs propres au paquet.
- **renvoie** : table|boolean Paquet combiné prêt à envoyer, ou false et un message d'erreur.

#### `libs_luamqtt_mqtt_protocol4.parse_packet(read_func)`

Analyse un paquet reçu à l'aide de read_func.

- `read_func` (*function*) : Fonction de lecture de n octets.
- **renvoie** : table|boolean Paquet analysé (métatable packet_mt), ou false et un message d'erreur.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol4.lua`.*

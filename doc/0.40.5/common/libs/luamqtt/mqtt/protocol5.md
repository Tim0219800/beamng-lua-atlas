# `libs_luamqtt_mqtt_protocol5`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol5.lua` · VM : Commun (GE + véhicule) · 1040 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol5")`

Implémentation du protocole MQTT 5.0 de luamqtt : construction (make_packet) et analyse (parse_packet) des paquets, avec propriétés et propriétés utilisateur, codes de raison et paquet AUTH. Chargé par client.lua quand la version 5 est demandée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol5.make_packet(args)` | Construit un paquet MQTT 5 à partir d'une table d'arguments dont le champ type est un packet_type ; gère properties et user_properties. | 687 |
| `libs_luamqtt_mqtt_protocol5.parse_packet(read_func)` | Analyse un paquet MQTT 5 reçu à l'aide de read_func. | 806 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_protocol5.make_packet(args)`

Construit un paquet MQTT 5 à partir d'une table d'arguments dont le champ type est un packet_type ; gère properties et user_properties.

- `args` (*table*) : type et champs propres au paquet.
- **renvoie** : table|boolean Paquet combiné prêt à envoyer, ou false et un message d'erreur.

#### `libs_luamqtt_mqtt_protocol5.parse_packet(read_func)`

Analyse un paquet MQTT 5 reçu à l'aide de read_func.

- `read_func` (*function*) : Fonction de lecture de n octets.
- **renvoie** : table|boolean Paquet analysé, ou false et un message d'erreur.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol5.lua`.*

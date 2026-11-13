# `libs_luamqtt_mqtt_protocol5`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol5.lua` · VM : Commun (GE + véhicule) · 1040 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol5")`

Here is a MQTT v5.0 protocol implementation

MQTT v5.0 documentation (DOC):
	http://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol5.make_packet(args)` | Create packet of given {type: number} in args | 687 |
| `libs_luamqtt_mqtt_protocol5.parse_packet(read_func)` | Parse packet using given read_func<br> Returns packet on success or false and error message on failure | 806 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol5.lua`.*

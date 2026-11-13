# `libs_luamqtt_mqtt_protocol4`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol4.lua` · VM : Commun (GE + véhicule) · 428 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol4")`

Here is a MQTT v3.1.1 protocol implementation

MQTT v3.1.1 documentation (DOC):
	http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol4.make_packet(args)` | Create packet of given {type: number} in args | 280 |
| `libs_luamqtt_mqtt_protocol4.parse_packet(read_func)` | Parse packet using given read_func<br> Returns packet on success or false and error message on failure | 313 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol4.lua`.*

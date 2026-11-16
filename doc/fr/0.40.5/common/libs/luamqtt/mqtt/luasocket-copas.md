# `libs_luamqtt_mqtt_luasocket_copas`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua` · VM : Commun (GE + véhicule) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/luasocket-copas")`

Connecteur réseau luamqtt pour luasocket combiné à copas (E/S coopératives dans des coroutines). Même interface que le connecteur luasocket (connect, shutdown, send, receive, settimeout) mais send et receive passent par copas.send/copas.receive. À passer dans l'argument connector du client MQTT.

## Remarques

- Utilise require('copas') par nom nu et require('socket') : ces modules ne sont pas forcément résolus par ce nom dans BeamNG (le jeu fournit libs/copas/copas).
- settimeout met le socket en mode non bloquant (settimeout(0)) et ne mémorise le délai que dans conn.timeout.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_luasocket_copas.connect(conn)` | Ouvre la connexion TCP via socket.connect et la stocke dans conn.sock. | 13 |
| `libs_luamqtt_mqtt_luasocket_copas.receive(conn, size)` | Reçoit size octets via copas.receive. | 34 |
| `libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j)` | Envoie via copas.send. | 28 |
| `libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout)` | Mémorise le délai dans conn.timeout et passe le socket en non bloquant. | 40 |
| `libs_luamqtt_mqtt_luasocket_copas.shutdown(conn)` | Appelle conn.sock:shutdown(). | 23 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_luasocket_copas.connect(conn)`

Ouvre la connexion TCP via socket.connect et la stocke dans conn.sock.

- `conn` (*table*) : host, port.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Erreur.

#### `libs_luamqtt_mqtt_luasocket_copas.receive(conn, size)`

Reçoit size octets via copas.receive.

- `conn` (*table*) : Connexion.
- `size` (*integer*) : Octets.

#### `libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j)`

Envoie via copas.send.

- `conn` (*table*) : Connexion.
- `data` (*string*) : Données.
- `i` (*integer|nil*) : Début.
- `j` (*integer|nil*) : Fin.

#### `libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout)`

Mémorise le délai dans conn.timeout et passe le socket en non bloquant.

- `conn` (*table*) : Connexion.
- `timeout` (*number*) : Secondes.

#### `libs_luamqtt_mqtt_luasocket_copas.shutdown(conn)`

Appelle conn.sock:shutdown().

- `conn` (*table*) : Connexion.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua`.*

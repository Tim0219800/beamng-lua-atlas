# `libs_luamqtt_mqtt_ngxsocket`

*Fichier : `lua/common/libs/luamqtt/mqtt/ngxsocket.lua` · VM : Commun (GE + véhicule) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/ngxsocket")`

Connecteur réseau luamqtt pour OpenResty/nginx (ngx.socket.tcp). Inutilisable dans BeamNG : le fichier lit la globale ngx à son chargement, qui n'existe pas dans le jeu. Même interface que les autres connecteurs.

## Remarques

- Le chargement du module lève une erreur hors OpenResty (ngx est nil : ngx.socket.tcp).
- settimeout convertit les secondes en millisecondes ; sans délai, il utilise 0x7FFFFFFF.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_ngxsocket.connect(conn)` | Ouvre un socket ngx, se connecte à conn.host:conn.port (timeout très long), fait sslhandshake si conn.secure, stocke dans conn.sock. | 12 |
| `libs_luamqtt_mqtt_ngxsocket.receive(conn, size)` | Reçoit size octets. | 41 |
| `libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j)` | Envoie les données (sous-chaîne i..j si i est donné). | 32 |
| `libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout)` | Règle le délai du socket. | 46 |
| `libs_luamqtt_mqtt_ngxsocket.shutdown(conn)` | Ferme le socket. | 27 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_ngxsocket.connect(conn)`

Ouvre un socket ngx, se connecte à conn.host:conn.port (timeout très long), fait sslhandshake si conn.secure, stocke dans conn.sock.

- `conn` (*table*) : host, port, secure.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Erreur.

#### `libs_luamqtt_mqtt_ngxsocket.receive(conn, size)`

Reçoit size octets.

- `conn` (*table*) : Connexion.
- `size` (*integer*) : Octets.

#### `libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j)`

Envoie les données (sous-chaîne i..j si i est donné).

- `conn` (*table*) : Connexion.
- `data` (*string*) : Données.
- `i` (*integer|nil*) : Début.
- `j` (*integer|nil*) : Fin.

#### `libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout)`

Règle le délai du socket.

- `conn` (*table*) : Connexion.
- `timeout` (*number|nil*) : Secondes.

#### `libs_luamqtt_mqtt_ngxsocket.shutdown(conn)`

Ferme le socket.

- `conn` (*table*) : Connexion.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/ngxsocket.lua`.*

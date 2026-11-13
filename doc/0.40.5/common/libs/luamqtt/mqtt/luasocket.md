# `connector`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket.lua` · VM : Commun (GE + véhicule) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `connector`

Connecteur réseau par défaut de luamqtt, basé sur luasocket. Il manipule une table de connexion 'conn' (host, port, sock, timeout) créée par le client MQTT. Chaque fonction prend conn en premier argument ; les erreurs sont renvoyées sous la forme false, 'texte'.

## Remarques

- Utilise require('socket') (module luasocket par nom nu).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `connector.connect(conn)` | Ouvre une connexion TCP vers conn.host:conn.port via socket.connect et stocke le socket dans conn.sock. | 11 |
| `connector.receive(conn, size)` | Reçoit exactement size octets (conn.sock:receive). | 33 |
| `connector.send(conn, data, i, j)` | Envoie des données (conn.sock:send). | 26 |
| `connector.settimeout(conn, timeout)` | Mémorise conn.timeout et règle le délai total du socket (mode 't'). | 44 |
| `connector.shutdown(conn)` | Ferme la connexion par conn.sock:shutdown(). | 21 |

### Détail des paramètres

#### `connector.connect(conn)`

Ouvre une connexion TCP vers conn.host:conn.port via socket.connect et stocke le socket dans conn.sock.

- `conn` (*table*) : Table de connexion (host, port).
- **renvoie** : boolean true si connecté, false sinon.
- **renvoie** : string|nil Message d'erreur.

#### `connector.receive(conn, size)`

Reçoit exactement size octets (conn.sock:receive).

- `conn` (*table*) : Connexion.
- `size` (*integer*) : Octets à lire.
- **renvoie** : string|nil Données.
- **renvoie** : string|nil Erreur, ex. 'timeout' ou 'closed'.

#### `connector.send(conn, data, i, j)`

Envoie des données (conn.sock:send).

- `conn` (*table*) : Connexion.
- `data` (*string*) : Données.
- `i` (*integer|nil*) : Début de sous-chaîne.
- `j` (*integer|nil*) : Fin de sous-chaîne.
- **renvoie** : integer|nil Index du dernier octet envoyé.
- **renvoie** : string|nil Erreur.

#### `connector.settimeout(conn, timeout)`

Mémorise conn.timeout et règle le délai total du socket (mode 't').

- `conn` (*table*) : Connexion.
- `timeout` (*number|nil*) : Secondes.

#### `connector.shutdown(conn)`

Ferme la connexion par conn.sock:shutdown().

- `conn` (*table*) : Connexion.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket.lua`.*

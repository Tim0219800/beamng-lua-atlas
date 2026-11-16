# `connector`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua` · VM : Commun (GE + véhicule) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `connector`

Connecteur réseau luamqtt pour connexions TLS : ouvre un socket TCP via le connecteur luasocket puis l'enveloppe avec ssl.wrap (module luasec ou compatible, nom conn.ssl_module, 'ssl' par défaut) et réalise la poignée de main. send, receive et settimeout sont ceux de luasocket.

## Remarques

- Nécessite le module 'ssl' (luasec), probablement absent du jeu : require('ssl') échouerait.
- connect exige conn.secure_params (table), rempli par le client à partir de l'argument secure.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `connector.connect(conn)` | Connexion TCP + TLS. Remplace conn.sock par le socket sécurisé. | 13 |
| `connector.receive(conn, size)` | Identique à luasocket.receive. (assignée dynamiquement) | dyn |
| `connector.send(conn, data, i, j)` | Identique à luasocket.send. (assignée dynamiquement) | dyn |
| `connector.settimeout(conn, timeout)` | Identique à luasocket.settimeout. (assignée dynamiquement) | dyn |
| `connector.shutdown(conn)` | Ferme la connexion avec conn.sock:close(). | 44 |

### Détail des paramètres

#### `connector.connect(conn)`

Connexion TCP + TLS. Remplace conn.sock par le socket sécurisé.

- `conn` (*table*) : host, port, secure_params, ssl_module.
- **renvoie** : boolean Succès.
- **renvoie** : string|nil Erreur.

#### `connector.receive(conn, size)`

Identique à luasocket.receive. (assignée dynamiquement)

- `conn` (*table*) : Connexion.
- `size` (*integer*) : Octets.

#### `connector.send(conn, data, i, j)`

Identique à luasocket.send. (assignée dynamiquement)

- `conn` (*table*) : Connexion.
- `data` (*string*) : Données.
- `i` (*integer|nil*) : Début.
- `j` (*integer|nil*) : Fin.

#### `connector.settimeout(conn, timeout)`

Identique à luasocket.settimeout. (assignée dynamiquement)

- `conn` (*table*) : Connexion.
- `timeout` (*number|nil*) : Secondes.

#### `connector.shutdown(conn)`

Ferme la connexion avec conn.sock:close().

- `conn` (*table*) : Connexion.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua`.*

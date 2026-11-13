# `libs_lua_websockets_websocket_tools`

*Fichier : `lua/common/libs/lua-websockets/websocket/tools.lua` · VM : Commun (GE + véhicule) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/tools")`

Utilitaires de lua-websockets : lecture/écriture d'entiers 8/16/32 bits en gros-boutiste, SHA-1 (via la bibliothèque 'crypto' si présente, sinon une implémentation en Lua), base64 (via le module luasocket 'mime'), analyse d'URL ws:// et génération de la clé Sec-WebSocket-Key.

## Remarques

- Le module appelle math.randomseed(os.time()) au chargement : cela réinitialise la graine aléatoire globale (effet de bord sur math.random pour tout le reste de la VM).
- Utilise require'mime' (nom global, pas un chemin libs/) ; il faut que ce module soit trouvable.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_tools.generate_key()` | Génère une clé Sec-WebSocket-Key : 16 octets aléatoires (math.random) en base64. | 180 |
| `libs_lua_websockets_websocket_tools.parse_url(url)` | Décompose une URL ws:// ou wss://. Port par défaut 80 (ws) ou 443 (wss) ; uri par défaut '/'. Lève une erreur si l'URL est invalide. | 167 |
| `libs_lua_websockets_websocket_tools.read_int16(str, pos)` | Lit un entier 16 bits gros-boutiste. | 27 |
| `libs_lua_websockets_websocket_tools.read_int32(str, pos)` | Lit un entier 32 bits gros-boutiste. | 32 |
| `libs_lua_websockets_websocket_tools.read_int8(str, pos)` | Lit un octet. | 23 |
| `libs_lua_websockets_websocket_tools.write_int16(v)` | Écrit un entier 16 bits gros-boutiste sur 2 octets. | 45 |
| `libs_lua_websockets_websocket_tools.write_int32(v)` | Écrit un entier 32 bits gros-boutiste sur 4 octets. | 49 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_tools.generate_key()`

Génère une clé Sec-WebSocket-Key : 16 octets aléatoires (math.random) en base64.

- **renvoie** : string Clé.

#### `libs_lua_websockets_websocket_tools.parse_url(url)`

Décompose une URL ws:// ou wss://. Port par défaut 80 (ws) ou 443 (wss) ; uri par défaut '/'. Lève une erreur si l'URL est invalide.

- `url` (*string*) : URL.
- **renvoie** : string Protocole en minuscules.
- **renvoie** : string Hôte.
- **renvoie** : integer Port.
- **renvoie** : string URI.

#### `libs_lua_websockets_websocket_tools.read_int16(str, pos)`

Lit un entier 16 bits gros-boutiste.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position.
- **renvoie** : integer Nouvelle position.
- **renvoie** : integer Valeur.

#### `libs_lua_websockets_websocket_tools.read_int32(str, pos)`

Lit un entier 32 bits gros-boutiste.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position.
- **renvoie** : integer Nouvelle position.
- **renvoie** : integer Valeur.

#### `libs_lua_websockets_websocket_tools.read_int8(str, pos)`

Lit un octet.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position (défaut 1).
- **renvoie** : integer Nouvelle position.
- **renvoie** : integer Valeur.

#### `libs_lua_websockets_websocket_tools.write_int16(v)`

Écrit un entier 16 bits gros-boutiste sur 2 octets.

- `v` (*integer*) : Valeur.
- **renvoie** : string 2 octets.

#### `libs_lua_websockets_websocket_tools.write_int32(v)`

Écrit un entier 32 bits gros-boutiste sur 4 octets.

- `v` (*integer*) : Valeur.
- **renvoie** : string 4 octets.

## Champs

| Champ | Type | Description |
|---|---|---|
| `base64` | table | Table avec encode(data) -> chaîne base64 (mime.b64). |
| `sha1` | function | Fonction SHA-1 : crypto.digest si disponible, sinon l'implémentation maison ; renvoie 20 octets bruts. |
| `write_int8` | function | Alias de string.char : écrit un ou plusieurs octets. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/tools.lua`.*

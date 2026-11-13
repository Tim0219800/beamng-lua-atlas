# `libs_luasocket_socket_url`

*Fichier : `lua/common/libs/luasocket/socket/url.lua` · VM : Commun (GE + véhicule) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/url")`

Bibliothèque tierce LuaSocket (Diego Nehab), version « URL 1.0.3 » : analyse, composition et résolution d'URL relatives selon la RFC 2396. Utile pour découper une URL en scheme/authority/userinfo/host/port/path/params/query/fragment, la reconstruire, encoder/décoder les caractères réservés (%XX) et manipuler les segments de chemin.

## Exemple

```lua
local url = require('socket.url')
local p = url.parse('http://user:pw@example.com:8080/a/b;p?x=1#frag')
print(p.host, p.port, p.path, p.query)  -- example.com 8080 /a/b x=1
print(url.absolute('http://example.com/a/b', '../c'))
```

## Remarques

- Le module est déclaré localement (`_M`) ; le fichier est chargé via `require` depuis le code qui en a besoin.
- `parse` renvoie nil et "invalid url" pour une chaîne vide ; l'authority IPv6 entre crochets est reconnue (host sans les crochets).
- Le commentaire de `unescape` dans le source est une copie de celui d'`escape` : `unescape` décode bien les séquences %XX.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_url.absolute(base_url, relative_url)` | Construit une URL absolue à partir d'une URL de base et d'une URL relative (RFC 2396). | 221 |
| `libs_luasocket_socket_url.build(parsed)` | Reconstruit une URL à partir d'une table du type renvoyé par parse ; les composants contenant des caractères réservés sont protégés. | 185 |
| `libs_luasocket_socket_url.build_path(parsed, unsafe)` | Recompose un chemin à partir de ses segments en échappant les caractères protégés. | 281 |
| `libs_luasocket_socket_url.escape(s)` | Encode une chaîne binaire en remplaçant chaque octet non alphanumérique par sa représentation %XX. | 30 |
| `libs_luasocket_socket_url.parse(url, default)` | Découpe une URL en table avec les champs scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (seuls ceux présents sont remplis). Le '/' initial du chemin fait partie de path. | 126 |
| `libs_luasocket_socket_url.parse_path(path)` | Découpe un chemin en segments (désencodés) ; un chemin commençant par '/' donne un champ is_absolute. | 260 |
| `libs_luasocket_socket_url.unescape(s)` | Décode les séquences %XX d'une chaîne en octets. | 73 |

### Détail des paramètres

#### `libs_luasocket_socket_url.absolute(base_url, relative_url)`

Construit une URL absolue à partir d'une URL de base et d'une URL relative (RFC 2396).

- `base_url` (*string|table*) : URL de base (chaîne ou table issue de parse).
- `relative_url` (*string|table*) : URL relative (chaîne ou table issue de parse).
- **renvoie** : string URL absolue correspondante.

#### `libs_luasocket_socket_url.build(parsed)`

Reconstruit une URL à partir d'une table du type renvoyé par parse ; les composants contenant des caractères réservés sont protégés.

- `parsed` (*table*) : Parties de l'URL.
- **renvoie** : string URL composée.

#### `libs_luasocket_socket_url.build_path(parsed, unsafe)`

Recompose un chemin à partir de ses segments en échappant les caractères protégés.

- `parsed` (*table*) : Segments du chemin (comme renvoyé par parse_path).
- `unsafe` (*boolean|nil*) : Si true, les segments ne sont pas protégés avant composition.
- **renvoie** : string Chemin composé.

#### `libs_luasocket_socket_url.escape(s)`

Encode une chaîne binaire en remplaçant chaque octet non alphanumérique par sa représentation %XX.

- `s` (*string*) : Chaîne à encoder.
- **renvoie** : string Chaîne échappée.

#### `libs_luasocket_socket_url.parse(url, default)`

Découpe une URL en table avec les champs scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (seuls ceux présents sont remplis). Le '/' initial du chemin fait partie de path.

- `url` (*string*) : URL à analyser.
- `default` (*table|nil*) : Valeurs par défaut copiées dans le résultat avant l'analyse.
- **renvoie** : table|nil Parties de l'URL, ou nil et "invalid url".

#### `libs_luasocket_socket_url.parse_path(path)`

Découpe un chemin en segments (désencodés) ; un chemin commençant par '/' donne un champ is_absolute.

- `path` (*string*) : Chemin de l'URL.
- **renvoie** : table Liste des segments (un par entrée).

#### `libs_luasocket_socket_url.unescape(s)`

Décode les séquences %XX d'une chaîne en octets.

- `s` (*string*) : Chaîne échappée.
- **renvoie** : string Chaîne décodée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `_VERSION` | string | Version du module : "URL 1.0.3". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/url.lua`.*

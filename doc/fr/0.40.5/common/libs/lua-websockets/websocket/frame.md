# `libs_lua_websockets_websocket_frame`

*Fichier : `lua/common/libs/lua-websockets/websocket/frame.lua` · VM : Commun (GE + véhicule) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/frame")`

Encodage et décodage des trames WebSocket (RFC 6455) pour lua-websockets : en-têtes 7/16/64 bits de longueur, masquage XOR côté client, trames de fermeture (code + raison). Utilisé par sync, ev_common et les backends client/serveur. Exporte aussi les constantes d'opcodes.

## Remarques

- Le décodage d'une longueur 64 bits échoue par assert si la longueur est inférieure à 0xffff ou supérieure à 2^53.
- xor_mask est marqué 'TODO: improve performance' dans le code : le masquage se fait octet par octet en Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_frame.decode(encoded)` | Décode une trame depuis un tampon. Si les données sont incomplètes, renvoie nil et le nombre d'octets manquants. | 106 |
| `libs_lua_websockets_websocket_frame.decode_close(data)` | Extrait code et raison de la charge utile d'une trame CLOSE. | 186 |
| `libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin)` | Construit une trame WebSocket complète : en-tête, longueur, éventuel masque aléatoire (math.random) et données masquées. | 69 |
| `libs_lua_websockets_websocket_frame.encode_close(code, reason)` | Construit la charge utile d'une trame CLOSE : code sur 2 octets suivi de la raison. Renvoie une chaîne vide si code est nil. | 175 |
| `libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low)` | En-tête avec longueur sur 64 bits (deux entiers 32 bits). | 65 |
| `libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len)` | En-tête avec longueur sur 16 bits (126..65535). | 61 |
| `libs_lua_websockets_websocket_frame.encode_header_small(header, payload)` | Deux octets d'en-tête (longueur < 126). | 57 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_frame.decode(encoded)`

Décode une trame depuis un tampon. Si les données sont incomplètes, renvoie nil et le nombre d'octets manquants.

- `encoded` (*string*) : Octets reçus (peut contenir plusieurs trames).
- **renvoie** : string|nil Charge utile démasquée, ou nil si incomplet.
- **renvoie** : boolean|integer fin (bit FIN), ou octets manquants si incomplet.
- **renvoie** : integer opcode.
- **renvoie** : string Octets restants après la trame.
- **renvoie** : boolean true si la trame était masquée.

#### `libs_lua_websockets_websocket_frame.decode_close(data)`

Extrait code et raison de la charge utile d'une trame CLOSE.

- `data` (*string|nil*) : Charge utile.
- **renvoie** : integer|nil Code.
- **renvoie** : string|nil Raison.

#### `libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin)`

Construit une trame WebSocket complète : en-tête, longueur, éventuel masque aléatoire (math.random) et données masquées.

- `data` (*string*) : Charge utile.
- `opcode` (*integer*) : Opcode (1 = TEXT par défaut).
- `masked` (*boolean*) : true pour masquer (obligatoire côté client).
- `fin` (*boolean|nil*) : Bit FIN ; nil ou true = trame finale.
- **renvoie** : string Octets de la trame.

#### `libs_lua_websockets_websocket_frame.encode_close(code, reason)`

Construit la charge utile d'une trame CLOSE : code sur 2 octets suivi de la raison. Renvoie une chaîne vide si code est nil.

- `code` (*integer|nil*) : Code de fermeture (ex. 1000).
- `reason` (*string|nil*) : Raison.
- **renvoie** : string Charge utile.

#### `libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low)`

En-tête avec longueur sur 64 bits (deux entiers 32 bits).

- `header` (*integer*) : Premier octet.
- `payload` (*integer*) : Second octet.
- `high` (*integer*) : 32 bits de poids fort.
- `low` (*integer*) : 32 bits de poids faible.
- **renvoie** : string En-tête.

#### `libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len)`

En-tête avec longueur sur 16 bits (126..65535).

- `header` (*integer*) : Premier octet.
- `payload` (*integer*) : Second octet.
- `len` (*integer*) : Longueur.
- **renvoie** : string En-tête.

#### `libs_lua_websockets_websocket_frame.encode_header_small(header, payload)`

Deux octets d'en-tête (longueur < 126).

- `header` (*integer*) : Premier octet (FIN + opcode).
- `payload` (*integer*) : Second octet (bit masque + longueur).
- **renvoie** : string En-tête.

## Champs

| Champ | Type | Description |
|---|---|---|
| `BINARY` | integer | 2. |
| `CLOSE` | integer | 8. |
| `CONTINUATION` | integer | 0. |
| `PING` | integer | 9. |
| `PONG` | integer | 10. |
| `TEXT` | integer | 1. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/frame.lua`.*

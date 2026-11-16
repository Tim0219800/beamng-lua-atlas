# `libs_luamqtt_mqtt_protocol`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol.lua` · VM : Commun (GE + véhicule) · 526 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol")`

Briques génériques du protocole MQTT (communes aux versions 3.1.1 et 5.0) de luamqtt : création et lecture d'entiers, chaînes UTF-8 et champs de longueur variable, en-tête fixe, constantes de types de paquets et codes CONNACK, identifiants de paquet, paquets combinés. Utilisé par protocol4.lua et protocol5.lua. Convention des fonctions parse_* : elles reçoivent read_func(n) qui lit n octets et renvoie la chaîne, ou false/nil et un message d'erreur.

## Remarques

- Uniquement utile pour écrire ou analyser des paquets MQTT à la main ; un moddeur utilise normalement client.lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol.check_packet_id(val)` | Vrai si la valeur est un identifiant de paquet valide. | 265 |
| `libs_luamqtt_mqtt_protocol.check_qos(val)` | Vrai si la valeur est un QoS valide. | 258 |
| `libs_luamqtt_mqtt_protocol.combine(...)` | Combine plusieurs morceaux de données en un paquet combiné (se comporte comme une chaîne : tostring, len, append). | 414 |
| `libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len)` | Crée l'en-tête fixe d'un paquet. | 252 |
| `libs_luamqtt_mqtt_protocol.make_string(str)` | Crée une chaîne UTF-8 préfixée par sa longueur sur 2 octets. | 85 |
| `libs_luamqtt_mqtt_protocol.make_uint16(val)` | Crée les données d'un entier 16 bits. | 66 |
| `libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value)` | Données d'une propriété 2 octets avec contrôle de valeur non nulle. | 120 |
| `libs_luamqtt_mqtt_protocol.make_uint32(val)` | Crée les données d'un entier 32 bits. | 75 |
| `libs_luamqtt_mqtt_protocol.make_uint8(val)` | Crée les données d'un entier 8 bits. | 57 |
| `libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value)` | Données d'une propriété 1 octet qui ne peut valoir que 0 ou 1. | 112 |
| `libs_luamqtt_mqtt_protocol.make_var_length(len)` | Encode un entier en champ de longueur variable (Remaining Length). | 92 |
| `libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value)` | Données d'une propriété de longueur variable avec contrôle de valeur non nulle. | 128 |
| `libs_luamqtt_mqtt_protocol.next_packet_id(curr)` | Renvoie l'identifiant de paquet suivant celui donné. | 272 |
| `libs_luamqtt_mqtt_protocol.packet_id_required(args)` | Vrai si le paquet décrit par args (champ type, et qos pour PUBLISH) exige un identifiant de paquet. Lève une exception si args n'est pas une table ou si args.type n'est pas un nombre. | 372 |
| `libs_luamqtt_mqtt_protocol.packet_tostring(packet)` | Convertit un paquet analysé en texte lisible. | 443 |
| `libs_luamqtt_mqtt_protocol.parse_string(read_func)` | Lit une chaîne UTF-8 préfixée par sa longueur. Renvoie false et un message en cas d'échec. | 138 |
| `libs_luamqtt_mqtt_protocol.parse_uint16(read_func)` | Lit un entier 16 bits. | 175 |
| `libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func)` | Lit un entier 16 bits non nul. | 187 |
| `libs_luamqtt_mqtt_protocol.parse_uint32(read_func)` | Lit un entier 32 bits. | 199 |
| `libs_luamqtt_mqtt_protocol.parse_uint8(read_func)` | Lit un entier 8 bits avec read_func. | 152 |
| `libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func)` | Lit un octet qui doit valoir 0 ou 1. | 163 |
| `libs_luamqtt_mqtt_protocol.parse_var_length(read_func)` | Lit un champ de longueur variable (Remaining Length). | 217 |
| `libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func)` | Lit un entier de longueur variable qui doit être non nul. | 238 |
| `libs_luamqtt_mqtt_protocol.start_parse_packet(read_func)` | Commence l'analyse d'un nouveau paquet : lit l'en-tête fixe et prépare un flux d'entrée (table avec read_func et available) pour le contenu. Renvoie le type, les drapeaux, le flux, etc. | 476 |

### Détail des paramètres

#### `libs_luamqtt_mqtt_protocol.check_packet_id(val)`

Vrai si la valeur est un identifiant de paquet valide.

- `val` (*any*) : Valeur testée.
- **renvoie** : boolean Validité.

#### `libs_luamqtt_mqtt_protocol.check_qos(val)`

Vrai si la valeur est un QoS valide.

- `val` (*any*) : Valeur testée.
- **renvoie** : boolean Validité.

#### `libs_luamqtt_mqtt_protocol.combine(...)`

Combine plusieurs morceaux de données en un paquet combiné (se comporte comme une chaîne : tostring, len, append).

- `...` (*any*) : Morceaux.
- **renvoie** : table Paquet combiné.

#### `libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len)`

Crée l'en-tête fixe d'un paquet.

- `ptype` (*integer*) : Type de paquet (packet_type).
- `flags` (*integer*) : Drapeaux.
- `len` (*integer*) : Longueur restante.
- **renvoie** : string En-tête.

#### `libs_luamqtt_mqtt_protocol.make_string(str)`

Crée une chaîne UTF-8 préfixée par sa longueur sur 2 octets.

- `str` (*string*) : Texte.
- **renvoie** : string Données.

#### `libs_luamqtt_mqtt_protocol.make_uint16(val)`

Crée les données d'un entier 16 bits.

- `val` (*integer*) : Valeur.
- **renvoie** : string 2 octets.

#### `libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value)`

Données d'une propriété 2 octets avec contrôle de valeur non nulle.

- `value` (*integer*) : Valeur non nulle.

#### `libs_luamqtt_mqtt_protocol.make_uint32(val)`

Crée les données d'un entier 32 bits.

- `val` (*integer*) : Valeur.
- **renvoie** : string 4 octets.

#### `libs_luamqtt_mqtt_protocol.make_uint8(val)`

Crée les données d'un entier 8 bits.

- `val` (*integer*) : Valeur.
- **renvoie** : string 1 octet.

#### `libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value)`

Données d'une propriété 1 octet qui ne peut valoir que 0 ou 1.

- `value` (*integer*) : 0 ou 1.

#### `libs_luamqtt_mqtt_protocol.make_var_length(len)`

Encode un entier en champ de longueur variable (Remaining Length).

- `len` (*integer*) : Valeur.
- **renvoie** : string Octets encodés.

#### `libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value)`

Données d'une propriété de longueur variable avec contrôle de valeur non nulle.

- `value` (*integer*) : Valeur non nulle.

#### `libs_luamqtt_mqtt_protocol.next_packet_id(curr)`

Renvoie l'identifiant de paquet suivant celui donné.

- `curr` (*integer|nil*) : Identifiant courant.
- **renvoie** : integer Identifiant suivant.

#### `libs_luamqtt_mqtt_protocol.packet_id_required(args)`

Vrai si le paquet décrit par args (champ type, et qos pour PUBLISH) exige un identifiant de paquet. Lève une exception si args n'est pas une table ou si args.type n'est pas un nombre.

- `args` (*table*) : Arguments de création de paquet.
- **renvoie** : boolean Résultat.

#### `libs_luamqtt_mqtt_protocol.packet_tostring(packet)`

Convertit un paquet analysé en texte lisible.

- `packet` (*table*) : Paquet.
- **renvoie** : string Représentation.

#### `libs_luamqtt_mqtt_protocol.parse_string(read_func)`

Lit une chaîne UTF-8 préfixée par sa longueur. Renvoie false et un message en cas d'échec.

- `read_func` (*function*) : Fonction de lecture.
- **renvoie** : string|boolean Texte, ou false.

#### `libs_luamqtt_mqtt_protocol.parse_uint16(read_func)`

Lit un entier 16 bits.

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func)`

Lit un entier 16 bits non nul.

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.parse_uint32(read_func)`

Lit un entier 32 bits.

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.parse_uint8(read_func)`

Lit un entier 8 bits avec read_func.

- `read_func` (*function*) : Fonction de lecture.
- **renvoie** : integer|boolean Valeur, ou false et message.

#### `libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func)`

Lit un octet qui doit valoir 0 ou 1.

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.parse_var_length(read_func)`

Lit un champ de longueur variable (Remaining Length).

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func)`

Lit un entier de longueur variable qui doit être non nul.

- `read_func` (*function*) : Fonction de lecture.

#### `libs_luamqtt_mqtt_protocol.start_parse_packet(read_func)`

Commence l'analyse d'un nouveau paquet : lit l'en-tête fixe et prépare un flux d'entrée (table avec read_func et available) pour le contenu. Renvoie le type, les drapeaux, le flux, etc.

- `read_func` (*function*) : Fonction de lecture de la connexion.

## Champs

| Champ | Type | Description |
|---|---|---|
| `connack_packet_mt` | table | Métatable des paquets CONNACK analysés. |
| `connack_rc` | table | Table des codes de retour CONNACK. |
| `packet_mt` | table | Métatable des paquets analysés (fournit notamment __tostring). |
| `packet_type` | table | Types de paquets MQTT : CONNECT=1, CONNACK=2, PUBLISH=3, PUBACK=4, PUBREC=5, PUBREL=6, PUBCOMP=7, SUBSCRIBE=8, SUBACK=9, UNSUBSCRIBE=10, UNSUBACK=11, PINGREQ=12, PINGRESP=13, DISCONNECT=14, AUTH=15 (MQTT 5). Table aussi indexée dans l'autre sens (1 -> 'CONNECT'). |

## Classe `combined_packet_mt`

Métatable des données combinées créées par combine.

| Méthode | Description | Ligne |
|---|---|---|
| `combined_packet_mt.__index(_, key)` | Fait fonctionner la table comme une classe (accès aux méthodes tostring, len, append). | 409 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol.lua`.*

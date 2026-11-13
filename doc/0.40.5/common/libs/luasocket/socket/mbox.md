# `libs_luasocket_socket_mbox`

*Fichier : `lua/common/libs/luasocket/socket/mbox.lua` · VM : Commun (GE + véhicule) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/mbox")`

Analyseur de boîtes aux lettres au format mbox de LuaSocket : découpe un fichier mbox en messages, sépare en-têtes et corps, interprète les en-têtes et l'adresse de l'expéditeur. Utilitaire de courrier électronique sans lien direct avec le jeu.

## Exemple

```lua
local mbox = require('libs/luasocket/socket/mbox')
local messages = mbox.parse(contenuMbox)
print(messages[1].headers.subject, messages[1].body)
```

## Remarques

- Bug : split_mbox assigne la globale 'mbox' (variable sans local), ce qui crée/écrase _G.mbox à chaque appel ; de plus, si 'module' existe, le module est lui aussi publié dans la globale mbox.
- Les noms d'en-têtes de parse_headers sont passés en minuscules ; les en-têtes répétés sont joints par ', '.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_mbox.parse(mbox_s)` | Analyse tout un fichier mbox : liste de messages {headers, body}. | 77 |
| `libs_luasocket_socket_mbox.parse_from(from)` | Extrait nom et adresse d'un champ 'From' du type 'Nom <adresse>' (ou une simple adresse). | 51 |
| `libs_luasocket_socket_mbox.parse_header(header_s)` | Décompose une ligne d'en-tête 'Nom: valeur'. | 29 |
| `libs_luasocket_socket_mbox.parse_headers(headers_s)` | Analyse un bloc d'en-têtes en table nom (minuscules) -> valeur. | 36 |
| `libs_luasocket_socket_mbox.parse_message(message_s)` | Analyse un message : renvoie {headers = table des en-têtes analysés, body = corps}. | 85 |
| `libs_luasocket_socket_mbox.split_headers(headers_s)` | Découpe un bloc d'en-têtes en lignes, en dépliant les lignes de continuation. | 21 |
| `libs_luasocket_socket_mbox.split_mbox(mbox_s)` | Découpe un fichier mbox en messages bruts, séparés par les lignes 'From ...' précédées d'une ligne vide. | 63 |
| `libs_luasocket_socket_mbox.split_message(message_s)` | Sépare un message en en-têtes et corps (premier saut de ligne vide). Convertit CRLF en LF. | 7 |

### Détail des paramètres

#### `libs_luasocket_socket_mbox.parse(mbox_s)`

Analyse tout un fichier mbox : liste de messages {headers, body}.

- `mbox_s` (*string*) : Contenu mbox.
- **renvoie** : table[] Messages.

#### `libs_luasocket_socket_mbox.parse_from(from)`

Extrait nom et adresse d'un champ 'From' du type 'Nom <adresse>' (ou une simple adresse).

- `from` (*string*) : Valeur du champ From.
- **renvoie** : string Nom (l'adresse si vide, guillemets retirés).
- **renvoie** : string Adresse.

#### `libs_luasocket_socket_mbox.parse_header(header_s)`

Décompose une ligne d'en-tête 'Nom: valeur'.

- `header_s` (*string*) : Ligne d'en-tête.
- **renvoie** : string|nil Nom.
- **renvoie** : string|nil Valeur.

#### `libs_luasocket_socket_mbox.parse_headers(headers_s)`

Analyse un bloc d'en-têtes en table nom (minuscules) -> valeur.

- `headers_s` (*string*) : En-têtes bruts.
- **renvoie** : table<string, string> En-têtes.

#### `libs_luasocket_socket_mbox.parse_message(message_s)`

Analyse un message : renvoie {headers = table des en-têtes analysés, body = corps}.

- `message_s` (*string*) : Message brut.
- **renvoie** : table Message.

#### `libs_luasocket_socket_mbox.split_headers(headers_s)`

Découpe un bloc d'en-têtes en lignes, en dépliant les lignes de continuation.

- `headers_s` (*string*) : En-têtes bruts.
- **renvoie** : string[] Une chaîne par en-tête.

#### `libs_luasocket_socket_mbox.split_mbox(mbox_s)`

Découpe un fichier mbox en messages bruts, séparés par les lignes 'From ...' précédées d'une ligne vide.

- `mbox_s` (*string*) : Contenu du fichier mbox.
- **renvoie** : string[] Messages bruts.

#### `libs_luasocket_socket_mbox.split_message(message_s)`

Sépare un message en en-têtes et corps (premier saut de ligne vide). Convertit CRLF en LF.

- `message_s` (*string*) : Message brut.
- **renvoie** : string En-têtes bruts (chaîne vide s'il n'y en a pas).
- **renvoie** : string Corps.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/mbox.lua`.*

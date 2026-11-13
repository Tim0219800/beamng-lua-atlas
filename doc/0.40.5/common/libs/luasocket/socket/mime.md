# `libs_luasocket_socket_mime`

*Fichier : `lua/common/libs/luasocket/socket/mime.lua` · VM : Commun (GE + véhicule) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/mime")`

Couche Lua du module MIME de LuaSocket (Diego Nehab, RFC 2045-2049) : encodage et décodage base64 et quoted-printable, découpe de lignes, normalisation de fins de ligne, protection des points (dot-stuffing SMTP). Construit des filtres LTN12 par-dessus les fonctions natives du module 'mime.core' (b64, unb64, qp, unqp, wrp, qpwrp, eol, dot).

## Exemple

```lua
local mime = require('mime')
local b64 = mime.b64('texte')           -- natif (mime.core)
local f = mime.encode('base64')         -- filtre ltn12
local out = f('texte') .. (f(nil) or '')
```

## Remarques

- Le module fait require('mime.core') (partie native) et require('ltn12') (nom nu) : le fichier en dépend. La table renvoyée est celle de mime.core, enrichie par ce fichier, donc elle contient aussi les fonctions natives (b64, unb64, qp, unqp…).
- encode, decode et wrap acceptent soit un nom d'algorithme, soit directement leurs options : si le premier argument n'est pas une chaîne, le nom 'default' est utilisé. Un nom inconnu lève l'erreur 'unknown key (...)'.
- Algorithmes : encodet = base64, quoted-printable ; decodet = base64, quoted-printable ; wrapt = text, base64, default (longueur 76 par défaut), quoted-printable.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_mime.normalize(marker)` | Crée un filtre qui normalise les fins de ligne vers le marqueur donné (via mime.eol). | 81 |
| `libs_luasocket_socket_mime.stuff()` | Crée un filtre de 'dot-stuffing' (double les points en début de ligne, pour SMTP) via mime.dot. | 86 |

### Détail des paramètres

#### `libs_luasocket_socket_mime.normalize(marker)`

Crée un filtre qui normalise les fins de ligne vers le marqueur donné (via mime.eol).

- `marker` (*string|nil*) : Fin de ligne souhaitée (par ex. '\r\n').
- **renvoie** : function Filtre LTN12.

#### `libs_luasocket_socket_mime.stuff()`

Crée un filtre de 'dot-stuffing' (double les points en début de ligne, pour SMTP) via mime.dot.

- **renvoie** : function Filtre LTN12.

## Champs

| Champ | Type | Description |
|---|---|---|
| `decode` | function | decode(nom, opt1, opt2) -> filtre ltn12 de décodage choisi dans decodet. |
| `decodet` | table<string, function> | Fabriques de filtres de décodage ('base64', 'quoted-printable'). |
| `encode` | function | encode(nom, opt1, opt2) -> filtre ltn12 d'encodage choisi dans encodet. |
| `encodet` | table<string, function> | Fabriques de filtres d'encodage ('base64', 'quoted-printable' ; en mode 'binary' le qp utilise =0D=0A). |
| `wrap` | function | wrap(nom, longueur) -> filtre ltn12 de découpe de lignes choisi dans wrapt. |
| `wrapt` | table<string, function> | Fabriques de filtres de découpe de lignes ('text', 'base64', 'default', 'quoted-printable'). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/mime.lua`.*

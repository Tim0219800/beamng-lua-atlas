# `libs_luasocket_socket_headers`

*Fichier : `lua/common/libs/luasocket/socket/headers.lua` · VM : Commun (GE + véhicule) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/headers")`

Table de mise en forme canonique des noms d'en-têtes (MIME/HTTP) de LuaSocket : associe un nom en minuscules à sa forme usuelle (par ex. 'content-type' -> 'Content-Type'). Le module s'enregistre aussi dans socket.headers. Utilisé par socket.http lors de l'envoi des en-têtes de requête.

## Exemple

```lua
local headers = require('libs/luasocket/socket/headers')
print(headers.canonic['content-type'])  -- 'Content-Type'
```

## Remarques

- Le module fait require('socket.socket') (et non libs/luasocket/socket/socket), ce qui suppose que ce nom de module soit résoluble par le chemin de recherche du jeu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `canonic` | table<string, string> | Noms d'en-têtes en minuscules vers leur capitalisation canonique ; un nom absent de la table est envoyé tel quel. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/headers.lua`.*

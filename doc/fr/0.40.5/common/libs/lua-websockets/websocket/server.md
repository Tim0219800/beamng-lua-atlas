# `server`

*Fichier : `lua/common/libs/lua-websockets/websocket/server.lua` · VM : Commun (GE + véhicule) · 7 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `server`

Sélecteur de backend serveur WebSocket de lua-websockets. Renvoie une table dont le __index charge à la demande 'websocket/server_copas' ou 'websocket/server_ev' selon le nom demandé (server.copas, server.ev) ; tout autre nom renvoie nil.

## Exemple

```lua
local server = require('libs/lua-websockets/websocket.server')
server.copas.listen({port = 8080, default = function(client) end})
```

## Remarques

- Le backend est mis en cache dans la table après le premier accès.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/server.lua`.*

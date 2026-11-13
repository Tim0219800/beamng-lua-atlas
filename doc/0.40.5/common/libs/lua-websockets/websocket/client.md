# `client`

*Fichier : `lua/common/libs/lua-websockets/websocket/client.lua` · VM : Commun (GE + véhicule) · 9 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `client`

Sélecteur de backend client WebSocket de lua-websockets. Renvoie une table vide dont le __index charge à la demande le module 'websocket/client_<nom>' pour les noms 'sync', 'copas', 'ev' et 'new' (alias de 'sync'). Tout autre nom renvoie nil sans rien charger.

## Exemple

```lua
local client = require('libs/lua-websockets/websocket.client')
local ws = client.new({timeout = 1})   -- backend synchrone
local wsCopas = client.copas()         -- backend copas
```

## Remarques

- Le backend chargé est mis en cache dans la table (client.sync, client.copas…) ; client.new est le même objet que client.sync.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/client.lua`.*

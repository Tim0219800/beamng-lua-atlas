# `libs_copas_copas_ftp`

*Fichier : `lua/common/libs/copas/copas/ftp.lua` · VM : Commun (GE + véhicule) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/ftp")`

identical to the socket.ftp module except that it uses
 async wrapped Copas sockets

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_ftp.command(cmdt)` |  | 90 |
| `libs_copas_copas_ftp.parseRequest(u, body)` | parses a simple form into the advanced form<br> if `body` is provided, a PUT, otherwise a GET.<br> If GET, then a field `target` is added to store the results | 57 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `get` | any |  |
| `put` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/ftp.lua`.*

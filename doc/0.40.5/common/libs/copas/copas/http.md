# `libs_copas_copas_http`

*Fichier : `lua/common/libs/copas/copas/http.lua` · VM : Commun (GE + véhicule) · 414 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/http")`

Full copy of the LuaSocket code, modified to include
 https and http/https redirects, and Copas async enabled.
 HTTP/1.1 client support for the Lua language.
 LuaSocket toolkit.
 Author: Diego Nehab
 Declare module and import dependencies

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_http.open(reqt)` |  | 121 |
| `libs_copas_copas_http.parseRequest(u, b)` | parses a shorthand form into the advanced table form.<br> adds field `target` to the table. This will hold the return values. | 380 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `PORT` | number | default port for document retrieval |
| `SSLOPTIONS` | string |  |
| `SSLPORT` | number | Default settings for SSL |
| `SSLPROTOCOL` | string |  |
| `SSLVERIFY` | string |  |
| `TIMEOUT` | number | Program constants<br> connection timeout in seconds |
| `USERAGENT` | any | user agent field sent in request |
| `request` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/http.lua`.*

# `libs_luasocket_ltn12`

*Fichier : `lua/common/libs/luasocket/ltn12.lua` · VM : Commun (GE + véhicule) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/ltn12")`

LTN12 1.0.3 (Diego Nehab, bibliothèque LuaSocket) : cadre de traitement de flux de données par morceaux. Quatre notions : sources (fonctions qui renvoient le morceau suivant), sinks (fonctions qui reçoivent des morceaux), filters (transforment un morceau en un autre) et pumps (transfèrent d'une source vers un sink). Utilisé par socket.http, socket.ftp et mime ; un moddeur s'en sert pour lire/écrire des réponses HTTP en flux (table, fichier, chaîne).

## Exemple

```lua
local ltn12 = require('libs/luasocket/ltn12')
local t = {}
ltn12.pump.all(ltn12.source.string('bonjour'), ltn12.sink.table(t))
print(table.concat(t))
```

## Remarques

- Conventions : une source renvoie le morceau suivant, ou nil (fin) ou nil, erreur. Un sink reçoit (morceau, erreur) et renvoie 1 pour continuer, ou nil, erreur ; il reçoit nil comme morceau pour signaler la fin. Un filtre reçoit un morceau (nil = fin) et renvoie un morceau ('' = rien pour l'instant, nil = fini).
- Si la globale 'module' existe (Lua 5.1 avec compat), le module est aussi publié dans _G.ltn12 via rawset.
- sink.chain appelle unpack, qui n'est pas défini dans ce fichier : il fonctionne sous LuaJIT (unpack global) mais pas sous Lua 5.2+.
- Les fonctions sont des champs de tables imbriquées : ltn12.source.*, ltn12.sink.*, ltn12.filter.*, ltn12.pump.* (la page auto les présente comme des classes).

## Champs

| Champ | Type | Description |
|---|---|---|
| `BLOCKSIZE` | integer | Taille des morceaux lus par source.file et source.string : 2048 octets. |
| `_VERSION` | string | 'LTN12 1.0.3'. |
| `filter` | table | Fonctions de filtrage : cycle, chain. |
| `pump` | table | Transfert de données : step, all. |
| `sink` | table | Fabriques de sinks : table, simplify, file, null, error, chain. |
| `source` | table | Fabriques de sources : empty, error, file, simplify, string, rewind, chain, cat. |

## Classe `filter`

ltn12.filter : construction de filtres.

| Méthode | Description | Ligne |
|---|---|---|
| `filter.chain(...)` | Enchaîne plusieurs filtres en un seul. | 45 |
| `filter.cycle(low, ctx, extra)` | Transforme un filtre bas niveau low(ctx, chunk, extra) -> (sortie, nouveau ctx) en filtre haut niveau qui conserve le contexte entre les appels. | 34 |

## Classe `pump`

ltn12.pump : transfert source vers sink.

| Méthode | Description | Ligne |
|---|---|---|
| `pump.all(src, snk, step)` | Transfère toutes les données de la source vers le sink avec la fonction step. | 295 |
| `pump.step(src, snk)` | Transfère un morceau de la source au sink. | 287 |

## Classe `sink`

ltn12.sink : fabriques de sinks.

| Méthode | Description | Ligne |
|---|---|---|
| `sink.chain(f, snk, ...)` | Sink précédé d'un ou plusieurs filtres. | 262 |
| `sink.error(err)` | Sink qui renvoie toujours nil, err. | 255 |
| `sink.file(handle, io_err)` | Sink qui écrit dans un fichier et le ferme à la fin. Sans handle, renvoie un sink d'erreur. | 234 |
| `sink.null()` | Sink qui ignore les données. | 250 |
| `sink.simplify(snk)` | Transforme un sink 'sophistiqué' en sink simple. | 223 |
| `sink.table(t)` | Sink qui range chaque morceau dans une table. | 213 |

## Classe `source`

ltn12.source : fabriques de sources.

| Méthode | Description | Ligne |
|---|---|---|
| `source.cat(...)` | Concatène plusieurs sources l'une après l'autre. | 196 |
| `source.chain(src, f, ...)` | Source filtrée : applique un ou plusieurs filtres à une source. | 145 |
| `source.empty()` | Source vide : renvoie toujours nil. | 83 |
| `source.error(err)` | Source qui renvoie toujours nil, err. | 88 |
| `source.file(handle, io_err)` | Source qui lit un fichier par blocs de BLOCKSIZE et le ferme à la fin. Sans handle, renvoie une source d'erreur. | 95 |
| `source.rewind(src)` | Source 'rembobinable' : appelée avec un morceau, elle le remet de côté ; sans argument, elle rend d'abord les morceaux remis de côté puis la source d'origine. | 130 |
| `source.simplify(src)` | Transforme une source 'sophistiquée' (qui peut renvoyer une nouvelle source) en source simple. | 106 |
| `source.string(s)` | Source qui découpe une chaîne en morceaux de BLOCKSIZE. Sans chaîne, renvoie une source vide. | 117 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/ltn12.lua`.*

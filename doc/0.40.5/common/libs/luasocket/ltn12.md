# `libs_luasocket_ltn12`

*Fichier : `lua/common/libs/luasocket/ltn12.lua` · VM : Commun (GE + véhicule) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/ltn12")`

LTN12 - Filters, sources, sinks and pumps.
 LuaSocket toolkit.
 Author: Diego Nehab
 Declare module

## Champs

| Champ | Type | Description |
|---|---|---|
| `BLOCKSIZE` | number | 2048 seems to be better in windows... |
| `_VERSION` | string |  |
| `filter` | any |  |
| `pump` | any |  |
| `sink` | any |  |
| `source` | any |  |

## Classe `filter`

| Méthode | Description | Ligne |
|---|---|---|
| `filter.chain(...)` | chains a bunch of filters together<br> (thanks to Wim Couwenberg) | 45 |
| `filter.cycle(low, ctx, extra)` | Filter stuff<br> returns a high level filter that cycles a low-level filter | 34 |

## Classe `pump`

| Méthode | Description | Ligne |
|---|---|---|
| `pump.all(src, snk, step)` | pumps all data from a source to a sink, using a step function | 295 |
| `pump.step(src, snk)` | Pump stuff<br> pumps one chunk from the source to the sink | 287 |

## Classe `sink`

| Méthode | Description | Ligne |
|---|---|---|
| `sink.chain(f, snk, ...)` | chains a sink with one or several filter(s) | 262 |
| `sink.error(err)` | creates a sink that just returns an error | 255 |
| `sink.file(handle, io_err)` | creates a file sink | 234 |
| `sink.null()` |  | 250 |
| `sink.simplify(snk)` | turns a fancy sink into a simple sink | 223 |
| `sink.table(t)` | Sink stuff<br> creates a sink that stores into a table | 213 |

## Classe `source`

| Méthode | Description | Ligne |
|---|---|---|
| `source.cat(...)` | creates a source that produces contents of several sources, one after the<br> other, as if they were concatenated<br> (thanks to Wim Couwenberg) | 196 |
| `source.chain(src, f, ...)` | chains a source with one or several filter(s) | 145 |
| `source.empty()` |  | 83 |
| `source.error(err)` | returns a source that just outputs an error | 88 |
| `source.file(handle, io_err)` | creates a file source | 95 |
| `source.rewind(src)` | creates rewindable source | 130 |
| `source.simplify(src)` | turns a fancy source into a simple source | 106 |
| `source.string(s)` | creates string source | 117 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/ltn12.lua`.*

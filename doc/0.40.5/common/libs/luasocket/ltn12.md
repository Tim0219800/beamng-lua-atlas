# `libs_luasocket_ltn12`

*File: `lua/common/libs/luasocket/ltn12.lua` · VM: Common (GE + vehicle) · 308 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/ltn12")`

LTN12 1.0.3 (Diego Nehab, LuaSocket library): framework for processing data streams in chunks. Four concepts: sources (functions that return the next chunk), sinks (functions that receive chunks), filters (transform one chunk into another) and pumps (transfer from a source to a sink). Used by socket.http, socket.ftp and mime; a modder uses it to read/write HTTP responses as streams (table, file, string).

## Example

```lua
local ltn12 = require('libs/luasocket/ltn12')
local t = {}
ltn12.pump.all(ltn12.source.string('bonjour'), ltn12.sink.table(t))
print(table.concat(t))
```

## Notes

- Conventions: a source returns the next chunk, or nil (end) or nil, error. A sink receives (chunk, error) and returns 1 to continue, or nil, error; it receives nil as the chunk to signal the end. A filter receives a chunk (nil = end) and returns a chunk ('' = nothing for now, nil = done).
- If the global 'module' exists (Lua 5.1 with compat), the module is also published in _G.ltn12 via rawset.
- sink.chain calls unpack, which is not defined in this file: it works under LuaJIT (global unpack) but not under Lua 5.2+.
- The functions are fields of nested tables: ltn12.source.*, ltn12.sink.*, ltn12.filter.*, ltn12.pump.* (the auto page presents them as classes).

## Fields

| Field | Type | Description |
|---|---|---|
| `BLOCKSIZE` | integer | Size of the chunks read by source.file and source.string: 2048 bytes. |
| `_VERSION` | string | 'LTN12 1.0.3'. |
| `filter` | table | Filter functions: cycle, chain. |
| `pump` | table | Data transfer: step, all. |
| `sink` | table | Sink factories: table, simplify, file, null, error, chain. |
| `source` | table | Source factories: empty, error, file, simplify, string, rewind, chain, cat. |

## Class `filter`

ltn12.filter: filter construction.

| Method | Description | Line |
|---|---|---|
| `filter.chain(...)` | Chains several filters into one. | 45 |
| `filter.cycle(low, ctx, extra)` | Turns a low-level filter low(ctx, chunk, extra) -> (output, new ctx) into a high-level filter that keeps the context between calls. | 34 |

## Class `pump`

ltn12.pump: source-to-sink transfer.

| Method | Description | Line |
|---|---|---|
| `pump.all(src, snk, step)` | Transfers all the data from the source to the sink using the step function. | 295 |
| `pump.step(src, snk)` | Transfers one chunk from the source to the sink. | 287 |

## Class `sink`

ltn12.sink: sink factories.

| Method | Description | Line |
|---|---|---|
| `sink.chain(f, snk, ...)` | Sink preceded by one or more filters. | 262 |
| `sink.error(err)` | Sink that always returns nil, err. | 255 |
| `sink.file(handle, io_err)` | Sink that writes to a file and closes it at the end. Without a handle, returns an error sink. | 234 |
| `sink.null()` | Sink that ignores the data. | 250 |
| `sink.simplify(snk)` | Turns a 'sophisticated' sink into a simple sink. | 223 |
| `sink.table(t)` | Sink that stores each chunk in a table. | 213 |

## Class `source`

ltn12.source: source factories.

| Method | Description | Line |
|---|---|---|
| `source.cat(...)` | Concatenates several sources one after another. | 196 |
| `source.chain(src, f, ...)` | Filtered source: applies one or more filters to a source. | 145 |
| `source.empty()` | Empty source: always returns nil. | 83 |
| `source.error(err)` | Source that always returns nil, err. | 88 |
| `source.file(handle, io_err)` | Source that reads a file in BLOCKSIZE blocks and closes it at the end. Without a handle, returns an error source. | 95 |
| `source.rewind(src)` | 'Rewindable' source: called with a chunk, it sets it aside; without an argument, it first returns the chunks set aside, then the original source. | 130 |
| `source.simplify(src)` | Turns a 'sophisticated' source (which may return a new source) into a simple source. | 106 |
| `source.string(s)` | Source that splits a string into BLOCKSIZE chunks. Without a string, returns an empty source. | 117 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/ltn12.lua`.*

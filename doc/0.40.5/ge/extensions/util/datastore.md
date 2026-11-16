# `util_datastore`

*File: `lua/ge/extensions/util/datastore.lua` · VM: Game Engine (GE) · 425 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_datastore`: `extensions.load("util_datastore")`, then the global `util_datastore`

Generic persistent key/value store, with secondary indexes built on demand. Each "store" is registered under a name with a (unique) primary key field and stored in a file <path>/<prefix->name.bin (MessagePack; the JSON format exists in the code but USE_MSGPACK is true). It serves as a data cache (the code mentions a UI cache) and allows searching entries by any field, following relation chains (getChain) and rewriting the file on each modification.

## Example

```lua
util_datastore.register('myStore', 'id', {path = '/temp'})
util_datastore.putEntries('myStore', {{id = 'a', color = 'red'}, {id = 'b', color = 'red'}})
local reds = util_datastore.getEntries('myStore', 'color', {'red'})
```

## Notes

- For an unregistered store, most functions return a failure table {ok = false, err = 'store_not_registered', storeName = ...} (not nil). Test with isUnregisteredFailure(result).
- The file is read only on first access (lazy loading); a truncated or unreadable file gives an empty store. Written files contain only entries (array of tables); order is not guaranteed.
- Default path: /temp; default primary key: 'name'. Paths are normalized (slashes, no trailing slash). With a non-empty opts.prefix, the file becomes <prefix>-<storeName>.bin.
- Read-only store (opts.readonly = true): putEntries, removeEntries and clear return false without writing.
- Secondary indexes are multivalued (several entries per value) and built on first use of a field, then maintained on each putEntries/removeEntries. nil values are not indexed.
- getChain starts from a "seed" entry then follows in depth the chainField field (array of keys), resolving each key in the chainResolveField field (set by setChain), without duplicates; returns the list of entries found, seed first.
- Hot reload: onSerialize keeps only the registrations (path, fields, read-only, chain), not the entries, which are re-read from the file.
- register reuses the chain configuration of a previous registration of the same name. The extension goes into manual unload (onInit).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_datastore.clear(storeName)` | Empties the store and rewrites the (empty) file. | 347 |
| `util_datastore.getAll(storeName)` | Returns all the entries of the store (order not guaranteed). | 242 |
| `util_datastore.getChain(storeName, field, value)` | Looks up a seed entry then follows its relation chain (chainField/resolveField set by setChain), without cycles. | 261 |
| `util_datastore.getEntries(storeName, field, values)` | Returns the entries whose field equals one of the values, without duplicates (deduplicated by primary key). | 194 |
| `util_datastore.getEntry(storeName, field, value)` | Returns the first entry whose field equals value. | 184 |
| `util_datastore.getIndex(storeName, field, primaryKey)` | Without primaryKey: list of the distinct values present for the field. With primaryKey = true: table primary key -> field value for each entry (not deduplicated). | 221 |
| `util_datastore.hasEntry(storeName, field, value)` | Returns whether at least one entry has this field equal to value. | 252 |
| `util_datastore.isRegistered(storeName)` | Returns whether a store is registered. | 64 |
| `util_datastore.isUnregisteredFailure(result)` | Returns whether a result is the "store_not_registered" failure. | 73 |
| `util_datastore.onDeserialized(data)` | Hot reload hook: recreates the stores from the saved registrations (entries to re-read from the file). *(internal)* *(hook)* | 388 |
| `util_datastore.onInit()` | Initialization hook: sets the extension to manual unload. *(internal)* *(hook)* | 369 |
| `util_datastore.onSerialize()` | Hot reload hook: serializes only the stores' registrations (not the entries). *(internal)* *(hook)* | 374 |
| `util_datastore.putEntries(storeName, entries)` | Inserts or replaces entries (identified by the primary key), updates the indexes and rewrites the file. Entries without a primary key are ignored with a warning. | 292 |
| `util_datastore.register(storeName, primaryField, opts)` | Registers (or re-registers) a store in memory; does not load the file. | 147 |
| `util_datastore.removeEntries(storeName, field, values)` | Removes the entries whose field equals one of the values, then rewrites the file. | 315 |
| `util_datastore.setChain(storeName, chainField, field)` | Defines how to follow relations for getChain: chainField contains an array of keys, resolved via the field field. | 359 |
| `util_datastore.unregister(storeName)` | Removes the in-memory registration without touching the file. | 174 |

### Parameter details

#### `util_datastore.clear(storeName)`

Empties the store and rewrites the (empty) file.

- `storeName` (*string*) : Store name.
- **returns**: boolean|table true; false if read-only; failure table if not registered.

#### `util_datastore.getAll(storeName)`

Returns all the entries of the store (order not guaranteed).

- `storeName` (*string*) : Store name.
- **returns**: table[] Entries (or failure table).

#### `util_datastore.getChain(storeName, field, value)`

Looks up a seed entry then follows its relation chain (chainField/resolveField set by setChain), without cycles.

- `storeName` (*string*) : Store name.
- `field` (*string*) : Field used to find the seed.
- `value` (*any*) : Seed value.
- **returns**: table[] Seed then linked entries; empty if the seed does not exist.

#### `util_datastore.getEntries(storeName, field, values)`

Returns the entries whose field equals one of the values, without duplicates (deduplicated by primary key).

- `storeName` (*string*) : Store name.
- `field` (*string*) : Search field.
- `values` (*table*) : List of values; a non-table value gives an empty list.
- **returns**: table[] Entries found (or failure table).

#### `util_datastore.getEntry(storeName, field, value)`

Returns the first entry whose field equals value.

- `storeName` (*string*) : Store name.
- `field` (*string*) : Search field (primary key or other).
- `value` (*any*) : Value searched.
- **returns**: table|nil Entry, nil if absent, or failure table if the store is not registered.

#### `util_datastore.getIndex(storeName, field, primaryKey)`

Without primaryKey: list of the distinct values present for the field. With primaryKey = true: table primary key -> field value for each entry (not deduplicated).

- `storeName` (*string*) : Store name.
- `field` (*string*) : Field to index.
- `primaryKey` (*boolean|nil*) : true for the table keyed by primary key.
- **returns**: table List or table, or failure table.

#### `util_datastore.hasEntry(storeName, field, value)`

Returns whether at least one entry has this field equal to value.

- `storeName` (*string*) : Store name.
- `field` (*string*) : Search field.
- `value` (*any*) : Value searched.
- **returns**: boolean true if found (or failure table if the store is unknown).

#### `util_datastore.isRegistered(storeName)`

Returns whether a store is registered.

- `storeName` (*string*) : Store name.
- **returns**: boolean true if saved.

#### `util_datastore.isUnregisteredFailure(result)`

Returns whether a result is the "store_not_registered" failure.

- `result` (*any*) : Result of a module function.
- **returns**: boolean true if it is that failure.

#### `util_datastore.onDeserialized(data)`

Hot reload hook: recreates the stores from the saved registrations (entries to re-read from the file).

- `data` (*table*) : Result of onSerialize.

#### `util_datastore.onSerialize()`

Hot reload hook: serializes only the stores' registrations (not the entries).

- **returns**: table {registrations = ...}.

#### `util_datastore.putEntries(storeName, entries)`

Inserts or replaces entries (identified by the primary key), updates the indexes and rewrites the file. Entries without a primary key are ignored with a warning.

- `storeName` (*string*) : Store name.
- `entries` (*table[]*) : List of entries (tables).
- **returns**: boolean true if something changed; false if read-only, invalid argument or nothing to write (or failure table).

#### `util_datastore.register(storeName, primaryField, opts)`

Registers (or re-registers) a store in memory; does not load the file.

- `storeName` (*string*) : Store name (non-empty).
- `primaryField` (*string|nil*) : Unique primary key field, 'name' by default.
- `opts` (*table|nil*) : {path = folder (default /temp), prefix = file prefix, readonly = boolean}.
- **returns**: boolean false if the name is invalid, otherwise true.

#### `util_datastore.removeEntries(storeName, field, values)`

Removes the entries whose field equals one of the values, then rewrites the file.

- `storeName` (*string*) : Store name.
- `field` (*string*) : Search field.
- `values` (*table*) : List of values.
- **returns**: boolean true if entries were removed.

#### `util_datastore.setChain(storeName, chainField, field)`

Defines how to follow relations for getChain: chainField contains an array of keys, resolved via the field field.

- `storeName` (*string*) : Store name.
- `chainField` (*string*) : Entry field containing an array of linked keys.
- `field` (*string*) : Field in which to look up each key.
- **returns**: boolean|table true, or failure table.

#### `util_datastore.unregister(storeName)`

Removes the in-memory registration without touching the file.

- `storeName` (*string*) : Store name.
- **returns**: boolean true if the store existed.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/datastore.lua`.*

# `util_datastore`

*Fichier : `lua/ge/extensions/util/datastore.lua` · VM : Game Engine (GE) · 425 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_datastore` : `extensions.load("util_datastore")`, puis la globale `util_datastore`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_datastore.clear(storeName)` |  | 347 |
| `util_datastore.getAll(storeName)` |  | 242 |
| `util_datastore.getChain(storeName, field, value)` | lookup, then follow the seed's chainField (array of keys) | 261 |
| `util_datastore.getEntries(storeName, field, values)` | flattened + deduped by primary<br> values must be a table | 194 |
| `util_datastore.getEntry(storeName, field, value)` |  | 184 |
| `util_datastore.getIndex(storeName, field, primaryKey)` | primaryKey=false (default): table of unique values present for that field<br> primaryKey=true: same table but mapped to each entry's primary value (and non-unique) | 221 |
| `util_datastore.hasEntry(storeName, field, value)` |  | 252 |
| `util_datastore.isRegistered(storeName)` |  | 64 |
| `util_datastore.isUnregisteredFailure(result)` |  | 73 |
| `util_datastore.onDeserialized(data)` | *(hook)* | 388 |
| `util_datastore.onInit()` | *(hook)* | 369 |
| `util_datastore.onSerialize()` | carry only the lightweight registrations across a hot reload, NOT the entries *(hook)* | 374 |
| `util_datastore.putEntries(storeName, entries)` | upsert by primaryField: detach the old entry, then re-index | 292 |
| `util_datastore.register(storeName, primaryField, opts)` | storeName, primaryField (unique storage key, default "name"), opts = { path, prefix, readonly }<br> file = <path>/<prefix?><storeName>.<bin\|json> (prefix adds a trailing "-" when set) | 147 |
| `util_datastore.removeEntries(storeName, field, values)` |  | 315 |
| `util_datastore.setChain(storeName, chainField, field)` | chainField: entry field holding an array of related keys | 359 |
| `util_datastore.unregister(storeName)` | in-memory only: drop registration without touching the backing file | 174 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/datastore.lua`.*

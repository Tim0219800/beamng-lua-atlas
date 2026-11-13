---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/datastore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_datastore` : `extensions.load("util_datastore")`, puis la globale `util_datastore`
---@class util_datastore
util_datastore = {}

---Source : lua/ge/extensions/util/datastore.lua:347
---@param storeName any
function util_datastore.clear(storeName) end

---Source : lua/ge/extensions/util/datastore.lua:242
---@param storeName any
function util_datastore.getAll(storeName) end

--- lookup, then follow the seed's chainField (array of keys)
---Source : lua/ge/extensions/util/datastore.lua:261
---@param storeName any
---@param field any
---@param value any
function util_datastore.getChain(storeName, field, value) end

--- flattened + deduped by primary
---  values must be a table
---Source : lua/ge/extensions/util/datastore.lua:194
---@param storeName any
---@param field any
---@param values any
function util_datastore.getEntries(storeName, field, values) end

---Source : lua/ge/extensions/util/datastore.lua:184
---@param storeName any
---@param field any
---@param value any
function util_datastore.getEntry(storeName, field, value) end

--- primaryKey=false (default): table of unique values present for that field
---  primaryKey=true: same table but mapped to each entry's primary value (and non-unique)
---Source : lua/ge/extensions/util/datastore.lua:221
---@param storeName any
---@param field any
---@param primaryKey any
function util_datastore.getIndex(storeName, field, primaryKey) end

---Source : lua/ge/extensions/util/datastore.lua:252
---@param storeName any
---@param field any
---@param value any
function util_datastore.hasEntry(storeName, field, value) end

---Source : lua/ge/extensions/util/datastore.lua:64
---@param storeName any
function util_datastore.isRegistered(storeName) end

---Source : lua/ge/extensions/util/datastore.lua:73
---@param result any
function util_datastore.isUnregisteredFailure(result) end

---Source : lua/ge/extensions/util/datastore.lua:388
---@param data any
function util_datastore.onDeserialized(data) end

---Source : lua/ge/extensions/util/datastore.lua:369
function util_datastore.onInit() end

--- carry only the lightweight registrations across a hot reload, NOT the entries
---Source : lua/ge/extensions/util/datastore.lua:374
function util_datastore.onSerialize() end

--- upsert by primaryField: detach the old entry, then re-index
---Source : lua/ge/extensions/util/datastore.lua:292
---@param storeName any
---@param entries any
function util_datastore.putEntries(storeName, entries) end

--- storeName, primaryField (unique storage key, default "name"), opts = { path, prefix, readonly }
---  file = <path>/<prefix?><storeName>.<bin|json> (prefix adds a trailing "-" when set)
---Source : lua/ge/extensions/util/datastore.lua:147
---@param storeName any
---@param primaryField any
---@param opts any
function util_datastore.register(storeName, primaryField, opts) end

---Source : lua/ge/extensions/util/datastore.lua:315
---@param storeName any
---@param field any
---@param values any
function util_datastore.removeEntries(storeName, field, values) end

--- chainField: entry field holding an array of related keys
---Source : lua/ge/extensions/util/datastore.lua:359
---@param storeName any
---@param chainField any
---@param field any
function util_datastore.setChain(storeName, chainField, field) end

--- in-memory only: drop registration without touching the backing file
---Source : lua/ge/extensions/util/datastore.lua:174
---@param storeName any
function util_datastore.unregister(storeName) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/datastore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic persistent key/value store, with secondary indexes built on demand. Each "store" is registered under a name with a (unique) primary key field and stored in a file <path>/<prefix->name.bin (MessagePack; the JSON format exists in the code but USE_MSGPACK is true). It serves as a data cache (the code mentions a UI cache) and allows searching entries by any field, following relation chains (getChain) and rewriting the file on each modification.
--- Access: extension `util_datastore`: `extensions.load("util_datastore")`, then the global `util_datastore`
---@class util_datastore
util_datastore = {}

--- Empties the store and rewrites the (empty) file.
---Source: lua/ge/extensions/util/datastore.lua:347
---@param storeName string Store name.
---@return boolean|table  true; false if read-only; failure table if not registered.
function util_datastore.clear(storeName) end

--- Returns all the entries of the store (order not guaranteed).
---Source: lua/ge/extensions/util/datastore.lua:242
---@param storeName string Store name.
---@return table[]  Entries (or failure table).
function util_datastore.getAll(storeName) end

--- Looks up a seed entry then follows its relation chain (chainField/resolveField set by setChain), without cycles.
---Source: lua/ge/extensions/util/datastore.lua:261
---@param storeName string Store name.
---@param field string Field used to find the seed.
---@param value any Seed value.
---@return table[]  Seed then linked entries; empty if the seed does not exist.
function util_datastore.getChain(storeName, field, value) end

--- Returns the entries whose field equals one of the values, without duplicates (deduplicated by primary key).
---Source: lua/ge/extensions/util/datastore.lua:194
---@param storeName string Store name.
---@param field string Search field.
---@param values table List of values; a non-table value gives an empty list.
---@return table[]  Entries found (or failure table).
function util_datastore.getEntries(storeName, field, values) end

--- Returns the first entry whose field equals value.
---Source: lua/ge/extensions/util/datastore.lua:184
---@param storeName string Store name.
---@param field string Search field (primary key or other).
---@param value any Value searched.
---@return table|nil  Entry, nil if absent, or failure table if the store is not registered.
function util_datastore.getEntry(storeName, field, value) end

--- Without primaryKey: list of the distinct values present for the field. With primaryKey = true: table primary key -> field value for each entry (not deduplicated).
---Source: lua/ge/extensions/util/datastore.lua:221
---@param storeName string Store name.
---@param field string Field to index.
---@param primaryKey boolean|nil true for the table keyed by primary key.
---@return table  List or table, or failure table.
function util_datastore.getIndex(storeName, field, primaryKey) end

--- Returns whether at least one entry has this field equal to value.
---Source: lua/ge/extensions/util/datastore.lua:252
---@param storeName string Store name.
---@param field string Search field.
---@param value any Value searched.
---@return boolean  true if found (or failure table if the store is unknown).
function util_datastore.hasEntry(storeName, field, value) end

--- Returns whether a store is registered.
---Source: lua/ge/extensions/util/datastore.lua:64
---@param storeName string Store name.
---@return boolean  true if saved.
function util_datastore.isRegistered(storeName) end

--- Returns whether a result is the "store_not_registered" failure.
---Source: lua/ge/extensions/util/datastore.lua:73
---@param result any Result of a module function.
---@return boolean  true if it is that failure.
function util_datastore.isUnregisteredFailure(result) end

--- Hot reload hook: recreates the stores from the saved registrations (entries to re-read from the file).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/datastore.lua:388
---@param data table Result of onSerialize.
function util_datastore.onDeserialized(data) end

--- Initialization hook: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/datastore.lua:369
function util_datastore.onInit() end

--- Hot reload hook: serializes only the stores' registrations (not the entries).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/datastore.lua:374
---@return table  {registrations = ...}.
function util_datastore.onSerialize() end

--- Inserts or replaces entries (identified by the primary key), updates the indexes and rewrites the file. Entries without a primary key are ignored with a warning.
---Source: lua/ge/extensions/util/datastore.lua:292
---@param storeName string Store name.
---@param entries table[] List of entries (tables).
---@return boolean  true if something changed; false if read-only, invalid argument or nothing to write (or failure table).
function util_datastore.putEntries(storeName, entries) end

--- Registers (or re-registers) a store in memory; does not load the file.
---Source: lua/ge/extensions/util/datastore.lua:147
---@param storeName string Store name (non-empty).
---@param primaryField string|nil Unique primary key field, 'name' by default.
---@param opts table|nil {path = folder (default /temp), prefix = file prefix, readonly = boolean}.
---@return boolean  false if the name is invalid, otherwise true.
function util_datastore.register(storeName, primaryField, opts) end

--- Removes the entries whose field equals one of the values, then rewrites the file.
---Source: lua/ge/extensions/util/datastore.lua:315
---@param storeName string Store name.
---@param field string Search field.
---@param values table List of values.
---@return boolean  true if entries were removed.
function util_datastore.removeEntries(storeName, field, values) end

--- Defines how to follow relations for getChain: chainField contains an array of keys, resolved via the field field.
---Source: lua/ge/extensions/util/datastore.lua:359
---@param storeName string Store name.
---@param chainField string Entry field containing an array of linked keys.
---@param field string Field in which to look up each key.
---@return boolean|table  true, or failure table.
function util_datastore.setChain(storeName, chainField, field) end

--- Removes the in-memory registration without touching the file.
---Source: lua/ge/extensions/util/datastore.lua:174
---@param storeName string Store name.
---@return boolean  true if the store existed.
function util_datastore.unregister(storeName) end


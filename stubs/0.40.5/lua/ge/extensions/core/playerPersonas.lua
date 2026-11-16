---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/playerPersonas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_playerPersonas`: visual identity of local players in multiplayer (multiseat). A 'persona' groups a displayed name, an icon, a color and optionally a favorite vehicle, numbered from 1 (player 0 = persona 1). Default values are generated: translated name 'ui.multiseat.playerTag', icon drawn from a pool (random offset per session), color from a palette of 8 hues (computed in OKLCH). A modder uses it to get the name, color and icon of a local player.
--- Access: extension `core_playerPersonas`: `extensions.load("core_playerPersonas")`, then the global `core_playerPersonas`
---@class core_playerPersonas
core_playerPersonas = {}

--- Replaces in place a persona's color with the 'solo' gray and recomputes colorHex and vehicleFallbackPaint.
---Source: lua/ge/extensions/core/playerPersonas.lua:140
---@param persona table Persona returned by get/preview.
---@return table  The same table (or the received value if it is not a table).
function core_playerPersonas.applySoloColor(persona) end

--- Clears a persona's stored data (back to default values).
---Source: lua/ge/extensions/core/playerPersonas.lua:171
---@param personaNumber integer Persona number.
---@return boolean  true if something was cleared.
function core_playerPersonas.clear(personaNumber) end

--- Clears all stored personas.
---Source: lua/ge/extensions/core/playerPersonas.lua:179
---@return boolean  true if something was cleared.
function core_playerPersonas.clearAll() end

--- Builds and returns the persona of the given number (stored values + default values).
---Source: lua/ge/extensions/core/playerPersonas.lua:134
---@param personaNumber integer Persona number >= 1.
---@return table|nil  Persona, or nil if the number is not valid.
function core_playerPersonas.get(personaNumber) end

--- Default name: translation of 'ui.multiseat.playerTag' with { number }, otherwise 'Player N' if core_locales is not loaded.
---Source: lua/ge/extensions/core/playerPersonas.lua:106
---@param personaNumber integer Persona number.
---@return string  Default name.
function core_playerPersonas.getDefaultDisplayName(personaNumber) end

--- Default icon of a persona, taken from the pool with a random offset fixed for the session.
---Source: lua/ge/extensions/core/playerPersonas.lua:114
---@param personaNumber integer Persona number.
---@return string  Icon name.
function core_playerPersonas.getDefaultIcon(personaNumber) end

--- Returns a copy of the list of available persona icons.
---Source: lua/ge/extensions/core/playerPersonas.lua:232
---@return string[]  Icon names.
function core_playerPersonas.getIconPool() end

--- Converts a local player index (0, 1, 2...) to a persona number (index + 1).
---Source: lua/ge/extensions/core/playerPersonas.lua:148
---@param player integer Player index >= 0.
---@return integer|nil  Number, or nil if invalid.
function core_playerPersonas.getNumberForPlayer(player) end

--- Returns the revision counter, incremented on every persona change.
---Source: lua/ge/extensions/core/playerPersonas.lua:237
---@return integer  Current revision.
function core_playerPersonas.getRevision() end

--- Increments the revision without changing anything, to force UIs to refresh.
---Source: lua/ge/extensions/core/playerPersonas.lua:186
function core_playerPersonas.invalidate() end

--- Indicates whether an icon is part of the persona icon pool.
---Source: lua/ge/extensions/core/playerPersonas.lua:233
---@param icon string Icon name.
---@return boolean  true if valid.
function core_playerPersonas.isPersonaIcon(icon) end

--- Builds a purely default persona (without the stored values) for a number (1 if invalid).
---Source: lua/ge/extensions/core/playerPersonas.lua:230
---@param personaNumber integer|nil Persona number.
---@return table  Default persona.
function core_playerPersonas.preview(personaNumber) end

--- Replaces all personas with those of a table (keys = numbers, or the number field of each element) then increments the revision.
---Source: lua/ge/extensions/core/playerPersonas.lua:197
---@param values table Table of personas { id, displayName, icon, color, vehicle }.
---@return boolean  false if values is not a table.
function core_playerPersonas.replaceAll(values) end

--- Restores the state from a snapshot() snapshot and increments the revision.
---Source: lua/ge/extensions/core/playerPersonas.lua:219
---@param value table Snapshot with a personas field.
---@return boolean  false if the snapshot is invalid.
function core_playerPersonas.restoreSnapshot(value) end

--- Stores a persona's data (id, displayName, icon, color, vehicle) and increments the revision.
---Source: lua/ge/extensions/core/playerPersonas.lua:154
---@param personaNumber integer Number >= 1.
---@param data table { id, displayName, icon, color = {r,g,b}, vehicle }
---@return boolean  true if stored, false if the arguments are invalid.
function core_playerPersonas.set(personaNumber, data) end

--- Deep copy of the state: { personas, revision }.
---Source: lua/ge/extensions/core/playerPersonas.lua:190
---@return table  Snapshot.
function core_playerPersonas.snapshot() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/parcelMods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Defines the career mode parcel modifiers ("mods"): timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous. Each mod has an unlock flag (unlockFlag), a sort priority, an icon, translated texts and a template (makeTemplate) that produces the table attached to the parcel. Used to generate a parcel's mods (generateModifiers), know whether they are unlocked and count delivery statistics per mod.
--- Access: extension `career_modules_delivery_parcelMods`: `extensions.load("career_modules_delivery_parcelMods")`, then the global `career_modules_delivery_parcelMods`
---@class career_modules_delivery_parcelMods
career_modules_delivery_parcelMods = {}

--- Computes a delivery time limit in seconds: distance/13 + 30 * (1 + random).
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:207
---@param distance number Trip distance in meters.
---@return number  Time in seconds.
function career_modules_delivery_parcelMods.calculateTimedModifierTime(distance) end

--- Draws a parcel's mods according to the parcelTemplate.modChance probabilities (one draw per key, keys sorted), adds the large mod for very big or very heavy parcels (65 slots, weight 80), then sorts by priority.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:218
---@param item table Parcel being generated; uses groupSeed (seed), slots and weight.
---@param parcelTemplate table Parcel template with the table modChance[modKey] = probability 0..1.
---@param distance number Trip distance, passed to makeTemplate (useful for timed).
---@return table  List of mod tables sorted by ascending priority.
function career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance) end

--- Returns the translated label and the translated short description (empty string if the mod has none).
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:201
---@param key string Mod key.
---@return string  Translated label.
---@return string  Translated short description or ''.
function career_modules_delivery_parcelMods.getLabelAndShortDescription(key) end

--- Returns a copy of a mod's data with unlockLabel, label and shortDescription already translated via _tr.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:188
---@param key string Mod key (timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous).
---@return table|nil  Mod data, or nil if the key is unknown.
function career_modules_delivery_parcelMods.getModData(key) end

--- Returns the mod's UI icon name.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:200
---@param key string Mod key.
---@return string  Icon identifier.
function career_modules_delivery_parcelMods.getModifierIcon(key) end

--- Returns the translated text describing how to unlock the mod.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:276
---@param key string Mod key.
---@return string  Translated label.
function career_modules_delivery_parcelMods.getParcelModProgressLabel(key) end

--- Returns the unlock state of each mod.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:268
---@return table<string, boolean>  modKey -> unlocked.
function career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple() end

--- Returns the progress table (counters per mod type: delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), used for saving.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:184
---@return table  Progress table, per mod type.
function career_modules_delivery_parcelMods.getProgress() end

--- Indicates whether the mod is marked important (timed and precious).
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:205
---@param key string Mod key.
---@return boolean  true if important.
function career_modules_delivery_parcelMods.isImportant(key) end

--- Indicates whether the mod's unlock flag is active in career_modules_unlockFlags.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:242
---@param modKey string Mod key.
---@return boolean  false if the mod is unknown or has no flag.
function career_modules_delivery_parcelMods.isParcelModUnlocked(modKey) end

--- For a set of mods, tells whether at least one is locked and returns the definition of the highest-level flag among those examined.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:248
---@param modKeys table<string, any> Table whose keys are mod keys.
---@return boolean  true if at least one mod is locked.
---@return table|nil  Flag definition (highest level), or nil.
function career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys) end

--- Hook called on career activation: stores the references to the other delivery extensions (parcelManager, cargoScreen, general, generator, progress, tutorial).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:6
function career_modules_delivery_parcelMods.onCareerActivated() end

--- Replaces the per-mod progress statistics (save loading). With no argument, reverts to a copy of the default template.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:180
---@param data table|nil Saved progress table, or nil to reset.
function career_modules_delivery_parcelMods.setProgress(data) end

--- Updates the statistics when a parcel is delivered: increments progress[type].delivered for each mod, and for timed classifies the delivery as on time, delayed or late according to the time elapsed since cargo.loadedAtTimeStamp.
---Source: lua/ge/extensions/career/modules/delivery/parcelMods.lua:279
---@param cargo table Delivered parcel, with modifiers and loadedAtTimeStamp.
function career_modules_delivery_parcelMods.trackModifierStats(cargo) end


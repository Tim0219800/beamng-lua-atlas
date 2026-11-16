# `career_modules_delivery_parcelMods`

*File: `lua/ge/extensions/career/modules/delivery/parcelMods.lua` · VM: Game Engine (GE) · 326 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_parcelMods`: `extensions.load("career_modules_delivery_parcelMods")`, then the global `career_modules_delivery_parcelMods`

Defines the career mode parcel modifiers ("mods"): timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous. Each mod has an unlock flag (unlockFlag), a sort priority, an icon, translated texts and a template (makeTemplate) that produces the table attached to the parcel. Used to generate a parcel's mods (generateModifiers), know whether they are unlocked and count delivery statistics per mod.

## Notes

- In generateModifiers, the condition `item.slots >= largeSlotThreshold or item.weight >= heavyWeightThreshold and not parcelTemplate.modChance.large` is evaluated with Lua precedence (and before or): the `not modChance.large` test only applies to the weight, not to the slots. A parcel of 65 slots or more therefore always gets a large mod, even if the template already has a large chance (duplicate possible).
- generateModifiers calls math.randomseed(item.groupSeed): generation is deterministic per group, but it reseeds the global random generator.
- progressTemplate uses the key 'delivieries' (typo), whereas trackModifierStats increments 'delivered': the template's 'delivieries' counters are never incremented.
- The timed mods have moneyMultipler (sic) 1.5, post 1.2, precious 2.5, large 1.2, supplies 1.0; the timed time is distance/13 + 30*random + 30 seconds (timeUntilDelayed), timeUntilLate = 1.25 * that time + 15.
- calculateTimedModifierTime (distance/13 + 30*(1+random)) is not used by the timed mod itself, which recomputes its own time in makeTemplate.
- getModifierIcon, getLabelAndShortDescription and isImportant crash if the key does not exist (indexing modifiers[key] without a test), unlike getModData.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_parcelMods.calculateTimedModifierTime(distance)` | Computes a delivery time limit in seconds: distance/13 + 30 * (1 + random). | 207 |
| `career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance)` | Draws a parcel's mods according to the parcelTemplate.modChance probabilities (one draw per key, keys sorted), adds the large mod for very big or very heavy parcels (65 slots, weight 80), then sorts by priority. | 218 |
| `career_modules_delivery_parcelMods.getLabelAndShortDescription(key)` | Returns the translated label and the translated short description (empty string if the mod has none). | 201 |
| `career_modules_delivery_parcelMods.getModData(key)` | Returns a copy of a mod's data with unlockLabel, label and shortDescription already translated via _tr. | 188 |
| `career_modules_delivery_parcelMods.getModifierIcon(key)` | Returns the mod's UI icon name. | 200 |
| `career_modules_delivery_parcelMods.getParcelModProgressLabel(key)` | Returns the translated text describing how to unlock the mod. | 276 |
| `career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple()` | Returns the unlock state of each mod. | 268 |
| `career_modules_delivery_parcelMods.getProgress()` | Returns the progress table (counters per mod type: delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), used for saving. | 184 |
| `career_modules_delivery_parcelMods.isImportant(key)` | Indicates whether the mod is marked important (timed and precious). | 205 |
| `career_modules_delivery_parcelMods.isParcelModUnlocked(modKey)` | Indicates whether the mod's unlock flag is active in career_modules_unlockFlags. | 242 |
| `career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys)` | For a set of mods, tells whether at least one is locked and returns the definition of the highest-level flag among those examined. | 248 |
| `career_modules_delivery_parcelMods.onCareerActivated()` | Hook called on career activation: stores the references to the other delivery extensions (parcelManager, cargoScreen, general, generator, progress, tutorial). *(internal)* *(hook)* | 6 |
| `career_modules_delivery_parcelMods.setProgress(data)` | Replaces the per-mod progress statistics (save loading). With no argument, reverts to a copy of the default template. | 180 |
| `career_modules_delivery_parcelMods.trackModifierStats(cargo)` | Updates the statistics when a parcel is delivered: increments progress[type].delivered for each mod, and for timed classifies the delivery as on time, delayed or late according to the time elapsed since cargo.loadedAtTimeStamp. | 279 |

### Parameter details

#### `career_modules_delivery_parcelMods.calculateTimedModifierTime(distance)`

Computes a delivery time limit in seconds: distance/13 + 30 * (1 + random).

- `distance` (*number*) : Trip distance in meters.
- **returns**: number Time in seconds.

#### `career_modules_delivery_parcelMods.generateModifiers(item, parcelTemplate, distance)`

Draws a parcel's mods according to the parcelTemplate.modChance probabilities (one draw per key, keys sorted), adds the large mod for very big or very heavy parcels (65 slots, weight 80), then sorts by priority.

- `item` (*table*) : Parcel being generated; uses groupSeed (seed), slots and weight.
- `parcelTemplate` (*table*) : Parcel template with the table modChance[modKey] = probability 0..1.
- `distance` (*number*) : Trip distance, passed to makeTemplate (useful for timed).
- **returns**: table List of mod tables sorted by ascending priority.

#### `career_modules_delivery_parcelMods.getLabelAndShortDescription(key)`

Returns the translated label and the translated short description (empty string if the mod has none).

- `key` (*string*) : Mod key.
- **returns**: string Translated label.
- **returns**: string Translated short description or ''.

#### `career_modules_delivery_parcelMods.getModData(key)`

Returns a copy of a mod's data with unlockLabel, label and shortDescription already translated via _tr.

- `key` (*string*) : Mod key (timed, post, precious, supplies, large, fluid, dryBulk, parcel, hazardous).
- **returns**: table|nil Mod data, or nil if the key is unknown.

#### `career_modules_delivery_parcelMods.getModifierIcon(key)`

Returns the mod's UI icon name.

- `key` (*string*) : Mod key.
- **returns**: string Icon identifier.

#### `career_modules_delivery_parcelMods.getParcelModProgressLabel(key)`

Returns the translated text describing how to unlock the mod.

- `key` (*string*) : Mod key.
- **returns**: string Translated label.

#### `career_modules_delivery_parcelMods.getParcelModUnlockStatusSimple()`

Returns the unlock state of each mod.

- **returns**: table<string, boolean> modKey -> unlocked.

#### `career_modules_delivery_parcelMods.getProgress()`

Returns the progress table (counters per mod type: delivered, onTimeDeliveries, delayedDeliveries, lateDeliveries, lost…), used for saving.

- **returns**: table Progress table, per mod type.

#### `career_modules_delivery_parcelMods.isImportant(key)`

Indicates whether the mod is marked important (timed and precious).

- `key` (*string*) : Mod key.
- **returns**: boolean true if important.

#### `career_modules_delivery_parcelMods.isParcelModUnlocked(modKey)`

Indicates whether the mod's unlock flag is active in career_modules_unlockFlags.

- `modKey` (*string*) : Mod key.
- **returns**: boolean false if the mod is unknown or has no flag.

#### `career_modules_delivery_parcelMods.lockedBecauseOfMods(modKeys)`

For a set of mods, tells whether at least one is locked and returns the definition of the highest-level flag among those examined.

- `modKeys` (*table<string, any>*) : Table whose keys are mod keys.
- **returns**: boolean true if at least one mod is locked.
- **returns**: table|nil Flag definition (highest level), or nil.

#### `career_modules_delivery_parcelMods.setProgress(data)`

Replaces the per-mod progress statistics (save loading). With no argument, reverts to a copy of the default template.

- `data` (*table|nil*) : Saved progress table, or nil to reset.

#### `career_modules_delivery_parcelMods.trackModifierStats(cargo)`

Updates the statistics when a parcel is delivered: increments progress[type].delivered for each mod, and for timed classifies the delivery as on time, delayed or late according to the time elapsed since cargo.loadedAtTimeStamp.

- `cargo` (*table*) : Delivered parcel, with modifiers and loadedAtTimeStamp.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/parcelMods.lua`.*

# `career_modules_unlockFlags`

*File: `lua/ge/extensions/career/modules/unlockFlags.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_unlockFlags`: `extensions.load("career_modules_unlockFlags")`, then the global `career_modules_unlockFlags`

Career unlock flags. The definitions come from other extensions via the onGetUnlockFlagDefinitions hook (each adds {unlockedFunction, icon, level, label} to the received table); a flag's value is computed on demand with unlockedFunction then cached, or forced with setFlag.

## Notes

- The definitions are reloaded and the cache cleared on each onCareerActivated.
- getFlag does not cache the false value (the condition `not flagCache[flagName]` is true): unlockedFunction is therefore re-evaluated on every call as long as the flag is false. A missing definition gives false.
- setFlag emits the onUnlockFlagChanged(flagName, value) hook.
- onSaveCurrentProfile is empty (nothing is saved by this module).
- getFlagLockedReason exists in the code but is not exported.

**Dependencies (loaded first):** `career_saveSystem`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_unlockFlags.getFlag(flagName)` | Returns a flag's value (evaluating it via its definition if needed). false if the flag has no definition. | 29 |
| `career_modules_unlockFlags.getFlagDefinition(flagName)` | Returns the registered definition of a flag. | 38 |
| `career_modules_unlockFlags.onCareerActivated()` | Hook called when the career is activated: clears the cache and reloads the definitions via the onGetUnlockFlagDefinitions hook. *(internal)* *(hook)* | 59 |
| `career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath)` | Profile save hook; does nothing in this version. *(internal)* *(hook)* | 23 |
| `career_modules_unlockFlags.resetFlags()` | Clears the flag value cache (definitions remain). | 55 |
| `career_modules_unlockFlags.setFlag(flagName, value)` | Forces a flag's value in the cache and emits onUnlockFlagChanged. | 49 |

### Parameter details

#### `career_modules_unlockFlags.getFlag(flagName)`

Returns a flag's value (evaluating it via its definition if needed). false if the flag has no definition.

- `flagName` (*string*) : Flag name.
- **returns**: boolean Flag value.

#### `career_modules_unlockFlags.getFlagDefinition(flagName)`

Returns the registered definition of a flag.

- `flagName` (*string*) : Flag name.
- **returns**: table|nil Definition {unlockedFunction, icon, level, label} or nil.

#### `career_modules_unlockFlags.onSaveCurrentProfile(currentSavePath)`

Profile save hook; does nothing in this version.

- `currentSavePath` (*string*) : Profile save folder.

#### `career_modules_unlockFlags.setFlag(flagName, value)`

Forces a flag's value in the cache and emits onUnlockFlagChanged.

- `flagName` (*string*) : Flag name.
- `value` (*boolean*) : New value.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_saveSystem"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGetUnlockFlagDefinitions` — listened to by 1 module(s)
- `onUnlockFlagChanged`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/unlockFlags.lua`.*

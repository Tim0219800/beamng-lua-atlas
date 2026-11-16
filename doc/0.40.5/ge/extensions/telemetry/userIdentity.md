# `telemetry_userIdentity`

*File: `lua/ge/extensions/telemetry/userIdentity.lua` · VM: Game Engine (GE) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_userIdentity`: `extensions.load("telemetry_userIdentity")`, then the global `telemetry_userIdentity`

Manages the user's anonymous ID used by telemetry. A random "salt" is created once and stored in `/telemetry/salt.txt`; the ID is the SHA-256 hash of that file. An old `/gameTelemetries/.salt` file is migrated automatically to keep the same ID.

## Example

```lua
local id = telemetry_userIdentity.getAnonymousUserID()
```

## Notes

- The salt file contains an explanatory banner (link to the privacy policy) followed by 6 lines of 80 random hexadecimal characters (`SecureComm.getRandomBytesHexSlow(40)`).
- The hash covers the whole content of the file read, banner included; during a migration, the old content is copied as is, without a banner, so as not to change the ID.
- Each call of getAnonymousUserID rereads the file and recomputes the hash (no cache).
- The extension sets itself to manual unload on load.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_userIdentity.getAnonymousUserID()` | Returns the anonymous ID: the SHA-256 hash (`hashStringSHA256`) of the salt. Creates or migrates the salt file if needed (`telemetry` folder created as needed). | 94 |
| `telemetry_userIdentity.onExtensionLoaded()` | Hook called when the extension loads. Sets the extension to manual unload to avoid its automatic unload. *(internal)* *(hook)* | 101 |

### Parameter details

#### `telemetry_userIdentity.getAnonymousUserID()`

Returns the anonymous ID: the SHA-256 hash (`hashStringSHA256`) of the salt. Creates or migrates the salt file if needed (`telemetry` folder created as needed).

- **returns**: string SHA-256 hash of the salt file's contents.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/userIdentity.lua`.*

# `license`

*File: `lua/ge/extensions/license.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `license`: `extensions.load("license")`, then the global `license`

Queries the state of the BeamNG.tech (research) and commercial licenses through the C++ objects ResearchVerifier and CommercialVerifier, with a per-session cache. Used to filter BeamNG.tech-only input map and action files (paths containing "_beamng.tech") when the license is not valid. For a modder, it is mostly useful to know whether the game is running with a tech/commercial license.

## Notes

- Results are cached in stateCache on first read and never refreshed: a license change during the session is not seen.
- If ResearchVerifier (or CommercialVerifier) does not exist, isValid (resp. isCommercial) returns false without caching.
- The path filter is a simple search for the substring "_beamng.tech" in the path.

## Functions

| Function | Description | Line |
|---|---|---|
| `license.isAllowedActionsPath(path)` | Same rule for action files. | 40 |
| `license.isAllowedInputmapPath(path)` | Tells whether it is relevant to load this input map: always true with a valid tech license, otherwise false if the path contains "_beamng.tech". | 34 |
| `license.isCommercial()` | Returns whether the license is commercial (CommercialVerifier.isCommercialLicense). | 19 |
| `license.isValid()` | Returns whether the BeamNG.tech license is verified (ResearchVerifier.isTechLicenseVerified). | 9 |
| `license.requestState()` | Sends the tech license state to the UI via guihooks (TechLicenseState). | 29 |

### Parameter details

#### `license.isAllowedActionsPath(path)`

Same rule for action files.

- `path` (*string*) : Action file path.
- **returns**: boolean 

#### `license.isAllowedInputmapPath(path)`

Tells whether it is relevant to load this input map: always true with a valid tech license, otherwise false if the path contains "_beamng.tech".

- `path` (*string*) : Input map file path.
- **returns**: boolean 

#### `license.isCommercial()`

Returns whether the license is commercial (CommercialVerifier.isCommercialLicense).

- **returns**: boolean false without a verifier or without a license.

#### `license.isValid()`

Returns whether the BeamNG.tech license is verified (ResearchVerifier.isTechLicenseVerified).

- **returns**: boolean false without a verifier or without a license.

**UI events (guihooks.trigger):** `TechLicenseState`

## Calls into the engine (C++)

- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/license.lua`.*

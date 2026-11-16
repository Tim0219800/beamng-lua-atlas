# `util_docCreator`

*File: `lua/ge/extensions/util/docCreator.lua` · VM: Game Engine (GE) · 303 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_docCreator`: `extensions.load("util_docCreator")`, then the global `util_docCreator`

Internal BeamNG tool to generate the JSON data and resources (images copied with a name based on the SHA1 hash) that feed the online documentation (Hugo system). For each available language, it exports the list of levels and vehicles (models and configurations); it also exports the game version, physical materials, JBeam defaults, JBeam statistics and tested game controllers (from /settings/inputmaps/). Everything is written to the doc-out/ folder (data/ and resources/). Of little use to a modder, except as an example of accessing the level/vehicle lists.

## Example

```lua
extensions.util_docCreator.run()
```

## Notes

- Both functions start a job (core_jobsystem): processing is asynchronous and prints DONE to the console at the end.
- The script changes the game language (Lua.userLanguage, reloadLanguages, onSettingsChanged hook) for each language; the original language is not restored at the end.
- Bug: in getTestedControllers, the vidpid mismatch error message contains `dumps(out.vidpid)".. vs filename "` (missing .. operator before the string), which is a function call on a string and would cause a Lua error if the two identifiers differ.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_docCreator.run()` | Creates an asynchronous job that generates all the documentation data (levels, vehicles per language, then common data) in doc-out/data/ and doc-out/resources/. | 290 |
| `util_docCreator.runAndQuit()` | Like run(), but exits the game (shutdown(0)) once generation is finished. Intended for command-line generation. | 294 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSettingsChanged` — listened to by 25 module(s)

## Calls into the engine (C++)

- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `findFiles`, `hashFileSHA1`
- `Lua:` `getSelectedLanguage`, `reloadLanguages`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/docCreator.lua`.*

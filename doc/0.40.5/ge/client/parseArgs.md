# `parseArgs`

*File: `lua/ge/client/parseArgs.lua` · VM: Game Engine (GE) · 142 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `parseArgs`

Parses the game's command-line arguments ($Game::argc / $Game::argv0…) and applies or stores the recognized options. Useful to launch BeamNG with -level, -vehicle, -lua, -luafile, etc.

## Example

```lua
-- command line: BeamNG.drive.exe -level gridmap_v2 -vehicle pickup -vehicleConfig "pickup/myConfig.pc" -lua "print('hi')"
```

## Notes

- Handled options: -log <0|1|2> (the received mode is shifted by +4 unless 0), -cefdev, -fullscreen, -windowed, -vehicleConfig, -vehicle ($beamngVehicleArgs), -useDefaultPc, -translationScrambleDebug, -luafile (require), -lua (LuaExecuteQueueString), -onLevelLoad_ext, -level ($levelToLoad), -tcom / -tcom-capture (loads tech/techCore; -tcom also opens the server), -levelOffset x y z (server.setLevelOffset), -enableAiRecordingForMissions.
- -worldeditor is obsolete: only an error is logged (use -worldEditor).
- Simple options are stored in M.args (vehicleConfig, useDefaultPc, translationScrambleDebug, enableAiRecordingForMissions); the others go through VariableRegistry or engine functions.
- Bug: in the for loop, "i = i + 1" does not actually skip the next argument in Lua (the loop variable is local to each iteration); the consumed value is therefore re-read as an argument afterwards, with no effect as long as it does not look like an option.
- The local functions pushFront/pushBack/popFront are not used.

## Functions

| Function | Description | Line |
|---|---|---|
| `parseArgs.defaultParseArgs()` | Resets M.args then goes through all command-line arguments and applies each recognized option. *(internal)* | 29 |

## Fields

| Field | Type | Description |
|---|---|---|
| `args` | table | Parsing result: keys vehicleConfig (string), useDefaultPc, translationScrambleDebug, enableAiRecordingForMissions (booleans). Reset to {} on each call of defaultParseArgs. |

**Loads extensions:** `tech/techCore`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/parseArgs.lua`.*

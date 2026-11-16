# `util_followTheWhiteRabbit`

*File: `lua/ge/extensions/util/followTheWhiteRabbit.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_followTheWhiteRabbit`: `extensions.load("util_followTheWhiteRabbit")`, then the global `util_followTheWhiteRabbit`

Small easter egg (Matrix reference): once loaded, the extension creates a "neo" console context, activates it and displays a mini text adventure. In this context, the "throttle" command answers "You crash. Game over."; other commands are ignored.

## Example

```lua
extensions.load('util_followTheWhiteRabbit')
```

## Notes

- The console context stays on 'neo' after loading; there is no exit code in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd)` | Hook called when a command is run in the console. Ignores any context other than 'neo'; for the 'throttle' command, prints "You crash. Game over.". *(internal)* *(hook)* | 18 |
| `util_followTheWhiteRabbit.onExtensionLoaded()` | Called when the extension loads: disables console log timestamps, adds and activates the 'neo' context then displays the intro text. *(internal)* *(hook)* | 9 |

### Parameter details

#### `util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd)`

Hook called when a command is run in the console. Ignores any context other than 'neo'; for the 'throttle' command, prints "You crash. Game over.".

- `context` (*string*) : Active console context
- `cmd` (*string*) : Command entered

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/followTheWhiteRabbit.lua`.*

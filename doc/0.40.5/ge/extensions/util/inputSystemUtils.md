# `util_inputSystemUtils`

*File: `lua/ge/extensions/util/inputSystemUtils.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_inputSystemUtils`: `extensions.load("util_inputSystemUtils")`, then the global `util_inputSystemUtils`

Maintenance tools for inputmaps files (controller profiles in /settings/inputmaps/, JSON format). printStats counts the bindings and prints the 20 most used actions; resave re-reads all inputmaps, completes vidpid and vendorName (from vendorNames.json), sorts the bindings by control then action and rewrites them with custom JSON formatting. Intended for game developers and controller profile creators.

## Example

```lua
extensions.util_inputSystemUtils.printStats()
extensions.util_inputSystemUtils.resave()
```

## Notes

- resave writes directly to the files found under an inputmaps/ folder; use with caution.
- The vidpid is inferred from the file name if the field is missing; it is removed if it is not made of 8 hexadecimal characters. The vendor id is made of characters 5 to 8.
- If a binding has no control field, the sort falls back to comparing tostring(table), which is not stable.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_inputSystemUtils.printStats()` | Walks all JSON files whose path contains inputmaps/, prints the total number of bindings and the 20 most frequent actions. | 20 |
| `util_inputSystemUtils.resave()` | Rewrites all inputmaps with normalized formatting (control key first, bindings last, small tables folded onto one line); writes the file only if the content changes, and prints the result per file. | 77 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/inputSystemUtils.lua`.*

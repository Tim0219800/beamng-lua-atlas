# `util_sortLines`

*File: `lua/ge/extensions/util/sortLines.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_sortLines`: `extensions.load("util_sortLines")`, then the global `util_sortLines`

Development tool that sorts, by "name" field, the sound JSON files of a level. These files contain one JSON object per line ("JSON lines" format) in /levels/<level>/main/MissionGroup/Audio/. handleLevel walks the *.json files of this folder and handleFile rewrites each file with its lines sorted by name. It modifies files in place.

## Example

```lua
util_sortLines.handleLevel('west_coast_usa')
```

## Notes

- Overwrites the original file (io.open(path, 'w')) with no backup; use it on a working copy.
- Empty lines are removed on rewrite. Each line is decoded with jsonDecode; lines without a name field are sorted with the empty name (first).
- Probable bug: the gmatch('([^\n]*)\n?') pattern produces a last empty string when the file ends with a line break; jsonDecode('') does not return a table, and obj.name would then cause a Lua error (indexing nil).
- table.sort is not stable: the relative order of lines with the same name is not guaranteed.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_sortLines.handleFile(path)` | Reads a JSON lines file, sorts the lines by their name field (ascending order) and rewrites the file. | 11 |
| `util_sortLines.handleLevel(level)` | Sorts all the *.json files (non-recursive) of the /levels/<level>/main/MissionGroup/Audio/ folder. | 35 |

### Parameter details

#### `util_sortLines.handleFile(path)`

Reads a JSON lines file, sorts the lines by their name field (ascending order) and rewrites the file.

- `path` (*string*) : Path of the file to sort.

#### `util_sortLines.handleLevel(level)`

Sorts all the *.json files (non-recursive) of the /levels/<level>/main/MissionGroup/Audio/ folder.

- `level` (*string*) : Level folder name.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/sortLines.lua`.*

# `util_jbeamStats`

*File: `lua/ge/extensions/util/jbeamStats.lua` · VM: Game Engine (GE) · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_jbeamStats`: `extensions.load("util_jbeamStats")`, then the global `util_jbeamStats`

Computes statistics over all .jbeam files accessible to the game (including mounted mods): number of files, parts, lines, root parts (slotType "main"), number of occurrences of each section and of data rows per section. Used by developers for documentation (see docCreator) and by curious modders interested in the scale of JBeam data.

## Example

```lua
dump(extensions.util_jbeamStats.getStats())
jsonWriteFile('jbeam_stats.json', extensions.util_jbeamStats.getStats(), true)
```

## Notes

- The analysis rereads and decodes all .jbeam files: the call is slow and blocks the GE thread.
- Minor bug: the line count (content:gsub) is done before the content ~= nil test; an unreadable file would cause an error.
- A file whose JSON decoding fails (pcall) is ignored for part statistics, but its lines are already counted.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_jbeamStats.getStats()` | Walks all .jbeam files and returns a statistics table. | 13 |

### Parameter details

#### `util_jbeamStats.getStats()`

Walks all .jbeam files and returns a statistics table.

- **returns**: table Fields: totalJbeamFiles, partCount, sectionCount (name -> count), sectionCountOrdered (list of {section, count} pairs sorted in descending order), sectionRowCount (name -> rows excluding header), totalLineCount, totalRootParts, totalModifiersCount

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/jbeamStats.lua`.*

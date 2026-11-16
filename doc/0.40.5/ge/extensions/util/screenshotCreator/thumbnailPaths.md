# `util_screenshotCreator_thumbnailPaths`

*File: `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_thumbnailPaths`: `extensions.load("util_screenshotCreator_thumbnailPaths")`, then the global `util_screenshotCreator_thumbnailPaths`

Computation of the vehicle thumbnail output paths for the thumbnail composer. All files go in vehicles/<modelKey>/ in .jpg format; a config's thumbnail is named <config>.jpg, and default.jpg for the default config in "defaults" mode. Names are sanitized (characters other than letters, digits, _, . and - replaced by _).

## Notes

- captureMode is "defaults" (only the default config is written, under the name default.jpg) or "all" (one thumbnail per config; the default config is also copied to default.jpg via paths.defaultFinal).
- makeOutputPaths creates the output folder (FS:directoryCreate): it has a side effect on the disk.
- hasThumbnail tests <config>.jpg then <config>.png in vehicles/<modelKey>/ (relative path, i.e. user folder and game folder via the virtual file system).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode)` | Computes the final path of a thumbnail and its folder. | 12 |
| `util_screenshotCreator_thumbnailPaths.hasThumbnail(item)` | Indicates whether a thumbnail (.jpg or .png) already exists for the item. | 19 |
| `util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode)` | Creates the output folder and returns the paths to use for the capture. | 24 |
| `util_screenshotCreator_thumbnailPaths.safePathPart(value)` | Sanitizes a piece of file name: replaces any character outside [A-Za-z0-9_.-] with _; returns "unknown" if the result is empty. | 7 |

### Parameter details

#### `util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode)`

Computes the final path of a thumbnail and its folder.

- `item` (*table*) : Item {modelKey, configName, isDefaultConfig}.
- `captureMode` (*string*) : "defaults" or "all".
- **returns**: string File path, e.g. vehicles/pickup/d15_4wd.jpg.
- **returns**: string Output folder, e.g. vehicles/pickup/.

#### `util_screenshotCreator_thumbnailPaths.hasThumbnail(item)`

Indicates whether a thumbnail (.jpg or .png) already exists for the item.

- `item` (*table*) : Item {modelKey, configName}.
- **returns**: boolean true if the file exists.

#### `util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode)`

Creates the output folder and returns the paths to use for the capture.

- `item` (*table*) : Item {modelKey, configName, isDefaultConfig}.
- `captureMode` (*string*) : "defaults" or "all".
- **returns**: table {outputFolder, final, defaultFinal = default.jpg path to copy ("all" mode, default config)}.

#### `util_screenshotCreator_thumbnailPaths.safePathPart(value)`

Sanitizes a piece of file name: replaces any character outside [A-Za-z0-9_.-] with _; returns "unknown" if the result is empty.

- `value` (*any*) : Value converted to a string.
- **returns**: string Safe name.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua`.*

# `ui_options`

*File: `lua/ge/extensions/ui/options.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_options`: `extensions.load("ui_options")`, then the global `ui_options`

Small GE-side utility for the layout of the Vue options menu. It reads which layout.json / layout.dev.json files exist in the user folder and can save a layout in /ui/ui-vue/src/modules/options/runtime/ (therefore in the user folder). Useful to a modder who wants to override the options menu structure.

## Example

```lua
ui_options.saveLayout("mon-layout", jsonString) -- writes layout.mon-layout.json
```

## Notes

- The saveLayout key must be empty/nil or match ^[%w%-_]+$; otherwise the function logs an error and returns false.
- isValidKey is only called if key is neither nil nor empty, so there is no risk of a string.match error on nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_options.getUserFolderLayouts()` | Lists those of the layout.json and layout.dev.json files whose real path is under the user folder (FS:getUserPath). | 16 |
| `ui_options.saveLayout(key, data)` | Writes the JSON data to layout[.key].json under /ui/ui-vue/src/modules/options/runtime/ via writeFile. | 30 |

### Parameter details

#### `ui_options.getUserFolderLayouts()`

Lists those of the layout.json and layout.dev.json files whose real path is under the user folder (FS:getUserPath).

- **returns**: string[] File names found; empty if the user folder is unknown.

#### `ui_options.saveLayout(key, data)`

Writes the JSON data to layout[.key].json under /ui/ui-vue/src/modules/options/runtime/ via writeFile.

- `key` (*string|nil*) : File suffix (safe slug); nil or empty for layout.json.
- `data` (*string*) : Already serialized JSON content.
- **returns**: boolean true if the write succeeded, false if data is not a string, the key is invalid or the write fails.

## Calls into the engine (C++)

- `FS:` `getFileRealPath`, `getUserPath`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/options.lua`.*

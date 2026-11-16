# `editor_dynamicDecals_news`

*File: `lua/ge/extensions/editor/dynamicDecals/news.lua` · VM: Game Engine (GE) · 170 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_news`: `extensions.load("editor_dynamicDecals_news")`, then the global `editor_dynamicDecals_news`

"Vehicle Livery Creator - News" window (public name of the Dynamic Decals tool): welcome message, link to the BeamNG forum thread and version history (1.1.0, 1.0.1, 1.0.0, hardcoded texts). It opens automatically when the tool version (tool.version) exceeds the one stored in the preference `dynamicDecalsTool.general.version`, or as long as "do not show again" is not checked.

## Notes

- When a new version is detected, the general.version preference is updated and doNotShowAgain reset to false.
- The window is also reopened every frame as long as windowBeenClosed == false and doNotShowAgain == false; the "OK" button sets windowBeenClosed to true and hides the window.
- The texts are in English, untranslated.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_news.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 160 |
| `editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry)` | Registers the bool preference `dynamicDecalsTool.news.doNotShowAgain` (default false). *(internal)* | 154 |
| `editor_dynamicDecals_news.setup(tool_in)` | Called by the tool: gets helper, declares the editor window (640x640) and registers the window drawing via tool.registerOnEditorGuiFn. *(internal)* | 145 |
| `editor_dynamicDecals_news.showWindow()` | Opens the news window. | 164 |

### Parameter details

#### `editor_dynamicDecals_news.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry)`

Registers the bool preference `dynamicDecalsTool.news.doNotShowAgain` (default false).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_news.setup(tool_in)`

Called by the tool: gets helper, declares the editor window (640x640) and registers the window drawing via tool.registerOnEditorGuiFn.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/news.lua`.*

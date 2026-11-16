# `editor_headlessEditorTest`

*File: `lua/ge/extensions/editor/headlessEditorTest.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_headlessEditorTest`: `extensions.load("editor_headlessEditorTest")`, then the global `editor_headlessEditorTest`

Development example of the editor's "headless" mode (hides menus and toolbars to show only its own tool). The module only exports its hooks if shipping_build is false: in a production build, it is empty. It shows how to enter/exit the mode (editor.enableHeadless), draw your own menu bar via onEditorHeadlessMainMenuBar and open a tool window and a floating toolbar.

## Example

```lua
-- enable headless mode for a tool
editor.enableHeadless(true, 'myHeadlessTool')
-- disable it
editor.enableHeadless(false, 'myHeadlessTool')
```

## Notes

- No function is exported in a production build (shipping_build): the hooks are only defined outside shipping.
- The tool name ("myHeadlessTool") must be unique; the functions only act if editor.isHeadlessToolActive(toolName) is true.
- The menu is called "Headless Editor Test" (Debug group); the toolbar buttons only do prints.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/headlessEditorTest.lua`.*

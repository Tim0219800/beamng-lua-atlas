# `editor_assetManagementTool`

*File: `lua/ge/extensions/editor/assetManagementTool.lua` · VM: Game Engine (GE) · 2025 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assetManagementTool`: `extensions.load("editor_assetManagementTool")`, then the global `editor_assetManagementTool`

Editor tool "Asset Management Tool" (Window > Assets menu, 1200x900 window) for managing asset files and link files (for BeamNG's SVN repository). Tabs: Duplicated Assets (only visible in devMode), Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker. It relies on FS:hashFile, FS:findLinkFiles, FS:convertLinkFileToTargetCopy, FS:copyFile, etc. Internal development tool, of little use to a mod.

## Notes

- The Duplicated Assets tab requires devMode and the userpath to be identical to the game path (command line option -nouserpath), otherwise it shows a warning.
- Only onEditorInitialized, onEditorActivated, onEditorGui and onExtensionLoaded are exported; the onWindowMenuItem function stays local (used by the menu).
- The game data folders considered are /art, /core, /campaigns, /levels, /protected, /vehicles.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assetManagementTool.onEditorActivated()` | Hook called when the editor is activated; empty body. *(internal)* *(hook)* | 1989 |
| `editor_assetManagementTool.onEditorGui()` | Hook called every editor frame: draws the tabbed window (Duplicated Assets if devMode, Link Checker, Delinker, Relinker, Link Files Cleanup, Naming Checker) and the associated modal dialogs (e.g. confirmation to remove assets from the list). *(internal)* *(hook)* | 1639 |
| `editor_assetManagementTool.onEditorInitialized()` | Hook called at editor initialization: registers the 'assetManagementTool' window and its ~15 modal windows, adds the "Asset Management Tool" menu entry (Assets group) and loads the saved duplicates list (loadDuplicatesList). *(internal)* *(hook)* | 1996 |
| `editor_assetManagementTool.onExtensionLoaded()` | Hook called when the extension is loaded; empty body. *(internal)* *(hook)* | 2017 |

## Calls into the engine (C++)

- `FS:` `convertLinkFileToTargetCopy`, `copyFile`, `deleteAssetFileForLinkFile`, `fileExists`, `findFiles`, `findHighestNumberedFolder`, `findLinkFiles`, `getGamePath`, `getHashFileAlgorithmId`, `getUserPath`, `hashFile`, `isLinkFile`, `native2Virtual`, `removeFile`
- `worldEditorCppApi.` `isSelectMultipleFilesAvailable`, `selectMultipleFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assetManagementTool.lua`.*

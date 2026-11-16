# `editor_assetDeduplicator`

*File: `lua/ge/extensions/editor/assetDeduplicator.lua` · VM: Game Engine (GE) · 996 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assetDeduplicator`: `extensions.load("editor_assetDeduplicator")`, then the global `editor_assetDeduplicator`

Editor tool "Asset Deduplicator" (Window > Assets menu): finds duplicate files in the current level and offers to replace them with link files. It builds a hash cache (/temp/assetdeduplicator.cache.json, version 3, tied to the game version) via a job, then compares either by content hash (safe) or by file name (manual review required). Mostly useful to teams preparing levels; nothing to call from a mod.

## Notes

- Writes/reads the cache in /temp/assetdeduplicator.cache.json; the "Reset current level asset cache" and "Deep clean asset cache" buttons invalidate it.
- The cache job is launched only once per session (jobLaunchedThisSession) the first time the window is opened.
- Probable minor bug: "Deep clean asset cache" sets cacheData to nil, while the rest of the code assumes a table (tableIsEmpty(cacheData) is called again afterwards) — inferred from code.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assetDeduplicator.onEditorActivated()` | Hook called when the editor is activated; empty body. *(internal)* *(hook)* | 976 |
| `editor_assetDeduplicator.onEditorDeactivated()` | Hook called when the editor is deactivated; empty body. *(internal)* *(hook)* | 980 |
| `editor_assetDeduplicator.onEditorGui()` | Hook called every editor frame: draws the "Asset Deduplicator" window (cache state, hash/name mode choice, "Run assessment" button, link preview and application, cache reset buttons). Launches the cache generation job on first open. *(internal)* *(hook)* | 849 |
| `editor_assetDeduplicator.onEditorInitialized()` | Hook called at editor initialization: adds the "Asset Deduplicator" menu entry (Assets group) and registers the 'assetDeduplicator' window (500x300). *(internal)* *(hook)* | 984 |
| `editor_assetDeduplicator.onWindowMenuItem()` | Menu callback: shows the 'assetDeduplicator' window. *(hook)* | 38 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `hashFile`, `isLinkFile`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assetDeduplicator.lua`.*

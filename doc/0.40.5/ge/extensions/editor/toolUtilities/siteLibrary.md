# `editor_toolUtilities_siteLibrary`

*File: `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua` · VM: Game Engine (GE) · 181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteLibrary`: `extensions.load("editor_toolUtilities_siteLibrary")`, then the global `editor_toolUtilities_siteLibrary`

Save, Save As and Open for single-document site tools. A massing building, an open space and a parking lot are each ONE document whose home is a library shelf folder (see siteAssets): Save rewrites over it without asking, Save As names a new folder and follows it, Open replaces the whole document. The site placer stands up the copies, the editor carves the original. new(cfg) builds, for each tool, a binding with the same three buttons, icons and labels.

## Example

```lua
local siteLibrary = require('editor/toolUtilities/siteLibrary')
local lib = siteLibrary.new({toolId = 'openSpaceEditor', kind = 'openSpace', noun = 'open space',
  stateKey = 'openSpace', editMode = 'openSpace', hasContent = hasContent,
  bakeRun = bakeRun, applyState = applyState, rename = rename})
-- every frame, at the start: lib.settle()
-- in the window: lib.buttons(doc)
```

## Notes

- cfg: toolId (session key and model.json label), kind ('building', 'openSpace', 'carPark'), noun (name in tooltips), stateKey (document key in model.json state), editMode (edit mode to choose on opening), hasContent(doc), bakeRun(doc) -> ok, folder written or reason, applyState(state) -> ok, reason, rename(doc, name) (name set via the tool's undo).
- The chosen folders and typed names are processed at the top of the next frame (settle / buttons), because the dialog that produced them is still being drawn and opening a site replaces the whole document.
- open refuses a folder whose model.json was written by another tool ("that folder holds a <tool> document") or without an editable state ("no editable model saved with this <noun>").
- Save, Save As and Open go through the extensions.editor_fileDialog dialog, rooted on the shelf (siteAssets.ensureRoot). The open dialog selects a folder, not a file.
- The module depends on session (folder binding via reattach, boundPath, attachment, unbind, markEdited) and on siteAssets.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteLibrary.new(cfg)` | Builds a tool's binding to its shelf. Returns a table with the functions: save(doc, name) (writes the document into the library under a name, which is also its folder; a single path for Save, Save As and Rename; returns ok), open(dir) (reopens a baked site from its model.json and binds to it; returns ok, error), buttons(doc) (draws Save, Save As, Open), settle() (opens the chosen folder before any drawing), unbind() (detaches from the open site and marks modified), saveOnLeave(doc) (on leaving the editor: rewrites the site if it changed, or gives it a free name, with numeric suffix), boundName() (name of the bound folder or nil), boundPath() (bound folder), attachment() (binding and modified state), reattach(at) and setOnOpened(fn) (to run once a document is loaded). | 35 |

### Parameter details

#### `editor_toolUtilities_siteLibrary.new(cfg)`

Builds a tool's binding to its shelf. Returns a table with the functions: save(doc, name) (writes the document into the library under a name, which is also its folder; a single path for Save, Save As and Rename; returns ok), open(dir) (reopens a baked site from its model.json and binds to it; returns ok, error), buttons(doc) (draws Save, Save As, Open), settle() (opens the chosen folder before any drawing), unbind() (detaches from the open site and marks modified), saveOnLeave(doc) (on leaving the editor: rewrites the site if it changed, or gives it a free name, with numeric suffix), boundName() (name of the bound folder or nil), boundPath() (bound folder), attachment() (binding and modified state), reattach(at) and setOnOpened(fn) (to run once a document is loaded).

- `cfg` (*table*) : { toolId, kind, noun, stateKey, editMode, hasContent, bakeRun, applyState, rename }.
- **returns**: table Binding with save, open, buttons, settle, unbind, saveOnLeave, boundName, boundPath, attachment, reattach, setOnOpened.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteLibrary.lua`.*

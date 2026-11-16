# `editor_toolUtilities_siteAssets`

*File: `lua/ge/extensions/editor/toolUtilities/siteAssets.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_siteAssets`: `extensions.load("editor_toolUtilities_siteAssets")`, then the global `editor_toolUtilities_siteAssets`

The "shelves" (on-disk library) that placed sites come from: buildings, open spaces, parking lots. Three editors bake their sites there and one placer reads them all; this module fixes once where they live and how their files are named. A site is a folder named after its slug, containing the manifest (<kind>.json: bounds, kit transforms, ground plan, lamps, plants), model.json (the editable document, to reopen the site in the editor that created it) and shell.dae (unique geometry, LODs and collision).

## Notes

- Shelves (kinds): building -> /assets/massingBuildings/ (manifest building.json, editor editor_massingEditor); openSpace -> /assets/openSpaces/ (openSpace.json, editor_openSpaceEditor); carPark -> /assets/carParks/ (carPark.json, editor_parkingLotEditor). Each entry also has id, noun, label, icon.
- kindOf returns the "building" shelf for an unknown or nil kind.
- The manifest is written compact (it contains thousands of transforms); model.json is written indented.
- wipe also deletes the .cdae cache next to a .dae, without which the engine loads it instead of the new file.
- The disk functions use FS (directoryExists, directoryCreate, directoryList, directoryRemove, findFiles, removeFile): without FS they do nothing and list returns an empty list.
- The auto page flags a global "i": these are loop variables.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_siteAssets.ensureRoot(kind)` | Ensures the shelf folder exists. The file dialog only LISTS the given path without creating it: without this call, the first bake on a fresh install would open the dialog on a nonexistent folder. | 64 |
| `editor_toolUtilities_siteAssets.exists(kind, slug)` | Is the name already taken? This is what Save As asks before overwriting someone's work. | 108 |
| `editor_toolUtilities_siteAssets.folderFor(kind, slug)` | Folder of a site: root + slug + '/'. | 56 |
| `editor_toolUtilities_siteAssets.kindOf(kind)` | Returns the shelf definition for an identifier (building by default). | 40 |
| `editor_toolUtilities_siteAssets.list(kind)` | Everything already on a shelf, sorted by name. Reads only the manifests (one small json read per site, no mesh). Each entry is the manifest augmented with dir (its folder) and kind (its shelf), which is enough for the placer to stand it up. | 126 |
| `editor_toolUtilities_siteAssets.manifestPath(kind, dir)` | Path of a site's manifest in its folder dir. | 58 |
| `editor_toolUtilities_siteAssets.modelPath(dir)` | Path of model.json in dir. | 59 |
| `editor_toolUtilities_siteAssets.onWritten(fn)` | Registers an observer called each time a site is written to a shelf. Observers are never removed. *(hook)* | 95 |
| `editor_toolUtilities_siteAssets.prepare(kind, slug)` | Creates the site folder if needed, empties it and returns it ready to write. Every bake starts here. | 80 |
| `editor_toolUtilities_siteAssets.remove(kind, slug)` | Removes a site from the shelf, folder included. A rename is a save under the new name followed by this call on the old one, which keeps the name stored in the manifest honest. | 114 |
| `editor_toolUtilities_siteAssets.rootOf(kind)` | Root folder of a shelf (for example /assets/openSpaces/). | 54 |
| `editor_toolUtilities_siteAssets.shellPath(dir)` | Path of shell.dae in dir. | 60 |
| `editor_toolUtilities_siteAssets.slugify(kind, name)` | Folder name derived from the object's name: lowercase, everything that is not alphanumeric becomes an underscore, edge underscores removed. A new bake of a renamed but identical site therefore overwrites its own folder. An empty name gives the kind's common name. | 46 |
| `editor_toolUtilities_siteAssets.wipe(dir)` | Empties a folder before rewriting, so that a smaller bake leaves nothing stale; also deletes the .cdae caches. | 72 |
| `editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest)` | Writes the manifest (compact), then notifies the observers registered by onWritten with (kind, manifest.slug). | 101 |
| `editor_toolUtilities_siteAssets.writeModel(dir, tool, state)` | Writes the editable document next to its meshes: { version = 1, tool, state }. tool is the editor that wrote it, so that a folder opened by the wrong one reports it. | 90 |

### Parameter details

#### `editor_toolUtilities_siteAssets.ensureRoot(kind)`

Ensures the shelf folder exists. The file dialog only LISTS the given path without creating it: without this call, the first bake on a fresh install would open the dialog on a nonexistent folder.

- `kind` (*string|nil*) : Shelf.
- **returns**: string Root path.

#### `editor_toolUtilities_siteAssets.exists(kind, slug)`

Is the name already taken? This is what Save As asks before overwriting someone's work.

- `kind` (*string|nil*) : Shelf.
- `slug` (*string*) : Slug.
- **returns**: boolean true if the folder exists.

#### `editor_toolUtilities_siteAssets.folderFor(kind, slug)`

Folder of a site: root + slug + '/'.

- `kind` (*string|nil*) : Shelf.
- `slug` (*string*) : Site slug.
- **returns**: string Folder path.

#### `editor_toolUtilities_siteAssets.kindOf(kind)`

Returns the shelf definition for an identifier (building by default).

- `kind` (*string|nil*) : 'building', 'openSpace' or 'carPark'.
- **returns**: table Entry of kinds.

#### `editor_toolUtilities_siteAssets.list(kind)`

Everything already on a shelf, sorted by name. Reads only the manifests (one small json read per site, no mesh). Each entry is the manifest augmented with dir (its folder) and kind (its shelf), which is enough for the placer to stand it up.

- `kind` (*string|nil*) : Shelf.
- **returns**: table[] Manifests (with slug), augmented with dir and kind.

#### `editor_toolUtilities_siteAssets.manifestPath(kind, dir)`

Path of a site's manifest in its folder dir.

- `kind` (*string|nil*) : Shelf.
- `dir` (*string*) : Site folder (with trailing slash).
- **returns**: string Manifest path.

#### `editor_toolUtilities_siteAssets.modelPath(dir)`

Path of model.json in dir.

- `dir` (*string*) : Site folder.
- **returns**: string Path.

#### `editor_toolUtilities_siteAssets.onWritten(fn)`

Registers an observer called each time a site is written to a shelf. Observers are never removed.

- `fn` (*function*) : fn(kind, slug).

#### `editor_toolUtilities_siteAssets.prepare(kind, slug)`

Creates the site folder if needed, empties it and returns it ready to write. Every bake starts here.

- `kind` (*string|nil*) : Shelf.
- `slug` (*string*) : Site slug.
- **returns**: string Site folder.

#### `editor_toolUtilities_siteAssets.remove(kind, slug)`

Removes a site from the shelf, folder included. A rename is a save under the new name followed by this call on the old one, which keeps the name stored in the manifest honest.

- `kind` (*string|nil*) : Shelf.
- `slug` (*string*) : Slug.
- **returns**: boolean true if deleted, false if absent.
- **returns**: string Deleted folder, or 'not in the library'.

#### `editor_toolUtilities_siteAssets.rootOf(kind)`

Root folder of a shelf (for example /assets/openSpaces/).

- `kind` (*string|nil*) : Shelf.
- **returns**: string Root path with trailing slash.

#### `editor_toolUtilities_siteAssets.shellPath(dir)`

Path of shell.dae in dir.

- `dir` (*string*) : Site folder.
- **returns**: string Path.

#### `editor_toolUtilities_siteAssets.slugify(kind, name)`

Folder name derived from the object's name: lowercase, everything that is not alphanumeric becomes an underscore, edge underscores removed. A new bake of a renamed but identical site therefore overwrites its own folder. An empty name gives the kind's common name.

- `kind` (*string|nil*) : Shelf.
- `name` (*string|nil*) : Site name.
- **returns**: string Slug.

#### `editor_toolUtilities_siteAssets.wipe(dir)`

Empties a folder before rewriting, so that a smaller bake leaves nothing stale; also deletes the .cdae caches.

- `dir` (*string*) : Folder to empty.

#### `editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest)`

Writes the manifest (compact), then notifies the observers registered by onWritten with (kind, manifest.slug).

- `kind` (*string|nil*) : Shelf.
- `dir` (*string*) : Site folder.
- `manifest` (*table*) : Manifest with at least the slug field.
- **returns**: boolean false if the write failed, true otherwise.

#### `editor_toolUtilities_siteAssets.writeModel(dir, tool, state)`

Writes the editable document next to its meshes: { version = 1, tool, state }. tool is the editor that wrote it, so that a folder opened by the wrong one reports it.

- `dir` (*string*) : Site folder.
- `tool` (*string*) : Editor identifier.
- `state` (*table*) : Serialized state of the document.
- **returns**: boolean true if the write succeeded.

## Fields

| Field | Type | Description |
|---|---|---|
| `kinds` | table[] | List of shelves: { id, noun, label, icon, root, manifest, editor }. |
| `modelFile` | string | File name of the editable document: 'model.json'. |
| `shellFile` | string | File name of the unique geometry: 'shell.dae'. |

**Globals assigned:** `i`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `directoryRemove`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/siteAssets.lua`.*

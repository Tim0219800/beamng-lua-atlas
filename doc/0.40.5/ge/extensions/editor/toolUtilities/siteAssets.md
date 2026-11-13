# `editor_toolUtilities_siteAssets`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteAssets.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteAssets` : `extensions.load("editor_toolUtilities_siteAssets")`, puis la globale `editor_toolUtilities_siteAssets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteAssets.ensureRoot(kind)` | Make sure the shelf's folder is really there. The file dialog only LISTS the path it is given - it will not create one -<br>so without this the first bake on a fresh install opens the dialog on a folder that does not exist, showing nothing. | 64 |
| `editor_toolUtilities_siteAssets.exists(kind, slug)` | Is this name already taken? What Save As asks before it writes over somebody else's work. | 108 |
| `editor_toolUtilities_siteAssets.folderFor(kind, slug)` |  | 56 |
| `editor_toolUtilities_siteAssets.kindOf(kind)` |  | 40 |
| `editor_toolUtilities_siteAssets.list(kind)` | Everything already on one shelf. Reads only the manifests, so listing a folder of fifty costs fifty small json reads and<br>not one mesh. Each comes back knowing its own folder and its own kind, which is all the placer needs to stand it up. | 126 |
| `editor_toolUtilities_siteAssets.manifestPath(kind, dir)` |  | 58 |
| `editor_toolUtilities_siteAssets.modelPath(dir)` |  | 59 |
| `editor_toolUtilities_siteAssets.onWritten(fn)` | Be told whenever a site is written to a shelf. *(hook)* | 95 |
| `editor_toolUtilities_siteAssets.prepare(kind, slug)` | Clear the folder out and hand it back ready to be written into. Every bake starts here, so a rebake never leaves half of<br>the last one lying about. | 80 |
| `editor_toolUtilities_siteAssets.remove(kind, slug)` | Off the shelf, folder and all. A rename is a save under the new name followed by this on the old one, which keeps the name<br>stored in the manifest honest - moving the folder alone would leave the old name inside it. | 114 |
| `editor_toolUtilities_siteAssets.rootOf(kind)` |  | 54 |
| `editor_toolUtilities_siteAssets.shellPath(dir)` |  | 60 |
| `editor_toolUtilities_siteAssets.slugify(kind, name)` | A folder name from the thing's own name. Anything a filesystem would argue about becomes an underscore, so a rebake of a<br>renamed-but-same site overwrites its own folder instead of quietly growing a second one beside it. | 46 |
| `editor_toolUtilities_siteAssets.wipe(dir)` | Clear a folder before rewriting it, so a rebake producing less than the last one leaves nothing stale behind. The engine<br>writes a .cdae cache beside a .dae, which has to go too or it is loaded in preference to the new file. | 72 |
| `editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest)` | Written compact, unlike the model beside it. Nobody opens a manifest by hand -- it is thousands of instance transforms<br>and a thousand mark runs -- and indenting it doubles a file the library has to read in full just to list the shelf. | 101 |
| `editor_toolUtilities_siteAssets.writeModel(dir, tool, state)` | The editable document, beside its meshes. `tool` is the editor that wrote it, so a folder opened by the wrong one says so<br>instead of quietly producing nonsense. | 90 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `kinds` | table | Public interface. |
| `modelFile` | string |  |
| `shellFile` | string |  |

**Globales affectées :** `i`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `directoryRemove`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteAssets.lua`.*

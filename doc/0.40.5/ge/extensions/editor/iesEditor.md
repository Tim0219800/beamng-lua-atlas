# `editor_iesEditor`

*File: `lua/ge/extensions/editor/iesEditor.lua` · VM: Game Engine (GE) · 1033 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_iesEditor`: `extensions.load("editor_iesEditor")`, then the global `editor_iesEditor`

Editor window "IES Cookie Importer (WIP)" (Window > Experimental menu). It reads an IES photometric file, displays its metadata (header, photometric type, units, peak direction), a preview, and generates a light "cookie" image (PNG named by default <file>.color.png, with metadata) via editor/api/iesImporter. Useful to a modder who wants to create headlight projection textures from IES data.

## Notes

- Default IES path: '/art/special/ies/'. The output path is inferred by iesCookie.inferCookiePathFromIES, otherwise <path without .ies>.color.png; it is recomputed on each validation and the folder is created if needed.
- Parameters (default, bounds applied before generation): resolution 2^9 = 512 (exponent 5 to 12, i.e. 32 to 4096), auto angle true / 35 degrees manual (0.001 to 179), projection perspective or linear, rotation 0 (-360 to 360), auto center false / theta 0 (0 to 180) / phi 0 (0 to 360), edgeFeather 0 (0 to 1), percentile 100 (0.001 to 100), gamma 1 (0.1 to 4), scale 1 (0 to 4), invert false.
- The manual angle and center are ignored when autoAngle / autoCenter is enabled (the auto center comes from the peak direction of the IES file).
- Generation runs in a jobsystem job; if it is unavailable, it runs synchronously (generateCookieSync). A second generation while another is running is refused.
- The drawing functions and helpers are local (not exported); only the extension lifecycle is exposed. The file picker uses editor_fileDialog.openFile (.ies filter).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_iesEditor.onEditorGui()` | Called every frame by the editor: initializes the defaults once, handles the possible end of the generation job, then draws the window (files/info table and preview, then settings). *(internal)* *(hook)* | 983 |
| `editor_iesEditor.onEditorInitialized()` | Called at editor initialization: adds the menu entry in the 'Experimental' group, registers the window (980x700), initializes the defaults and logs 'Initialized'. *(internal)* *(hook)* | 1022 |
| `editor_iesEditor.onWindowMenuItem()` | Shows the 'iesEditor' window (editor.showWindow); called by the menu entry. *(internal)* *(hook)* | 1018 |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/iesEditor.lua`.*

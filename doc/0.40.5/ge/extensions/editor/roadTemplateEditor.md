# `editor_roadTemplateEditor`

*File: `lua/ge/extensions/editor/roadTemplateEditor.lua` · VM: Game Engine (GE) · 426 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadTemplateEditor`: `extensions.load("editor_roadTemplateEditor")`, then the global `editor_roadTemplateEditor`

Road template editor (Window > Roads > "Road Template Editor" menu). Lets you choose, save ("Save", "Save as..."), create ("New") and delete a road template (.road.json file) made of DecalRoads, decorations and decals; the fields are edited in the Inspector window. Depends on editor_roadEditor and relies on editor_roadUtils (template reloading). When the window is hidden, the current template is deselected and its temporary objects are deleted.

## Notes

- Preference roadTemplates.general.loadTemplates (bool, default false): "Load road templates on startup (longer initialization time)". As long as it is false, editor_roadUtils neither reloads nor applies any template.
- "Delete" deletes the file with os.remove("roadtemplates/<name>.road.json") (path relative to the process working directory, whereas saving and editor_roadUtils use levels/<level>/roadtemplates/: probable BUG, Delete does not delete the right file).

**Dependencies (loaded first):** `editor_roadEditor`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadTemplateEditor.onEditorGui()` | Called every frame: if the "roadTemplateEditor" window is hidden, deselects the template; otherwise draws the "Road Templates" window with the buttons Choose Template, Save, Save as..., New, Delete and the choice of the template's roads/decorations/decals. *(internal)* *(hook)* | 182 |
| `editor_roadTemplateEditor.onEditorInitialized()` | Called when the editor initializes: adds the "Road Template Editor" menu entry (Roads group) and registers the window (200x400). *(internal)* *(hook)* | 407 |
| `editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry)` | Registers the "roadTemplates" preference category with the "general" subcategory and the loadTemplates checkbox (bool, false by default). *(internal)* *(hook)* | 412 |

### Parameter details

#### `editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry)`

Registers the "roadTemplates" preference category with the "general" subcategory and the loadTemplates checkbox (bool, false by default).

- `prefsRegistry` (*table*) : Editor preferences registry.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"editor_roadEditor"}: extensions loaded before this one. |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadTemplateEditor.lua`.*

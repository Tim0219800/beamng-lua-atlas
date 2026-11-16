# `career_modules_tutorial_tasklistLocale`

*File: `lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_tasklistLocale`: `extensions.load("career_modules_tutorial_tasklistLocale")`, then the global `career_modules_tutorial_tasklistLocale`

Helper used by the career tutorial steps to send the task list to the UI: it translates the text fields (label, subtext, labelController, subtextController) that are keys starting with "ui." or tables {txt=...}, fills the actionItems labels (fillActionLabels), then triggers the guihooks SetTasklistHeader / SetTasklistTask. Loaded by require, not as an extension.

## Notes

- Entries with the clear field are returned as is, without translation.
- The translation works on a copy: the original table is not modified.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_tasklistLocale.resolveHeader(header)` | Returns a copy of a task list header with its texts translated. | 39 |
| `career_modules_tutorial_tasklistLocale.resolveTask(task)` | Returns a copy of a task (goal or message) with translated texts and resolved action labels. | 43 |
| `career_modules_tutorial_tasklistLocale.setTasklistHeader(header)` | Sends the translated header to the UI via guihooks.trigger("SetTasklistHeader"). | 47 |
| `career_modules_tutorial_tasklistLocale.setTasklistTask(task)` | Sends or updates a translated task in the UI via guihooks.trigger("SetTasklistTask"). | 51 |

### Parameter details

#### `career_modules_tutorial_tasklistLocale.resolveHeader(header)`

Returns a copy of a task list header with its texts translated.

- `header` (*table*) : Header (e.g. {label = "ui.…"}).
- **returns**: table Translated copy.

#### `career_modules_tutorial_tasklistLocale.resolveTask(task)`

Returns a copy of a task (goal or message) with translated texts and resolved action labels.

- `task` (*table*) : Task (id, type, label, subtext, actionItems, attention...).
- **returns**: table Translated copy.

#### `career_modules_tutorial_tasklistLocale.setTasklistHeader(header)`

Sends the translated header to the UI via guihooks.trigger("SetTasklistHeader").

- `header` (*table*) : Header to display.

#### `career_modules_tutorial_tasklistLocale.setTasklistTask(task)`

Sends or updates a translated task in the UI via guihooks.trigger("SetTasklistTask").

- `task` (*table*) : Task to display or update.

**UI events (guihooks.trigger):** `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua`.*

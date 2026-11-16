# `gameplay_rally_notebook_systemPacenotes`

*File: `lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_systemPacenotes`: `extensions.load("gameplay_rally_notebook_systemPacenotes")`, then the global `gameplay_rally_notebook_systemPacenotes`

Holds the canonical list of rally "system" pacenote names (countdown, start warnings, radio/belt checks, false start…) and validates the `system` array of a notebook style. Each style must provide all the names in `required`, in that order; unknown names, duplicates or variants without text are rejected. Useful to a modder writing a co-driver style in a new language.

## Example

```lua
local sp = require('gameplay_rally_notebook_systemPacenotes')
local system = sp.localized({ countdown5 = 'Cinq', countdowngo = {'Go', 'Partez'} })
local ok = sp.validate(system, 'monStyle') -- false: the other names are empty
```

## Notes

- The order of M.required is enforced: validate requires system[i].name == required[i].
- localized() produces entries with variants = {} for names absent from the table; validate then rejects them (non-empty variants required).
- validate logs the error with log('E', 'systemPacenotes', ...) and returns false at the first anomaly.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_systemPacenotes.localized(localized)` | Builds a style's ordered `system` array from a compact name -> text table. Each value can be a string, a {text=...} table, or a list of strings/tables (variants). Missing or invalid-type names give an empty variants list. | 70 |
| `gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName)` | Checks that a `system` array is a complete ordered list: table entries with a string `name`, recognized names, in the order of `required`, without duplicates, with a non-empty `variants` list in which every element has a non-empty `text`. | 82 |

### Parameter details

#### `gameplay_rally_notebook_systemPacenotes.localized(localized)`

Builds a style's ordered `system` array from a compact name -> text table. Each value can be a string, a {text=...} table, or a list of strings/tables (variants). Missing or invalid-type names give an empty variants list.

- `localized` (*table<string, string|table>|nil*) : Localized texts keyed by system pacenote name.
- **returns**: table[] List of { name = string, variants = { {text=string,...}, ... } } in the order of `required`.

#### `gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName)`

Checks that a `system` array is a complete ordered list: table entries with a string `name`, recognized names, in the order of `required`, without duplicates, with a non-empty `variants` list in which every element has a non-empty `text`.

- `systemArray` (*table*) : Array to validate (typically returned by localized).
- `styleName` (*string|nil*) : Style name for log messages ("?" by default).
- **returns**: boolean true if valid, false otherwise (error logged).

## Fields

| Field | Type | Description |
|---|---|---|
| `required` | string[] | Required names, in order: precountdown, countdown5 to countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart (15 entries). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua`.*

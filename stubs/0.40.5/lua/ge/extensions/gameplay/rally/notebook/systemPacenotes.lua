---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Holds the canonical list of rally "system" pacenote names (countdown, start warnings, radio/belt checks, false start…) and validates the `system` array of a notebook style. Each style must provide all the names in `required`, in that order; unknown names, duplicates or variants without text are rejected. Useful to a modder writing a co-driver style in a new language.
--- Access: extension `gameplay_rally_notebook_systemPacenotes`: `extensions.load("gameplay_rally_notebook_systemPacenotes")`, then the global `gameplay_rally_notebook_systemPacenotes`
---@class gameplay_rally_notebook_systemPacenotes
---@field required string[] Required names, in order: precountdown, countdown5 to countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart (15 entries).
gameplay_rally_notebook_systemPacenotes = {}

--- Builds a style's ordered `system` array from a compact name -> text table. Each value can be a string, a {text=...} table, or a list of strings/tables (variants). Missing or invalid-type names give an empty variants list.
---Source: lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua:70
---@param localized table<string, string|table>|nil Localized texts keyed by system pacenote name.
---@return table[]  List of { name = string, variants = { {text=string,...}, ... } } in the order of `required`.
function gameplay_rally_notebook_systemPacenotes.localized(localized) end

--- Checks that a `system` array is a complete ordered list: table entries with a string `name`, recognized names, in the order of `required`, without duplicates, with a non-empty `variants` list in which every element has a non-empty `text`.
---Source: lua/ge/extensions/gameplay/rally/notebook/systemPacenotes.lua:82
---@param systemArray table Array to validate (typically returned by localized).
---@param styleName string|nil Style name for log messages ("?" by default).
---@return boolean  true if valid, false otherwise (error logged).
function gameplay_rally_notebook_systemPacenotes.validate(systemArray, styleName) end


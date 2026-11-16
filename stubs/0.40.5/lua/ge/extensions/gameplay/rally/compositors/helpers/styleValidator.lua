---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Checks the internal consistency of a rally note compositor style (file under compositors/styles/). It checks the distance table (callsEnabled, links with increasing thresholds, base/large/point units, rounding, max), the componentTypes components (corner with numbering/intensity/lengths/direction, caution, modifiers, modifierAliases) and the system notes via notebook/systemPacenotes. It enforces no common schema between styles: each style can define its own types. Each error is logged (log 'E', tag styleValidator) and validation stops at the first error.
--- Access: extension `gameplay_rally_compositors_helpers_styleValidator`: `extensions.load("gameplay_rally_compositors_helpers_styleValidator")`, then the global `gameplay_rally_compositors_helpers_styleValidator`
---@class gameplay_rally_compositors_helpers_styleValidator
gameplay_rally_compositors_helpers_styleValidator = {}

--- Validates a style. Called by textCompositor:load after applying the calibrations; on failure the style is not loaded.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua:495
---@param style table Style table (distance, componentTypes, system...).
---@param name string|nil Style name for error messages ('?' by default).
---@return boolean  true if the style is valid.
function gameplay_rally_compositors_helpers_styleValidator.validate(style, name) end


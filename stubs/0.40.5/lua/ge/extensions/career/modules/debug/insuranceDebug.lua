---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/insuranceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Insurance" career debug tab. Adds a single menu entry '> Reset insurance data' that calls career_modules_insurance_insurance.resetPlPolicyData() (resets the player's insurance policy data).
--- Access: extension `career_modules_debug_insuranceDebug`: `extensions.load("career_modules_debug_insuranceDebug")`, then the global `career_modules_debug_insuranceDebug`
---@class career_modules_debug_insuranceDebug
---@field debugName string 'Insurance'.
---@field debugOrder number Sort order (1).
career_modules_debug_insuranceDebug = {}

--- Draws the '> Reset insurance data' entry; on click, resets the insurance policy data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/insuranceDebug.lua:9
function career_modules_debug_insuranceDebug.drawDebugFunctions() end


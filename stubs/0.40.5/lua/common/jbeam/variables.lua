---@meta
-- tim19Atlas stub generated from lua/common/jbeam/variables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages jbeam variables (range-type vehicle settings: geometry, alignment, etc.) and the substitution of '$...' in parts. It collects the variables of the root part and of all chosen parts while respecting slot scope (a slot can provide variables to its child part), computes their value (user value or default, clamped), replaces the references '$name', '$=expression', '$>>component' in the values AND keys of tables, merges the 'components' sections and prepares vehicle.variables for the UI. Used by the jbeam loader.
--- Access: `require("jbeam/variables")`
---@class jbeam_variables
local jbeam_variables = {}

--- Final cleanup: removes functions in vehicle.components and hidden variables from vehicle.variables.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/variables.lua:502
---@param vehicle table vehicle (components and variables)
---@return boolean  always true
function jbeam_variables.cleanup(vehicle) end

--- Collects all known variables (root part then journal parts, from child to parent) evaluating only the '$=' in their lists (without renaming keys), according to each slot's scope. Returns the name -> definition table with val computed (user or default, clamped).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/variables.lua:321
---@param rootPart table main part (variables, components)
---@param unifyJournal table[] merge journal from slotSystem.findParts (entries {parent, part, level, options, path, slotDef})
---@param vehicleConfig table configuration (vars = values chosen by the user)
---@return table<string, table>  resolved variables keyed by name (e.g. '$AAA')
function jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig) end

--- Places in vehicle.variables the table of variables keyed by their name (v.name), from the getAllVariables table (ignores '$components' and non-table values).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/variables.lua:427
---@param vehicle table vehicle under construction (receives variables)
---@param allVariables table resolved variables
function jbeam_variables.postProcessVariables(vehicle, allVariables) end

--- Merges the 'components' sections of all parts into rootPart.components (variable substitutions applied, including on the '$' keys of nested 'variables' tables, legacy behavior) then removes 'components' from the source parts.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/variables.lua:462
---@param rootPart table main part (receives components)
---@param unifyJournal table[] merge journal
---@param vehicleConfig table configuration (not used directly)
---@param vars table resolved variables
---@return boolean  always true
function jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars) end

--- Applies variable substitutions in the root part (components first) then in each part of the journal and in its slot options, with the scope specific to each slot. Modifies the parts in place.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/variables.lua:382
---@param rootPart table main part
---@param unifyJournal table[] merge journal
---@param vehicleConfig table vehicle configuration (not used directly here)
---@param vars table resolved variables from getAllVariables (also receives '$components')
---@return table  vars
function jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars) end

return jbeam_variables

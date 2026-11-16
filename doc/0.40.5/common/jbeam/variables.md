# `jbeam_variables`

*File: `lua/common/jbeam/variables.lua` · VM: Common (GE + vehicle) · 527 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/variables")`

Manages jbeam variables (range-type vehicle settings: geometry, alignment, etc.) and the substitution of '$...' in parts. It collects the variables of the root part and of all chosen parts while respecting slot scope (a slot can provide variables to its child part), computes their value (user value or default, clamped), replaces the references '$name', '$=expression', '$>>component' in the values AND keys of tables, merges the 'components' sections and prepares vehicle.variables for the UI. Used by the jbeam loader.

## Example

```lua
-- order of use by the loader (jbeam/loader):
local v = require('jbeam/variables')
local vars = v.getAllVariables(rootPart, unifyJournal, vehicleConfig)
v.processParts(rootPart, unifyJournal, vehicleConfig, vars)
v.processComponents(rootPart, unifyJournal, vehicleConfig, vars)
v.postProcessVariables(vehicle, vars)
v.cleanup(vehicle)
```

## Notes

- Substitution syntax (strings starting with '$'): '$name' = value of the variable (the val field if it is a range definition); '$=expr' = expression evaluated by jbeam/expressionParser with the current variables (parseSafe); '$.xxx' = '<$prefix>xxx<$suffix>' (prefix/suffix provided by the scope); '$>>path.to.value' = deep copy of a value from the components section (dotted path, first element must be 'components', accepted only for values, never for keys). Strings starting with '$+', '$<', '$>', '$*' are numeric merge indicators (see slotSystem) and are not substituted.
- An unknown variable is logged as an error (log E 'missing variable') and its value becomes nil.
- 'range' type variables: fields name, type='range', min, max, default (required numbers), unit, category (default 'alignment', 'cat.sub' is split into category/subCategory), minDis/maxDis/stepDis for display (default -100/100/1 without unit, or min/max and (maxDis-minDis)/100 with unit), step, hidden. The final val comes from vehicleConfig.vars[name] otherwise default, clamped to [min,max] (warning message if it is modified). A type other than 'range' is ignored with an error.
- Scope per slot: each part inherits the variables of its parent part, plus the slot's variables (slotDef.variables, resolved against the parent scope, up to 400 passes) and its own variables. If a part redefines a variable of the same name, the last one encountered (walking the journal from child to parent) overwrites the first in the global list.
- Probable BUG: applySlotVars ends with `for k, v in ipairs(slotVars)` over a table with string keys: this loop never runs, so slot variables still unresolved after the 400 passes are silently lost instead of being evaluated with parseSafe.
- The special variable '$components' = {val = rootPart.components} is added to the scopes to allow writing '$=$components.xxx' in expressions. postProcessVariables excludes it from vehicle.variables.
- cleanup removes functions from the components (setFunctionsToNil, recursive) and deletes from vehicle.variables those marked hidden = true: vehicle.variables must already exist (otherwise error: postProcessVariables must be called first).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_variables.cleanup(vehicle)` | Final cleanup: removes functions in vehicle.components and hidden variables from vehicle.variables. *(internal)* | 502 |
| `jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig)` | Collects all known variables (root part then journal parts, from child to parent) evaluating only the '$=' in their lists (without renaming keys), according to each slot's scope. Returns the name -> definition table with val computed (user or default, clamped). *(internal)* | 321 |
| `jbeam_variables.postProcessVariables(vehicle, allVariables)` | Places in vehicle.variables the table of variables keyed by their name (v.name), from the getAllVariables table (ignores '$components' and non-table values). *(internal)* | 427 |
| `jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars)` | Merges the 'components' sections of all parts into rootPart.components (variable substitutions applied, including on the '$' keys of nested 'variables' tables, legacy behavior) then removes 'components' from the source parts. *(internal)* | 462 |
| `jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars)` | Applies variable substitutions in the root part (components first) then in each part of the journal and in its slot options, with the scope specific to each slot. Modifies the parts in place. *(internal)* | 382 |

### Parameter details

#### `jbeam_variables.cleanup(vehicle)`

Final cleanup: removes functions in vehicle.components and hidden variables from vehicle.variables.

- `vehicle` (*table*) : vehicle (components and variables)
- **returns**: boolean always true

#### `jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig)`

Collects all known variables (root part then journal parts, from child to parent) evaluating only the '$=' in their lists (without renaming keys), according to each slot's scope. Returns the name -> definition table with val computed (user or default, clamped).

- `rootPart` (*table*) : main part (variables, components)
- `unifyJournal` (*table[]*) : merge journal from slotSystem.findParts (entries {parent, part, level, options, path, slotDef})
- `vehicleConfig` (*table*) : configuration (vars = values chosen by the user)
- **returns**: table<string, table> resolved variables keyed by name (e.g. '$AAA')

#### `jbeam_variables.postProcessVariables(vehicle, allVariables)`

Places in vehicle.variables the table of variables keyed by their name (v.name), from the getAllVariables table (ignores '$components' and non-table values).

- `vehicle` (*table*) : vehicle under construction (receives variables)
- `allVariables` (*table*) : resolved variables

#### `jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars)`

Merges the 'components' sections of all parts into rootPart.components (variable substitutions applied, including on the '$' keys of nested 'variables' tables, legacy behavior) then removes 'components' from the source parts.

- `rootPart` (*table*) : main part (receives components)
- `unifyJournal` (*table[]*) : merge journal
- `vehicleConfig` (*table*) : configuration (not used directly)
- `vars` (*table*) : resolved variables
- **returns**: boolean always true

#### `jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars)`

Applies variable substitutions in the root part (components first) then in each part of the journal and in its slot options, with the scope specific to each slot. Modifies the parts in place.

- `rootPart` (*table*) : main part
- `unifyJournal` (*table[]*) : merge journal
- `vehicleConfig` (*table*) : vehicle configuration (not used directly here)
- `vars` (*table*) : resolved variables from getAllVariables (also receives '$components')
- **returns**: table vars

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/variables.lua`.*

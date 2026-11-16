# `flowgraph_utils`

*File: `lua/ge/extensions/flowgraph/utils.lua` · VM: Game Engine (GE) · 286 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `flowgraph_utils`: `extensions.load("flowgraph_utils")`, then the global `flowgraph_utils`

Flowgraph utilities: detection of a value's type, compatibility test with a pin type, default value per type, ImGui label, and merge functions used by `variableStorage` variables when several nodes write the same variable in the same frame. It is loaded as the `flowgraph_utils` extension but also via `require` from pin and variableStorage.

## Notes

- `getVariableType` recognizes a table only by its size: 3 elements = vec3, 4 = quat; a color (4 components) is therefore seen as `quat`.
- `isVariableCompatible` accepts a 3-vector for 'vec3' or 'table', and 4 elements for 'quat', 'color' or 'table'. A `nil` or other type is incompatible.
- Merge strategies: `all` (first, last, readOnly), `number` (min, max, average, sum), `bool` (or_, and_), `vec3` (average, sum), `string` (concat, concatComma, concatSpace, concatNewline), `any` (all of them, prefixed num_, bool_, vec_, any_).
- Each strategy has `init(variable)`, `merge(variable, newValue)` and `finalize(variable)`, called by `variableStorage`.
- For `vec3` strategies, `merge` keeps the first value's table and adds to it in place: this modifies the table passed by the first caller.
- `any_concat*` are stored under the `any_` key but apply to strings.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_utils.getDefaultValueForType(typeName)` | Default value of a type: 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). If `typeName` is a list, uses the first element. Other type: nil. | 31 |
| `flowgraph_utils.getVariableType(value)` | Gives the flowgraph type of a Lua value: bool, string, number, vec3 (table of 3), quat (table of 4), otherwise nil. | 10 |
| `flowgraph_utils.isVariableCompatible(value, compType)` | Tells whether a value can be stored in a pin/variable of type `compType`. | 21 |
| `flowgraph_utils.showLabel(label, color)` | Draws a small ImGui label (translucent red background by default) just above the current line. | 53 |

### Parameter details

#### `flowgraph_utils.getDefaultValueForType(typeName)`

Default value of a type: 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). If `typeName` is a list, uses the first element. Other type: nil.

- `typeName` (*string|table*) : Type or list of types.
- **returns**: any Default value or nil.

#### `flowgraph_utils.getVariableType(value)`

Gives the flowgraph type of a Lua value: bool, string, number, vec3 (table of 3), quat (table of 4), otherwise nil.

- `value` (*any*) : Value to test.
- **returns**: string|nil Type name or nil.

#### `flowgraph_utils.isVariableCompatible(value, compType)`

Tells whether a value can be stored in a pin/variable of type `compType`.

- `value` (*any*) : Value.
- `compType` (*string*) : Target type (bool, string, number, vec3, quat, color, table).
- **returns**: boolean true if compatible.

#### `flowgraph_utils.showLabel(label, color)`

Draws a small ImGui label (translucent red background by default) just above the current line.

- `label` (*string*) : Text.
- `color` (*any*) : Background ImVec4 (default red, 0.4 alpha).

## Fields

| Field | Type | Description |
|---|---|---|
| `mergeFuns` | table<string, table> | Merge functions by category: all, number, bool, vec3, string, any. Each entry: {num, description, init, merge, finalize}. |
| `sortedMergeFuns` | table<string, table[]> | Sorted lists {name, desc, num} by category (any, all, number, string, bool, vec3), for display in the editor. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/utils.lua`.*

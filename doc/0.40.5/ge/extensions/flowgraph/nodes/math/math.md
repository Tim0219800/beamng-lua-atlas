# `flowgraph_nodes_math_math`

*File: `lua/ge/extensions/flowgraph/nodes/math/math.lua` · VM: Game Engine (GE) · 293 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/math")` (file under extensions/ but not a regular extension)

Flowgraph node 'Expression' (simple category, file math). Evaluates a Lua math expression (data.expression) on pins a, b, c... (number, vec3 or quat) and outputs the result on 'value'. The environment exposes the math functions, clamp, round, sign, lerp, inverseLerp, smoothstep, case, vec3, quat, quatFromEuler, terrainHeight, pingpong, random, etc. Pin tables are converted to vec3 (3 components) or quat (4). Offered templates: distance between two positions, lerp.

## Example

```lua
Expression: '(a-b):length()' with a and b of type vec3 gives the distance; 'lerp(a,b,c)' interpolates.
```

## Notes

- A pin table is interpreted as a quat if it has 4 elements, otherwise as a vec3.
- No character whitelist is applied: any function exposed in the environment (and the vec3/quat methods) can be called.
- The keyworkdWhiteListLookup table is built but never used.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Builds activePinList (connected input pins). | 258 |
| `C:_onDeserialized(nodeData)` | Calls parseExpression after loading (result ignored). | 269 |
| `C:buildBaseEnv()` | Builds the expression environment (math functions and utilities, pin reading with vec3/quat cache). | 101 |
| `C:drawCustomProperties()` | List of expression templates and description of their pins. | 47 |
| `C:drawMiddle(builder, style)` | Displays the expression. | 246 |
| `C:init()` | safeMode=true, empty expression, creation of the environment and the vec3/quat caches. | 277 |
| `C:onLink(link)` | Creates an additional input pin (next letter, default value 0) when a link is added and a pin is missing. | 251 |
| `C:onUnlink(link)` | Empty. | 273 |
| `C:parseExpression()` | Rejects assignments (isolated '=') then compiles 'return <expression>' with load() in the environment. | 182 |
| `C:work()` | In safeMode, does nothing if a connected input is nil. Recompiles if the expression changed, runs with pcall, converts a vec3/quat result (cdata) to a table {x,y,z[,w]}, writes 'value' and reports errors (node + logEvent). | 199 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/math.lua`.*

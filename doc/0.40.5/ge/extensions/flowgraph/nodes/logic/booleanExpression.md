# `flowgraph_nodes_logic_booleanExpression`

*File: `lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua` · VM: Game Engine (GE) · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/booleanExpression")` (file under extensions/ but not a regular extension)

Flowgraph node 'Boolean Expression' (simple category). Evaluates a Lua boolean expression entered in data.expression (e.g. 'a and not b') with bool input pins a, b, c... and outputs the result on the bool pin 'value'. AND, OR, XOR, NAND templates are offered in the editor. An additional input pin (next letter) is created on each new link.

## Notes

- The character filter '[^(and)(or)(not)%l%s%(%)]' is a character class: it accepts any lowercase letter, space and parenthesis, so the whitelist keyworkdWhiteListLookup is not actually used.
- The pin created by onLink has a default value of 0 while its type is bool.
- C.tags contains 'math','arithmetic','vector' (copied from the math node), unrelated to the node's role.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | At start, builds the activePinList list of actually connected input pins (used by safeMode). | 181 |
| `C:_onDeserialized(nodeData)` | Calls parseExpression after loading (the result is ignored). | 192 |
| `C:buildBaseEnv()` | Builds the expression environment: a table whose __index reads the value of the input pin with the same name. | 96 |
| `C:drawCustomProperties()` | Properties panel: dropdown of expression templates (AND, OR, XOR, NAND, or 'Custom Expression') and description of the chosen template's pins. | 62 |
| `C:drawMiddle(builder, style)` | Displays the expression in the middle of the node. | 169 |
| `C:init()` | Initializes data.safeMode=true, empty expression, the environment and a whitelist of keywords (not, true, false, nil). | 200 |
| `C:onLink(link)` | When a link is added and a pin is missing, creates a new bool input pin named after the next letter (a, b, c...). | 174 |
| `C:onUnlink(link)` | Empty (does nothing). | 196 |
| `C:parseExpression()` | Checks the expression (rejects assignment '=' and characters other than lowercase letters/spaces/parentheses) then compiles it with load() in the restricted environment. | 114 |
| `C:work()` | In safeMode, does nothing if a connected input is nil. Recompiles the expression if it changed, runs it with pcall and writes the result to 'value'; errors are displayed via __setNodeError('expression'). | 134 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua`.*

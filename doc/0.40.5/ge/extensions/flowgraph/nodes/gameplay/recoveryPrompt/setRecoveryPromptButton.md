# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButton`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Recovery Prompt Button" (category once_instant). Creates or modifies a recovery prompt button via core_recoveryPrompt.addButton. Input pins: buttonId, label (default "Button"), order (leave empty = added at the end), fadeActive (hidden, default true: screen fade), icon (icon id).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls core_recoveryPrompt.addButton with buttonId, label, an empty function (nop), order, fadeActive and icon. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton.lua`.*

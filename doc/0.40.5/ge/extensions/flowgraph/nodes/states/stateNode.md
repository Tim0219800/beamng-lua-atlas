# `flowgraph_nodes_states_stateNode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/states/stateNode")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:EndPin()` |  | 146 |
| `C:_onDeserialized(data)` | Deserialize (loading) custo fields from data here.<br> self.data will be restored automatically. | 159 |
| `C:_onSerialize(res)` | Serialize (saving) custom fields into res here.<br> You dont need to serialize fields in self.data | 151 |
| `C:_onSerializeState()` |  | 185 |
| `C:_postDeserialize()` |  | 163 |
| `C:doubleClicked()` |  | 113 |
| `C:drawCustomProperties()` | write custom imgui code here that gets displayed in the property window when the node is selected.<br> return a string so a history point will be created (redo/undo) | 64 |
| `C:drawMiddle(builder, style)` |  | 121 |
| `C:getTransitionNames()` |  | 104 |
| `C:init(mgr)` | This gets called when the node has been created for the first time. Init field here | 37 |
| `C:onCustomNameChanged(name)` |  | 176 |
| `C:representsGraph()` |  | 31 |
| `C:setAutoStart(val)` |  | 57 |
| `C:setTargetGraph(graph)` |  | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/states/stateNode.lua`.*

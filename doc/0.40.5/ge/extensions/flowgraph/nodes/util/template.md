# `flowgraph_nodes_util_template`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/template.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/template")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | gets called when the project of this node starts execution (before any work) | 121 |
| `C:_executionStopped()` | gets called when the project of this node stops execution. | 130 |
| `C:_onClear()` | gets called when the node needs to be cleared. usually before serialization, before starting etc. by default, calls the _executionStopped function. | 135 |
| `C:_onDeserialized(data)` | Deserialize (loading) custo fields from data here.<br> self.data will be restored automatically. | 189 |
| `C:_onSerialize(res)` | Serialize (saving) custom fields into res here.<br> You dont need to serialize fields in self.data | 182 |
| `C:destroy()` | This gets called when the node has been deleted. | 195 |
| `C:drawCustomProperties()` |  | 148 |
| `C:drawMiddle(builder, style)` | write custom imgui code here that gets displayed within the node.<br> always start with builder:Middle() | 166 |
| `C:hideProperties()` | called when the properties are no longer shown | 160 |
| `C:init(mgr)` | This gets called when the node has been created for the first time. Init field here | 109 |
| `C:showProperties()` | called when the properties are shown | 141 |
| `C:work()` | This gets called when the node should execute it's actual function in the flowgraph. | 125 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/template.lua`.*

# `ui_flowgraph_editor`

*Fichier : `lua/common/extensions/ui/flowgraph/editor.lua` · VM : Commun (GE + véhicule) · 966 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_flowgraph_editor` : `extensions.load("ui_flowgraph_editor")`, puis la globale `ui_flowgraph_editor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_flowgraph_editor.fullDisplay(value, tpe)` |  | 273 |
| `ui_flowgraph_editor.fullValueString(value, tpe)` |  | 238 |
| `ui_flowgraph_editor.getAutoTypeFromName(name)` |  | 875 |
| `ui_flowgraph_editor.getBehaviourDescription(behaviour)` |  | 871 |
| `ui_flowgraph_editor.getBehaviourIcon(behaviour)` |  | 867 |
| `ui_flowgraph_editor.getGraphTypes()` |  | 186 |
| `ui_flowgraph_editor.getSimpleTypes()` |  | 160 |
| `ui_flowgraph_editor.getTypeColor(dataType)` |  | 178 |
| `ui_flowgraph_editor.getTypeIcon(dataType)` |  | 182 |
| `ui_flowgraph_editor.getTypes()` |  | 164 |
| `ui_flowgraph_editor.isDurationNode(category)` |  | 833 |
| `ui_flowgraph_editor.isDynamicNode(category)` |  | 854 |
| `ui_flowgraph_editor.isF_DurationNode(category)` |  | 842 |
| `ui_flowgraph_editor.isFunctionalNode(category)` |  | 814 |
| `ui_flowgraph_editor.isOnceNode(category)` |  | 848 |
| `ui_flowgraph_editor.isSimpleNode(category)` |  | 828 |
| `ui_flowgraph_editor.shortDisplay(value, tpe)` |  | 225 |
| `ui_flowgraph_editor.shortValueString(value, tpe)` |  | 190 |
| `ui_flowgraph_editor.tooltip(message)` |  | 168 |
| `ui_flowgraph_editor.variableEditor(source, name, displayOptions)` |  | 286 |
| `ui_flowgraph_editor.vehicleSelector(self, onlyModel)` |  | 567 |
| `ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel)` |  | 522 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultTypeIconSize` | number |  |
| `detaultIconType` | string |  |
| `flowgraphVersion` | number | print("EDITOR API LOADED") |
| `nodeColors` | table |  |
| `nodeIcons` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/flowgraph/editor.lua`.*

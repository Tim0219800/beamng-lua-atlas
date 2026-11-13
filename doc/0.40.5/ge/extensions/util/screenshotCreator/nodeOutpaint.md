# `util_screenshotCreator_nodeOutpaint`

*Fichier : `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua` · VM : Game Engine (GE) · 581 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_nodeOutpaint` : `extensions.load("util_screenshotCreator_nodeOutpaint")`, puis la globale `util_screenshotCreator_nodeOutpaint`

**Dépendances (chargées avant) :** `ui_imgui`, `ui_imguiUtils`, `core_camera`, `core_vehicle_manager`, `util_screenshotCreator_settings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot)` |  | 171 |
| `util_screenshotCreator_nodeOutpaint.beginUiFrame()` |  | 424 |
| `util_screenshotCreator_nodeOutpaint.deserialize(data)` |  | 525 |
| `util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options)` |  | 433 |
| `util_screenshotCreator_nodeOutpaint.drawTab(options)` |  | 358 |
| `util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName)` |  | 499 |
| `util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName)` |  | 241 |
| `util_screenshotCreator_nodeOutpaint.finishStroke()` |  | 251 |
| `util_screenshotCreator_nodeOutpaint.getConfigPath()` |  | 543 |
| `util_screenshotCreator_nodeOutpaint.getControls()` |  | 566 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create)` |  | 67 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create)` |  | 551 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier)` |  | 162 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle)` |  | 118 |
| `util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName)` |  | 36 |
| `util_screenshotCreator_nodeOutpaint.isTabActive()` |  | 559 |
| `util_screenshotCreator_nodeOutpaint.loadConfig(force)` |  | 45 |
| `util_screenshotCreator_nodeOutpaint.onDeserialized(data)` | *(hook)* | 525 |
| `util_screenshotCreator_nodeOutpaint.onExtensionLoaded()` | *(hook)* | 531 |
| `util_screenshotCreator_nodeOutpaint.onExtensionUnloaded()` | *(hook)* | 535 |
| `util_screenshotCreator_nodeOutpaint.onSerialize()` | *(hook)* | 518 |
| `util_screenshotCreator_nodeOutpaint.onVehicleSpawned()` | *(hook)* | 539 |
| `util_screenshotCreator_nodeOutpaint.redo(actionData)` |  | 188 |
| `util_screenshotCreator_nodeOutpaint.saveConfig()` |  | 57 |
| `util_screenshotCreator_nodeOutpaint.selfCheck()` |  | 104 |
| `util_screenshotCreator_nodeOutpaint.serialize()` |  | 518 |
| `util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName)` |  | 222 |
| `util_screenshotCreator_nodeOutpaint.setTabActive(value)` |  | 428 |
| `util_screenshotCreator_nodeOutpaint.undo(actionData)` |  | 183 |
| `util_screenshotCreator_nodeOutpaint.updateBrush(options)` |  | 263 |
| `util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options)` |  | 263 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua`.*

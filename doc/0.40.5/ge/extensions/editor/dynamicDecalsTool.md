# `editor_dynamicDecalsTool`

*Fichier : `lua/ge/extensions/editor/dynamicDecalsTool.lua` · VM : Game Engine (GE) · 1003 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecalsTool` : `extensions.load("editor_dynamicDecalsTool")`, puis la globale `editor_dynamicDecalsTool`

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `editor_dynamicDecals_docs`, `editor_dynamicDecals_helper`, `editor_dynamicDecals_widgets`, `editor_dynamicDecals_notification`, `editor_dynamicDecals_news`, `editor_dynamicDecals_layerStack`, `editor_dynamicDecals_selection`, `editor_dynamicDecals_inspector`, `editor_dynamicDecals_inspector_utils`, `editor_dynamicDecals_browser`, `editor_dynamicDecals_textures`, `editor_dynamicDecals_export`, `editor_dynamicDecals_fonts`, `editor_dynamicDecals_brushes`, `editor_dynamicDecals_gizmo`, `editor_dynamicDecals_vehicleColorPalette`, `editor_dynamicDecals_colorPresets`, `editor_dynamicDecals_colorHistory`, `editor_dynamicDecals_camera`, `editor_dynamicDecals_loadSave`, `editor_dynamicDecals_settings`, `editor_dynamicDecals_history`, `editor_dynamicDecals_meshes`, `editor_dynamicDecals_layerTypes_decal`, `editor_dynamicDecals_layerTypes_brushStroke`, `editor_dynamicDecals_layerTypes_path`, `editor_dynamicDecals_layerTypes_fill`, `editor_dynamicDecals_layerTypes_textureFill`, `editor_dynamicDecals_layerTypes_group`, `editor_dynamicDecals_layerTypes_linkedSet`, `editor_dynamicDecals_debugTextures`, `editor_dynamicDecals_debugSection`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecalsTool.applyDecal(value)` | public interface for dynamic decals tool | 883 |
| `editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod)` |  | 910 |
| `editor_dynamicDecalsTool.changeDecalSize(increase, mod)` |  | 909 |
| `editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid)` |  | 939 |
| `editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid)` |  | 930 |
| `editor_dynamicDecalsTool.enableBrushStroke(value)` |  | 955 |
| `editor_dynamicDecalsTool.enablePathLayer(value)` |  | 963 |
| `editor_dynamicDecalsTool.finishPathLayer()` |  | 967 |
| `editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid()` |  | 997 |
| `editor_dynamicDecalsTool.getIconSize()` |  | 981 |
| `editor_dynamicDecalsTool.getIconSizeVec2()` |  | 985 |
| `editor_dynamicDecalsTool.getMainScrollY()` |  | 989 |
| `editor_dynamicDecalsTool.getSectionOpenState(name)` |  | 827 |
| `editor_dynamicDecalsTool.getSectionWindowName(section)` | ##### GUI Start ##### | 146 |
| `editor_dynamicDecalsTool.lockDepth(value)` |  | 947 |
| `editor_dynamicDecalsTool.lockSurfaceNormal(value)` |  | 951 |
| `editor_dynamicDecalsTool.onDeserialized(data)` | *(hook)* | 864 |
| `editor_dynamicDecalsTool.onSerialize()` | serialization *(hook)* | 859 |
| `editor_dynamicDecalsTool.onVehicleSwitched()` | *(hook)* | 975 |
| `editor_dynamicDecalsTool.redo()` |  | 921 |
| `editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn)` |  | 780 |
| `editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn)` |  | 848 |
| `editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons)` | summary:<br>  params<br>  * name; string; Name of section<br>  * guiFn; function; Function being called in the section as well as within the window<br>  * order [optional]; number; At which position the section appears compared to all other sections.<br>    The lower the number the further up the section appears.<br>  * defaultOpen [optional]; bool; Whether the section is opened by default or not<br>  * window [optional]; table {windowSize[ImVec2]}; Whether a dedicated window will be registered or not.<br>    If a window was registered a button will be displayed in the section to open the window. Window size can be set in table object. | 801 |
| `editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order)` |  | 843 |
| `editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order)` |  | 838 |
| `editor_dynamicDecalsTool.removeLastPathLayerPoint()` |  | 971 |
| `editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid)` |  | 993 |
| `editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll)` |  | 805 |
| `editor_dynamicDecalsTool.undo()` |  | 912 |
| `editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name)` |  | 784 |
| `editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name)` |  | 852 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `directoryPath` | string |  |
| `doApiUpdate` | boolean |  |
| `toolMode` | any |  |
| `toolModes` | table |  |
| `version` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecalsTool.lua`.*

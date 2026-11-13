# `editor_masterSpline_layerMgr`

*Fichier : `lua/ge/extensions/editor/masterSpline/layerMgr.lua` · VM : Game Engine (GE) · 251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_layerMgr` : `extensions.load("editor_masterSpline_layerMgr")`, puis la globale `editor_masterSpline_layerMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_layerMgr.addNewLayer(spline)` | Adds a new layer. | 189 |
| `editor_masterSpline_layerMgr.deepCopyAllLayers(layers)` | Deep copies all layers. | 72 |
| `editor_masterSpline_layerMgr.deepCopyLayer(layer)` | Deep copies a layer. | 69 |
| `editor_masterSpline_layerMgr.deserializeLayer(data)` | Deserialises a layer from a table. | 219 |
| `editor_masterSpline_layerMgr.getSliderDefaults()` | Returns the default values for the slider properties, for use in the tool's front end. | 66 |
| `editor_masterSpline_layerMgr.removeAllLayers(masterSpline)` | Removes all layers and their linked splines. | 177 |
| `editor_masterSpline_layerMgr.removeLayer(idx, masterSpline)` | Removes a layer at the given index. | 167 |
| `editor_masterSpline_layerMgr.serializeLayer(layer)` | Serialises a layer to a table. | 204 |
| `editor_masterSpline_layerMgr.updateAllLayers(masterSpline)` | Updates the properties of all layers. | 148 |
| `editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline)` | Updates the properties of only the dirty layers. | 155 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/layerMgr.lua`.*

# `ui_liveries_decal`

*Fichier : `lua/ge/extensions/ui/liveries/decal.lua` · VM : Game Engine (GE) · 1121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_decal` : `extensions.load("ui_liveries_decal")`, puis la globale `ui_liveries_decal`

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `ui_liveries`, `ui_liveries_camera`, `ui_liveries_paint`, `ui_liveries_textures`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_decal.beginExistingTransform(layerUid)` |  | 710 |
| `ui_liveries_decal.commitTransform()` |  | 874 |
| `ui_liveries_decal.deleteLayer(layerUid)` |  | 371 |
| `ui_liveries_decal.duplicateLayer(layerUid)` |  | 362 |
| `ui_liveries_decal.dynamicDecals_moveLayer()` | External hooks. Do not call! | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerAdded()` | External hooks. Do not call! | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerDeleted()` | External hooks. Do not call! | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerUpdated()` | External hooks. Do not call! | 1109 |
| `ui_liveries_decal.endExistingTransform()` |  | 806 |
| `ui_liveries_decal.getLayerMirror(layerUid)` | per-layer mirror flags for a committed decal; the mirror plane offset is editor-global | 514 |
| `ui_liveries_decal.getLockRatio()` |  | 970 |
| `ui_liveries_decal.getMirrorSnapshot()` |  | 947 |
| `ui_liveries_decal.getPaint(layerUid)` |  | 478 |
| `ui_liveries_decal.getSmallIncrements()` |  | 952 |
| `ui_liveries_decal.getTransformPaint()` |  | 553 |
| `ui_liveries_decal.getTransformSnapshot()` |  | 942 |
| `ui_liveries_decal.hideSelectedCursor()` |  | 661 |
| `ui_liveries_decal.isUseMousePos()` |  | 988 |
| `ui_liveries_decal.notifyUi()` |  | 286 |
| `ui_liveries_decal.onUpdate(dtReal)` | *(hook)* | 1051 |
| `ui_liveries_decal.placeSelectedDecal()` |  | 829 |
| `ui_liveries_decal.reorderLayers(orderedUids)` |  | 414 |
| `ui_liveries_decal.resumeTransformActionMap()` |  | 697 |
| `ui_liveries_decal.select(layerUid)` |  | 291 |
| `ui_liveries_decal.setFlipMirroredDecal(value)` |  | 1027 |
| `ui_liveries_decal.setLayerMirror(layerUid, mirror)` | the new values are applied to a copy of the layer, so the api's history don't get affected | 532 |
| `ui_liveries_decal.setLockRatio(value)` |  | 974 |
| `ui_liveries_decal.setMirrorOffset(value)` |  | 1039 |
| `ui_liveries_decal.setMirrored(value)` |  | 1015 |
| `ui_liveries_decal.setPaint(layerUid, paint)` |  | 487 |
| `ui_liveries_decal.setRotateLeft(value)` |  | 911 |
| `ui_liveries_decal.setRotateRight(value)` |  | 915 |
| `ui_liveries_decal.setScaleHorizontal(value)` |  | 895 |
| `ui_liveries_decal.setScaleVertical(value)` |  | 899 |
| `ui_liveries_decal.setSkewHorizontal(value)` |  | 903 |
| `ui_liveries_decal.setSkewVertical(value)` |  | 907 |
| `ui_liveries_decal.setSmallIncrements(value)` |  | 956 |
| `ui_liveries_decal.setTransformPaint(paint)` |  | 565 |
| `ui_liveries_decal.setUseMousePos(value)` |  | 993 |
| `ui_liveries_decal.setUseSurfaceNormal(value)` |  | 919 |
| `ui_liveries_decal.setup()` |  | 259 |
| `ui_liveries_decal.showExistingCursor()` |  | 751 |
| `ui_liveries_decal.showSelectedCursor()` |  | 617 |
| `ui_liveries_decal.startAddDecal(targetLayerUid)` |  | 823 |
| `ui_liveries_decal.suspendTransformActionMap()` |  | 684 |
| `ui_liveries_decal.teardown()` |  | 271 |
| `ui_liveries_decal.toggleLayerHighlight(layerUid)` |  | 348 |
| `ui_liveries_decal.toggleLayerVisibility(layerUid)` |  | 333 |
| `ui_liveries_decal.toggleProjectionMode()` |  | 935 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/decal.lua`.*

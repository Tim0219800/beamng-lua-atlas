---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_liveries_decal` : `extensions.load("ui_liveries_decal")`, puis la globale `ui_liveries_decal`
---@class ui_liveries_decal
---@field dependencies table
ui_liveries_decal = {}

---Source : lua/ge/extensions/ui/liveries/decal.lua:710
---@param layerUid any
function ui_liveries_decal.beginExistingTransform(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:874
function ui_liveries_decal.commitTransform() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:371
---@param layerUid any
function ui_liveries_decal.deleteLayer(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:362
---@param layerUid any
function ui_liveries_decal.duplicateLayer(layerUid) end

--- External hooks. Do not call!
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_moveLayer() end

--- External hooks. Do not call!
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerAdded() end

--- External hooks. Do not call!
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerDeleted() end

--- External hooks. Do not call!
---Source : lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerUpdated() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:806
function ui_liveries_decal.endExistingTransform() end

--- per-layer mirror flags for a committed decal; the mirror plane offset is editor-global
---Source : lua/ge/extensions/ui/liveries/decal.lua:514
---@param layerUid any
function ui_liveries_decal.getLayerMirror(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:970
function ui_liveries_decal.getLockRatio() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:947
function ui_liveries_decal.getMirrorSnapshot() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:478
---@param layerUid any
function ui_liveries_decal.getPaint(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:952
function ui_liveries_decal.getSmallIncrements() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:553
function ui_liveries_decal.getTransformPaint() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:942
function ui_liveries_decal.getTransformSnapshot() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:661
function ui_liveries_decal.hideSelectedCursor() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:988
function ui_liveries_decal.isUseMousePos() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:286
function ui_liveries_decal.notifyUi() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:1051
---@param dtReal any
function ui_liveries_decal.onUpdate(dtReal) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:829
function ui_liveries_decal.placeSelectedDecal() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:414
---@param orderedUids any
function ui_liveries_decal.reorderLayers(orderedUids) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:697
function ui_liveries_decal.resumeTransformActionMap() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:291
---@param layerUid any
function ui_liveries_decal.select(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:1027
---@param value any
function ui_liveries_decal.setFlipMirroredDecal(value) end

--- the new values are applied to a copy of the layer, so the api's history don't get affected
---Source : lua/ge/extensions/ui/liveries/decal.lua:532
---@param layerUid any
---@param mirror any
function ui_liveries_decal.setLayerMirror(layerUid, mirror) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:974
---@param value any
function ui_liveries_decal.setLockRatio(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:1039
---@param value any
function ui_liveries_decal.setMirrorOffset(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:1015
---@param value any
function ui_liveries_decal.setMirrored(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:487
---@param layerUid any
---@param paint any
function ui_liveries_decal.setPaint(layerUid, paint) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:911
---@param value any
function ui_liveries_decal.setRotateLeft(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:915
---@param value any
function ui_liveries_decal.setRotateRight(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:895
---@param value any
function ui_liveries_decal.setScaleHorizontal(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:899
---@param value any
function ui_liveries_decal.setScaleVertical(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:903
---@param value any
function ui_liveries_decal.setSkewHorizontal(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:907
---@param value any
function ui_liveries_decal.setSkewVertical(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:956
---@param value any
function ui_liveries_decal.setSmallIncrements(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:565
---@param paint any
function ui_liveries_decal.setTransformPaint(paint) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:993
---@param value any
function ui_liveries_decal.setUseMousePos(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:919
---@param value any
function ui_liveries_decal.setUseSurfaceNormal(value) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:259
function ui_liveries_decal.setup() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:751
function ui_liveries_decal.showExistingCursor() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:617
function ui_liveries_decal.showSelectedCursor() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:823
---@param targetLayerUid any
function ui_liveries_decal.startAddDecal(targetLayerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:684
function ui_liveries_decal.suspendTransformActionMap() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:271
function ui_liveries_decal.teardown() end

---Source : lua/ge/extensions/ui/liveries/decal.lua:348
---@param layerUid any
function ui_liveries_decal.toggleLayerHighlight(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:333
---@param layerUid any
function ui_liveries_decal.toggleLayerVisibility(layerUid) end

---Source : lua/ge/extensions/ui/liveries/decal.lua:935
function ui_liveries_decal.toggleProjectionMode() end


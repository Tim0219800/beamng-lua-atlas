---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioForest/audioForestCommon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Code shared between runtime (audioForest.lua) and the editor: turns the objects of a Forest into a thinned cloud of audio nodes. Loaded with require('core/audioForest/audioForestCommon'). The algorithm: (1) a prepass that reads the forest items (in blocks) and computes volume and height per model (shape); (2) S/M/L classification by normalized volume (95th percentile) with possible override; (3) greedy thinning: keep an item and absorb all its neighbors within minNodeSpacing (20 m); (4) construction of a 3D KD-tree of the nodes.
--- Access: extension `core_audioForest_audioForestCommon`: `extensions.load("core_audioForest_audioForestCommon")`, then the global `core_audioForest_audioForestCommon`
---@class core_audioForest_audioForestCommon
core_audioForest_audioForestCommon = {}

--- Builds the audio node cloud. Finishes the prepass if needed, classifies the models, thins the items and builds a KD-tree (kdtreepoint3d). Returns an empty cloud (nodeCount 0) if there are no included items.
---Source: lua/ge/extensions/core/audioForest/audioForestCommon.lua:231
---@param forestObj userdata Forest object
---@param st table|nil Tool state: classSelByShape, classOverrideByShape, includeByShape
---@param cfg table|nil Configuration (defaultCfg keys, as well as pitchDensityPercentile)
---@param opts table|nil Options: prepass (prepass already done), shapeToRow + includeEditorFields (adds nodeTypeRow and nodeClassId for the editor)
---@return table  {minNodeSpacing, nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, nodeTypeRow, nodeClassId, kdNodes}
function core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts) end

--- Converts a normalized volume [0..1] into a size class: 1 below t0, 2 below t1, otherwise 3.
---Source: lua/ge/extensions/core/audioForest/audioForestCommon.lua:137
---@param normVol number Normalized volume
---@param classT0 number|nil Threshold 1/2, 1/3 by default
---@param classT1 number|nil Threshold 2/3, 2/3 by default (swapped with t0 if t0 > t1)
---@return integer  1, 2 or 3
function core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1) end

--- Volume (m³) of a forest item's bounding box, multiplied by its scale. Returns 0 without a box.
---Source: lua/ge/extensions/core/audioForest/audioForestCommon.lua:113
---@param item userdata|nil Forest item (getObjBox, getScale)
---@return number  Volume
function core_audioForest_audioForestCommon.getItemVolume(item) end

--- Prepares the state of an incremental prepass: fetches all forest items (forestObj:getData():getItems()).
---Source: lua/ge/extensions/core/audioForest/audioForestCommon.lua:170
---@param forestObj userdata Forest object
---@param st table|nil Tool state; uses includeByShape (an absent model or true is included, false is excluded)
---@return table  Prepass state {all, allCount, i, includeByShape, shapeVol, shapeMaxZ, includedItem, includedShape, volList, volN, itemCount, isReady}
function core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st) end

--- Processes up to maxSteps prepass items: keeps the included items and measures the volume and max height once per model. Sets isReady to true when all items have been seen.
---Source: lua/ge/extensions/core/audioForest/audioForestCommon.lua:190
---@param p table State returned by startRuntimePrepass
---@param maxSteps integer|nil Maximum number of items per call, 10000 by default
---@return boolean  true when the prepass is finished
function core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps) end


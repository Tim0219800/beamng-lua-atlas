---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/autoAnnotation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Level editor tool: recursively walks the scene tree (MissionGroup) and the forest item dataset (ForestItemDataSet) to automatically set an annotation field (semantic category, 'Override' mode) on objects that lack one. Categories are guessed from the shape file name (TSStatic, ForestItemData) or the GroundCover name.
--- Access: extension `util_autoAnnotation`: `extensions.load("util_autoAnnotation")`, then the global `util_autoAnnotation`
---@class util_autoAnnotation
util_autoAnnotation = {}

--- Annotates the forest object data (ForestItemDataSet).
---Source: lua/ge/extensions/util/autoAnnotation.lua:132
function util_autoAnnotation.autoAnnotateGroups() end

--- Annotates the whole level: scene tree then forest dataset.
---Source: lua/ge/extensions/util/autoAnnotation.lua:137
function util_autoAnnotation.autoAnnotateLevel() end

--- Annotates the whole scene tree starting from MissionGroup. Logs an error and stops if MissionGroup is not found.
---Source: lua/ge/extensions/util/autoAnnotation.lua:121
function util_autoAnnotation.autoAnnotateScenetree() end

--- Initialization hook with no effect (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/autoAnnotation.lua:118
function util_autoAnnotation.onInit() end

--- Internal table of 'visit<Class>' visitors called according to each node's class. The TSStatic and ForestItemData visitors set the annotation from shapeName; those of SFXSpace, SFXEmitter, PointLight, SpotLight do nothing.
---@class util_autoAnnotation_visitors
local util_autoAnnotation_visitors = {}

--- Visits each element of a forest (Forest) and annotates the data of its items.
---Source: lua/ge/extensions/util/autoAnnotation.lua:94
---@param parent userdata Parent node.
---@param node userdata Forest object.
function util_autoAnnotation_visitors.visitForest(parent, node) end

--- Annotates a GroundCover without annotation from its name (NATURE by default).
---Source: lua/ge/extensions/util/autoAnnotation.lua:102
---@param parent userdata Parent node.
---@param node userdata GroundCover object.
function util_autoAnnotation_visitors.visitGroundCover(parent, node) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/triLive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Counter of the triangles actually drawn by a "kit" (instanced pieces), as seen from the camera: each instance is counted at the LOD it really draws, minus those off screen. Used by the statsFooter footer. Keeps a single answer at a time (the editor has only one edit mode). The measured LOD scales, which are costly, are shared and cached on disk in /temp/massingEditor/shapeLods.json (with the shape file's modification date).
--- Access: extension `editor_toolUtilities_triLive`: `extensions.load("editor_toolUtilities_triLive")`, then the global `editor_toolUtilities_triLive`
---@class editor_toolUtilities_triLive
editor_toolUtilities_triLive = {}

--- Last result: instanced triangles drawn, distance to the instances' centroid (m), instances drawn, instances placed, shapes left to scan.
---Source: lua/ge/extensions/editor/toolUtilities/triLive.lua:254
---@return number  Triangles drawn.
---@return number  Distance to the centroid (m).
---@return integer  Instances drawn.
---@return integer  Instances placed.
---@return integer  Shapes still to scan.
function editor_toolUtilities_triLive.get() end

--- Queues the shapes of `instances` never measured (or whose file has changed). Cheap enough to be called on every rebuild.
---Source: lua/ge/extensions/editor/toolUtilities/triLive.lua:130
---@param instances table List of entries with a shape field.
function editor_toolUtilities_triLive.note(instances) end

--- Clears the measurement cache, the scales, the queue and the failures: "retry everything". The cache will be rewritten.
---Source: lua/ge/extensions/editor/toolUtilities/triLive.lua:258
function editor_toolUtilities_triLive.rescan() end

--- Measures ONE shape per call (LOD scale), called from the editor frame so that the cold scan shows up as progress rather than a freeze. Saves the cache when the queue is empty.
---Source: lua/ge/extensions/editor/toolUtilities/triLive.lua:148
---@return boolean  True if a shape was processed.
function editor_toolUtilities_triLive.scanStep() end

--- Computes the total of instanced triangles on screen and the camera - instance centroid distance. Rate-limited and split into slices of 10000 instances per frame.
---Source: lua/ge/extensions/editor/toolUtilities/triLive.lua:197
---@param instances table List of entries { shape, px, py, pz }.
function editor_toolUtilities_triLive.update(instances) end


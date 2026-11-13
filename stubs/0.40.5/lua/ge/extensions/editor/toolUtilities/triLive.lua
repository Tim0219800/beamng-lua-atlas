---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/triLive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_triLive` : `extensions.load("editor_toolUtilities_triLive")`, puis la globale `editor_toolUtilities_triLive`
---@class editor_toolUtilities_triLive
editor_toolUtilities_triLive = {}

--- live instanced tris, distance to the instance centroid, instances drawing, instances placed, shapes still to scan
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:254
function editor_toolUtilities_triLive.get() end

--- Queue any shape in `instances` we have never measured. Cheap enough to call every rebuild.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:130
---@param instances any
function editor_toolUtilities_triLive.note(instances) end

---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:258
function editor_toolUtilities_triLive.rescan() end

--- One shape per call. Called from the editor's own frame, so the cold scan shows as progress rather than as a freeze.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:148
function editor_toolUtilities_triLive.scanStep() end

--- Total instanced triangles on screen, plus the distance the answer is for. Throttled, since it is a number a human is
--- reading, and walked SLICE instances a frame: a placed town is hundreds of thousands of them, and pricing every one in a
--- single frame four times a second was a frame in every fifteen taking most of a tenth of a second.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:197
---@param instances any
function editor_toolUtilities_triLive.update(instances) end


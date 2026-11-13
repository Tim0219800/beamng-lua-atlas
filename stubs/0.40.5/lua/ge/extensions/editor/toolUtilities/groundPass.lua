---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundPass.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_groundPass` : `extensions.load("editor_toolUtilities_groundPass")`, puis la globale `editor_toolUtilities_groundPass`
---@class editor_toolUtilities_groundPass
---@field defaults table
---@field params table
editor_toolUtilities_groundPass = {}

---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:189
---@param t any
function editor_toolUtilities_groundPass.applyParams(t) end

--- Every network's terraform features, with these settings (the shared ones by default). A network ticked off is left out.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:51
---@param out any
---@param p any
function editor_toolUtilities_groundPass.features(out, p) end

--- The settings, kept in each tool's session file.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:183
function editor_toolUtilities_groundPass.getParams() end

--- The carve record, kept over a Lua reload and in the session files.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:197
function editor_toolUtilities_groundPass.getRecord() end

---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:150
function editor_toolUtilities_groundPass.hasCarve() end

--- Lay the site grade the `holdSites` passes kept up over the ground the last of them cut. One undo step.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:129
function editor_toolUtilities_groundPass.laySites() end

--- The ground as it was before every carve, as a lookup `height(x, y)` (terraform.groundBefore). Built again only when the
---  records have changed: off them it reads live terrain, which needs no rebuild.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:162
function editor_toolUtilities_groundPass.naturalGround() end

---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:40
---@param id any
---@param s any
function editor_toolUtilities_groundPass.register(id, s) end

--- A new level: its terrain is not the one the record was cut in.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:209
function editor_toolUtilities_groundPass.reset() end

--- Put the networks' ground back, and the site grade back over it.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:146
function editor_toolUtilities_groundPass.restore() end

--- Terraform the networks (when Terraform is on) and lay the site grade back over them. `p` overrides the shared settings for
---  one run; `laySites` grades the sites even when they were not graded; `holdSites` leaves that to laySites().
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:121
---@param p any
---@param laySites any
---@param holdSites any
function editor_toolUtilities_groundPass.run(p, laySites, holdSites) end

---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:202
---@param bl any
function editor_toolUtilities_groundPass.setRecord(bl) end

---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:48
---@param s any
function editor_toolUtilities_groundPass.setSites(s) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundPass.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The single terraforming of the terrain on which the editor tools place their objects. The road and rail networks are carved together in a single pass, with a single blend (rail has priority, PRIO.RAIL). City Builder's site grade is laid on top as a second pass: lifted before the network pass and laid back after. Each Build button calls run(), each Restore calls restore().
--- Access: extension `editor_toolUtilities_groundPass`: `extensions.load("editor_toolUtilities_groundPass")`, then the global `editor_toolUtilities_groundPass`
---@class editor_toolUtilities_groundPass
---@field defaults table Default values of the numeric settings.
---@field params table Current settings: on, roads, rail (booleans) and doi, margin, falloff, smooth, roughness, scale, abutLen, abutShoulder.
editor_toolUtilities_groundPass = {}

--- Applies saved settings: only existing keys whose type matches are taken. Ignores a non-table argument.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:189
---@param t table Saved settings.
function editor_toolUtilities_groundPass.applyParams(t) end

--- Adds to out the terraforming elements of each registered network, according to the settings p (the shared ones by default). An unchecked network (p[id] == false) is ignored.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:51
---@param out table Output list.
---@param p table|nil Settings; default params.
---@return table  The out list.
function editor_toolUtilities_groundPass.features(out, p) end

--- Copy of the settings, to keep in each tool's session file.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:183
---@return table  Copy of params.
function editor_toolUtilities_groundPass.getParams() end

--- Returns the carving record (keep it across Lua reloads and in sessions).
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:197
---@return table|nil  owner.terraBaseline.
function editor_toolUtilities_groundPass.getRecord() end

--- True if a carving is stored (shared record or something the sources would have to put back).
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:150
---@return boolean  A carving exists.
function editor_toolUtilities_groundPass.hasCarve() end

--- Lays back the site grade kept lifted by the holdSites passes, on the terrain of the last pass, in one 'Grade Sites' transaction. No effect (0) if nothing is pending.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:129
---@return integer  Result of sites.lay(), 0 if nothing or if the network is still rebuilding.
function editor_toolUtilities_groundPass.laySites() end

--- Returns the function height(x, y) of the terrain before all the carvings (terraform.groundBefore). Rebuilt only if the records changed; without a record it reads the live terrain.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:162
---@return function  height(x, y).
function editor_toolUtilities_groundPass.naturalGround() end

--- Registers (or replaces, if the id already exists) the terraforming source of a network.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:40
---@param id string Network id, also the key of params (e.g. 'roads', 'rail').
---@param s table Source with features(out, p) and optionally lift, finish, after, records, hasCarve.
function editor_toolUtilities_groundPass.register(id, s) end

--- New level: forgets the carving record, since the terrain is no longer the one where it was made.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:209
function editor_toolUtilities_groundPass.reset() end

--- Puts the original terrain back under the networks and the site grade on top (transaction 'Restore Ground').
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:146
---@return integer  Number of elements (0 in practice).
function editor_toolUtilities_groundPass.restore() end

--- Terraforms the networks (if Terraform is active) then lays the site grade back, in one 'Build Ground' transaction.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:121
---@param p table|nil Settings that replace the shared settings for this run.
---@param laySites boolean|nil Grades the sites even if they were not.
---@param holdSites boolean|nil Leaves the grade lifted; laySites() must be called later.
---@return integer  Number of terraforming elements applied (0 if blocked).
function editor_toolUtilities_groundPass.run(p, laySites, holdSites) end

--- Restores a carving record (must be a table with gx a table and n > 0, otherwise it is cleared). The block id is set back to nil: checkOwner attaches the record via the level.
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:202
---@param bl table|nil Record.
function editor_toolUtilities_groundPass.setRecord(bl) end

--- Plugs in City Builder's site grade (lift, lay, busy, record).
---Source: lua/ge/extensions/editor/toolUtilities/groundPass.lua:48
---@param s table|nil Sites object.
function editor_toolUtilities_groundPass.setSites(s) end


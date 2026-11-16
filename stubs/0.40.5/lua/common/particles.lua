---@meta
-- tim19Atlas stub generated from lua/common/particles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loads lua/common/particles.json at startup (physical materials and particle rules between two materials) and prepares lookup tables: a list of materials and a table keyed by material pair with, for each rule, a compiled comparison function _anon(on perpendicularVel and slipVel). Used to choose the impact/slip particles according to the two materials in contact.
--- Access: global `_`, `particles`
---@class _
_ = {}

--- Returns the material at index i in mats, or nil if i is nil.
---Source: lua/common/particles.lua:11
---@param mats table list of materials (first return value of getMaterialsParticlesTable)
---@param i integer|nil material identifier
---@return table|nil  material {name, colorR, colorG, colorB, ...}
function _.getMaterialByID(mats, i) end

--- Looks up the identifier of the material named s; returns min(3, #mats) if it is unknown (no addition).
---Source: lua/common/particles.lua:30
---@param mats table list of materials
---@param s string material name
---@return integer  material identifier
function _.getMaterialIDByName(mats, s) end

--- Returns the list of materials and the table of particle rules per material pair (key id1*10000+id2).
---Source: lua/common/particles.lua:122
---@return table  materials
---@return table<integer, table[]>  rules per material pair
function _.getMaterialsParticlesTable() end

--- Looks up the identifier of the material named s; if it does not exist, creates a temporary definition (white, dynamic = true) added to mats and returns its new identifier.
---Source: lua/common/particles.lua:16
---@param mats table list of materials (modified)
---@param s string material name
---@return integer  material identifier
function _.getOrAddMaterialIDByName(mats, s) end


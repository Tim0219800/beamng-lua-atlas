---@meta
-- tim19Atlas stub generated from lua/common/jbeam/links.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Resolution of references between jbeam rows. In a jbeam file, a column whose name contains ':' (e.g. "id1:", "torqueArm:", or "links:") designates the name of a row in another section (nodes by default if nothing follows the colon, e.g. "nodeArm:"; "id1:nodes" explicit). This module finds these links (prepareLinksDestructive), replaces them with the numeric identifier cid of the target (resolveLinks), and handles the group links "[group]:section" which become the list of cids of the rows belonging to those groups (resolveGroupLinks). This is why beams reference their nodes by number in the final data.
--- Access: `require("jbeam/links")`
---@class jbeam_links
local jbeam_links = {}

--- Walks all the vehicle's sections, detects the links, removes the link keys from the rows (modifies vehicle in place) and returns a flat journal of triplets (row or list, key, target row) so that resolveLinks writes the cids.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/links.lua:15
---@param vehicle table Vehicle jbeam data (modified in place).
---@param sectionRenames table<string, string> Section renames (old name -> new name).
---@return table  Flat list of triplets {container, key, targetRow, ...} (indices 1,2,3 then 4,5,6...).
function jbeam_links.prepareLinksDestructive(vehicle, sectionRenames) end

--- Replaces the '[group]:section' columns with lists of cids of rows belonging to the cited groups (key '_group_section').
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/links.lua:184
---@param vehicle table Vehicle jbeam data.
---@return boolean  Always true.
function jbeam_links.resolveGroupLinks(vehicle) end

--- Writes the cid of its target into each link then rebuilds the sections of vehicle.validTables by indexing them by cid.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/links.lua:159
---@param vehicle table Vehicle jbeam data (with validTables).
---@param links table Journal returned by prepareLinksDestructive.
---@return boolean  Always true.
function jbeam_links.resolveLinks(vehicle, links) end

return jbeam_links

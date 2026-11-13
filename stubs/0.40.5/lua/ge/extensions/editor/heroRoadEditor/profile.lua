---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/profile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_profile` : `extensions.load("editor_heroRoadEditor_profile")`, puis la globale `editor_heroRoadEditor_profile`
---@class editor_heroRoadEditor_profile
---@field MAT_ROAD any
---@field MAT_SHOULDER any
editor_heroRoadEditor_profile = {}

--- Builds the per-station cross-sections + bank for the group.
---  Returns: stations (array over divPoints of { pts = {{o,dz}...}, bank = radians }), bandMat (material key per band).
---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:283
---@param group any
function editor_heroRoadEditor_profile.build(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:349
---@param group any
function editor_heroRoadEditor_profile.minSafeRadius(group) end

--- Straight-section cross-section (full crown, no bank, no fold clamp) for the read-only UI preview.
---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:360
---@param group any
function editor_heroRoadEditor_profile.previewCrossSection(group) end


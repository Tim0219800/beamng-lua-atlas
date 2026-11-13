---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/fetchSources.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_terraform_fetchSources` : `extensions.load("editor_terraform_fetchSources")`, puis la globale `editor_terraform_fetchSources`
---@class editor_terraform_fetchSources
editor_terraform_fetchSources = {}

--- Returns all the sources within the given polygon, which are supported by the terraform tool.
---  [If eg a road goes in and out of the polygon, then it is split and only the inner parts of the road are included, as separate sources.]
---Source : lua/ge/extensions/editor/terraform/fetchSources.lua:245
---@param polygon any
function editor_terraform_fetchSources.getAllSourcesInPolygon(polygon) end

---Source : lua/ge/extensions/editor/terraform/fetchSources.lua:287
function editor_terraform_fetchSources.getAllSourcesInSelection() end


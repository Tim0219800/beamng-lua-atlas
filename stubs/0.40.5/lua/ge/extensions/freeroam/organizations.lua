---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/organizations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of organizations (career mode factions with reputation), loaded from the `gameplay/organizations/*.organizations.json` files and enriched with the career's reputation data. Also provides UI-ready data. Global: freeroam_organizations.
--- Access: extension `freeroam_organizations`: `extensions.load("freeroam_organizations")`, then the global `freeroam_organizations`
---@class freeroam_organizations
freeroam_organizations = {}

--- Returns an organization by id (refreshing its reputation) or nil with an error log.
---Source: lua/ge/extensions/freeroam/organizations.lua:36
---@param id string Organization id.
---@return table|nil  Organization.
function freeroam_organizations.getOrganization(id) end

--- Display order and icon: constants (7000, 'peopleOutline').
---Source: lua/ge/extensions/freeroam/organizations.lua:47
---@param id string Not used.
---@return integer  7000
---@return string  'peopleOutline'
function freeroam_organizations.getOrganizationIdOrderAndIcon(id) end

--- Loads (once, cached) all the organizations.
---Source: lua/ge/extensions/freeroam/organizations.lua:15
---@return table<string, table>  Organizations keyed by id.
function freeroam_organizations.getOrganizations() end

--- List of the organizations in UI format (getUIDataForOrg), sorted by translated name.
---Source: lua/ge/extensions/freeroam/organizations.lua:87
---@return table[]  UI data.
function freeroam_organizations.getUIData() end

--- Enriched copy of an organization for the UI.
---Source: lua/ge/extensions/freeroam/organizations.lua:70
---@param orgId string Organization id.
---@return table|nil  UI data.
function freeroam_organizations.getUIDataForOrg(orgId) end


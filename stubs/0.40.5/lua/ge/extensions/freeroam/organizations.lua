---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/organizations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des organisations (factions du mode carrière avec réputation), chargé depuis les fichiers `gameplay/organizations/*.organizations.json` et enrichi avec les données de réputation du carrière. Fournit aussi les données prêtes pour l'UI. Global : freeroam_organizations.
--- Accès : extension `freeroam_organizations` : `extensions.load("freeroam_organizations")`, puis la globale `freeroam_organizations`
---@class freeroam_organizations
freeroam_organizations = {}

--- Renvoie une organisation par id (en rafraîchissant sa réputation) ou nil avec un log d'erreur.
---Source : lua/ge/extensions/freeroam/organizations.lua:36
---@param id string Id de l'organisation.
---@return table|nil  Organisation.
function freeroam_organizations.getOrganization(id) end

--- Ordre d'affichage et icône : constants (7000, 'peopleOutline').
---Source : lua/ge/extensions/freeroam/organizations.lua:47
---@param id string Non utilisé.
---@return integer  7000
---@return string  'peopleOutline'
function freeroam_organizations.getOrganizationIdOrderAndIcon(id) end

--- Charge (une fois, mise en cache) toutes les organisations.
---Source : lua/ge/extensions/freeroam/organizations.lua:15
---@return table<string, table>  Organisations indexées par id.
function freeroam_organizations.getOrganizations() end

--- Liste des organisations au format UI (getUIDataForOrg), triées par nom traduit.
---Source : lua/ge/extensions/freeroam/organizations.lua:87
---@return table[]  Données UI.
function freeroam_organizations.getUIData() end

--- Copie enrichie d'une organisation pour l'UI.
---Source : lua/ge/extensions/freeroam/organizations.lua:70
---@param orgId string Id de l'organisation.
---@return table|nil  Données UI.
function freeroam_organizations.getUIDataForOrg(orgId) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAbstract.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_playerAbstract` : `extensions.load("career_modules_playerAbstract")`, puis la globale `career_modules_playerAbstract`
---@class career_modules_playerAbstract
career_modules_playerAbstract = {}

---Source : lua/ge/extensions/career/modules/playerAbstract.lua:31
function career_modules_playerAbstract.closePlayerAbstractMenu() end

---Source : lua/ge/extensions/career/modules/playerAbstract.lua:40
function career_modules_playerAbstract.getPlayerAbstractData() end

---Source : lua/ge/extensions/career/modules/playerAbstract.lua:14
---@param menuData any
---@param computerFunctions any
function career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions) end

--- Router lifecycle: clear route-local state when leaving the screen.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:51
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data) end

--- Router lifecycle: attach the player abstract data into routeData so the UI
---  reads it from the routeData store instead of fetching it on mount.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:46
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/playerAbstract.lua:6
---@param _originComputerId any
function career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId) end

--- Push fresh abstract data to an already-open screen (e.g. after a score reset).
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:56
function career_modules_playerAbstract.sendPlayerAbstractDataToUI() end


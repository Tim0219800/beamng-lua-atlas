---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAbstract.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Driver abstract" screen accessible from the garage computer in career. It adds an entry to the computer menu and provides the UI with the data computed by the insurance module (career_modules_insurance_insurance.getPlayerAbstractData).
--- Access: extension `career_modules_playerAbstract`: `extensions.load("career_modules_playerAbstract")`, then the global `career_modules_playerAbstract`
---@class career_modules_playerAbstract
career_modules_playerAbstract = {}

--- Returns to the originating computer's menu, or closes all career menus if there is none.
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:31
function career_modules_playerAbstract.closePlayerAbstractMenu() end

--- Returns the driver abstract data provided by the insurance module.
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:40
---@return table  Abstract data.
function career_modules_playerAbstract.getPlayerAbstractData() end

--- Computer hook: adds the playerAbstract function _anon(order 15, category general) if the facility allows it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:14
---@param menuData table Menu data (computerFacility, hasBoughtStarterVehicle).
---@param computerFunctions table Function tables to fill.
function career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions) end

--- UI router lifecycle: forgets the originating computer when leaving the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:51
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Route being left.
---@param data table routeData.
function career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data) end

--- UI router lifecycle: places the abstract data in data.playerAbstract.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:46
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Previous route.
---@param data table routeData to fill.
function career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data) end

--- Remembers the originating computer and, if it exists, navigates to career.computer.playerAbstract then triggers the onComputerPlayerAbstract hook.
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:6
---@param _originComputerId string|nil Garage computer id.
function career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId) end

--- Pushes fresh data to an already open screen (guihooks playerAbstractData), e.g. after a score reset.
---Source: lua/ge/extensions/career/modules/playerAbstract.lua:56
function career_modules_playerAbstract.sendPlayerAbstractDataToUI() end


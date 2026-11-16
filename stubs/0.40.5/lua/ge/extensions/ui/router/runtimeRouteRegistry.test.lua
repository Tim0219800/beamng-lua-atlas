---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of the runtime route registry (parsing of raw Vue routes, transactional validation, source precedence, added/removed/changed diffs, instance isolation). Run with: extensions.testFramework_TestManager:runTestFiles("runtimeRouteRegistry"). Useful as examples of the route format accepted by registerModRoutes.
--- Access: extension `ui_router_runtimeRouteRegistry.test`: `extensions.load("ui_router_runtimeRouteRegistry.test")`, then the global `ui_router_runtimeRouteRegistry.test`
---@class ui_router_runtimeRouteRegistry.test
ui_router_runtimeRouteRegistry.test = {}

--- meta.luaRoute applies only the allowed keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:123
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx) end

--- An array `name` creates several routes sharing the same definition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:79
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx) end

--- getEffectiveRoutes returns deep copies: modifying them does not affect the registry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:335
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx) end

--- An invalid re-registration leaves the previous snapshot intact (transactional).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:202
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx) end

--- An empty or non-string sourceId is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:359
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx) end

--- The meta fields (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav...) are carried over into `ui`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:94
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx) end

--- The most recent source wins for the same name, with no merging.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:217
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx) end

--- Children nested over several levels are all parsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:56
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx) end

--- A named route gets the Vue defaults (runtime, ui.uiTypes = vue, filter only).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:20
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx) end

--- Re-registering a source removes the names that are no longer in the new list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:285
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx) end

--- Re-registering a source keeps its priority rank.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:230
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx) end

--- register returns the correct added and changed lists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:297
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx) end

--- Simultaneous backTarget and fallbackTarget are rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:177
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx) end

--- A duplicate route name within a source is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:185
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx) end

--- A hook given as a function _anon(not a string) is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:169
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx) end

--- A lifecycle hook that is not "module.func" is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:160
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx) end

--- A `name` of invalid type (neither string nor array of strings) is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:194
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx) end

--- Two registry instances are independent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:349
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx) end

--- getSourceOrder follows the order of first registration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:270
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx) end

--- A node without a name produces no route but its children do.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:38
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx) end

--- Unregistering an unknown source succeeds with no effect (existed = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:324
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx) end

--- unregister returns the correct removed list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:313
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx) end

--- Unregistering the winning source restores the definition of the previous source.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:257
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx) end

--- Unregistering then re-registering a source gives it the most recent rank.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua:243
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeManager.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of routeManager (resolution of relative route names, relative back targets, default value of `uiNav`). Game test file, of no direct interest to a modder except as usage examples of resolveRouteName and getRoute. Run with: extensions.testFramework_TestManager:runTestFiles("routeManager"). The file also contains, in a comment, a manual relative navigation test (ui_router.navigate("./options:options-search") from "pause" must give name = "pause.options").
--- Access: extension `ui_router_routeManager.test`: `extensions.load("ui_router_routeManager.test")`, then the global `ui_router_routeManager.test`
---@class ui_router_routeManager.test
ui_router_routeManager.test = {}

--- Single-segment global references ("play") and '/'-prefixed ones ("/mainmenu") stay absolute, even without a base route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:31
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx) end

--- An absolute dotted reference ("pause.options") passes through unchanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:24
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx) end

--- The relative `backTarget` of an abstract parent is resolved against that parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:192
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx) end

--- An empty or nil reference fails with "invalid_relative_route".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:100
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testInvalidReferenceFails(ctx) end

--- Going above the root fails ("../../options" or ".." from "pause" give "invalid_relative_route").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:89
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeAboveRootFails(ctx) end

--- With temporary routes (registerModRoutes then unregisterModRoutes), a relative `backTarget` ".." is resolved against the route that declares it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:124
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx) end

--- "./options" from "pause" gives "pause.options".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:38
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeChild(ctx) end

--- "./category" from "pause.options" gives "pause.options.category".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:45
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeDeeperChild(ctx) end

--- A relative `fallbackTarget` is resolved the same way.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:143
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx) end

--- An already resolved canonical name ("pause.options") stays identical if resolved again (stability on reload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:70
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx) end

--- "../../system" from "pause.options.category" gives "pause.system".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:65
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeMultiParent(ctx) end

--- ".." from "pause.options" gives "pause".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:55
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeParent(ctx) end

--- "." from "pause.options" gives "pause.options" (the base route itself).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:60
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeSelf(ctx) end

--- "../options" from "pause.system" gives "pause.options".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:50
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeSibling(ctx) end

--- A relative reference without a base route (nil or empty string) fails with "relative_route_without_base".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:78
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx) end

--- `ui.uiNav` is true when the route does not define it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:154
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx) end

--- An explicit `ui.uiNav = false` is not overwritten by default value inheritance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:165
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx) end

--- The static route "multiseat" has uiNav = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:184
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx) end

--- The static route "play" has uiNav = false (UI navigation disabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.test.lua:176
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx) end


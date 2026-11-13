---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_routeReference.test` : `extensions.load("ui_router_routeReference.test")`, puis la globale `ui_router_routeReference.test`
---@class ui_router_routeReference.test
ui_router_routeReference.test = {}

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:76
---@param ctx any
function ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:146
---@param ctx any
function ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:106
---@param ctx any
function ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:122
---@param ctx any
function ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:92
---@param ctx any
function ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:85
---@param ctx any
function ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:99
---@param ctx any
function ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:131
---@param ctx any
function ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:138
---@param ctx any
function ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:113
---@param ctx any
function ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx) end

--- Mirror the router's construction: parse -> merge -> request -> entry, then
---  assert both lifecycle sites (onEnter and onMount) observe the same effective
---  params. onEnter receives entry.resolved directly; onMount receives the
---  transition context's toRoute (entry.resolved) plus the same navigation context.
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:165
---@param ctx any
function ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:15
---@param ctx any
function ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:40
---@param ctx any
function ui_router_routeReference.test.testQueryAndScopeReference(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:31
---@param ctx any
function ui_router_routeReference.test.testQueryOnlyReference(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:48
---@param ctx any
function ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:70
---@param ctx any
function ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:196
---@param ctx any
function ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:23
---@param ctx any
function ui_router_routeReference.test.testScopeOnlyReference(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:64
---@param ctx any
function ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx) end

---Source : lua/ge/extensions/ui/router/routeReference.test.lua:56
---@param ctx any
function ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx) end


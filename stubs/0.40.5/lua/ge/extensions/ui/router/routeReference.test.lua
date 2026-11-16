---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of routeReference (parsing "route?key=value:scope", URL decoding, merging of explicit and inline parameters) and of the propagation of effective parameters to the onEnter/onMount hooks via ResolvedRoute and navigationContext. Run with: extensions.testFramework_TestManager:runTestFiles("routeReference").
--- Access: extension `ui_router_routeReference.test`: `extensions.load("ui_router_routeReference.test")`, then the global `ui_router_routeReference.test`
---@class ui_router_routeReference.test
ui_router_routeReference.test = {}

--- A key without '=' is an empty string.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:76
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx) end

--- The canonical reference (without query) re-parses without drift on reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:146
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx) end

--- Empty query segments ("a=1&&b=2") are ignored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:106
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx) end

--- mergeParams: explicit parameters win over inline ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:122
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx) end

--- An empty route: the whole reference is treated as the route name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:92
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx) end

--- An empty scope is ignored (scope = nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:85
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx) end

--- A reference that starts with '?' is treated as an entire route name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:99
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx) end

--- mergeParams without explicit ones keeps the inline ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:131
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx) end

--- mergeParams without inline ones keeps the explicit ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:138
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx) end

--- A non-string reference is returned as is with empty params.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:113
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx) end

--- Reproduces the router construction (parse, merge, query, entry) and checks that onEnter and onMount receive the same effective parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:165
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx) end

--- A simple route has no scope and no parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:15
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx) end

--- "route?a=1:scope": parameters and scope extracted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:40
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testQueryAndScopeReference(ctx) end

--- "route?a=1": parameters extracted, no scope.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:31
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testQueryOnlyReference(ctx) end

--- The route part stays relative ("./options") after parse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:48
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx) end

--- A repeated key keeps the last value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:70
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx) end

--- The query stores the effective parameters and `fullRoute` no longer contains the inline query.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:196
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx) end

--- "route:scope": scope extracted, no parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:23
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testScopeOnlyReference(ctx) end

--- Encoded keys and encoded delimiters are decoded correctly.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:64
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx) end

--- Decoding of '+' (space) and %XX sequences in values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeReference.test.lua:56
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx) end


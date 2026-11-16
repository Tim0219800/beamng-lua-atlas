# `ui_router_routeReference.test`

*File: `lua/ge/extensions/ui/router/routeReference.test.lua` · VM: Game Engine (GE) · 209 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeReference.test`: `extensions.load("ui_router_routeReference.test")`, then the global `ui_router_routeReference.test`

Unit tests of routeReference (parsing "route?key=value:scope", URL decoding, merging of explicit and inline parameters) and of the propagation of effective parameters to the onEnter/onMount hooks via ResolvedRoute and navigationContext. Run with: extensions.testFramework_TestManager:runTestFiles("routeReference").

## Notes

- The testXxx(ctx) functions are run by testFramework_TestManager; the game does not call them in normal use.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx)` | A key without '=' is an empty string. *(internal)* | 76 |
| `ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx)` | The canonical reference (without query) re-parses without drift on reload. *(internal)* | 146 |
| `ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx)` | Empty query segments ("a=1&&b=2") are ignored. *(internal)* | 106 |
| `ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx)` | mergeParams: explicit parameters win over inline ones. *(internal)* | 122 |
| `ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx)` | An empty route: the whole reference is treated as the route name. *(internal)* | 92 |
| `ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx)` | An empty scope is ignored (scope = nil). *(internal)* | 85 |
| `ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx)` | A reference that starts with '?' is treated as an entire route name. *(internal)* | 99 |
| `ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx)` | mergeParams without explicit ones keeps the inline ones. *(internal)* | 131 |
| `ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx)` | mergeParams without inline ones keeps the explicit ones. *(internal)* | 138 |
| `ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx)` | A non-string reference is returned as is with empty params. *(internal)* | 113 |
| `ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx)` | Reproduces the router construction (parse, merge, query, entry) and checks that onEnter and onMount receive the same effective parameters. *(internal)* | 165 |
| `ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx)` | A simple route has no scope and no parameters. *(internal)* | 15 |
| `ui_router_routeReference.test.testQueryAndScopeReference(ctx)` | "route?a=1:scope": parameters and scope extracted. *(internal)* | 40 |
| `ui_router_routeReference.test.testQueryOnlyReference(ctx)` | "route?a=1": parameters extracted, no scope. *(internal)* | 31 |
| `ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx)` | The route part stays relative ("./options") after parse. *(internal)* | 48 |
| `ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx)` | A repeated key keeps the last value. *(internal)* | 70 |
| `ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx)` | The query stores the effective parameters and `fullRoute` no longer contains the inline query. *(internal)* | 196 |
| `ui_router_routeReference.test.testScopeOnlyReference(ctx)` | "route:scope": scope extracted, no parameters. *(internal)* | 23 |
| `ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx)` | Encoded keys and encoded delimiters are decoded correctly. *(internal)* | 64 |
| `ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx)` | Decoding of '+' (space) and %XX sequences in values. *(internal)* | 56 |

### Parameter details

#### `ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx)`

A key without '=' is an empty string.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx)`

The canonical reference (without query) re-parses without drift on reload.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx)`

Empty query segments ("a=1&&b=2") are ignored.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx)`

mergeParams: explicit parameters win over inline ones.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx)`

An empty route: the whole reference is treated as the route name.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx)`

An empty scope is ignored (scope = nil).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx)`

A reference that starts with '?' is treated as an entire route name.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx)`

mergeParams without explicit ones keeps the inline ones.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx)`

mergeParams without inline ones keeps the explicit ones.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx)`

A non-string reference is returned as is with empty params.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx)`

Reproduces the router construction (parse, merge, query, entry) and checks that onEnter and onMount receive the same effective parameters.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx)`

A simple route has no scope and no parameters.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testQueryAndScopeReference(ctx)`

"route?a=1:scope": parameters and scope extracted.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testQueryOnlyReference(ctx)`

"route?a=1": parameters extracted, no scope.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx)`

The route part stays relative ("./options") after parse.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx)`

A repeated key keeps the last value.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx)`

The query stores the effective parameters and `fullRoute` no longer contains the inline query.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testScopeOnlyReference(ctx)`

"route:scope": scope extracted, no parameters.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx)`

Encoded keys and encoded delimiters are decoded correctly.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx)`

Decoding of '+' (space) and %XX sequences in values.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeReference.test.lua`.*

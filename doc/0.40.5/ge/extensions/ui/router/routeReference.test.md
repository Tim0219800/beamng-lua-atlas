# `ui_router_routeReference.test`

*Fichier : `lua/ge/extensions/ui/router/routeReference.test.lua` · VM : Game Engine (GE) · 209 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeReference.test` : `extensions.load("ui_router_routeReference.test")`, puis la globale `ui_router_routeReference.test`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx)` |  | 76 |
| `ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx)` |  | 146 |
| `ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx)` |  | 106 |
| `ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx)` |  | 122 |
| `ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx)` |  | 92 |
| `ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx)` |  | 85 |
| `ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx)` |  | 99 |
| `ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx)` |  | 131 |
| `ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx)` |  | 138 |
| `ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx)` |  | 113 |
| `ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx)` | Mirror the router's construction: parse -> merge -> request -> entry, then<br> assert both lifecycle sites (onEnter and onMount) observe the same effective<br> params. onEnter receives entry.resolved directly; onMount receives the<br> transition context's toRoute (entry.resolved) plus the same navigation context. | 165 |
| `ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx)` |  | 15 |
| `ui_router_routeReference.test.testQueryAndScopeReference(ctx)` |  | 40 |
| `ui_router_routeReference.test.testQueryOnlyReference(ctx)` |  | 31 |
| `ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx)` |  | 48 |
| `ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx)` |  | 70 |
| `ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx)` |  | 196 |
| `ui_router_routeReference.test.testScopeOnlyReference(ctx)` |  | 23 |
| `ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx)` |  | 64 |
| `ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx)` |  | 56 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeReference.test.lua`.*

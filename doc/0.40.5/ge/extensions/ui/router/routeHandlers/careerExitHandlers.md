# `ui_router_routeHandlers_careerExitHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers_careerExitHandlers`: `extensions.load("ui_router_routeHandlers_careerExitHandlers")`, then the global `ui_router_routeHandlers_careerExitHandlers`

Back/exit handlers of the career screens, referenced by routeHandlers.lua: exit from profile selection, back in branch pages and exit from a negotiation.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler()` | Back from a career branch page. If the branch (params.pathId) has a parent, navigates to career.branchPage with {pathId = parentId, focusPathId = pathId, returnRoute?}. Otherwise, if returnRoute == "career.computer", navigates to career.computer, else to career.domainSelection with {focusPathId = pathId}. | 15 |
| `ui_router_routeHandlers_careerExitHandlers.careerProfilesExitHandler()` | Leaves the career profiles screen: navigates to "pause" if career is active (career_career.isActive), otherwise to "menu". | 7 |
| `ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler()` | Leaves a negotiation: calls career_modules_marketplace.finalizeNegotiationExit() then goes back to the previous entry (same parameters, restoreLastScope = true). | 41 |

### Parameter details

#### `ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler()`

Back from a career branch page. If the branch (params.pathId) has a parent, navigates to career.branchPage with {pathId = parentId, focusPathId = pathId, returnRoute?}. Otherwise, if returnRoute == "career.computer", navigates to career.computer, else to career.domainSelection with {focusPathId = pathId}.

- **returns**: table Result of ui_router.navigate.

#### `ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler()`

Leaves a negotiation: calls career_modules_marketplace.finalizeNegotiationExit() then goes back to the previous entry (same parameters, restoreLastScope = true).

- **returns**: table Result of navigate, or {success=false, reason="no_previous_entry"} with no previous entry.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua`.*

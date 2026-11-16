---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Back/exit handlers of the career screens, referenced by routeHandlers.lua: exit from profile selection, back in branch pages and exit from a negotiation.
--- Access: extension `ui_router_routeHandlers_careerExitHandlers`: `extensions.load("ui_router_routeHandlers_careerExitHandlers")`, then the global `ui_router_routeHandlers_careerExitHandlers`
---@class ui_router_routeHandlers_careerExitHandlers
ui_router_routeHandlers_careerExitHandlers = {}

--- Back from a career branch page. If the branch (params.pathId) has a parent, navigates to career.branchPage with {pathId = parentId, focusPathId = pathId, returnRoute?}. Otherwise, if returnRoute == "career.computer", navigates to career.computer, else to career.domainSelection with {focusPathId = pathId}.
---Source: lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:15
---@return table  Result of ui_router.navigate.
function ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler() end

--- Leaves the career profiles screen: navigates to "pause" if career is active (career_career.isActive), otherwise to "menu".
---Source: lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:7
function ui_router_routeHandlers_careerExitHandlers.careerProfilesExitHandler() end

--- Leaves a negotiation: calls career_modules_marketplace.finalizeNegotiationExit() then goes back to the previous entry (same parameters, restoreLastScope = true).
---Source: lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:41
---@return table  Result of navigate, or {success=false, reason="no_previous_entry"} with no previous entry.
function ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler() end


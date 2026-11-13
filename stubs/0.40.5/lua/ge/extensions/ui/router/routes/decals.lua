---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/decals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-arbre de routes de l'éditeur de décalcomanies de livrées (inclus par liveries.edit.decals). Flux d'ajout : decals -> camera (choix de la vue) -> selector (grille de décalcomanies) -> transform -> settings ; branches séparées pour material, mirror et transform d'une décalcomanie déjà sélectionnée. Les hooks pointent vers ui_liveries_routeLifecycleCallbacks.
--- Accès : extension `ui_router_routes_decals` : `extensions.load("ui_router_routes_decals")`, puis la globale `ui_router_routes_decals`
---@class ui_router_routes_decals
---@field Children table<string, table> camera (> selector > transform > settings), material, mirror, transform (> settings), chacun avec backTarget vers le niveau précédent.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "liveries.edit.decals", title = "ui.liveries.edit.decals", backTarget = "liveries.edit", targetScope = "layers-manager", scopeTree (liveries-decals-hidden, layers-manager), onEnter onDecalsEnter, onMount onDecalsMount, onLeave onDecalsLeave}
ui_router_routes_decals = {}


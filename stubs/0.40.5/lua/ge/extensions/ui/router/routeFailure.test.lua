---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeFailure.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests du contrat d'échec de transition de router.lua : routeMounted refusé avant la validation, retour arrière de routeChangeFailed pour une navigation non validée, rejets sans transition active, après validation ou avec un identifiant périmé. Fichier lancé par le framework de tests, pas une API pour moddeur.
--- Accès : extension `ui_router_routeFailure.test` : `extensions.load("ui_router_routeFailure.test")`, puis la globale `ui_router_routeFailure.test`
---@class ui_router_routeFailure.test
ui_router_routeFailure.test = {}

--- routeChangeFailed est rejeté une fois la route déjà validée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeFailure.test.lua:103
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx) end

--- routeChangeFailed est rejeté s'il n'y a aucune transition active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeFailure.test.lua:94
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx) end

--- routeChangeFailed rejette un identifiant de transition différent pour ne pas annuler une navigation plus récente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeFailure.test.lua:124
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx) end

--- routeChangeFailed efface l'entrée en attente et termine la transition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeFailure.test.lua:76
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx) end

--- routeMounted est rejeté avec not_committed tant que le changement de route n'est pas validé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeFailure.test.lua:61
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx) end


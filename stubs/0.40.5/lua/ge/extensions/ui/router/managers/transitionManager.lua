---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/transitionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère le cycle de vie des transitions de route du routeur d'interface : une seule transition à la fois, session de transition (jalons de progression, phase, temps écoulé par phase et total, renvois du changement de route), validation des accusés des frameworks et classification des timeouts. Le module n'a aucun effet de bord sur le routeur : update() renvoie des évènements (resendRouteChange ou timeout) que router.lua traite. Le temps est accumulé à partir de dtReal fourni par onGuiUpdate (pas os.clock).
--- Accès : extension `ui_router_managers_transitionManager` : `extensions.load("ui_router_managers_transitionManager")`, puis la globale `ui_router_managers_transitionManager`
---@class ui_router_managers_transitionManager
ui_router_managers_transitionManager = {}

--- Indique si une nouvelle transition peut démarrer (aucune en cours).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:426
---@return boolean  true si status ~= transitioning.
function ui_router_managers_transitionManager.canStartTransition() end

--- Annule la transition active, efface l'état et revient à idle.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:508
---@param reason string|nil Raison ("cancelled" par défaut), journalisée.
---@return boolean  true s'il y avait une transition.
---@return string|nil  Identifiant de la transition annulée.
function ui_router_managers_transitionManager.cancel(reason) end

--- Termine la transition avec succès après validation de l'identifiant et du nom de route, puis remet tout l'état à zéro.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:468
---@param routeName string|nil Route terminée (validée contre le nom attendu).
---@param transitionId string|nil Identifiant de transition (validé si fourni).
---@return boolean  true si terminée.
---@return string  "completed" ou raison d'échec (no_active_transition, transition_id_mismatch, route_name_mismatch).
function ui_router_managers_transitionManager.complete(routeName, transitionId) end

--- Renvoie des informations de debug.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:543
---@return table  {status, transitionId, elapsedTime}.
function ui_router_managers_transitionManager.getDebugInfo() end

--- Temps écoulé (secondes) depuis le début de la transition plate, accumulé depuis dtReal.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:107
---@return number  Secondes.
function ui_router_managers_transitionManager.getElapsedTime() end

--- Renvoie la route d'origine de la transition active.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:124
---@return table|nil  Route d'origine (vue compat).
function ui_router_managers_transitionManager.getFromRoute() end

--- Renvoie le type de la transition (context.kind, "navigate" par défaut).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:116
---@return string|nil  Type ou nil.
function ui_router_managers_transitionManager.getKind() end

--- Renvoie la session de transition active créée par router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken…).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:170
---@return table|nil  Session ou nil si inactif.
function ui_router_managers_transitionManager.getSession() end

--- Renvoie l'état courant : "idle", "transitioning" ou "cancelled" (transitoire).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:92
---@return string  Constants.TransitionStatus.
function ui_router_managers_transitionManager.getStatus() end

--- Instantané de chronométrage pour le gestionnaire de timeout du routeur ; la classification est déduite des jalons de progression si elle n'est pas fournie.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:299
---@param classification string|nil Classification déjà calculée (chemin phasé).
---@return table  {transitionId, classification, phase, phaseElapsed, totalElapsed, handoffAttempts}.
function ui_router_managers_transitionManager.getTimeoutInfo(classification) end

--- Renvoie la route de destination de la transition active.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:120
---@return table|nil  Route résolue.
function ui_router_managers_transitionManager.getToRoute() end

--- Renvoie un instantané du contexte de transition.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:128
---@return table  {transitionId, kind, toRoute, fromRoute}.
function ui_router_managers_transitionManager.getTransitionContext() end

--- Renvoie l'identifiant de la transition active.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:102
---@return string|nil  Identifiant ou nil si aucune transition.
function ui_router_managers_transitionManager.getTransitionId() end

--- Indique si le délai du régime plat (Config.Timeout) est atteint.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:112
---@return boolean  true si elapsedTime >= Config.Timeout.
function ui_router_managers_transitionManager.isTimeoutReached() end

--- Indique si une transition est en cours.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:97
---@return boolean  true si status == transitioning.
function ui_router_managers_transitionManager.isTransitioning() end

--- Marque la session comme validée (routeChangeComplete a promu l'entrée). La validation et la promotion sont faites par le routeur.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:206
---@param routeName string Route validée (non utilisée, pour symétrie).
---@param transitionId string|nil Identifiant de transition.
---@return table  {success=true} ou {success=false, reason=no_active_transition|transition_id_mismatch}.
function ui_router_managers_transitionManager.markCommitted(routeName, transitionId) end

--- Marque la session comme montée (accusé routeMounted traité).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:232
---@param routeName string Route montée (non utilisée).
---@param transitionId string|nil Identifiant de transition.
---@return table  {success=true} ou {success=false, reason}.
function ui_router_managers_transitionManager.markMounted(routeName, transitionId) end

--- Enregistre un jalon de progression rapporté par le framework après validation de l'accusé.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:183
---@param routeName string Route accusée.
---@param milestone string routeChangeReceived ou routeNavigationStarted.
---@param transitionId string|nil Identifiant de transition.
---@return table  {success=true} ou {success=false, reason}.
function ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId) end

--- Réinitialise l'état (tests ou récupération) : statut idle, identifiant, temps, session. Ne remet pas à nil kind, toRoute ni fromRoute.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:533
function ui_router_managers_transitionManager.reset() end

--- Démarre une transition : génère l'identifiant, enregistre route cible/origine et session, passe en transitioning. Échoue si une transition est déjà en cours ou sans route cible.
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:435
---@param context table {toRoute (ou resolved), fromRoute?, kind?, session?}.
---@return boolean  true si démarrée ; false sinon.
---@return string  Identifiant de transition, ou raison (transition_already_in_progress, no_target_route) en cas d'échec.
function ui_router_managers_transitionManager.start(context) end

--- Fait avancer le chronométrage de la transition active ; appelée par router.onGuiUpdate. Renvoie nil si rien à signaler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:413
---@param dtReal number Delta de temps réel en secondes.
---@return table|nil  {type="resendRouteChange", entry} ou {type="timeout", reason, classification?}.
function ui_router_managers_transitionManager.update(dtReal) end

--- Valide un accusé d'un framework contre la transition active (voir notes).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:150
---@param routeName string|nil Route accusée (optionnel).
---@param transitionId string|nil Identifiant de transition renvoyé par l'UI (optionnel).
---@return table  {success=true} ou {success=false, reason}.
function ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId) end


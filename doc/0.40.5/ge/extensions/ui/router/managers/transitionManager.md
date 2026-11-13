# `ui_router_managers_transitionManager`

*Fichier : `lua/ge/extensions/ui/router/managers/transitionManager.lua` · VM : Game Engine (GE) · 552 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_transitionManager` : `extensions.load("ui_router_managers_transitionManager")`, puis la globale `ui_router_managers_transitionManager`

Gère le cycle de vie des transitions de route du routeur d'interface : une seule transition à la fois, session de transition (jalons de progression, phase, temps écoulé par phase et total, renvois du changement de route), validation des accusés des frameworks et classification des timeouts. Le module n'a aucun effet de bord sur le routeur : update() renvoie des évènements (resendRouteChange ou timeout) que router.lua traite. Le temps est accumulé à partir de dtReal fourni par onGuiUpdate (pas os.clock).

## Remarques

- Deux régimes de timeout. Plat (Angular/legacy, session.phase == nil) : un seul délai Config.Timeout (3 s) sur elapsedTime ; à l'expiration, le hook TRANSITION_TIMEOUT est émis une fois ({type="hard", context}) et update renvoie {type="timeout", reason="timeout_reached"}. Phasé (Vue) : phases startup, routeCommit, mountReady, done.
- Phase startup : renvoie {type="resendRouteChange", entry=pendingEntry} toutes les Config.PhaseTimeouts.startupResendInterval secondes, sans jamais expirer ; la phase se termine quand routeNavigationStarted est reçu (alors totalElapsed est remis à 0). Phases suivantes : budgets routeCommit et mountReady, puis plafond total ; classifications : route_change_not_completed, route_mounted_not_acknowledged, transition_total_timeout.
- Un accusé est valide si une transition est active, si transitionId (quand fourni) correspond, et si routeName (quand fourni) correspond au nom attendu (entrée en attente, sinon nom de la session, sinon route cible). Raisons d'échec : no_active_transition, transition_id_mismatch, route_mismatch (complete renvoie route_name_mismatch).
- L'identifiant de transition est généré sous la forme « transition_<compteur>_<UUID> » (Engine.generateUUID).
- Incohérence mineure : le commentaire de start() annonce « @return transitionId, success » alors que la fonction renvoie (success, transitionId) ; router.lua utilise bien l'ordre (success, id).
- isTimeoutReached ne concerne que le régime plat (elapsedTime >= Config.Timeout) ; en régime phasé elapsedTime n'est pas incrémenté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_transitionManager.canStartTransition()` | Indique si une nouvelle transition peut démarrer (aucune en cours). | 426 |
| `ui_router_managers_transitionManager.cancel(reason)` | Annule la transition active, efface l'état et revient à idle. | 508 |
| `ui_router_managers_transitionManager.complete(routeName, transitionId)` | Termine la transition avec succès après validation de l'identifiant et du nom de route, puis remet tout l'état à zéro. | 468 |
| `ui_router_managers_transitionManager.getDebugInfo()` | Renvoie des informations de debug. | 543 |
| `ui_router_managers_transitionManager.getElapsedTime()` | Temps écoulé (secondes) depuis le début de la transition plate, accumulé depuis dtReal. | 107 |
| `ui_router_managers_transitionManager.getFromRoute()` | Renvoie la route d'origine de la transition active. | 124 |
| `ui_router_managers_transitionManager.getKind()` | Renvoie le type de la transition (context.kind, "navigate" par défaut). | 116 |
| `ui_router_managers_transitionManager.getSession()` | Renvoie la session de transition active créée par router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken…). | 170 |
| `ui_router_managers_transitionManager.getStatus()` | Renvoie l'état courant : "idle", "transitioning" ou "cancelled" (transitoire). | 92 |
| `ui_router_managers_transitionManager.getTimeoutInfo(classification)` | Instantané de chronométrage pour le gestionnaire de timeout du routeur ; la classification est déduite des jalons de progression si elle n'est pas fournie. | 299 |
| `ui_router_managers_transitionManager.getToRoute()` | Renvoie la route de destination de la transition active. | 120 |
| `ui_router_managers_transitionManager.getTransitionContext()` | Renvoie un instantané du contexte de transition. | 128 |
| `ui_router_managers_transitionManager.getTransitionId()` | Renvoie l'identifiant de la transition active. | 102 |
| `ui_router_managers_transitionManager.isTimeoutReached()` | Indique si le délai du régime plat (Config.Timeout) est atteint. | 112 |
| `ui_router_managers_transitionManager.isTransitioning()` | Indique si une transition est en cours. | 97 |
| `ui_router_managers_transitionManager.markCommitted(routeName, transitionId)` | Marque la session comme validée (routeChangeComplete a promu l'entrée). La validation et la promotion sont faites par le routeur. | 206 |
| `ui_router_managers_transitionManager.markMounted(routeName, transitionId)` | Marque la session comme montée (accusé routeMounted traité). | 232 |
| `ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId)` | Enregistre un jalon de progression rapporté par le framework après validation de l'accusé. | 183 |
| `ui_router_managers_transitionManager.reset()` | Réinitialise l'état (tests ou récupération) : statut idle, identifiant, temps, session. Ne remet pas à nil kind, toRoute ni fromRoute. | 533 |
| `ui_router_managers_transitionManager.start(context)` | Démarre une transition : génère l'identifiant, enregistre route cible/origine et session, passe en transitioning. Échoue si une transition est déjà en cours ou sans route cible. | 435 |
| `ui_router_managers_transitionManager.update(dtReal)` | Fait avancer le chronométrage de la transition active ; appelée par router.onGuiUpdate. Renvoie nil si rien à signaler. *(interne)* | 413 |
| `ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId)` | Valide un accusé d'un framework contre la transition active (voir notes). | 150 |

### Détail des paramètres

#### `ui_router_managers_transitionManager.canStartTransition()`

Indique si une nouvelle transition peut démarrer (aucune en cours).

- **renvoie** : boolean true si status ~= transitioning.

#### `ui_router_managers_transitionManager.cancel(reason)`

Annule la transition active, efface l'état et revient à idle.

- `reason` (*string|nil*) : Raison ("cancelled" par défaut), journalisée.
- **renvoie** : boolean true s'il y avait une transition.
- **renvoie** : string|nil Identifiant de la transition annulée.

#### `ui_router_managers_transitionManager.complete(routeName, transitionId)`

Termine la transition avec succès après validation de l'identifiant et du nom de route, puis remet tout l'état à zéro.

- `routeName` (*string|nil*) : Route terminée (validée contre le nom attendu).
- `transitionId` (*string|nil*) : Identifiant de transition (validé si fourni).
- **renvoie** : boolean true si terminée.
- **renvoie** : string "completed" ou raison d'échec (no_active_transition, transition_id_mismatch, route_name_mismatch).

#### `ui_router_managers_transitionManager.getDebugInfo()`

Renvoie des informations de debug.

- **renvoie** : table {status, transitionId, elapsedTime}.

#### `ui_router_managers_transitionManager.getElapsedTime()`

Temps écoulé (secondes) depuis le début de la transition plate, accumulé depuis dtReal.

- **renvoie** : number Secondes.

#### `ui_router_managers_transitionManager.getFromRoute()`

Renvoie la route d'origine de la transition active.

- **renvoie** : table|nil Route d'origine (vue compat).

#### `ui_router_managers_transitionManager.getKind()`

Renvoie le type de la transition (context.kind, "navigate" par défaut).

- **renvoie** : string|nil Type ou nil.

#### `ui_router_managers_transitionManager.getSession()`

Renvoie la session de transition active créée par router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken…).

- **renvoie** : table|nil Session ou nil si inactif.

#### `ui_router_managers_transitionManager.getStatus()`

Renvoie l'état courant : "idle", "transitioning" ou "cancelled" (transitoire).

- **renvoie** : string Constants.TransitionStatus.

#### `ui_router_managers_transitionManager.getTimeoutInfo(classification)`

Instantané de chronométrage pour le gestionnaire de timeout du routeur ; la classification est déduite des jalons de progression si elle n'est pas fournie.

- `classification` (*string|nil*) : Classification déjà calculée (chemin phasé).
- **renvoie** : table {transitionId, classification, phase, phaseElapsed, totalElapsed, handoffAttempts}.

#### `ui_router_managers_transitionManager.getToRoute()`

Renvoie la route de destination de la transition active.

- **renvoie** : table|nil Route résolue.

#### `ui_router_managers_transitionManager.getTransitionContext()`

Renvoie un instantané du contexte de transition.

- **renvoie** : table {transitionId, kind, toRoute, fromRoute}.

#### `ui_router_managers_transitionManager.getTransitionId()`

Renvoie l'identifiant de la transition active.

- **renvoie** : string|nil Identifiant ou nil si aucune transition.

#### `ui_router_managers_transitionManager.isTimeoutReached()`

Indique si le délai du régime plat (Config.Timeout) est atteint.

- **renvoie** : boolean true si elapsedTime >= Config.Timeout.

#### `ui_router_managers_transitionManager.isTransitioning()`

Indique si une transition est en cours.

- **renvoie** : boolean true si status == transitioning.

#### `ui_router_managers_transitionManager.markCommitted(routeName, transitionId)`

Marque la session comme validée (routeChangeComplete a promu l'entrée). La validation et la promotion sont faites par le routeur.

- `routeName` (*string*) : Route validée (non utilisée, pour symétrie).
- `transitionId` (*string|nil*) : Identifiant de transition.
- **renvoie** : table {success=true} ou {success=false, reason=no_active_transition|transition_id_mismatch}.

#### `ui_router_managers_transitionManager.markMounted(routeName, transitionId)`

Marque la session comme montée (accusé routeMounted traité).

- `routeName` (*string*) : Route montée (non utilisée).
- `transitionId` (*string|nil*) : Identifiant de transition.
- **renvoie** : table {success=true} ou {success=false, reason}.

#### `ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId)`

Enregistre un jalon de progression rapporté par le framework après validation de l'accusé.

- `routeName` (*string*) : Route accusée.
- `milestone` (*string*) : routeChangeReceived ou routeNavigationStarted.
- `transitionId` (*string|nil*) : Identifiant de transition.
- **renvoie** : table {success=true} ou {success=false, reason}.

#### `ui_router_managers_transitionManager.start(context)`

Démarre une transition : génère l'identifiant, enregistre route cible/origine et session, passe en transitioning. Échoue si une transition est déjà en cours ou sans route cible.

- `context` (*table*) : {toRoute (ou resolved), fromRoute?, kind?, session?}.
- **renvoie** : boolean true si démarrée ; false sinon.
- **renvoie** : string Identifiant de transition, ou raison (transition_already_in_progress, no_target_route) en cas d'échec.

#### `ui_router_managers_transitionManager.update(dtReal)`

Fait avancer le chronométrage de la transition active ; appelée par router.onGuiUpdate. Renvoie nil si rien à signaler.

- `dtReal` (*number*) : Delta de temps réel en secondes.
- **renvoie** : table|nil {type="resendRouteChange", entry} ou {type="timeout", reason, classification?}.

#### `ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId)`

Valide un accusé d'un framework contre la transition active (voir notes).

- `routeName` (*string|nil*) : Route accusée (optionnel).
- `transitionId` (*string|nil*) : Identifiant de transition renvoyé par l'UI (optionnel).
- **renvoie** : table {success=true} ou {success=false, reason}.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/transitionManager.lua`.*

# `ui_router_navigationObserver`

*Fichier : `lua/ge/extensions/ui/router/navigationObserver.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationObserver` : `extensions.load("ui_router_navigationObserver")`, puis la globale `ui_router_navigationObserver`

Diagnostic non-shipping du routeur : attribue chaque appel à navigate() au module Lua appelant (en remontant la pile en ignorant les fichiers « ui/router/ ») et avertit quand une navigation en préempte une autre encore en cours (transition active remplacée, ou navigate() dont l'époque a été incrémentée par un navigate() réentrant pendant ses gardes/onEnter). Chaque préemption est classée duplicate_navigation (requêtes identiques : route, params, portée, options) ou conflicting_navigation. Il n'a aucun effet sur le comportement du routeur : il enregistre des tentatives et écrit des avertissements.

## Remarques

- Ne doit être chargé et appelé que si shipping_build ~= true (router.lua le garantit).
- Le message d'avertissement est écrit avec l'étiquette de journal « LuaRouterObserver » au niveau W, sous la forme « <catégorie>: navigation from <source> [route=… scope=…] preempted by … (phase: …); check and fix duplicate navigation ».
- La source est {module, file, func, line} du premier cadre hors routeur dans les 24 premiers niveaux de pile ; sinon module = "bridge/unknown" (appel venant du moteur/UI).
- Une même tentative préemptée n'est jamais signalée deux fois, et une tentative ne se préempte pas elle-même.
- Valeurs de phase utilisées par router.lua : active_transition, post_guard, post_enter.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationObserver.attachResolvedTarget(attempt, target)` | Associe la cible résolue (route complète, paramètres effectifs, portée, options) à une tentative. *(interne)* | 179 |
| `ui_router_navigationObserver.beginAttempt()` | Démarre une nouvelle tentative à l'entrée de navigate() en capturant l'appelant Lua externe. Doit être appelée avant tout wrapper du routeur. *(interne)* | 164 |
| `ui_router_navigationObserver.getCurrentAttempt()` | Renvoie la dernière tentative commencée (un navigate() réentrant écrase la précédente). *(interne)* | 189 |
| `ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase)` | Signale une préemption avérée : classe la paire de tentatives, écrit un avertissement unique et renvoie l'enregistrement. Ne fait rien si une tentative manque, si ce sont les mêmes ou si la préemptée a déjà été signalée. *(interne)* | 203 |
| `ui_router_navigationObserver.reset()` | Réinitialise l'observateur (tentative courante, compteur, tentatives déjà signalées). *(interne)* | 227 |

### Détail des paramètres

#### `ui_router_navigationObserver.attachResolvedTarget(attempt, target)`

Associe la cible résolue (route complète, paramètres effectifs, portée, options) à une tentative.

- `attempt` (*table|nil*) : Tentative créée par beginAttempt.
- `target` (*table|nil*) : Cible issue de resolveNavigationTarget (fullRouteName, params, options).

#### `ui_router_navigationObserver.beginAttempt()`

Démarre une nouvelle tentative à l'entrée de navigate() en capturant l'appelant Lua externe. Doit être appelée avant tout wrapper du routeur.

- **renvoie** : table Tentative {id, source, route, params, scope, options} (les quatre derniers renseignés par attachResolvedTarget).

#### `ui_router_navigationObserver.getCurrentAttempt()`

Renvoie la dernière tentative commencée (un navigate() réentrant écrase la précédente).

- **renvoie** : table|nil Tentative courante.

#### `ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase)`

Signale une préemption avérée : classe la paire de tentatives, écrit un avertissement unique et renvoie l'enregistrement. Ne fait rien si une tentative manque, si ce sont les mêmes ou si la préemptée a déjà été signalée.

- `preemptedAttempt` (*table|nil*) : Navigation interrompue.
- `replacementAttempt` (*table|nil*) : Navigation qui l'a remplacée.
- `phase` (*string*) : Étiquette indiquant où la préemption a été détectée.
- **renvoie** : table|nil {category, phase, preempted, replacement} ou nil si rien n'a été signalé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `ModuleName` | string | Nom du module : "navigationObserver". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationObserver.lua`.*

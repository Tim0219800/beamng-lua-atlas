---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationObserver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Diagnostic non-shipping du routeur : attribue chaque appel à navigate() au module Lua appelant (en remontant la pile en ignorant les fichiers « ui/router/ ») et avertit quand une navigation en préempte une autre encore en cours (transition active remplacée, ou navigate() dont l'époque a été incrémentée par un navigate() réentrant pendant ses gardes/onEnter). Chaque préemption est classée duplicate_navigation (requêtes identiques : route, params, portée, options) ou conflicting_navigation. Il n'a aucun effet sur le comportement du routeur : il enregistre des tentatives et écrit des avertissements.
--- Accès : extension `ui_router_navigationObserver` : `extensions.load("ui_router_navigationObserver")`, puis la globale `ui_router_navigationObserver`
---@class ui_router_navigationObserver
---@field ModuleName string Nom du module : "navigationObserver".
ui_router_navigationObserver = {}

--- Associe la cible résolue (route complète, paramètres effectifs, portée, options) à une tentative.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:179
---@param attempt table|nil Tentative créée par beginAttempt.
---@param target table|nil Cible issue de resolveNavigationTarget (fullRouteName, params, options).
function ui_router_navigationObserver.attachResolvedTarget(attempt, target) end

--- Démarre une nouvelle tentative à l'entrée de navigate() en capturant l'appelant Lua externe. Doit être appelée avant tout wrapper du routeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:164
---@return table  Tentative {id, source, route, params, scope, options} (les quatre derniers renseignés par attachResolvedTarget).
function ui_router_navigationObserver.beginAttempt() end

--- Renvoie la dernière tentative commencée (un navigate() réentrant écrase la précédente).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:189
---@return table|nil  Tentative courante.
function ui_router_navigationObserver.getCurrentAttempt() end

--- Signale une préemption avérée : classe la paire de tentatives, écrit un avertissement unique et renvoie l'enregistrement. Ne fait rien si une tentative manque, si ce sont les mêmes ou si la préemptée a déjà été signalée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:203
---@param preemptedAttempt table|nil Navigation interrompue.
---@param replacementAttempt table|nil Navigation qui l'a remplacée.
---@param phase string Étiquette indiquant où la préemption a été détectée.
---@return table|nil  {category, phase, preempted, replacement} ou nil si rien n'a été signalé.
function ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase) end

--- Réinitialise l'observateur (tentative courante, compteur, tentatives déjà signalées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:227
function ui_router_navigationObserver.reset() end


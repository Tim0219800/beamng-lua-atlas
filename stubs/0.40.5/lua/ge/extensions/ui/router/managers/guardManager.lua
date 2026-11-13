---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/guardManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des gardes de navigation du routeur. reloadGuards parcourt le dossier lua/ge/extensions/ui/router/guards/, charge chaque fichier et enregistre les fonctions de sa table M.guards sous leur clé. Les routes référencent ces clés dans leurs listes de gardes (enterGuards, exitGuards) ; executeGuards les exécute dans l'ordre. Un moddeur peut ajouter ses propres gardes avec addGuard.
--- Accès : extension `ui_router_managers_guardManager` : `extensions.load("ui_router_managers_guardManager")`, puis la globale `ui_router_managers_guardManager`
---@class ui_router_managers_guardManager
ui_router_managers_guardManager = {}

--- Ajoute une garde sous la clé donnée ; ne fait rien (avertissement) si la clé existe déjà.
---Source : lua/ge/extensions/ui/router/managers/guardManager.lua:26
---@param key string Clé de la garde.
---@param fn function Fonction (route, params, context) -> boolean.
function ui_router_managers_guardManager.addGuard(key, fn) end

--- Exécute dans l'ordre les gardes listées ; s'arrête à la première qui renvoie false.
---Source : lua/ge/extensions/ui/router/managers/guardManager.lua:46
---@param specifiedGuards string[] Clés de gardes à exécuter.
---@param route table Route visée (ou de la route courante pour les gardes de sortie).
---@param params table|nil Paramètres de route.
---@param context table|nil Contexte (par exemple {routeName, options} pour les gardes de sortie).
---@return table  {result = valeur de la dernière garde exécutée (true par défaut), failedGuard = clé de la garde bloquante}.
function ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context) end

--- Vide le registre puis recharge toutes les gardes des fichiers du dossier guards/. Appelée au chargement de ui_router.
---Source : lua/ge/extensions/ui/router/managers/guardManager.lua:9
function ui_router_managers_guardManager.reloadGuards() end

--- Supprime la garde de clé donnée.
---Source : lua/ge/extensions/ui/router/managers/guardManager.lua:42
---@param key string Clé de la garde.
function ui_router_managers_guardManager.removeGuard(key) end

--- Remplace une garde existante ; ne fait rien (avertissement) si la clé est inconnue.
---Source : lua/ge/extensions/ui/router/managers/guardManager.lua:34
---@param key string Clé de la garde.
---@param fn function Nouvelle fonction.
function ui_router_managers_guardManager.updateGuard(key, fn) end


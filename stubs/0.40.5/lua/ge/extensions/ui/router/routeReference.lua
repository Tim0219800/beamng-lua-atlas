---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions pures pour décomposer une référence de navigation décorée de la forme `route[?clé=valeur&...][:portée]`. La partie route peut rester relative (« ./options ») : ce module ne la résout pas, il sépare seulement la requête inline et la portée (scope) et décode les paramètres inline.
--- Accès : extension `ui_router_routeReference` : `extensions.load("ui_router_routeReference")`, puis la globale `ui_router_routeReference`
---@class ui_router_routeReference
ui_router_routeReference = {}

--- Superpose les paramètres explicites sur les paramètres inline (copie). Les explicites gagnent et un avertissement est journalisé si la valeur diffère.
---Source : lua/ge/extensions/ui/router/routeReference.lua:118
---@param inlineParams table|nil Paramètres issus de la référence.
---@param explicitParams table|nil Paramètres passés explicitement.
---@return table  Table fusionnée.
function ui_router_routeReference.mergeParams(inlineParams, explicitParams) end

--- Sépare « route[?requête][:portée] » en ses parties. Une référence non-chaîne est renvoyée sans changement avec des params vides.
---Source : lua/ge/extensions/ui/router/routeReference.lua:70
---@param reference string|any Référence de navigation brute.
---@return table  { route = string, scope = string|nil, params = table<string, string> }
function ui_router_routeReference.parse(reference) end

--- Analyse un segment « a=1&b=2 » en table. Les valeurs restent des chaînes ; une clé répétée garde la dernière valeur (avertissement) ; une clé nue (« flag ») vaut une chaîne vide ; les clés vides sont ignorées.
---Source : lua/ge/extensions/ui/router/routeReference.lua:38
---@param query string|nil Segment de requête sans le '?'.
---@return table<string, string>  Paramètres décodés.
function ui_router_routeReference.parseQuery(query) end

--- Décode un composant de requête : '+' devient une espace, puis les séquences %XX sont décodées.
---Source : lua/ge/extensions/ui/router/routeReference.lua:24
---@param value string Texte encodé ; une valeur non-chaîne est renvoyée telle quelle.
---@return string  Texte décodé.
function ui_router_routeReference.urlDecode(value) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petits utilitaires du routeur UI : détection et résolution de noms de routes relatifs (styles Angular « ^. » et Vue « ./ », « ../ »), fusion profonde de tables et résolution d'une référence de fonction « module.func » en fonction Lua appelable. Utilisé par le routeur et ses services.
--- Accès : extension `ui_router_utils` : `extensions.load("ui_router_utils")`, puis la globale `ui_router_utils`
---@class ui_router_utils
ui_router_utils = {}

--- Fusionne récursivement `source` dans `target` (modifié sur place) : les tables communes sont fusionnées, les autres valeurs écrasées par celles de source. Si source n'est pas une table, renvoie source (ou target si source est nil).
---Source : lua/ge/extensions/ui/router/utils.lua:101
---@param target table Table modifiée.
---@param source table Table à fusionner.
---@return table  La table target fusionnée.
function ui_router_utils.deepMerge(target, source) end

--- Indique si le nom de route est relatif : commence par '^' (Angular) ou par '.' (Vue).
---Source : lua/ge/extensions/ui/router/utils.lua:5
---@param route string|any Nom de route.
---@return boolean  true si relatif ; false pour un non-string.
function ui_router_utils.isRelativeRoute(route) end

--- Résout une chaîne « module.func » (séparation au dernier point) en fonction de l'extension correspondante.
---Source : lua/ge/extensions/ui/router/utils.lua:123
---@param reference string|nil Référence « module.func » ; nil donne trois nil.
---@param contextLabel string|nil Libellé utilisé dans les messages d'erreur (défaut « Function reference »).
---@return function|nil  La fonction trouvée.
---@return string|nil  Message d'erreur.
---@return boolean|nil  true en cas d'erreur.
function ui_router_utils.resolveFunctionReference(reference, contextLabel) end

--- Convertit une route relative en nom absolu pointé par rapport à l'état courant. « ^^.x » ou « ../../x » remontent de n niveaux ; « ./x » reste au même niveau (ajoute un enfant) ; les '/' deviennent des '.'. Une route absolue est renvoyée telle quelle.
---Source : lua/ge/extensions/ui/router/utils.lua:23
---@param route string Route relative ou absolue.
---@param currentState string Nom pointé de la route courante.
---@return string  Nom pointé résolu.
function ui_router_utils.resolveRelativeRoute(route, currentState) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP de dessin de debug dans le monde : sphères, lignes et textes persistants, redessinés à chaque frame avec debugDrawer jusqu'à effacement ou expiration (ttl). Sert à signaler une position ou un problème dans la scène. Module chargé par mcp_tools.
--- Accès : extension `mcp_tools_debug` : `extensions.load("mcp_tools_debug")`, puis la globale `mcp_tools_debug`
---@class mcp_tools_debug
---@field schemas table<string, table> Schémas de debug_draw et debug_clear.
mcp_tools_debug = {}

--- Efface une forme par id, ou toutes si aucun id n'est donné.
---Source : lua/ge/extensions/mcp/tools/debug.lua:62
---@param args table|nil {id?: string}
---@return string  Confirmation.
---@return boolean  toujours false.
function mcp_tools_debug.debug_clear(args) end

--- Ajoute ou remplace une forme de debug persistante et renvoie son id (« sN » auto-généré si non fourni).
---Source : lua/ge/extensions/mcp/tools/debug.lua:41
---@param args table {kind?: 'sphere'|'line'|'text', pos?: {x,y,z}, from?: {x,y,z}, to?: {x,y,z}, radius?: number m (défaut 0.5), label?|text?: string, color?: {r,g,b,a}, ttl?: number s (0/absent = permanent), id?: string}. line exige from+to ; sphere/text exigent pos ; text exige un label.
---@return string  Id de la forme, ou message d'erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_debug.debug_draw(args) end

--- Appelé avant chaque rendu : supprime les formes expirées et dessine les autres (ligne, texte ou sphère, avec étiquette éventuelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools/debug.lua:32
---@param dtReal number Durée réelle (s), inutilisée.
function mcp_tools_debug.onPreRender(dtReal) end


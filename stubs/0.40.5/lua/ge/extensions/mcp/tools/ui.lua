---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP pour l'interface (CEF/Vue) : lire la route et l'état Pinia, naviguer, afficher/masquer l'UI, afficher un message, et piloter le DOM (JS arbitraire, clic, molette, saisie, clavier, survol) pour des tests d'interface. Les commandes JS sont envoyées avec be:executeJS ; les résultats reviennent à GE par window.beamng.sendEngineLua vers les callbacks `_cb.vueDump` / `_cb.uiEval`.
--- Accès : extension `mcp_tools_ui` : `extensions.load("mcp_tools_ui")`, puis la globale `mcp_tools_ui`
---@class mcp_tools_ui
---@field cb table<string, function> Callbacks `vueDump(s)` et `uiEval(s)` : stockent la chaîne dans shared.asyncResults.vue / .ui.
---@field schemas table<string, table> Schémas des outils d'interface.
mcp_tools_ui = {}

--- Demande un instantané de la route courante et des stores Pinia (asynchrone).
---Source : lua/ge/extensions/mcp/tools/ui.lua:50
---@return string  JSON {route, stores} précédent, ou message.
---@return boolean  false.
function mcp_tools_ui.dump_vue_state() end

--- État de l'UI : route/scope (ui_router.getState) et état de jeu (core_gamestate.getGameState).
---Source : lua/ge/extensions/mcp/tools/ui.lua:36
---@return string  JSON {route, gameState}.
---@return boolean  false.
function mcp_tools_ui.get_ui_state() end

--- Navigue vers une route de l'UI (ui_router.navigate).
---Source : lua/ge/extensions/mcp/tools/ui.lua:42
---@param args table {route: string (ex. 'menu', 'menu.vehicles'), params?: table}
---@return string  Message.
---@return boolean  true en cas d'erreur.
function mcp_tools_ui.set_ui_state(args) end

--- Affiche un message dans l'app de messages du jeu via ui_message ; réutiliser la même category remplace le message précédent.
---Source : lua/ge/extensions/mcp/tools/ui.lua:66
---@param args table {text: string, ttl?: number s (défaut 5), category?: string (défaut 'mcp'), icon?: string (défaut 'info')}
---@return string  « shown: … ».
---@return boolean  true si text manquant.
function mcp_tools_ui.show_message(args) end

--- Affiche/masque l'UI (comme Alt+U) via ui_visibility.
---Source : lua/ge/extensions/mcp/tools/ui.lua:58
---@param args table|nil {show?: boolean} true/false pour fixer, absent pour basculer.
---@return string  « ui visible: … ».
---@return boolean  true si ui_visibility absent.
function mcp_tools_ui.toggle_ui(args) end

--- Simule un clic complet (pointerdown, mousedown, pointerup, mouseup, click, option dblclick) au centre d'un élément trouvé par sélecteur CSS ; clic droit déclenche aussi contextmenu.
---Source : lua/ge/extensions/mcp/tools/ui.lua:89
---@param args table {selector: string, nth?: integer, button?: 'left'|'middle'|'right'|0|1|2, doubleClick?: boolean}
---@return string  Message.
---@return boolean  true si selector manquant.
function mcp_tools_ui.ui_click(args) end

--- Évalue du JavaScript dans l'UI et renvoie sa valeur en JSON (asynchrone).
---Source : lua/ge/extensions/mcp/tools/ui.lua:76
---@param args table {js: string}
---@return string  Résultat JSON ou message « dispatched ».
---@return boolean  true si js manquant.
function mcp_tools_ui.ui_eval(args) end

--- Simule un survol (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) d'un élément.
---Source : lua/ge/extensions/mcp/tools/ui.lua:134
---@param args table {selector: string, nth?: integer}
---@return string  Message.
---@return boolean  true si selector manquant.
function mcp_tools_ui.ui_hover(args) end

--- Envoie un évènement clavier à un élément ou à l'élément actif.
---Source : lua/ge/extensions/mcp/tools/ui.lua:124
---@param args table {key: string (ex. 'Enter'), selector?: string, event?: 'down'|'up'|'press' (défaut keydown+keyup), nth?: integer}
---@return string  Message.
---@return boolean  true si key manquant.
function mcp_tools_ui.ui_key(args) end

--- Envoie un évènement wheel à un élément (deltaY>0 = vers le bas ; 120 par défaut si aucun delta).
---Source : lua/ge/extensions/mcp/tools/ui.lua:103
---@param args table {selector: string, deltaX?: number, deltaY?: number, nth?: integer}
---@return string  Message.
---@return boolean  true si selector manquant.
function mcp_tools_ui.ui_scroll(args) end

--- Saisit du texte dans un input/textarea/contenteditable (fixe la valeur puis déclenche input et change, compatible v-model).
---Source : lua/ge/extensions/mcp/tools/ui.lua:113
---@param args table {selector: string, text: string, clear?: boolean (défaut true, false = ajoute), nth?: integer}
---@return string  Message.
---@return boolean  true si paramètre manquant.
function mcp_tools_ui.ui_type(args) end


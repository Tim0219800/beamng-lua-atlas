---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP d'entrées véhicule : injecter un évènement de contrôle (direction, accélérateur, frein…), tester un contrôle « hydro » en aller-retour avec détection d'erreurs dans le log, et exécuter du Lua dans la VM d'un ou de tous les véhicules.
--- Accès : extension `mcp_tools_input` : `extensions.load("mcp_tools_input")`, puis la globale `mcp_tools_input`
---@class mcp_tools_input
---@field cb table<string, function> Callback `vehLua(vid, result)` : stocke result dans shared.asyncResults.vehLua[tostring(vid)].
---@field schemas table<string, table> Schémas de inject_input, test_hydro, run_lua_vehicle.
mcp_tools_input = {}

--- Envoie input.event(event, value, filter) dans la VM du véhicule via be:queueObjectLua.
---Source : lua/ge/extensions/mcp/tools/input.lua:43
---@param args table {event: string (steering, throttle, brake, parkingbrake, clutch…), value?: number (défaut 0, typ. -1..1 ou 0..1), filter?: integer (défaut 2), id?: integer}
---@return string  Confirmation.
---@return boolean  true en cas d'erreur.
function mcp_tools_input.inject_input(args) end

--- Appelé chaque frame : fait avancer la séquence test_hydro (étapes 1 à 3 temporisées) et, à la fin, lit les erreurs du log.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools/input.lua:26
---@param dtReal number Durée réelle (s).
function mcp_tools_input.onUpdate(dtReal) end

--- Exécute du Lua dans la VM d'un véhicule (ou de tous avec all=true) ; résultats asynchrones.
---Source : lua/ge/extensions/mcp/tools/input.lua:66
---@param args table {code: string, id?: integer, all?: boolean}
---@return string  JSON des résultats précédents ou message « queued ».
---@return boolean  true en cas d'erreur.
function mcp_tools_input.run_lua_vehicle(args) end

--- Lance le test haut/bas/neutre d'un évènement d'entrée et détecte les erreurs loggées. Asynchrone : rappeler après ~2 s.
---Source : lua/ge/extensions/mcp/tools/input.lua:54
---@param args table|nil {event?: string (défaut 'steering'), id?: integer}
---@return string  JSON {event, vid, ok, errors} du test précédent, ou message de démarrage.
---@return boolean  true si le véhicule n'existe pas.
function mcp_tools_input.test_hydro(args) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur des modules d'outils MCP. Au chargement il parcourt `/lua/ge/extensions/mcp/tools/*.lua` (niveau 1), les `require` un par un et fusionne dans l'extension `mcp_tools` : les fonctions d'outils, les schémas (`schemas`), les callbacks (`cb`, exposés sous `_cb`) et les hooks `onUpdate`, `onPreRender`, `onInstabilityDetected`, redistribués à tous les modules. Le serveur (mcp_server) expose ensuite comme outil MCP chaque fonction de `mcp_tools` qui ne commence pas par `on`+majuscule.
--- Accès : extension `mcp_tools` : `extensions.load("mcp_tools")`, puis la globale `mcp_tools`
---@class mcp_tools
---@field _cb table<string, function> Callbacks appelés depuis la VM véhicule ou l'UI via `extensions.mcp_tools._cb.<nom>(...)` : ai, electrics, vehLua, vueDump, uiEval. Servent à rapporter des résultats asynchrones dans mcp/shared asyncResults.
---@field schemas table<string, table> Métadonnées des outils : nom -> {description, inputSchema} (JSON Schema), fusionnées depuis chaque module.
mcp_tools = {}

--- Hook de fan-out : relaie l'instabilité physique détectée par le moteur aux modules (vehicle.lua la journalise). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools.lua:dyn
---@param vid integer Id du véhicule instable (déduit du code).
---@param returnData any Données fournies par le moteur (non utilisées).
function mcp_tools.onInstabilityDetected(vid, returnData) end

--- Hook de fan-out : appelle le onPreRender de chaque module qui en définit un (debug : dessin des formes). Appelé avant le rendu. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools.lua:dyn
---@param dtReal number Durée réelle (s).
function mcp_tools.onPreRender(dtReal) end

--- Hook de fan-out généré par le chargeur : appelle le onUpdate de chaque module d'outils qui en définit un (camera, input, spawn). Appelé chaque frame. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools.lua:dyn
---@param dtReal number Durée réelle de la frame (s).
function mcp_tools.onUpdate(dtReal) end


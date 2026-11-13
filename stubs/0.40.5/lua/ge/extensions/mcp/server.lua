---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/server.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur MCP (Model Context Protocol) intégré au jeu. Il ouvre un petit serveur HTTP local (via le serveur C++ BNGWebWSServer) sur http://127.0.0.1:29292/mcp et y parle JSON-RPC 2.0 en transport « Streamable HTTP » (uniquement POST). Un client MCP (Cursor, Claude, etc.) peut ainsi lister et appeler les outils exposés par l'extension mcp_tools (exécuter du Lua dans le jeu, lire les logs, capturer l'écran, piloter véhicules, caméra, éditeur, UI…). Ce module ne contient que la plomberie du protocole ; les outils eux-mêmes sont dans mcp_tools et mcp/tools/*.lua.
--- Accès : extension `mcp_server` : `extensions.load("mcp_server")`, puis la globale `mcp_server`
---@class mcp_server
mcp_server = {}

--- Indique si le serveur écoute vraiment : le port publié correspond au port courant, le serveur existe et `server:isListening()` est vrai. Utilisé par ge/main.lua (tryCompleteLuaReload) pour attendre que le serveur soit relancé avant de terminer un rechargement Lua.
---Source : lua/ge/extensions/mcp/server.lua:171
---@return boolean  true si l'écouteur HTTP est prêt.
function mcp_server.isReady() end

--- Appelé après un rechargement du VM Lua : relance le serveur si `data.active` était vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:169
---@param data table|nil Table renvoyée par onSerialize.
function mcp_server.onDeserialize(data) end

--- Hook appelé quand l'extension est chargée : démarre le serveur HTTP (BNGWebWSServer.getOrCreate sur l'hôte/port courant, route /mcp).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:161
function mcp_server.onExtensionLoaded() end

--- Hook appelé au déchargement : détruit le serveur HTTP s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:163
function mcp_server.onExtensionUnloaded() end

--- Hook d'extension appelé au chargement : passe l'extension en mode de déchargement manuel pour qu'elle ne soit pas déchargée lors des changements de niveau ou de mode de jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:159
function mcp_server.onInit() end

--- Appelé avant un rechargement du VM Lua (Ctrl+L) : mémorise si le serveur était actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:168
---@return table  {active = boolean}
function mcp_server.onSerialize() end

--- Hook appelé à chaque frame : publie le port une fois la liaison réussie, exécute le chien de garde (toutes les 2 s, change de port si l'écouteur est tombé), puis lit les requêtes HTTP en attente (getHttpRequests) : POST -> handleRpc et réponse JSON, autre méthode -> 405.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/server.lua:121
---@param dtReal number Durée réelle de la frame en secondes.
function mcp_server.onUpdate(dtReal) end


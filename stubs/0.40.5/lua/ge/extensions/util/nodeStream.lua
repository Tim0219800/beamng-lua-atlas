---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/nodeStream.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur WebSocket local (127.0.0.1:8088, nom « nodestream ») qui diffuse en direct la structure du véhicule joueur à un client externe (visualiseur 3D, outil de débogage). Le client peut demander : les positions initiales des nœuds, les données de mappage des flexbodies, le démarrage/arrêt du flux des positions courantes (toutes les 0,1 s), ou le chargement d'une extension. Les autres messages JSON sont relayés aux extensions via le hook onWebSocketHandlerMessage.
--- Accès : extension `util_nodeStream` : `extensions.load("util_nodeStream")`, puis la globale `util_nodeStream`
---@class util_nodeStream
util_nodeStream = {}

--- Appelé au chargement : crée (ou récupère) le serveur WebSocket via wsUtils.createOrGetWS sur 127.0.0.1:8088.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/nodeStream.lua:214
function util_nodeStream.onExtensionLoaded() end

--- Appelé au déchargement : détruit le serveur WebSocket (BNGWebWSServer.destroy).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/nodeStream.lua:225
function util_nodeStream.onExtensionUnloaded() end

--- Hook appelé chaque frame : diffuse les positions de nœuds si le flux est actif (intervalle 0,1 s), traite les évènements des clients (connexion C, déconnexion DC, données D), puis met à jour le serveur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/nodeStream.lua:234
---@param dt number Delta de temps en secondes
function util_nodeStream.onUpdate(dt) end


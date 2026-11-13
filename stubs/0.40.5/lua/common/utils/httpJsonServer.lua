---@meta
-- tim19Atlas stub generated from lua/common/utils/httpJsonServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mini serveur HTTP non bloquant qui répond en JSON, pour monter rapidement une API REST locale (outils externes, éditeurs). Se charge avec require('utils/httpJsonServer') ; init() ouvre le port, puis update() doit être appelé régulièrement (à chaque frame). Seules les requêtes GET sont traitées.
--- Accès : `require("utils/httpJsonServer")`
---@class utils_httpJsonServer
local utils_httpJsonServer = {}

--- Crée la socket TCP, la lie à l'hôte/port, la met en écoute non bloquante et mémorise le callback de traitement des requêtes.
---Source : lua/common/utils/httpJsonServer.lua:52
---@param _bindhost string Adresse d'écoute, ex. 'localhost'
---@param _bindport integer Port TCP, ex. 23512
---@param _callback function function(request) -> table|nil : construit la réponse JSON
function utils_httpJsonServer.init(_bindhost, _bindport, _callback) end

--- À appeler régulièrement : accepte les nouveaux clients, lit les requêtes GET prêtes, appelle le callback et envoie les réponses JSON (puis ferme la connexion). Ne fait rien avant init().
---Source : lua/common/utils/httpJsonServer.lua:105
function utils_httpJsonServer.update() end

return utils_httpJsonServer

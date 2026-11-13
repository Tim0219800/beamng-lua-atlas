---@meta
-- tim19Atlas stub generated from lua/common/utils/simpleHttpServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mini serveur HTTP non bloquant, qui sert des fichiers statiques d'un dossier (avec détection de type MIME par extension et gabarits libs/resty/template pour .htmlt/.jst) et des handlers Lua par motif d'URL. Se charge avec require('utils/simpleHttpServer'). Prévu uniquement pour des environnements sûrs (le fichier le dit) : lent, petits fichiers, non sécurisé.
--- Accès : globale `ws`
---@class ws
ws = {}

--- Crée la socket TCP, la lie à l'hôte/port et la met en écoute non bloquante. En cas d'échec de bind, loggue une erreur, ferme la socket et abandonne.
---Source : lua/common/utils/simpleHttpServer.lua:68
---@param _bindhost string Adresse d'écoute, ex. '127.0.0.1'
---@param _bindport integer Port TCP
---@param _fileroot string Dossier racine des fichiers servis (concaténé au chemin d'URL)
---@param _handlers table|nil Liste de {motif, fonction} (voir notes), vide par défaut
---@param _argsCallback function|nil function(req, path) -> table : variables passées aux gabarits .htmlt/.jst
function ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback) end

--- Ferme la socket d'écoute et loggue la fermeture.
---Source : lua/common/utils/simpleHttpServer.lua:90
function ws.stop() end

--- À appeler à chaque frame : accepte les nouveaux clients, lit les requêtes GET prêtes, construit la réponse (handler ou fichier) et la pompe vers le client (fermeture à la fin). Ne fait rien si le serveur n'est pas démarré.
---Source : lua/common/utils/simpleHttpServer.lua:235
function ws.update() end


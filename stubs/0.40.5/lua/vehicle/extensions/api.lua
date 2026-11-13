---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/api.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension véhicule qui démarre un petit serveur HTTP/JSON local (utils/httpJsonServer) sur localhost:23512 au chargement de l'extension. Il répond à deux routes : v1/ping et v1/getData (nœuds, poutres et triangles du véhicule, pour un éditeur externe). L'extension est chargée par véhicule ; le serveur est démarré une seule fois dans ce VM.
--- Accès : extension `api` : `extensions.load (VM véhicule)("api")`, puis la globale `api`
---@class api
api = {}

--- Appelé au chargement de l'extension : démarre une fois le serveur HTTP JSON sur localhost:23512 avec le gestionnaire de requêtes interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/api.lua:108
function api.onExtensionLoaded() end

--- Hook appelé quand le véhicule est chargé ; corps vide (code de débogage commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/api.lua:125
function api.onVehicleLoaded() end

--- Appelé chaque frame : traite les connexions en attente du serveur HTTP.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/api.lua:129
function api.updateGFX() end


---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dynoClient.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client de banc de puissance (dyno) côté véhicule : après initDyno, il envoie chaque frame le régime moteur, le rapport engagé et les rapports de transmission à une texture HTML (JUI) appartenant à l'objet du banc, via queueJSUITexture exécuté dans le GE Lua.
--- Accès : extension `dynoClient` : `extensions.load (VM véhicule)("dynoClient")`, puis la globale `dynoClient`
---@class dynoClient
dynoClient = {}

--- Mémorise l'objet du banc et sa texture, puis lui envoie un message d'initialisation 'client_init'. Sans identifiant d'objet, ne fait rien.
---Source : lua/vehicle/extensions/dynoClient.lua:16
---@param _dynoObjectID integer Identifiant de l'objet banc de puissance.
---@param _textureName string Nom de la texture JUI sur cet objet.
function dynoClient.initDyno(_dynoObjectID, _textureName) end

--- Appelé chaque frame : envoie 'client_data' au banc si initDyno a été appelé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/dynoClient.lua:36
---@param dt number Pas de temps en secondes (non utilisé).
function dynoClient.updateGFX(dt) end


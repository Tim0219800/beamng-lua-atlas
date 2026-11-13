---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/utRecorder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Envoie à chaque frame les données du véhicule au Lua du moteur de jeu (GE) pour qu'elles soient enregistrées avec le reste (outil de test). Le message est mis en file par obj:queueGameEngineLua et appelle extensions.test_utRecorder.onVehicleData(vehId, tableDonnées) côté GE.
--- Accès : extension `utRecorder` : `extensions.load (VM véhicule)("utRecorder")`, puis la globale `utRecorder`
---@class utRecorder
utRecorder = {}

--- Appelé à chaque frame graphique (extensions.hook('updateGFX')). Construit la table de données du véhicule et l'envoie à extensions.test_utRecorder.onVehicleData côté GE.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/utRecorder.lua:9
---@param dt number Pas de temps (non utilisé).
function utRecorder.updateGFX(dt) end


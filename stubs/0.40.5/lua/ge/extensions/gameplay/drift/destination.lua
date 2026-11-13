---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/destination.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suivi d'itinéraire du mode drift (« A vers B »). setRacePath charge un chemin de course (gameplay/race/path) depuis un fichier JSON, éventuellement inversé, et en extrait les points. Chaque frame, il calcule la distance restante le long de ce chemin, la distance à la route prévue, si le véhicule roule à contresens, et cumule la distance parcourue à contresens : au-delà d'un seuil (10 m par défaut) wrongWayFail passe à true. Un moddeur de mission de drift lit ces valeurs pour afficher la progression ou faire échouer la mission.
--- Accès : extension `gameplay_drift_destination` : `extensions.load("gameplay_drift_destination")`, puis la globale `gameplay_drift_destination`
---@class gameplay_drift_destination
gameplay_drift_destination = {}

--- Indique si la détection de contresens et le calcul de distance sont désactivés (valeur passée à setRacePath).
---Source : lua/ge/extensions/gameplay/drift/destination.lua:196
---@return boolean|nil  disableWrongWayAndDist, nil avant setRacePath.
function gameplay_drift_destination.getDisableWrongWayAndDist() end

--- Distance (m) du véhicule au segment de route prévu le plus proche.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:192
---@return number  Distance, 0 par défaut.
function gameplay_drift_destination.getDistToIntendedRoad() end

--- Table de configuration du debug de l'extension : {default = false, canBeChanged = true}.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:184
---@return table  Infos de debug.
function gameplay_drift_destination.getDriftDebugInfo() end

--- Garbage Lua produit par la dernière frame mesurée par le profileur.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:188
---@return number  Quantité de garbage.
function gameplay_drift_destination.getGC() end

--- Indique si le véhicule roule actuellement à contresens.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:176
---@return boolean|nil  true si contresens.
function gameplay_drift_destination.getGoingWrongWay() end

--- Objet chemin de course chargé (gameplay/race/path).
---Source : lua/ge/extensions/gameplay/drift/destination.lua:164
---@return table|nil  Chemin, nil avant setRacePath.
function gameplay_drift_destination.getPathData() end

--- Distance restante (m) le long du chemin jusqu'au dernier point.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:172
---@return number|nil  Distance restante.
function gameplay_drift_destination.getRemainingDist() end

--- Positions des points du chemin (dans l'ordre de parcours, inversées si reverse).
---Source : lua/ge/extensions/gameplay/drift/destination.lua:168
---@return vec3[]|nil  Liste de positions.
function gameplay_drift_destination.getWaypoints() end

--- Vrai quand la distance cumulée à contresens dépasse maxWrongWayDist.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:180
---@return boolean|nil  Échec contresens.
function gameplay_drift_destination.getWrongWayFail() end

--- Hook par frame : met à jour distance restante, contresens et échec de contresens (rien si gameplay_drift_drift n'a pas de position de véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/destination.lua:147
function gameplay_drift_destination.onUpdate() end

--- Hook : véhicule réinitialisé ; remet la dernière position à zéro pour ne pas compter le saut de reset comme distance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/destination.lua:206
---@param vehicleId integer ID du véhicule réinitialisé.
function gameplay_drift_destination.onVehicleResetted(vehicleId) end

--- Remet à zéro la distance restante, la distance cumulée à contresens et la dernière position (pas wrongWayFail).
---Source : lua/ge/extensions/gameplay/drift/destination.lua:200
function gameplay_drift_destination.reset() end

--- Charge le chemin de course depuis data.filePath (JSON), l'inverse si data.reverse, applique autoConfig et extrait les positions des points de passage triés.
---Source : lua/ge/extensions/gameplay/drift/destination.lua:27
---@param data table {filePath = string, reverse = boolean|nil, maxWrongWayDist = number|nil (défaut 10), disableWrongWayAndDist = boolean|nil}.
function gameplay_drift_destination.setRacePath(data) end


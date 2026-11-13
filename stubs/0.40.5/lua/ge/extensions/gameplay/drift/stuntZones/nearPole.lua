---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone nearPole. Champs : data = {id, zoneData = {pos}}, marker, activeData = {veh, hitPole, lastFrameHitPole, available, resetFlag, lastFramePlDist, minCornerDist}.
---@class gameplay_drift_stuntZones_nearPole
local gameplay_drift_stuntZones_nearPole = {}

--- Réussite : supprime le marqueur, rend la zone indisponible et émet onAnyStuntZoneAccomplished (sous-hook onNearPoleAccomplished avec currDegAngle, closeness, points).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:82
function gameplay_drift_stuntZones_nearPole:accomplish() end

--- Supprime le véhicule poteau et son marqueur.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:8
function gameplay_drift_stuntZones_nearPole:clear() end

--- Supprime le marqueur de course s'il existe.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:15
function gameplay_drift_stuntZones_nearPole:clearMarker() end

--- Crée un marqueur de course « overhead » (rayon 5) 2.5 m au-dessus du poteau.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:22
function gameplay_drift_stuntZones_nearPole:createMarker() end

--- Parcourt les 4 coins du véhicule (getVehCorners), mémorise la distance minimale et marque la zone comme réussie quand le véhicule s'éloigne du poteau sans l'avoir touché.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:104
function gameplay_drift_stuntZones_nearPole:detectStunt() end

--- Constructeur interne : mémorise les données, spawne le poteau rayé à zoneData.pos, crée le marqueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:67
---@param data table {id, zoneData = {pos}, nearDist}.
function gameplay_drift_stuntZones_nearPole:init(data) end

--- Indique si le poteau peut encore rapporter des points.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:159
---@return boolean  true tant que la zone n'a pas été réussie.
function gameplay_drift_stuntZones_nearPole:isAvailable() end

--- Appelé à chaque frame : met à jour le marqueur et détecte une collision entre le véhicule du drift et le poteau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:132
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulé.
function gameplay_drift_stuntZones_nearPole:onUpdate(dtReal, dtSim) end

--- Si le véhicule détruit est le poteau, oublie le poteau et retire la zone du gestionnaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:152
---@param vehId integer Véhicule détruit.
function gameplay_drift_stuntZones_nearPole:onVehicleDestroyed(vehId) end

--- Remet le poteau en place (reset physique et mesh), réinitialise les données puis recrée le marqueur après 0.1 s via un job.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:46
function gameplay_drift_stuntZones_nearPole:reset() end

--- Remet à zéro activeData (available = true, distances à l'infini).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:33
function gameplay_drift_stuntZones_nearPole:resetData() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone hitPole. Champs : data = {id, zoneData = {pos}}, marker (marqueur de course), activeData = {veh (poteau), hitPole, lastFrameHitPole, available, resetFlag}.
---@class gameplay_drift_stuntZones_hitPole
local gameplay_drift_stuntZones_hitPole = {}

--- Réussite : supprime le marqueur, rend la zone indisponible et émet onAnyStuntZoneAccomplished (sous-hook onHitPoleAccomplished).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:77
function gameplay_drift_stuntZones_hitPole:accomplish() end

--- Supprime le véhicule poteau et son marqueur.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:6
function gameplay_drift_stuntZones_hitPole:clear() end

--- Supprime le marqueur de course s'il existe.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:13
function gameplay_drift_stuntZones_hitPole:clearMarker() end

--- Crée un marqueur de course « overhead » (rayon 5) 2.5 m au-dessus du poteau.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:20
function gameplay_drift_stuntZones_hitPole:createMarker() end

--- Appelé quand le joueur drifte : appelle accomplish si le poteau vient d'être touché.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:96
function gameplay_drift_stuntZones_hitPole:detectStunt() end

--- Constructeur interne : mémorise les données, spawne le poteau delineator (pole.pc) à zoneData.pos sans y faire entrer le joueur, crée le marqueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:62
---@param data table {id, zoneData = {pos}, nearDist}.
function gameplay_drift_stuntZones_hitPole:init(data) end

--- Indique si le poteau peut encore rapporter des points.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:129
---@return boolean  true tant qu'il n'a pas été touché.
function gameplay_drift_stuntZones_hitPole:isAvailable() end

--- Appelé à chaque frame : met à jour le marqueur, mémorise l'état de collision précédent et détecte une collision entre le véhicule du drift et le poteau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:102
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulé.
function gameplay_drift_stuntZones_hitPole:onUpdate(dtReal, dtSim) end

--- Si le véhicule détruit est le poteau, oublie le poteau et retire la zone du gestionnaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:122
---@param vehId integer Véhicule détruit.
function gameplay_drift_stuntZones_hitPole:onVehicleDestroyed(vehId) end

--- Remet le poteau en place (reset physique et mesh), réinitialise les données puis recrée le marqueur après 0.1 s via un job.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:41
function gameplay_drift_stuntZones_hitPole:reset() end

--- Remet à zéro activeData (available = true, pas de collision), en perdant la référence au poteau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:31
function gameplay_drift_stuntZones_hitPole:resetData() end


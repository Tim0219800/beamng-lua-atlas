---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/donut.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone donut. Champs : data = {id, zoneData = {pos, scl (rayon), cooldown}, drawData}, activeData = {isActive, currCooldown, totalDriftAngle, completedPerc}.
---@class gameplay_drift_stuntZones_donut
local gameplay_drift_stuntZones_donut = {}

--- Réussite : remet l'angle cumulé à 0, démarre le cooldown et émet onAnyStuntZoneAccomplished (sous-hook onDonutDriftAccomplished, points = base donut).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:25
function gameplay_drift_stuntZones_donut:accomplish() end

--- Ajoute à l'angle cumulé la variation d'angle de drift de la frame (gameplay_drift_drift.getAngleDiff) ; à 360° ou plus, appelle accomplish.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:39
function gameplay_drift_stuntZones_donut:detectStunt() end

--- Constructeur interne : mémorise les données de la zone et appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:20
---@param data table {id, zoneData, drawData, nearDist}.
function gameplay_drift_stuntZones_donut:init(data) end

--- Indique si le cooldown est écoulé.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:49
---@return boolean  true si la zone peut être validée.
function gameplay_drift_stuntZones_donut:isAvailable() end

--- Teste si le véhicule est à moins de scl de pos ; sinon remet l'angle cumulé à 0.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:53
---@return boolean  true si le joueur est dans le cercle.
function gameplay_drift_stuntZones_donut:isPlayerInside() end

--- Appelé à chaque frame par le gestionnaire : dessine le cercle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:61
function gameplay_drift_stuntZones_donut:onUpdate() end

--- Réinitialise activeData (cooldown à 0, angle cumulé à 0).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:11
function gameplay_drift_stuntZones_donut:reset() end

--- Dessine le cercle avec debugDrawer:drawLineInstance, coloré selon l'avancement et le cooldown (si le tracé est activé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:68
function gameplay_drift_stuntZones_donut:sendDecals() end


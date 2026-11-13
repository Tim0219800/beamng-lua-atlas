---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone driftThrough. Champs : data = {id, zoneData = {pos, scl (vec3), rot (quat), cooldown}, x, y, z (demi-axes), drawData = {pointA..D}}, activeData = {isActive, currCooldown, usedFlag}.
---@class gameplay_drift_stuntZones_driftThrough
local gameplay_drift_stuntZones_driftThrough = {}

--- Réussite : remet usedFlag à false, démarre le cooldown et émet onAnyStuntZoneAccomplished (sous-hook onDriftThroughAccomplished avec currDegAngle et points).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:24
function gameplay_drift_stuntZones_driftThrough:accomplish() end

--- Appelé quand le joueur drifte dans la zone ; appelle accomplish si usedFlag est vrai.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:41
function gameplay_drift_stuntZones_driftThrough:detectStunt() end

--- Constructeur interne : mémorise les données de la zone et appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:19
---@param data table {id, zoneData, x, y, z, drawData, nearDist}.
function gameplay_drift_stuntZones_driftThrough:init(data) end

--- Indique si le cooldown est écoulé.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:47
---@return boolean  true si la zone peut être validée.
function gameplay_drift_stuntZones_driftThrough:isAvailable() end

--- Teste avec containsOBB_point si le véhicule est dans la boîte ; s'il n'y est pas, met usedFlag à true.
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:51
---@return boolean  true si le joueur est dans la boîte.
function gameplay_drift_stuntZones_driftThrough:isPlayerInside() end

--- Appelé à chaque frame par le gestionnaire : dessine les lignes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:59
function gameplay_drift_stuntZones_driftThrough:onUpdate() end

--- Réinitialise activeData (cooldown 0, usedFlag false).
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:11
function gameplay_drift_stuntZones_driftThrough:reset() end

--- Dessine les deux bords de la zone avec debugDrawer:drawLineInstance (si le tracé est activé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:70
function gameplay_drift_stuntZones_driftThrough:sendDecals() end


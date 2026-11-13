---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/vehicleTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traqueur de véhicule. Champs : damageThreshold (1 par défaut), vehicleData, lastDamage, lastDamageDiff, justHadDamage, debugDraw, wheelOffsets, currentCorners, previousCorners.
---@class gameplay_rally_vehicleTracker
local gameplay_rally_vehicleTracker = {}

--- Dégât cumulé du véhicule d'après map.objects.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:185
---@return number|nil  Valeur de damage (0 si absent), nil si aucune donnée véhicule.
function gameplay_rally_vehicleTracker:damage() end

--- Indique si un choc d'au moins damageThreshold a eu lieu au dernier tick.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:193
---@return boolean  justHadDamage.
function gameplay_rally_vehicleTracker:didJustHaveDamage() end

--- Si activé : sphère magenta (rayon 1,5) 2 m au-dessus du véhicule, ligne cyan pour la vitesse (x2, au-delà de 0,1 m/s) et texte « VehicleTracker | Pos | Speed » en km/h et m/s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:204
function gameplay_rally_vehicleTracker:drawDebugInfo() end

--- Renvoie getPlayerVehicle(0).
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:54
---@return table|nil  Objet véhicule.
function gameplay_rally_vehicleTracker:getVehicle() end

--- Id du véhicule joueur 0.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:48
---@return integer|nil  Id, ou nil sans véhicule.
function gameplay_rally_vehicleTracker:getVehicleId() end

--- Constructeur. Récupère les données du véhicule joueur, mémorise le dégât courant et calcule les décalages des roues dans le repère du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:9
---@param damageThreshold number|nil Augmentation minimale de `damage` pour compter comme un choc ; défaut 1.
function gameplay_rally_vehicleTracker:init(damageThreshold) end

--- À appeler chaque image : met à jour vehicleData et l'état de dégâts, puis dessine le debug si activé. Sans véhicule, réinitialise vehicleData, lastDamage et justHadDamage.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:70
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_rally_vehicleTracker:onUpdate(dtReal, dtSim, dtRaw) end

--- Position du véhicule joueur (vec3 partagé, réutilisé entre appels).
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:151
---@return vec3|nil  Position monde en mètres.
function gameplay_rally_vehicleTracker:pos() end

--- Active ou coupe le dessin de debug.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:200
---@param enabled boolean true pour dessiner.
function gameplay_rally_vehicleTracker:setDebugDraw(enabled) end

--- Norme de la vitesse.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:180
---@return number|nil  Vitesse en m/s.
function gameplay_rally_vehicleTracker:speedMs() end

--- Compare le dégât courant au dernier retenu et met à jour lastDamage, lastDamageDiff et justHadDamage.
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:115
function gameplay_rally_vehicleTracker:updateVehicleDamage() end

--- Met vehicleData à map.objects[vehicleId] (ou nil).
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:145
---@param vehicleId integer|nil Id du véhicule.
function gameplay_rally_vehicleTracker:updateVehicleData(vehicleId) end

--- Vitesse du véhicule joueur (vec3 partagé, réutilisé).
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:168
---@return vec3|nil  Vitesse en m/s.
function gameplay_rally_vehicleTracker:velocity() end


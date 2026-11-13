---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/fuelTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de stockage d'énergie 'fuelTank' : réservoir de carburant liquide (essence, diesel, kérosène). L'énergie est stockée en joules à partir du volume en litres, de la masse volumique et de la densité énergétique ; la masse des nœuds d'engine group est ajustée selon le niveau, et une fuite peut vider le réservoir en 60 s s'il est percé. Instancié par energyStorage.lua pour `type = "fuelTank"`.
--- Accès : type de stockage d'énergie `fuelTank`, accessible par `energyStorage.getStorage("nom")`
---@class energyStorage_fuelTank
local energyStorage_fuelTank = {}

--- Crée l'instance de réservoir à partir de l'entrée jbeam et applique tout de suite la masse de carburant aux nœuds concernés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage/fuelTank.lua:87
---@param jbeamData table Données jbeam fusionnées du stockage.
---@return table  Instance de stockage (classe 'storage').
function energyStorage_fuelTank.new(jbeamData) end

--- Instance renvoyée par new(jbeamData). Champs publics notables : name, type, energyType, storedEnergy (J), energyCapacity (J), initialStoredEnergy (J), capacity (L), startingCapacity (L), remainingVolume (L), remainingRatio (0 à 1), currentLeakRate (L/s), brokenLeakRate, energyDensity, fuelLiquidDensity, assignedDevices.
---@class energyStorage_fuelTank_storage
local energyStorage_fuelTank_storage = {}

--- Restaure remainingVolume depuis des données sérialisées (si présent).
---Source : lua/vehicle/energyStorage/fuelTank.lua:77
---@param data table Table contenant remainingVolume.
function energyStorage_fuelTank_storage:deserialize(data) end

--- Renvoie l'intégrité (0 si fuite, 1 sinon) et l'état {storedEnergy, currentLeakRate = 0}.
---Source : lua/vehicle/energyStorage/fuelTank.lua:55
---@return number  integrityValue.
---@return table  État sauvegardable.
function energyStorage_fuelTank_storage:getPartCondition() end

--- Appelé quand une poutre breakTriggerBeam casse : active la fuite (currentLeakRate = brokenLeakRate).
---Source : lua/vehicle/energyStorage/fuelTank.lua:31
function energyStorage_fuelTank_storage:onBreak() end

--- Enregistre un périphérique dans assignedDevices.
---Source : lua/vehicle/energyStorage/fuelTank.lua:35
---@param device table Périphérique avec un champ name.
function energyStorage_fuelTank_storage:registerDevice(device) end

--- Remplit le réservoir au niveau de départ, supprime la fuite et réapplique la masse aux nœuds.
---Source : lua/vehicle/energyStorage/fuelTank.lua:65
function energyStorage_fuelTank_storage:reset() end

--- Renvoie {remainingVolume} pour la sauvegarde.
---Source : lua/vehicle/energyStorage/fuelTank.lua:83
---@return table  {remainingVolume = L}.
function energyStorage_fuelTank_storage:serialize() end

--- Restaure l'état depuis la condition de pièce (nombre = fraction du réservoir, avec fuite si 0 ; ou table {storedEnergy, currentLeakRate}).
---Source : lua/vehicle/energyStorage/fuelTank.lua:39
---@param odometer number Inutilisé.
---@param integrity number|table Fraction 0 à 1 ou table d'état.
---@param visual any Inutilisé.
function energyStorage_fuelTank_storage:setPartCondition(odometer, integrity, visual) end

--- Fixe storedEnergy à energyCapacity * ratio (ratio borné entre 0 et 1).
---Source : lua/vehicle/energyStorage/fuelTank.lua:27
---@param ratio number 0 à 1.
function energyStorage_fuelTank_storage:setRemainingRatio(ratio) end

--- Fixe le volume restant (borné entre 0 et capacity) et met à jour storedEnergy.
---Source : lua/vehicle/energyStorage/fuelTank.lua:23
---@param volume number Litres.
function energyStorage_fuelTank_storage:setRemainingVolume(volume) end

--- Appelé chaque frame : recalcule remainingVolume/remainingRatio, applique la masse aux nœuds et retire du carburant si currentLeakRate > 0.
---Source : lua/vehicle/energyStorage/fuelTank.lua:10
---@param dt number Pas de temps en secondes.
function energyStorage_fuelTank_storage:updateGFX(dt) end

return energyStorage_fuelTank

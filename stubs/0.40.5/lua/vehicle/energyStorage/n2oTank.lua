---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/n2oTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de stockage d'énergie 'n2oTank' : bouteille de protoxyde d'azote (nitrous). Capacité exprimée en masse (kg), l'énergie stockée étant la masse multipliée par une densité énergétique fictive. Fonctionne comme fuelTank (masse des nœuds ajustée, fuite en 60 s si la poutre déclencheuse casse). Instancié par energyStorage.lua pour `type = "n2oTank"`.
--- Accès : type de stockage d'énergie `n2oTank`, accessible par `energyStorage.getStorage("nom")`
---@class energyStorage_n2oTank
local energyStorage_n2oTank = {}

--- Crée l'instance de bouteille N2O à partir de l'entrée jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage/n2oTank.lua:84
---@param jbeamData table Données jbeam fusionnées du stockage.
---@return table  Instance de stockage (classe 'storage').
function energyStorage_n2oTank.new(jbeamData) end

--- Instance renvoyée par new(jbeamData). Champs notables : name, type, energyType ('n2o'), storedEnergy (J), energyCapacity (J), initialStoredEnergy, capacity (kg), startingCapacity (kg), remainingMass (kg), remainingRatio, currentLeakRate (kg/s), brokenLeakRate, energyDensity, assignedDevices.
---@class energyStorage_n2oTank_storage
local energyStorage_n2oTank_storage = {}

--- Restaure remainingMass si présent.
---Source : lua/vehicle/energyStorage/n2oTank.lua:74
---@param data table Table contenant remainingMass.
function energyStorage_n2oTank_storage:deserialize(data) end

--- Renvoie l'intégrité (toujours 1) et {storedEnergy}.
---Source : lua/vehicle/energyStorage/n2oTank.lua:53
---@return number  integrityValue.
---@return table  État.
function energyStorage_n2oTank_storage:getPartCondition() end

--- Appelé à la rupture d'une poutre déclencheuse : active la fuite.
---Source : lua/vehicle/energyStorage/n2oTank.lua:31
function energyStorage_n2oTank_storage:onBreak() end

--- Enregistre un périphérique dans assignedDevices.
---Source : lua/vehicle/energyStorage/n2oTank.lua:35
---@param device table Périphérique avec un champ name.
function energyStorage_n2oTank_storage:registerDevice(device) end

--- Remplit la bouteille au niveau de départ, supprime la fuite et réapplique la masse aux nœuds.
---Source : lua/vehicle/energyStorage/n2oTank.lua:62
function energyStorage_n2oTank_storage:reset() end

--- Renvoie {remainingMass}.
---Source : lua/vehicle/energyStorage/n2oTank.lua:80
---@return table  {remainingMass = kg}.
function energyStorage_n2oTank_storage:serialize() end

--- Restaure l'état depuis la condition de pièce (nombre = fraction, ou table {storedEnergy}).
---Source : lua/vehicle/energyStorage/n2oTank.lua:39
---@param odometer number Inutilisé.
---@param integrity number|table Fraction 0 à 1 ou table d'état.
---@param visual any Inutilisé.
function energyStorage_n2oTank_storage:setPartCondition(odometer, integrity, visual) end

--- Fixe la masse restante (bornée entre 0 et capacity).
---Source : lua/vehicle/energyStorage/n2oTank.lua:23
---@param mass number Masse en kg.
function energyStorage_n2oTank_storage:setRemainingMass(mass) end

--- Fixe storedEnergy à energyCapacity * ratio (ratio borné entre 0 et 1).
---Source : lua/vehicle/energyStorage/n2oTank.lua:27
---@param ratio number 0 à 1.
function energyStorage_n2oTank_storage:setRemainingRatio(ratio) end

--- Appelé chaque frame : recalcule remainingMass/remainingRatio, applique la masse aux nœuds et applique la fuite si active.
---Source : lua/vehicle/energyStorage/n2oTank.lua:10
---@param dt number Pas de temps en secondes.
function energyStorage_n2oTank_storage:updateGFX(dt) end

return energyStorage_n2oTank

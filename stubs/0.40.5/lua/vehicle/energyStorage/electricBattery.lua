---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/electricBattery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de stockage d'énergie 'electricBattery' : batterie de véhicule électrique. L'énergie est gardée en joules (energyType 'electricEnergy') et configurée en kWh dans le jbeam. Instanciée par energyStorage.lua à partir d'une entrée jbeam de `type = "electricBattery"` ; les moteurs électriques la consomment via les périphériques du powertrain.
--- Accès : type de stockage d'énergie `electricBattery`, accessible par `energyStorage.getStorage("nom")`
---@class energyStorage_electricBattery
local energyStorage_electricBattery = {}

--- Crée un stockage de type batterie électrique à partir de l'entrée jbeam. Le stockage renvoyé est une table avec name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData et les méthodes listées dans la classe 'storage'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage/electricBattery.lua:52
---@param jbeamData table Données jbeam fusionnées du stockage.
---@return table  Instance de stockage (classe 'storage').
function energyStorage_electricBattery.new(jbeamData) end

--- Instance renvoyée par new(jbeamData). Les méthodes s'appellent avec la syntaxe `storage:methode(...)`.
---@class energyStorage_electricBattery_storage
local energyStorage_electricBattery_storage = {}

--- Renvoie l'intégrité (toujours 1) et l'état {storedEnergy}.
---Source : lua/vehicle/energyStorage/electricBattery.lua:39
---@return number  integrityValue (1).
---@return table  {storedEnergy = J}.
function energyStorage_electricBattery_storage:getPartCondition() end

--- Enregistre un périphérique du powertrain dans assignedDevices (par son nom).
---Source : lua/vehicle/energyStorage/electricBattery.lua:23
---@param device table Périphérique avec un champ name.
function energyStorage_electricBattery_storage:registerDevice(device) end

--- Restaure la charge de départ (startingCapacity en kWh convertie en J).
---Source : lua/vehicle/energyStorage/electricBattery.lua:48
function energyStorage_electricBattery_storage:reset() end

--- Restaure l'état depuis la condition de pièce : un nombre est interprété comme fraction de energyCapacity, une table doit contenir storedEnergy.
---Source : lua/vehicle/energyStorage/electricBattery.lua:27
---@param odometer number Inutilisé.
---@param integrity number|table Fraction (0 à 1) ou {storedEnergy = J}.
---@param visual any Inutilisé.
function energyStorage_electricBattery_storage:setPartCondition(odometer, integrity, visual) end

--- Fixe l'énergie à energyCapacity * ratio (ratio borné entre 0 et 1).
---Source : lua/vehicle/energyStorage/electricBattery.lua:15
---@param ratio number Niveau de charge de 0 à 1.
function energyStorage_electricBattery_storage:setRemainingRatio(ratio) end

--- Fixe l'énergie stockée et recalcule remainingVolume (kWh) et remainingRatio.
---Source : lua/vehicle/energyStorage/electricBattery.lua:9
---@param energy number Énergie en joules.
function energyStorage_electricBattery_storage:setStoredEnergy(energy) end

--- Appelé chaque frame par energyStorage.updateGFX : recalcule les valeurs dérivées.
---Source : lua/vehicle/energyStorage/electricBattery.lua:19
---@param dt number Pas de temps en secondes (inutilisé).
function energyStorage_electricBattery_storage:updateGFX(dt) end

return energyStorage_electricBattery

---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/pressureTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de stockage d'énergie 'pressureTank' : réservoir de gaz sous pression (air comprimé des camions, remorques, suspensions pneumatiques). L'énergie vaut P·V (loi des gaz parfaits, tient compte de la pression et température ambiantes du powertrain), le réservoir peut fuir (rupture de poutre ou déformation) et peut alimenter ou être alimenté par un autre véhicule via un coupleur (pneumatic PTO, synchronisation par electrics). Instancié par energyStorage.lua pour `type = "pressureTank"`.
--- Accès : type de stockage d'énergie `pressureTank`, accessible par `energyStorage.getStorage("nom")`
---@class energyStorage_pressureTank
local energyStorage_pressureTank = {}

--- Crée l'instance de réservoir sous pression, calcule énergie, masse et noms d'electrics, et initialise les valeurs electrics et dommages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/energyStorage/pressureTank.lua:268
---@param jbeamData table Données jbeam fusionnées du stockage.
---@return table  Instance de stockage (classe 'storage').
function energyStorage_pressureTank.new(jbeamData) end

--- Instance renvoyée par new(jbeamData). Champs notables : name, type, energyType, capacity (m³), storedEnergy (J), energyCapacity (J), initialStoredEnergy, remainingMass (kg), remainingRatio, currentPressure (Pa absolu), supplyPressure, maxWorkingPressure, currentLeakRate, maxLeakRate, consumerPressureCoef (0 à 1), pressureElectricName, pressureConsumerElectricName, pressureConsumerCoefElectricName.
---@class energyStorage_pressureTank_storage
local energyStorage_pressureTank_storage = {}

--- Restaure remainingMass si présent.
---Source : lua/vehicle/energyStorage/pressureTank.lua:258
---@param data table Table contenant remainingMass.
function energyStorage_pressureTank_storage:deserialize(data) end

--- Renvoie l'intégrité (toujours 1) et {storedEnergy}.
---Source : lua/vehicle/energyStorage/pressureTank.lua:215
---@return number  integrityValue.
---@return table  État.
function energyStorage_pressureTank_storage:getPartCondition() end

--- Renvoie la masse de gaz restante.
---Source : lua/vehicle/energyStorage/pressureTank.lua:166
---@return number  Masse en kg.
function energyStorage_pressureTank_storage:getRemainingMass() end

--- Appelé à la rupture d'une poutre déclencheuse : fuite maximale et dommage 'breakLeak'.
---Source : lua/vehicle/energyStorage/pressureTank.lua:194
function energyStorage_pressureTank_storage:onBreak() end

--- Hook de couplage : si le nœud est un nœud d'alimentation, crée les noms electrics de synchronisation avec le véhicule fournisseur et demande l'export de la pression ; si c'est un nœud consommateur, initialise pression et débit et demande l'export du débit.
---Source : lua/vehicle/energyStorage/pressureTank.lua:116
---@param nodeId integer Nœud du coupleur de ce véhicule.
---@param obj2id integer Identifiant de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param attachForce number Reçoit attachEnergy (voir notes), non utilisé.
function energyStorage_pressureTank_storage:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook de détachement : supprime les electrics de synchronisation côté consommateur (supplyPressure remis à 0) ou le débit côté fournisseur.
---Source : lua/vehicle/energyStorage/pressureTank.lua:142
---@param nodeId integer Nœud du coupleur.
---@param obj2id integer Autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param breakForce number Force de rupture (inutilisé).
function energyStorage_pressureTank_storage:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Enregistre un périphérique dans assignedDevices.
---Source : lua/vehicle/energyStorage/pressureTank.lua:199
---@param device table Périphérique avec un champ name.
function energyStorage_pressureTank_storage:registerDevice(device) end

--- Remet le réservoir à sa pression de départ, supprime fuites et synchronisations, réinitialise les electrics et les dommages.
---Source : lua/vehicle/energyStorage/pressureTank.lua:224
function energyStorage_pressureTank_storage:reset() end

--- Renvoie {remainingMass}.
---Source : lua/vehicle/energyStorage/pressureTank.lua:264
---@return table  {remainingMass = kg}.
function energyStorage_pressureTank_storage:serialize() end

--- Fixe le coefficient de pression envoyée aux consommateurs (borné 0 à 1) et affiche un message UI (trailerAir enabled/disabled).
---Source : lua/vehicle/energyStorage/pressureTank.lua:185
---@param coef number 0 coupe l'alimentation, 1 pleine.
function energyStorage_pressureTank_storage:setConsumerPressureCoef(coef) end

--- Restaure storedEnergy depuis la condition de pièce (nombre = fraction de energyCapacity, ou table {storedEnergy}).
---Source : lua/vehicle/energyStorage/pressureTank.lua:203
---@param odometer number Inutilisé.
---@param integrity number|table Fraction 0 à 1 ou table d'état.
---@param visual any Inutilisé.
function energyStorage_pressureTank_storage:setPartCondition(odometer, integrity, visual) end

--- Fixe la masse de gaz (convertie en moles puis en énergie).
---Source : lua/vehicle/energyStorage/pressureTank.lua:170
---@param mass number Masse en kg.
function energyStorage_pressureTank_storage:setRemainingMass(mass) end

--- Fixe le taux de remplissage par rapport à la pression maximale.
---Source : lua/vehicle/energyStorage/pressureTank.lua:179
---@param ratio number 0 à 1 (borné).
function energyStorage_pressureTank_storage:setRemainingRatio(ratio) end

--- Bascule entre 0 et 1 pour consumerPressureCoef.
---Source : lua/vehicle/energyStorage/pressureTank.lua:190
function energyStorage_pressureTank_storage:toggleConsumerPressureCoef() end

--- Recalcule storedEnergy, remainingMass et remainingRatio à la température ambiante courante. Sans argument, déduit la quantité de gaz de l'énergie actuelle et de l'ancienne température.
---Source : lua/vehicle/energyStorage/pressureTank.lua:101
---@param molarQuantity number|nil Quantité de gaz en mol ; nil pour la déduire de storedEnergy.
function energyStorage_pressureTank_storage:updateEnergy(molarQuantity) end

--- Appelé chaque frame : calcule la pression, synchronise avec les fournisseurs/consommateurs, applique la fuite (rupture ou déformation), met à jour énergie et masse des nœuds et publie la pression relative dans electrics.
---Source : lua/vehicle/energyStorage/pressureTank.lua:58
---@param dt number Pas de temps en secondes.
function energyStorage_pressureTank_storage:updateGFX(dt) end

--- Côté consommateur : équilibre l'énergie avec la pression d'alimentation du fournisseur et publie le débit ; côté fournisseur : publie la pression envoyée au consommateur et retire l'énergie correspondant au débit reçu.
---Source : lua/vehicle/energyStorage/pressureTank.lua:16
---@param dt number Pas de temps en secondes.
function energyStorage_pressureTank_storage:updateTankSync(dt) end

return energyStorage_pressureTank

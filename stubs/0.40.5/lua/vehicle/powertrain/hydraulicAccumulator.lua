---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicAccumulator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `hydraulicAccumulator` : accumulateur hydraulique autonome (réservoir sous pression, sans pompe ni entraînement mécanique). Il alimente des consommateurs hydrauliques (`hydraulicCylinder`, déclarés dans `v.data.powertrainHydros` avec `connectedPump` = nom de l'accumulateur) et peut se remplir à distance depuis la pompe d'un autre véhicule couplé (remorque, outil) via des valeurs electrics partagées (PTO hydraulique). Catégorie `hydraulicPowerSource`, sans port de sortie ni couple.
--- Accès : type de composant powertrain `hydraulicAccumulator` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_hydraulicAccumulator
---@field deviceCategories table<string, boolean> {hydraulicPowerSource=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_hydraulicAccumulator = {}

--- Construit l'accumulateur : pression de travail, volume, état initial, soupape de décharge, noms electrics de PTO, nœuds de coupleurs d'alimentation et de consommation, puis crée les consommateurs hydrauliques déclarés pour lui dans v.data.powertrainHydros.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:303
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_hydraulicAccumulator.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate vaut nop.
---@class powertrain_hydraulicAccumulator_device
local powertrain_hydraulicAccumulator_device = {}

--- Ne fait rien (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:155
---@param damageAmount number Ignoré.
function powertrain_hydraulicAccumulator_device:applyDeformGroupDamage(damageAmount) end

--- Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:198
function powertrain_hydraulicAccumulator_device:calculateInertia() end

--- Renvoie 1 (0 si cassé) et la table {isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:170
---@return number  Intégrité.
---@return table  {isBroken}.
function powertrain_hydraulicAccumulator_device:getPartCondition() end

--- Renvoie l'état sauvegardable : volume d'huile (clé '<nom>_accumulatorOilVolume') fusionné avec l'état des consommateurs.
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:211
---@return table  Table stateData.
function powertrain_hydraulicAccumulator_device:getState() end

--- Initialise les sons de chaque consommateur ; l'accumulateur n'a pas de son propre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:243
---@param jbeamData table Données jbeam du composant (non utilisées).
function powertrain_hydraulicAccumulator_device:initSounds(jbeamData) end

--- Marque isBroken = true et vide l'accumulateur : pression, volume, débits et electrics de PTO remis à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:183
function powertrain_hydraulicAccumulator_device:onBreak() end

--- Hook de coupleur. Côté consommateur : quand le coupleur d'alimentation est attaché, crée les noms electrics partagés avec le véhicule alimentant et lui envoie les noms à exporter. Côté alimentation : quand un véhicule se connecte à un coupleur de consommation, crée la valeur electrics de débit pour lui et la lui exporte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:87
---@param nodeId integer Nœud de ce véhicule portant le coupleur.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param attachForce number Force d'attache (non utilisée).
function powertrain_hydraulicAccumulator_device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook de coupleur. Côté consommateur : supprime les valeurs electrics de l'alimentation. Côté alimentation : supprime la valeur de débit du consommateur parti.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:119
---@param nodeId integer Nœud de ce véhicule portant le coupleur.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param breakForce number Force de rupture (non utilisée).
function powertrain_hydraulicAccumulator_device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Remet à zéro l'état (pression et volume initiaux, débits, electrics de PTO, noms d'alimentation), puis réinitialise les consommateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:259
---@param jbeamData table Données jbeam du composant (gearRatio, friction).
---@return table  Le device.
function powertrain_hydraulicAccumulator_device:reset(jbeamData) end

--- Appelle resetSounds de chaque consommateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:251
---@param jbeamData table Données jbeam du composant (non utilisées).
function powertrain_hydraulicAccumulator_device:resetSounds(jbeamData) end

--- Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:158
---@param subSystem any Non utilisé.
---@param odometer number Non utilisé.
---@param integrity number|table Nombre 0..1 ou table {isBroken}.
---@param visual any Non utilisé.
function powertrain_hydraulicAccumulator_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restaure le volume d'huile (nombre fini, borné, ignoré si l'accumulateur est cassé) et la pression, puis transmet l'état aux consommateurs.
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:225
---@param data table|nil Table d'état produite par getState.
function powertrain_hydraulicAccumulator_device:setState(data) end

--- Appelée à chaque pas physique : calcule la pression, interroge chaque consommateur (consumer:update) pour obtenir ses débits, calcule le débit de la soupape de décharge, met outputTorque1 à 0 et retranche les débits sortants du volume d'huile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:17
---@param dt number Pas de temps en secondes.
function powertrain_hydraulicAccumulator_device:torqueUpdate(dt) end

--- Mise à jour par image : met à jour les consommateurs, reçoit le débit de l'alimentation distante (côté consommateur), publie la pression dans les electrics (côté alimentation) et soustrait les débits demandés par les consommateurs distants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:42
---@param dt number Durée de l'image en secondes.
function powertrain_hydraulicAccumulator_device:updateGFX(dt) end

--- Appelle updateSounds de chaque consommateur (l'accumulateur n'a pas de son propre).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:81
---@param dt number Durée de l'image en secondes.
function powertrain_hydraulicAccumulator_device:updateSounds(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicAccumulator.lua:179
---@return boolean  true.
function powertrain_hydraulicAccumulator_device:validate() end

return powertrain_hydraulicAccumulator

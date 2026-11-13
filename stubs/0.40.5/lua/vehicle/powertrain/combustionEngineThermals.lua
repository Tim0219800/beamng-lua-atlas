---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/combustionEngineThermals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module thermique et d'usure d'un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'exporte pas `new` et n'est pas listé dans le jbeam. Il est chargé par powertrain/combustionEngine.lua avec rerequire (donc une instance par moteur ; le nom du fichier peut être remplacé par la clé jbeam `thermalsLuaFileName`) et rangé dans `device.thermals`. Il simule les températures du bloc, des parois de cylindre, de l'huile, du liquide de refroidissement et de l'échappement, le radiateur et ses ventilateurs, les fuites de liquide et d'huile, le manque d'huile, les dégâts (joint de culasse, segments, bielles, fusion), l'arbre d'échappement (nœuds et poutres isExhaust), les retours de flamme (afterfire), la fumée, la vapeur, les sons de refroidissement.
--- Accès : type de composant powertrain `combustionEngineThermals` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_combustionEngineThermals
---@field additionalCoolantEnergyPerStep number Énergie supplémentaire (J) ajoutée au liquide de refroidissement au prochain pas physique, remise à 0 ensuite.
---@field connectingRodBearingsDamaged boolean Coussinets de bielle endommagés (bruit de cognement).
---@field coolantTemperature number|nil Température du liquide de refroidissement en °C. nil sur un moteur refroidi par air actif.
---@field cylinderWallOverheatDamage number Dégâts cumulés de surchauffe des parois ; au seuil pistonRingDamageThreshold les segments sont endommagés.
---@field cylinderWallTemperature number Température des parois de cylindre en °C.
---@field cylinderWallsMelted boolean Parois de cylindre fondues (moteur bloqué).
---@field debugData table {engineThermalData = table} : mêmes valeurs que le flux GUI 'engineThermalData' (températures, énergies échangées, masses, débits de fuite, dégâts).
---@field engineBlockMelted boolean Bloc fondu (moteur bloqué).
---@field engineBlockOverheatDamage number Dégâts cumulés de surchauffe du bloc ; atteindre le seuil headGasketDamageThreshold fait claquer le joint de culasse.
---@field engineBlockTemperature number Température du bloc moteur en °C.
---@field exhaustEndNodes table Liste des sorties d'échappement actuelles (éléments {start, finish, afterFireAudioCoef, afterFireVisualCoef, afterFireVolumeCoef, afterFireMufflingCoef…}). Mise à jour quand une poutre d'échappement casse ou au reset.
---@field exhaustTemperature number Température de l'échappement en °C.
---@field headGasketBlown boolean Joint de culasse claqué.
---@field oilOverheatDamage number Dégâts cumulés de surchauffe d'huile ; au seuil connectingRodDamageThreshold les coussinets de bielle sont endommagés.
---@field oilTemperature number Température d'huile en °C (sert aussi au cadran de température sur les moteurs refroidis par air).
---@field pistonRingsDamaged boolean Segments endommagés.
---@field radiatorFanSpin number Angle de rotation du ventilateur de radiateur en degrés (0..360), pour l'animation.
local powertrain_combustionEngineThermals = {}

--- Augmente la fuite d'huile du radiateur d'huile (damageAmount * 0.1 kg/s, plafonnée à 0.1) et signale 'oilRadiatorLeak'. Appelée pour le groupe 'oilRadiator'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:286
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount) end

--- Augmente la fuite d'huile du carter (damageAmount * 10 kg/s, plafonnée à 1) et signale 'oilpanLeak' dans le damageTracker. Appelée pour le groupe 'oilPan'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:281
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount) end

--- Ajoute des dégâts au radiateur (radiatorDamage), qui produisent une fuite de liquide au-delà du seuil radiatorDeformThreshold. Appelée par le moteur pour le groupe de déformation 'radiator'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:277
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount) end

--- Appelée quand une poutre casse. Si c'est une poutre d'échappement (isExhaust), coupe la branche de l'arbre d'échappement, recalcule les sorties, prévient le moteur (exhaustEndNodesChanged), met à jour l'interface et affiche un message 'exhaustDamaged'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1452
---@param id integer cid de la poutre cassée.
function powertrain_combustionEngineThermals.beamBroke(id) end

--- Renvoie toujours une intégrité de 1 et une table vide (pas de modélisation de l'état de l'échappement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:389
---@return number  Toujours 1.
---@return table  Table vide.
function powertrain_combustionEngineThermals.getPartConditionExhaust() end

--- Renvoie l'intégrité du radiateur 0..1 (minimum entre l'état du radiateur et la masse de liquide restante) et la table {radiatorDamage, coolantMass}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:376
---@return number  Intégrité 0..1.
---@return table  {radiatorDamage, coolantMass}.
function powertrain_combustionEngineThermals.getPartConditionRadiator() end

--- Renvoie l'intégrité 0..1 (minimum : joint 0.3, segments 0.2, bielles 0.1, fusion 0) et la table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:396
---@return number  Intégrité 0..1.
---@return table  Table d'état des dégâts.
function powertrain_combustionEngineThermals.getPartConditionThermals() end

--- Initialise le module pour un moteur : mémorise le moteur parent puis lit la configuration thermique du jbeam (initThermals). Appelée par combustionEngine.new avec device.thermals.init(device, jbeamData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1944
---@param engine table Device moteur parent (combustionEngine), utilisé pour le régime, la charge, les travaux, etc.
---@param engineJbeamData table Données jbeam du moteur (clés thermiques listées dans notes).
function powertrain_combustionEngineThermals.init(engine, engineJbeamData) end

--- Crée les sources sonores (sifflement du radiateur, ventilateur) et lit les paramètres des craquements de refroidissement du bloc et de l'échappement. Appelée par combustionEngine.initSounds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1888
---@param jbeamData table Données jbeam du moteur.
function powertrain_combustionEngineThermals.initSounds(jbeamData) end

--- Construit un graphe de l'échappement (racines, nœuds, arêtes, poutres cassées) et l'envoie à l'interface via guihooks.trigger('ExhaustTreeDataChanged', data).
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1321
function powertrain_combustionEngineThermals.requestExhaustTreeData() end

--- Remet les températures à la température préchauffée (thermostat - 10 °C) ou ambiante selon le réglage startThermalsPreHeated, efface les dégâts, les fuites, les masses de fluides, les minuteurs, répare l'arbre d'échappement et réinitialise les entrées damageTracker. Ne fait que poser les températures si les thermiques sont désactivés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1514
---@param jbeamData table Données jbeam du moteur (lit les overrides headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride).
function powertrain_combustionEngineThermals.reset(jbeamData) end

--- Arrête les sons du radiateur ; relance le ventilateur mécanique. Appelée par combustionEngine.resetSounds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1925
function powertrain_combustionEngineThermals.resetSounds() end

--- Ne fait rien : l'état de l'échappement n'est pas restauré (corps vide en dehors de la création d'une table locale).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:337
---@param odometer number Non utilisé.
---@param integrity number|table Non utilisé.
---@param visual any Non utilisé.
function powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual) end

--- Restaure l'état du radiateur (dégâts, masse de liquide) depuis une intégrité nombre 0..1 ou une table {radiatorDamage, coolantMass}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:324
---@param odometer number Distance parcourue en mètres (non utilisée).
---@param integrity number|table Nombre 0..1 ou table {radiatorDamage, coolantMass}.
---@param visual any Non utilisé.
function powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual) end

--- Restaure les dégâts du moteur : à partir d'un nombre 0..1 (joint < 0.3, segments < 0.2, bielles < 0.1) ou d'une table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applique les conséquences (couple réduit, friction, fuites).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:345
---@param odometer number Distance parcourue en mètres (non utilisée).
---@param integrity number|table Nombre 0..1 ou table d'état.
---@param visual any Non utilisé.
function powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual) end

--- Mise à jour par image : refroidissement (eau ou air) et intégration des températures, dégâts, fumée et retours de flamme de l'échappement, mécanique d'huile et manque d'huile, craquements de refroidissement. Appelée par combustionEngine.updateGFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngineThermals.lua:1937
---@param dt number Durée de l'image en secondes.
function powertrain_combustionEngineThermals.updateGFX(dt) end

return powertrain_combustionEngineThermals

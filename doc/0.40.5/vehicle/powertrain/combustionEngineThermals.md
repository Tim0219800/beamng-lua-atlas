# `powertrain_combustionEngineThermals`

*Fichier : `lua/vehicle/powertrain/combustionEngineThermals.lua` · VM : Véhicule · 1968 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `combustionEngineThermals` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Sous-module thermique et d'usure d'un moteur à combustion. Ce n'est PAS un composant powertrain indépendant : il n'exporte pas `new` et n'est pas listé dans le jbeam. Il est chargé par powertrain/combustionEngine.lua avec rerequire (donc une instance par moteur ; le nom du fichier peut être remplacé par la clé jbeam `thermalsLuaFileName`) et rangé dans `device.thermals`. Il simule les températures du bloc, des parois de cylindre, de l'huile, du liquide de refroidissement et de l'échappement, le radiateur et ses ventilateurs, les fuites de liquide et d'huile, le manque d'huile, les dégâts (joint de culasse, segments, bielles, fusion), l'arbre d'échappement (nœuds et poutres isExhaust), les retours de flamme (afterfire), la fumée, la vapeur, les sons de refroidissement.

## Exemple

```lua
local engine = powertrain.getDevice("mainEngine")
local t = engine.thermals
print(t.coolantTemperature, t.oilTemperature, t.engineBlockTemperature, t.headGasketBlown) -- °C, booléen
```

## Remarques

- Température en °C partout (l'environnement vient de obj:getEnvTemperature() converti de K en °C). Les énergies sont en J par pas de temps, les masses en kg, les débits de fuite en kg/s.
- L'ensemble est désactivé sauf si le jbeam du moteur contient thermalsEnabled = true. Sans cela, init sort tôt, les fonctions de mise à jour restent nop et seules les températures initiales sont posées (reset les met à 80 °C ou à la température ambiante). Une erreur (matériau inconnu, pas de groupe de nœuds engineBlock, arbre d'échappement impossible à construire) désactive aussi les thermiques avec un message dans le log.
- Clés jbeam du moteur lues (initThermals) : thermalsEnabled, headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride, particulates, idleParticulates, coolantVolume (kg, minimum 1.5), oilVolume (L, défaut 5, converti x0.87), oilMinimumSafeVolume, oilMaximumSafeVolume, oilpanNodes_nodes ({bas, haut}), oilpanMaximumSafeG (1.2), engineBlockMaterial ('iron' ou 'aluminium'/'aluminum'), engineBlockAirCoolingEfficiency (50), engineBlockAirflowCoef (1), blockFanMaxAirSpeed (0), radiatorFanType ('electric' ou 'mechanical'), electricRadiatorFanOverrideIgnitionLevel (-1), radiatorArea, radiatorEffectiveness, radiatorFanMaxAirSpeed, mechanicalFanRPMCoef (0.5), radiatorFanTemperature (110), thermostatTemperature (90), airRegulatorClosedCoef (0.1), oilThermostatTemperature (110), oilRadiatorArea, oilRadiatorEffectiveness, isAirCooledOnly, cylinderWallTemperatureDamageThreshold (160), engineBlockTemperatureDamageThreshold (140), headGasketDamageThreshold / pistonRingDamageThreshold / connectingRodDamageThreshold (2000000), radiatorDeformThreshold (0.015), radiatorDamageDeformGroup ('radiator_damage'), hasOilStarvingDamage (true), groupes de nœuds engineBlock._engineGroup_nodes et radiator._engineGroup_nodes (requis si radiateur).
- Clés jbeam sons/effets lues dans initSounds/initThermals : radiatorHissLoopEvent, radiatorFanLoopEvent, radiatorFanVolume (0.5), engineTick* et exhaustTick* (PeriodGain, MinRate, MaxRate, MinTemperature, Pitch, SizeBias, Volume, StartDelay, EventName) pour les craquements de refroidissement, instant/sustained/shiftAfterFireSound, ...AfterFireVolumeCoef, afterFireAudibleThreshold*, afterFireVisualThreshold*.
- Champs publics du module : engineBlockTemperature, cylinderWallTemperature, coolantTemperature, oilTemperature, exhaustTemperature (°C), radiatorFanSpin (degrés, 0..360), additionalCoolantEnergyPerStep (J ajoutés au liquide au pas suivant, remis à 0 ensuite, utilisable par d'autres composants ex. turbo/intercooler), exhaustEndNodes (liste des sorties d'échappement {start, finish, ...}), engineBlockOverheatDamage, oilOverheatDamage, cylinderWallOverheatDamage (accumulateurs de dégâts en J, plafonnés par les seuils), headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted (booléens), debugData.engineThermalData (table envoyée au flux GUI 'engineThermalData').
- Conséquences des dégâts : joint de culasse et segments = scaleOutputTorque(0.8) et fuites ; fusion du bloc ou des parois = scaleFriction(10000) (moteur quasi bloqué) ; huile > 150 °C = friction augmentée ; manque d'huile = scaleFrictionInitial croissant ; bielles = son de cognement. Le moteur parent doit donc fournir scaleOutputTorque, scaleFriction, scaleFrictionInitial, exhaustEndNodesChanged, engineWorkPerUpdate, pumpingLossPerUpdate, frictionLossPerUpdate, engineLoad, invBurnEfficiencyTable, etc.
- Refroidissement par eau (par défaut) : le liquide est borné à 130 °C ; au-dessus de 120 °C une fuite de 0.01 kg/s (surpression) commence. Refroidissement par air (isAirCooledOnly) : updateAirCoolingGFX met M.coolantTemperature = nil à chaque pas ; ne pas lire coolantTemperature sur un moteur refroidi par air (engineThermalData.coolantTemperature reprend alors l'huile).
- Flux GUI 'engineThermalData' envoyé seulement si streams.willSend('engineThermalData'). Événement UI 'ExhaustTreeDataChanged' envoyé par requestExhaustTreeData.
- Incohérences : setPartConditionExhaust ne fait rien et getPartConditionExhaust renvoie toujours 1. updateGFX appelle updateHeatTicksGFX même si les thermiques sont désactivés (la fonction se retrouve alors à utiliser des listes de nœuds vides mais la condition de température la protège).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount)` | Augmente la fuite d'huile du radiateur d'huile (damageAmount * 0.1 kg/s, plafonnée à 0.1) et signale 'oilRadiatorLeak'. Appelée pour le groupe 'oilRadiator'. *(interne)* | 286 |
| `powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount)` | Augmente la fuite d'huile du carter (damageAmount * 10 kg/s, plafonnée à 1) et signale 'oilpanLeak' dans le damageTracker. Appelée pour le groupe 'oilPan'. *(interne)* | 281 |
| `powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount)` | Ajoute des dégâts au radiateur (radiatorDamage), qui produisent une fuite de liquide au-delà du seuil radiatorDeformThreshold. Appelée par le moteur pour le groupe de déformation 'radiator'. *(interne)* | 277 |
| `powertrain_combustionEngineThermals.beamBroke(id)` | Appelée quand une poutre casse. Si c'est une poutre d'échappement (isExhaust), coupe la branche de l'arbre d'échappement, recalcule les sorties, prévient le moteur (exhaustEndNodesChanged), met à jour l'interface et affiche un message 'exhaustDamaged'. *(interne)* | 1452 |
| `powertrain_combustionEngineThermals.getPartConditionExhaust()` | Renvoie toujours une intégrité de 1 et une table vide (pas de modélisation de l'état de l'échappement). *(interne)* | 389 |
| `powertrain_combustionEngineThermals.getPartConditionRadiator()` | Renvoie l'intégrité du radiateur 0..1 (minimum entre l'état du radiateur et la masse de liquide restante) et la table {radiatorDamage, coolantMass}. *(interne)* | 376 |
| `powertrain_combustionEngineThermals.getPartConditionThermals()` | Renvoie l'intégrité 0..1 (minimum : joint 0.3, segments 0.2, bielles 0.1, fusion 0) et la table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. *(interne)* | 396 |
| `powertrain_combustionEngineThermals.init(engine, engineJbeamData)` | Initialise le module pour un moteur : mémorise le moteur parent puis lit la configuration thermique du jbeam (initThermals). Appelée par combustionEngine.new avec device.thermals.init(device, jbeamData). *(interne)* | 1944 |
| `powertrain_combustionEngineThermals.initSounds(jbeamData)` | Crée les sources sonores (sifflement du radiateur, ventilateur) et lit les paramètres des craquements de refroidissement du bloc et de l'échappement. Appelée par combustionEngine.initSounds. *(interne)* | 1888 |
| `powertrain_combustionEngineThermals.requestExhaustTreeData()` | Construit un graphe de l'échappement (racines, nœuds, arêtes, poutres cassées) et l'envoie à l'interface via guihooks.trigger('ExhaustTreeDataChanged', data). | 1321 |
| `powertrain_combustionEngineThermals.reset(jbeamData)` | Remet les températures à la température préchauffée (thermostat - 10 °C) ou ambiante selon le réglage startThermalsPreHeated, efface les dégâts, les fuites, les masses de fluides, les minuteurs, répare l'arbre d'échappement et réinitialise les entrées damageTracker. Ne fait que poser les températures si les thermiques sont désactivés. *(interne)* | 1514 |
| `powertrain_combustionEngineThermals.resetSounds()` | Arrête les sons du radiateur ; relance le ventilateur mécanique. Appelée par combustionEngine.resetSounds. *(interne)* | 1925 |
| `powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual)` | Ne fait rien : l'état de l'échappement n'est pas restauré (corps vide en dehors de la création d'une table locale). *(interne)* | 337 |
| `powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual)` | Restaure l'état du radiateur (dégâts, masse de liquide) depuis une intégrité nombre 0..1 ou une table {radiatorDamage, coolantMass}. *(interne)* | 324 |
| `powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual)` | Restaure les dégâts du moteur : à partir d'un nombre 0..1 (joint < 0.3, segments < 0.2, bielles < 0.1) ou d'une table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applique les conséquences (couple réduit, friction, fuites). *(interne)* | 345 |
| `powertrain_combustionEngineThermals.updateGFX(dt)` | Mise à jour par image : refroidissement (eau ou air) et intégration des températures, dégâts, fumée et retours de flamme de l'échappement, mécanique d'huile et manque d'huile, craquements de refroidissement. Appelée par combustionEngine.updateGFX. *(interne)* | 1937 |

### Détail des paramètres

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount)`

Augmente la fuite d'huile du radiateur d'huile (damageAmount * 0.1 kg/s, plafonnée à 0.1) et signale 'oilRadiatorLeak'. Appelée pour le groupe 'oilRadiator'.

- `damageAmount` (*number*) : Quantité de dégâts du groupe de déformation.

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount)`

Augmente la fuite d'huile du carter (damageAmount * 10 kg/s, plafonnée à 1) et signale 'oilpanLeak' dans le damageTracker. Appelée pour le groupe 'oilPan'.

- `damageAmount` (*number*) : Quantité de dégâts du groupe de déformation.

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount)`

Ajoute des dégâts au radiateur (radiatorDamage), qui produisent une fuite de liquide au-delà du seuil radiatorDeformThreshold. Appelée par le moteur pour le groupe de déformation 'radiator'.

- `damageAmount` (*number*) : Quantité de dégâts du groupe de déformation.

#### `powertrain_combustionEngineThermals.beamBroke(id)`

Appelée quand une poutre casse. Si c'est une poutre d'échappement (isExhaust), coupe la branche de l'arbre d'échappement, recalcule les sorties, prévient le moteur (exhaustEndNodesChanged), met à jour l'interface et affiche un message 'exhaustDamaged'.

- `id` (*integer*) : cid de la poutre cassée.

#### `powertrain_combustionEngineThermals.getPartConditionExhaust()`

Renvoie toujours une intégrité de 1 et une table vide (pas de modélisation de l'état de l'échappement).

- **renvoie** : number Toujours 1.
- **renvoie** : table Table vide.

#### `powertrain_combustionEngineThermals.getPartConditionRadiator()`

Renvoie l'intégrité du radiateur 0..1 (minimum entre l'état du radiateur et la masse de liquide restante) et la table {radiatorDamage, coolantMass}.

- **renvoie** : number Intégrité 0..1.
- **renvoie** : table {radiatorDamage, coolantMass}.

#### `powertrain_combustionEngineThermals.getPartConditionThermals()`

Renvoie l'intégrité 0..1 (minimum : joint 0.3, segments 0.2, bielles 0.1, fusion 0) et la table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}.

- **renvoie** : number Intégrité 0..1.
- **renvoie** : table Table d'état des dégâts.

#### `powertrain_combustionEngineThermals.init(engine, engineJbeamData)`

Initialise le module pour un moteur : mémorise le moteur parent puis lit la configuration thermique du jbeam (initThermals). Appelée par combustionEngine.new avec device.thermals.init(device, jbeamData).

- `engine` (*table*) : Device moteur parent (combustionEngine), utilisé pour le régime, la charge, les travaux, etc.
- `engineJbeamData` (*table*) : Données jbeam du moteur (clés thermiques listées dans notes).

#### `powertrain_combustionEngineThermals.initSounds(jbeamData)`

Crée les sources sonores (sifflement du radiateur, ventilateur) et lit les paramètres des craquements de refroidissement du bloc et de l'échappement. Appelée par combustionEngine.initSounds.

- `jbeamData` (*table*) : Données jbeam du moteur.

#### `powertrain_combustionEngineThermals.reset(jbeamData)`

Remet les températures à la température préchauffée (thermostat - 10 °C) ou ambiante selon le réglage startThermalsPreHeated, efface les dégâts, les fuites, les masses de fluides, les minuteurs, répare l'arbre d'échappement et réinitialise les entrées damageTracker. Ne fait que poser les températures si les thermiques sont désactivés.

- `jbeamData` (*table*) : Données jbeam du moteur (lit les overrides headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride).

#### `powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual)`

Ne fait rien : l'état de l'échappement n'est pas restauré (corps vide en dehors de la création d'une table locale).

- `odometer` (*number*) : Non utilisé.
- `integrity` (*number|table*) : Non utilisé.
- `visual` (*any*) : Non utilisé.

#### `powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual)`

Restaure l'état du radiateur (dégâts, masse de liquide) depuis une intégrité nombre 0..1 ou une table {radiatorDamage, coolantMass}.

- `odometer` (*number*) : Distance parcourue en mètres (non utilisée).
- `integrity` (*number|table*) : Nombre 0..1 ou table {radiatorDamage, coolantMass}.
- `visual` (*any*) : Non utilisé.

#### `powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual)`

Restaure les dégâts du moteur : à partir d'un nombre 0..1 (joint < 0.3, segments < 0.2, bielles < 0.1) ou d'une table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applique les conséquences (couple réduit, friction, fuites).

- `odometer` (*number*) : Distance parcourue en mètres (non utilisée).
- `integrity` (*number|table*) : Nombre 0..1 ou table d'état.
- `visual` (*any*) : Non utilisé.

#### `powertrain_combustionEngineThermals.updateGFX(dt)`

Mise à jour par image : refroidissement (eau ou air) et intégration des températures, dégâts, fumée et retours de flamme de l'échappement, mécanique d'huile et manque d'huile, craquements de refroidissement. Appelée par combustionEngine.updateGFX.

- `dt` (*number*) : Durée de l'image en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `additionalCoolantEnergyPerStep` | number | Énergie supplémentaire (J) ajoutée au liquide de refroidissement au prochain pas physique, remise à 0 ensuite. |
| `connectingRodBearingsDamaged` | boolean | Coussinets de bielle endommagés (bruit de cognement). |
| `coolantTemperature` | number|nil | Température du liquide de refroidissement en °C. nil sur un moteur refroidi par air actif. |
| `cylinderWallOverheatDamage` | number | Dégâts cumulés de surchauffe des parois ; au seuil pistonRingDamageThreshold les segments sont endommagés. |
| `cylinderWallTemperature` | number | Température des parois de cylindre en °C. |
| `cylinderWallsMelted` | boolean | Parois de cylindre fondues (moteur bloqué). |
| `debugData` | table | {engineThermalData = table} : mêmes valeurs que le flux GUI 'engineThermalData' (températures, énergies échangées, masses, débits de fuite, dégâts). |
| `engineBlockMelted` | boolean | Bloc fondu (moteur bloqué). |
| `engineBlockOverheatDamage` | number | Dégâts cumulés de surchauffe du bloc ; atteindre le seuil headGasketDamageThreshold fait claquer le joint de culasse. |
| `engineBlockTemperature` | number | Température du bloc moteur en °C. |
| `exhaustEndNodes` | table | Liste des sorties d'échappement actuelles (éléments {start, finish, afterFireAudioCoef, afterFireVisualCoef, afterFireVolumeCoef, afterFireMufflingCoef…}). Mise à jour quand une poutre d'échappement casse ou au reset. |
| `exhaustTemperature` | number | Température de l'échappement en °C. |
| `headGasketBlown` | boolean | Joint de culasse claqué. |
| `oilOverheatDamage` | number | Dégâts cumulés de surchauffe d'huile ; au seuil connectingRodDamageThreshold les coussinets de bielle sont endommagés. |
| `oilTemperature` | number | Température d'huile en °C (sert aussi au cadran de température sur les moteurs refroidis par air). |
| `pistonRingsDamaged` | boolean | Segments endommagés. |
| `radiatorFanSpin` | number | Angle de rotation du ventilateur de radiateur en degrés (0..360), pour l'animation. |

**Évènements UI (guihooks.trigger) :** `ExhaustTreeDataChanged`

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `getEnvTemperature`, `getFrontAirflowSpeed`, `getNodeForceNonInertial`, `inWater`, `playSFX`, `playSFXOnceCT`, `setVolumePitch`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/combustionEngineThermals.lua`.*

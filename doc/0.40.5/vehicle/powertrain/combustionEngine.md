# `powertrain_combustionEngine`

*Fichier : `lua/vehicle/powertrain/combustionEngine.lua` · VM : Véhicule · 2167 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `combustionEngine` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Fabrique du type de device powertrain `combustionEngine` (moteur thermique). `new(jbeamData)` construit un device à partir d'une entrée jbeam de la section powertrain : courbe de couple (avec modificateurs d'admission/échappement, chute après la zone rouge), limiteur de régime (3 types), ralenti régulé, démarreur, allumage, pannes d'allumage, hydrolock, dégâts de sur-régime/sur-couple, consommation de carburant par les energyStorage, sons moteur/échappement (blend FMOD) et sous-modules optionnels (thermals, turbocharger, supercharger, nitrousOxideInjection). Le moteur est toujours la racine d'un arbre : ses enfants doivent être des devices `clutchlike`. Un moddeur récupère le device avec powertrain.getDevice('nom') ou getDevicesByType('combustionEngine') et lit/écrit ses champs.

## Exemple

```lua
local eng = powertrain.getDevicesByType('combustionEngine')[1]
print(eng.outputAV1 * 9.5493, eng.engineLoad, eng.combustionTorque) -- régime tr/min, charge 0..1, couple N·m
eng:setIgnition(0)          -- coupe le contact
eng:cutIgnition(0.1)        -- coupe l'allumage 0.1 s (changement de rapport)
eng:setTempRevLimiter(600)  -- limiteur temporaire (rad/s)
eng:scaleOutputTorque(0.5)  -- réduit le couple de moitié
```

## Remarques

- UNITÉS : les vitesses angulaires internes (outputAV1, idleAV, maxAV, revLimiterAV, starterMaxAV…) sont en rad/s ; les jbeam donnent des tr/min (idleRPM, maxRPM, revLimiterRPM…), convertis avec rpmToAV = 0.104719755 ; avToRPM = 9.5493. Couples en N·m, inertie en kg·m², température en °C/K selon le sous-module thermals. device.maxPower est la puissance max de getTorqueData (calculée avec torqueToPower = 0.0001404345 : couple x tr/min, soit en ch/PS d'après le facteur ; maxPowerThrottleMap = maxPower x 735.499 la convertit en W).
- CLÉS JBEAM LUES par new : name, type, inputName, inputIndex, friction (couple de frottement constant, défaut 0), dynamicFriction (par rad/s, défaut 0), idleRPM (obligatoire), idleRPMRoughness (défaut 50), idleRPMRoughnessRate, idleRPMStartRate (1), idleRPMStartCoef (2), idleUpdateFrequency (100 Hz), idleUpdateFrequencyRandomness (0.01), idleControllerP (0.01), maxIdleThrottle (0.15), idleSmoothingUp/Down (100), maxRPM (obligatoire), maxPhysicalRPM (défaut maxRPM x 1.05), inertia (0.1), torque (table d'en-tête {rpm, torque}), torqueModMult, torqueModIntake, torqueModExhaust (tables rpm/torque : multiplicateur, puis couples additifs), torqueCompressionBrake (défaut rpm/torque 0/0, 1000/500, 3000/1500), hasRevLimiter (défaut true), revLimiterType ('rpmDrop' défaut, 'timeBased', 'soft'), revLimiterRPM, revLimiterRPMDrop (défaut 3 % de maxRPM), revLimiterCutTime (0.15 s), revLimiterMaxRPMDrop (500), revLimiterSmoothOvershootRPM (50), redlineTorqueDropOffRange (500, borné 10..maxRPM), revLimiterActiveMaxExhaustFlowCoef (0.5), starterTorque (défaut friction x 15), starterMaxRPM (défaut idleRPM x 0.7), starterThrottleKillTime (0.5 s), numberOfOutputPorts (1), torqueReactionNodes_nodes (3 ids de noeuds), engineBrakeTorque (défaut friction x 2), burnEfficiency (nombre ou table {charge 0..1, rendement}), requiredEnergyType (défaut 'gasoline'), energyStorage, instantAfterFireCoef, sustainedAfterFireCoef, sustainedAfterFireTime (1.5 s), maxOverRevDamage (1500), maxTorqueRating (-1 = désactivé), maxOverTorqueDamage (1000), waterDamage._engineGroup_nodes (noeuds testés pour l'inondation), engineBlock._engineGroup_nodes (>= 2 noeuds), thermalsLuaFileName / turbocharger / turbochargerLuaFileName / supercharger / superchargerLuaFileName / nitrousOxideInjection / nitrousOxideLuaFileName (noms de sections jbeam et fichiers), breakTriggerBeam, electricsThrottleName (défaut 'throttle'), electricsThrottleFactorName ('throttleFactor'), sons : soundConfig, soundConfigExhaust, starterSample, starterSampleExhaust, shutOffSampleEngine, shutOffSampleExhaust, starterVolume, starterVolumeExhaust, shutOffVolumeEngine, shutOffVolumeExhaust, enginePlacement ('outside'/'inside'), rpmSmootherInRate/OutRate (15/25), loadSmootherInRate/OutRate (20), particulates, thermalsEnabled, engineBlockMaterial, oilVolume, *DamageThreshold (passés aux thermals).
- PRINCIPAUX CHAMPS du device : outputAV1 (rad/s, vitesse de sortie vers l'embrayage) et outputRPM (tr/min, mis à jour dans updateGFX), outputTorque1 (couple de charge renvoyé par l'embrayage), inputAV, throttle (gaz effectif lissé 0..1), requestedThrottle, idleThrottle, engineLoad (charge lissée 0..1), instantEngineLoad, combustionTorque (couple net moteur = couple produit - frottements), frictionTorque, lastOutputTorque, nitrousOxideTorque, forcedInductionCoef, intakeAirDensityCoef (obj:getRelativeAirDensity), torqueCurve (table indexée par tr/min entier -> N·m), compressionBrakeCurve, maxRPM, maxAV, idleRPM, idleAV, maxIdleAV/minIdleAV, maxPhysicalAV, maxPower, maxTorque, torqueData, inertia/initialInertia (inertie des embrayages enfants ajoutée dans validate), friction/initialFriction/dynamicFriction, ignitionCoef (0/1), starterEngagedCoef, starterThrottleKillCoef, isStalled, isDisabled, isBroken, outputTorqueState (1 = normal, 0 = mort), outputAVState, floodLevel (0..1), revLimiterActive, revLimiterAV, hasRevLimiter, overRevDamage, overTorqueDamage, spentEnergy / spentEnergyNitrousOxide (énergie à retirer des réservoirs par frame), hasFuel, remainingFuelRatio, requiredEnergyType, registeredEnergyStorages, thermals / turbocharger / supercharger / nitrousOxideInjection (sous-modules, chacun avec isExisting), clutchChildren (enfants par port), activeOutputPorts, engineNodeID, engineBlockNodes, torqueReactionNodes, wear*/damage*Coef (coefficients de friction/ralenti), soundConfiguration, engineSoundID / engineSoundIDExhaust.
- Lu dans electrics.values : throttle (nom changeable par electricsThrottleName) et throttleFactor (peut être remplacé par device.throttleFactor), ignitionLevel au spawn ; écrit : electricalLoadCoef (charge électrique du démarreur). Appelle damageTracker.setDamage('engine', …) pour : engineDisabled, engineLockedUp, engineReducedTorque, overRevDanger, mildOverrevDamage, catastrophicOverrevDamage, overTorqueDanger, catastrophicOverTorqueDamage, engineHydrolocked, engineIsHydrolocking, impactDamage.
- BOUCLE : le moteur ne met pas à jour de vitesse (velocityUpdate = nop) ; torqueUpdate(dt) (updateTorque) intègre à chaque pas de physique : gaz (ralenti + démarreur + allumage + limiteur + lissage) -> couple de la courbe x densité d'air x admission forcée x carte de gaz + N2O -> frottements, frein moteur, frein par compression, démarreur -> nouvelle vitesse = outputAV1 + dt x couple net / inertie, propagée à tous les ports de sortie actifs. updateFixedStep tourne à 100 Hz (régulation du ralenti, turbo/compresseur). updateGFX(dt) (une fois par frame) gère carburant, démarreur, calage, sur-régime/sur-couple, hydrolock, thermals, sons.
- Aux dégâts : lockUp() (moteur bloqué) est déclenché par hydrolock, sur-régime catastrophique, sur-couple catastrophique, frottement supérieur au couple max, ou onBreak (poutre de rupture). Un moteur bloqué a outputAVState = 0 et isBroken = true.
- Bug repéré : les sous-modules factices (turbocharger/supercharger sans jbeam) n'ont pas de setAntilagCoef, getTorqueCoefs, setPartCondition ni applyDeformGroupDamage ; updateGFX appelle device.turbocharger.setAntilagCoef(...) quand antiLagCoefDesired change, ce qui plante (appel de nil) sur un moteur sans turbo si setAntilagCoef est appelé. Le factice nitrousOxideInjection n'a pas updateFixedStep (non appelé) mais getAddedTorque = nop.
- Bug repéré : applyDeformGroupDamage utilise min(x + y) avec un seul argument pour fastIgnitionErrorChance et slowIgnitionErrorChance (probablement un plafond oublié), donc rien ne limite ces probabilités.
- Bug repéré : setPartCondition affecte fastIgnitionErrorChance / slowIgnitionErrorChance avec integrityState.xxx sans valeur par défaut ; si l'état d'intégrité en table ne les contient pas, ils deviennent nil et updateGFX plantera. Le tableau d'intégrité sort de getPartCondition qui, lui, les fournit.
- Incohérences : new() réinitialise l'indicateur damageTracker 'mildOverTorqueDamage' mais reset() ne le fait pas (et reset réinitialise 'overRevDanger'/'overTorqueDanger' que new() ne réinitialise pas). getTorqueData renvoie finalCurveName = 1 (nombre) alors que les courbes sont nommées par chaîne. Le trou `hasResetSounds = ... or true` de powertrain.lua rend la condition toujours vraie.
- Les compagnons du moteur (combustionEngineThermals, turbocharger, supercharger, nitrousOxideInjection) sont chargés avec rerequire pour que chaque moteur ait sa propre instance ; ils sont dans la liste noire des fabriques de powertrain.lua et ne sont donc pas des devices autonomes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_combustionEngine.new(jbeamData)` | Fabrique d'un moteur thermique appelée par powertrain.init pour une entrée jbeam de type 'combustionEngine'. Lit les clés jbeam (voir notes), construit la courbe de couple finale (créée par createCurve, indexée par tr/min entier), le limiteur de régime, le lissage du ralenti, charge les sous-modules thermals/turbo/compresseur/N2O et renvoie le device (table avec ses méthodes). *(interne)* | 1677 |

### Détail des paramètres

#### `powertrain_combustionEngine.new(jbeamData)`

Fabrique d'un moteur thermique appelée par powertrain.init pour une entrée jbeam de type 'combustionEngine'. Lit les clés jbeam (voir notes), construit la courbe de couple finale (créée par createCurve, indexée par tr/min entier), le limiteur de régime, le lissage du ralenti, charge les sous-modules thermals/turbo/compresseur/N2O et renvoie le device (table avec ses méthodes).

- `jbeamData` (*table*) : Données jbeam du device (déjà fusionnées avec la section jbeam du même nom) ; idleRPM, maxRPM et torque sont indispensables.
- **renvoie** : table Le device combustionEngine.

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine = true}. Copié (shallowcopy) dans chaque device ; powertrain.getDevicesByCategory('engine') retrouve les moteurs. |
| `outputPorts` | table<integer, boolean> | Ports de sortie annoncés à powertrain : {[1] = true} par défaut. new() le remplace par numberOfOutputPorts ports (true) ; validate met à false ceux sans enfant (sauf le port 1). |

## Classe `device`

Objet renvoyé par new(jbeamData). Toutes les méthodes s'appellent avec deux-points (device:methode(...)). Les méthodes marquées internes sont appelées par powertrain.lua.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:activateStarter()` | Met le contact (ignitionCoef = 1) et engage le démarreur s'il ne l'est pas déjà : coupe temporairement les gaz (plus longtemps à froid, x4 en diesel contre x2 sous -20 °C) et joue le son de démarreur. | 995 |
| `device:applyDeformGroupDamage(damageAmount, groupType)` | Applique des dégâts de déformation selon le type de groupe : 'main' augmente frictions, erreur de ralenti et probabilités d'erreur d'allumage ; 'radiator', 'oilPan', 'oilRadiator' sont relayés aux thermals ; 'turbo' et 'supercharger' à leurs modules. | 830 |
| `device:applyRevLimiter(engineAV, throttle, dt)` | Fonction de limitation choisie à la construction selon revLimiterType : 'rpmDrop' (coupe les gaz jusqu'à ce que le régime retombe de revLimiterRPMDrop), 'timeBased' (coupe pendant revLimiterCutTime ou jusqu'à la chute de revLimiterMaxRPMDrop), 'soft' (fondu progressif de la manette des gaz), ou désactivée (renvoie les gaz inchangés). Appelée par torqueUpdate. | 660 |
| `device:beamBroke(id)` | Relaie la rupture d'une poutre aux thermals (radiateur, échappement…). | 1068 |
| `device:calculateInertia()` | Copie cumulativeInertia, cumulativeGearRatio et maxCumulativeGearRatio du premier enfant (embrayage) ; 0/1/1 sans enfant. | 1090 |
| `device:checkHydroLocking(dt)` | Gère l'inondation : si TOUS les noeuds waterDamage sont sous l'eau (obj:inWater) le niveau floodLevel monte proportionnellement au régime, sinon il redescend plus lentement ; au-delà de 0.9 le moteur est bloqué (lockUp). Envoie des messages UI par paliers de 10 %. | 329 |
| `device:cutIgnition(time)` | Coupe l'allumage (couple moteur nul) pendant un temps donné ; utilisé par les boîtes pour le changement de rapport. | 1015 |
| `device:deactivateStarter()` | Relâche le démarreur ; si le moteur a dépassé 1.1 x starterMaxAV et que la coupure des gaz est finie, arrête le son, sinon le coupe. | 1019 |
| `device:disable()` | Désactive le moteur : couple à 0, isDisabled = true, démarreur désactivé et arrêt du son de démarreur s'il tournait. Signale engineDisabled. | 264 |
| `device:enable()` | Réactive le moteur (outputTorqueState = 1, isDisabled = false, démarreur autorisé). | 279 |
| `device:exhaustEndNodesChanged(endNodes)` | Appelée par les thermals quand les noeuds de sortie d'échappement changent (rupture d'un tuyau) : recalcule les paires de noeuds, le gain et l'étouffement de base du son d'échappement. | 1185 |
| `device:getPartCondition(subSystem)` | Renvoie l'intégrité du moteur (ou du sous-système 'exhaust', 'radiator', 'turbocharger') : valeur 0..1 (minimum des critères friction, ralenti, erreurs d'allumage, thermals ; 0 si cassé) et table d'état. | 890 |
| `device:getSoundConfiguration()` | Renvoie la table soundConfiguration (par référence 'engine'/'exhaust' : blendFile, params, soundID). | 1229 |
| `device:getTorqueData()` | Calcule les courbes de couple et de puissance (moins frottements) pour chaque configuration (NA, N2O, Turbo, SC, combinaisons), triées par priorité, avec les couples/puissances maximaux et leur régime. | 25 |
| `device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference)` | Crée le son moteur côté jeu (core_sounds.initEngineSound en file d'attente GE), mémorise le blend et définit la position du son pour l'affichage debug. | 1106 |
| `device:initExhaustSound(soundID, samplePath, exhaustNodeIDPairs, offLoadGain, onLoadGain, reference)` | Crée le son d'échappement (core_sounds.initExhaustSound) avec des paires de noeuds (début, fin d'échappement). | 1115 |
| `device:initSounds(jbeamData)` | Appelée par powertrain.initSounds. Crée les sons de démarreur et d'extinction, lit les soundConfig/soundConfigExhaust du jbeam, initialise le son moteur et d'échappement (égaliseurs, gains, fréquence fondamentale = cylindres/120 x tr/min), crée les lisseurs de régime/charge, active updateSounds, puis initialise les sons des sous-modules. Désactivé si des sons moteur personnalisés anciens sont utilisés. | 1452 |
| `device:lockUp()` | Bloque le moteur : couple et vitesse de sortie forcés à 0 (outputTorqueState = outputAVState = 0), isBroken = true, démarreur coupé. Signale engineLockedUp et le powertrain cassé. | 287 |
| `device:onBreak()` | Appelée par powertrain.breakDevice : bloque le moteur (lockUp). | 1064 |
| `device:registerStorage(storageName)` | Enregistre un réservoir d'énergie : réservoir N2O -> module nitrous ; batterie électrique -> starterBattery ; réservoir du type requiredEnergyType -> liste des réservoirs consommés. Ignore un réservoir inconnu. | 1072 |
| `device:reset(jbeamData)` | Appelée par powertrain.reset : remet tous les états dynamiques à leurs valeurs de spawn (régime de ralenti si le contact est mis au spawn, frictions, ralenti, démarreur, calage, inondation, limiteurs, erreurs d'allumage, dégâts, énergies, usure), réinitialise les sous-modules, recalcule getTorqueData et réinitialise les indicateurs damageTracker. | 1308 |
| `device:resetSounds(jbeamData)` | Appelée au reset : remet à zéro les lisseurs de son, recalcule les paramètres du son d'échappement et réinitialise les sons des sous-modules. | 1257 |
| `device:resetTempRevLimiter()` | Désactive le limiteur temporaire (limite remise à maxAV x 10) et remet à zéro le décalage de gain/étouffement du son d'échappement dû au limiteur. | 648 |
| `device:scaleFriction(friction)` | Multiplie la friction courante par un facteur (cumulatif). | 254 |
| `device:scaleFrictionInitial(friction)` | Fixe friction = initialFriction x valeur (repart de la friction jbeam). | 250 |
| `device:scaleOutputTorque(state, maxReduction)` | Réduit le couple de sortie : outputTorqueState = max(état x state, min(maxReduction, état)). Le minimum ne peut pas ressusciter un moteur déjà à 0. Signale engineReducedTorque au damageTracker. | 258 |
| `device:sendTorqueData(data)` | Envoie les courbes de couple à l'UI via guihooks.trigger('TorqueCurveChanged', data). Appelée par powertrain.sendTorqueData quand le joueur 1 est assis. | 243 |
| `device:setAntilagCoef(coef)` | Fixe le coefficient désiré d'anti-lag, transmis au turbo et au son d'échappement dans updateGFX (plante si le moteur n'a pas de turbocharger défini, voir notes). | 1060 |
| `device:setCompressionBrakeCoef(coef)` | Fixe le coefficient désiré du frein moteur par compression (appliqué seulement quand les gaz sont à 0). | 1056 |
| `device:setEngineSoundParameter(soundID, paramName, paramValue, reference)` | Envoie un paramètre FMOD au son (via le GE) et le mémorise dans soundConfiguration. Ne met pas à jour les paramètres agrégés (main_gain, muffled) ni les sons de démarreur : utiliser la version liste pour cela. Sans effet si soundID est nil. | 1140 |
| `device:setEngineSoundParameterList(soundID, params, reference)` | Envoie une liste complète de paramètres de son. Recalcule main_gain (plafonné à 0 dB) et muffled à partir de base_gain/base_muffled et des décalages, puis ajuste le volume des sons de démarreur et d'extinction. | 1153 |
| `device:setExhaustGainMufflingOffset(mufflingOffset, gainOffset)` | Décale le gain et l'étouffement du son d'échappement (utilisé par les systèmes d'échappement/silencieux). Sans effet si le son d'échappement n'est pas configuré. | 1233 |
| `device:setExhaustGainMufflingOffsetRevLimiter(mufflingOffset, gainOffset)` | Même chose pour le décalage dû au limiteur de régime (champs mufflingOffsetRevLimiter / gainOffsetRevLimiter). | 1245 |
| `device:setExhaustSoundNodes(soundID, exhaustNodeIDPairs)` | Change les noeuds du son d'échappement (core_sounds.setExhaustSoundNodes) et met à jour leur emplacement debug. | 1128 |
| `device:setIgnition(value)` | Règle le contact : ignitionCoef = 1 si value > 0 sinon 0. À 0, arrête le démarreur et, si le régime dépasse 80 % du ralenti, demande le son d'extinction. | 1045 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'état d'usure (odomètre) et d'intégrité au moteur (sans sous-système : coefficients de friction, ralenti, erreurs d'allumage, thermals, rupture éventuelle) ou à un sous-système : 'radiator', 'exhaust' (thermals) ou 'turbocharger'. | 851 |
| `device:setSoundLocation(soundType, displayText, nodeCids)` | Mémorise où se trouve un son (moteur, échappement) pour l'affichage debug des noeuds. | 1215 |
| `device:setTempRevLimiter(revLimiterAV, maxOvershootAV)` | Active un limiteur de régime temporaire (plus bas que le limiteur normal ; le plus bas des deux s'applique), utile pour un launch control ou un limiteur de vitesse. | 641 |
| `device:torqueUpdate(dt)` | Cœur de la simulation, appelée à chaque pas de physique par powertrain.update (racine vers les feuilles). Calcule gaz, couple, charge, frottements, frein moteur, couple du démarreur, puis la nouvelle vitesse de sortie transmise à chaque port actif, le couple de charge renvoyé (somme des torqueDiff des embrayages), la réaction d'inertie appliquée via obj:applyTorqueAxisCouple, l'énergie dépensée et le carburant d'après-feu. | 728 |
| `device:updateEnergyStorageRatios()` | Répartit la consommation entre les réservoirs enregistrés du bon type d'énergie qui ont encore de l'énergie (ratio 1/N, 0 si vide). | 377 |
| `device:updateFixedStep(dt)` | Pas fixe à 100 Hz appelé depuis torqueUpdate : régulation de la manette de ralenti (P sur l'erreur de régime, avec aléa), remise à 1 de forcedInductionCoef puis mise à jour des pas fixes du turbo et du compresseur. | 704 |
| `device:updateFuelUsage()` | Retire spentEnergy des réservoirs (storedEnergy) selon les ratios, met à jour hasFuel et remainingFuelRatio ; désactive le moteur (disable) à la panne sèche et le réactive (enable) au retour de carburant. | 390 |
| `device:updateGFX(dt)` | Appelée une fois par frame par powertrain.updateGFX. Consommation de carburant, régime en tr/min, logique du démarreur et du calage, erreurs d'allumage aléatoires (lentes et rapides, plus fréquentes en manque de carburant), sons de coupure, dégâts de sur-régime (blocage possible, perte de couple) et de sur-couple, blocage si friction supérieure au couple dispo, frein par compression et anti-lag, délais d'après-feu, mise à jour des sous-modules (turbo, compresseur, N2O, thermals), densité d'air, hydrolock, erreur de lecture du ralenti, et remise à zéro des compteurs d'énergie. | 428 |
| `device:updateSoundNodeDebug()` | Redessine le texte de debug des noeuds de son (bdebug.setNodeDebugText). | 1220 |
| `device:updateSounds(dt)` | Affecté dynamiquement par initSounds uniquement si des sons moteur/échappement sont configurés. Appelée par powertrain.updateGFX : lisse régime et charge, calcule la charge audio, envoie obj:setEngineSound pour le moteur et l'échappement, et met à jour les sons du turbo et du compresseur. | 304 |
| `device:validate()` | Appelée par powertrain.init après la construction de l'arbre. Vérifie que tous les enfants sont de catégorie clutchlike (sinon renvoie false et avorte l'init), ajoute leur additionalEngineInertia à l'inertie du moteur, enregistre le moteur dans powertrain.engineData, configure les ports de sortie actifs et initialise outputAV/outputTorque (régime de ralenti si le contact est mis au spawn). | 930 |
| `device:velocityUpdate()` | Toujours nop pour un moteur (assigné par selectUpdates) : la vitesse est calculée dans torqueUpdate. | dyn |

**Évènements UI (guihooks.trigger) :** `TorqueCurveChanged`

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `applyTorqueAxisCouple`, `createSFXSource2`, `cutSFX`, `getId`, `getRelativeAirDensity`, `inWater`, `playSFX`, `queueGameEngineLua`, `setEngineSound`, `setVolume`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/combustionEngine.lua`.*

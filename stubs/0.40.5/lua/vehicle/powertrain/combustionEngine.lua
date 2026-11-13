---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/combustionEngine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fabrique du type de device powertrain `combustionEngine` (moteur thermique). `new(jbeamData)` construit un device à partir d'une entrée jbeam de la section powertrain : courbe de couple (avec modificateurs d'admission/échappement, chute après la zone rouge), limiteur de régime (3 types), ralenti régulé, démarreur, allumage, pannes d'allumage, hydrolock, dégâts de sur-régime/sur-couple, consommation de carburant par les energyStorage, sons moteur/échappement (blend FMOD) et sous-modules optionnels (thermals, turbocharger, supercharger, nitrousOxideInjection). Le moteur est toujours la racine d'un arbre : ses enfants doivent être des devices `clutchlike`. Un moddeur récupère le device avec powertrain.getDevice('nom') ou getDevicesByType('combustionEngine') et lit/écrit ses champs.
--- Accès : type de composant powertrain `combustionEngine` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_combustionEngine
---@field deviceCategories table<string, boolean> {engine = true}. Copié (shallowcopy) dans chaque device ; powertrain.getDevicesByCategory('engine') retrouve les moteurs.
---@field outputPorts table<integer, boolean> Ports de sortie annoncés à powertrain : {[1] = true} par défaut. new() le remplace par numberOfOutputPorts ports (true) ; validate met à false ceux sans enfant (sauf le port 1).
local powertrain_combustionEngine = {}

--- Fabrique d'un moteur thermique appelée par powertrain.init pour une entrée jbeam de type 'combustionEngine'. Lit les clés jbeam (voir notes), construit la courbe de couple finale (créée par createCurve, indexée par tr/min entier), le limiteur de régime, le lissage du ralenti, charge les sous-modules thermals/turbo/compresseur/N2O et renvoie le device (table avec ses méthodes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1677
---@param jbeamData table Données jbeam du device (déjà fusionnées avec la section jbeam du même nom) ; idleRPM, maxRPM et torque sont indispensables.
---@return table  Le device combustionEngine.
function powertrain_combustionEngine.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Toutes les méthodes s'appellent avec deux-points (device:methode(...)). Les méthodes marquées internes sont appelées par powertrain.lua.
---@class powertrain_combustionEngine_device
local powertrain_combustionEngine_device = {}

--- Met le contact (ignitionCoef = 1) et engage le démarreur s'il ne l'est pas déjà : coupe temporairement les gaz (plus longtemps à froid, x4 en diesel contre x2 sous -20 °C) et joue le son de démarreur.
---Source : lua/vehicle/powertrain/combustionEngine.lua:995
function powertrain_combustionEngine_device:activateStarter() end

--- Applique des dégâts de déformation selon le type de groupe : 'main' augmente frictions, erreur de ralenti et probabilités d'erreur d'allumage ; 'radiator', 'oilPan', 'oilRadiator' sont relayés aux thermals ; 'turbo' et 'supercharger' à leurs modules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:830
---@param damageAmount number Dégât ajouté depuis la dernière fois.
---@param groupType string Type de groupe de déformation (clé deformGroups_<type> du jbeam, 'main' par défaut).
function powertrain_combustionEngine_device:applyDeformGroupDamage(damageAmount, groupType) end

--- Fonction de limitation choisie à la construction selon revLimiterType : 'rpmDrop' (coupe les gaz jusqu'à ce que le régime retombe de revLimiterRPMDrop), 'timeBased' (coupe pendant revLimiterCutTime ou jusqu'à la chute de revLimiterMaxRPMDrop), 'soft' (fondu progressif de la manette des gaz), ou désactivée (renvoie les gaz inchangés). Appelée par torqueUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:660
---@param engineAV number Vitesse du moteur en rad/s.
---@param throttle number Gaz demandés 0..1.
---@param dt number Pas de temps en secondes.
---@return number  Gaz après limitation.
function powertrain_combustionEngine_device:applyRevLimiter(engineAV, throttle, dt) end

--- Relaie la rupture d'une poutre aux thermals (radiateur, échappement…).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1068
---@param id integer Cid de la poutre cassée.
function powertrain_combustionEngine_device:beamBroke(id) end

--- Copie cumulativeInertia, cumulativeGearRatio et maxCumulativeGearRatio du premier enfant (embrayage) ; 0/1/1 sans enfant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1090
function powertrain_combustionEngine_device:calculateInertia() end

--- Gère l'inondation : si TOUS les noeuds waterDamage sont sous l'eau (obj:inWater) le niveau floodLevel monte proportionnellement au régime, sinon il redescend plus lentement ; au-delà de 0.9 le moteur est bloqué (lockUp). Envoie des messages UI par paliers de 10 %.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:329
---@param dt number Pas de temps en secondes.
function powertrain_combustionEngine_device:checkHydroLocking(dt) end

--- Coupe l'allumage (couple moteur nul) pendant un temps donné ; utilisé par les boîtes pour le changement de rapport.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1015
---@param time number Durée de coupure en secondes.
function powertrain_combustionEngine_device:cutIgnition(time) end

--- Relâche le démarreur ; si le moteur a dépassé 1.1 x starterMaxAV et que la coupure des gaz est finie, arrête le son, sinon le coupe.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1019
function powertrain_combustionEngine_device:deactivateStarter() end

--- Désactive le moteur : couple à 0, isDisabled = true, démarreur désactivé et arrêt du son de démarreur s'il tournait. Signale engineDisabled.
---Source : lua/vehicle/powertrain/combustionEngine.lua:264
function powertrain_combustionEngine_device:disable() end

--- Réactive le moteur (outputTorqueState = 1, isDisabled = false, démarreur autorisé).
---Source : lua/vehicle/powertrain/combustionEngine.lua:279
function powertrain_combustionEngine_device:enable() end

--- Appelée par les thermals quand les noeuds de sortie d'échappement changent (rupture d'un tuyau) : recalcule les paires de noeuds, le gain et l'étouffement de base du son d'échappement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1185
---@param endNodes table[]|nil Liste d'extrémités {start, finish, exhaustAudioOpennessCoef, exhaustAudioGainChange} ; liste vide = repli sur le noeud moteur.
function powertrain_combustionEngine_device:exhaustEndNodesChanged(endNodes) end

--- Renvoie l'intégrité du moteur (ou du sous-système 'exhaust', 'radiator', 'turbocharger') : valeur 0..1 (minimum des critères friction, ralenti, erreurs d'allumage, thermals ; 0 si cassé) et table d'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:890
---@param subSystem string|nil nil = moteur complet.
---@return number  Intégrité 0..1.
---@return table  État détaillé, utilisable par setPartCondition.
function powertrain_combustionEngine_device:getPartCondition(subSystem) end

--- Renvoie la table soundConfiguration (par référence 'engine'/'exhaust' : blendFile, params, soundID).
---Source : lua/vehicle/powertrain/combustionEngine.lua:1229
---@return table  Configuration de son courante.
function powertrain_combustionEngine_device:getSoundConfiguration() end

--- Calcule les courbes de couple et de puissance (moins frottements) pour chaque configuration (NA, N2O, Turbo, SC, combinaisons), triées par priorité, avec les couples/puissances maximaux et leur régime.
---Source : lua/vehicle/powertrain/combustionEngine.lua:25
---@return table  {maxRPM, curves = {{torque, power, name, priority, dash, width}…}, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID} ; les courbes sont indexées par tr/min + 1.
function powertrain_combustionEngine_device:getTorqueData() end

--- Crée le son moteur côté jeu (core_sounds.initEngineSound en file d'attente GE), mémorise le blend et définit la position du son pour l'affichage debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1106
---@param soundID integer Identifiant de son (powertrain.getEngineSoundID).
---@param samplePath string Chemin du fichier .sfxBlend2D.json.
---@param engineNodeIDs integer[] Noeuds source du son.
---@param offLoadGain number Gain hors charge.
---@param onLoadGain number Gain en charge.
---@param reference string Clé de soundConfiguration ('engine').
function powertrain_combustionEngine_device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference) end

--- Crée le son d'échappement (core_sounds.initExhaustSound) avec des paires de noeuds (début, fin d'échappement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1115
---@param soundID integer Identifiant de son.
---@param samplePath string Chemin du blend.
---@param exhaustNodeIDPairs integer[][] Liste de paires {début, fin}.
---@param offLoadGain number Gain hors charge.
---@param onLoadGain number Gain en charge.
---@param reference string Clé de soundConfiguration ('exhaust').
function powertrain_combustionEngine_device:initExhaustSound(soundID, samplePath, exhaustNodeIDPairs, offLoadGain, onLoadGain, reference) end

--- Appelée par powertrain.initSounds. Crée les sons de démarreur et d'extinction, lit les soundConfig/soundConfigExhaust du jbeam, initialise le son moteur et d'échappement (égaliseurs, gains, fréquence fondamentale = cylindres/120 x tr/min), crée les lisseurs de régime/charge, active updateSounds, puis initialise les sons des sous-modules. Désactivé si des sons moteur personnalisés anciens sont utilisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1452
---@param jbeamData table Données jbeam du moteur.
function powertrain_combustionEngine_device:initSounds(jbeamData) end

--- Bloque le moteur : couple et vitesse de sortie forcés à 0 (outputTorqueState = outputAVState = 0), isBroken = true, démarreur coupé. Signale engineLockedUp et le powertrain cassé.
---Source : lua/vehicle/powertrain/combustionEngine.lua:287
function powertrain_combustionEngine_device:lockUp() end

--- Appelée par powertrain.breakDevice : bloque le moteur (lockUp).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1064
function powertrain_combustionEngine_device:onBreak() end

--- Enregistre un réservoir d'énergie : réservoir N2O -> module nitrous ; batterie électrique -> starterBattery ; réservoir du type requiredEnergyType -> liste des réservoirs consommés. Ignore un réservoir inconnu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1072
---@param storageName string Nom du réservoir (energyStorage).
function powertrain_combustionEngine_device:registerStorage(storageName) end

--- Appelée par powertrain.reset : remet tous les états dynamiques à leurs valeurs de spawn (régime de ralenti si le contact est mis au spawn, frictions, ralenti, démarreur, calage, inondation, limiteurs, erreurs d'allumage, dégâts, énergies, usure), réinitialise les sous-modules, recalcule getTorqueData et réinitialise les indicateurs damageTracker.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1308
---@param jbeamData table Données jbeam du moteur.
function powertrain_combustionEngine_device:reset(jbeamData) end

--- Appelée au reset : remet à zéro les lisseurs de son, recalcule les paramètres du son d'échappement et réinitialise les sons des sous-modules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1257
---@param jbeamData table Données jbeam du moteur.
function powertrain_combustionEngine_device:resetSounds(jbeamData) end

--- Désactive le limiteur temporaire (limite remise à maxAV x 10) et remet à zéro le décalage de gain/étouffement du son d'échappement dû au limiteur.
---Source : lua/vehicle/powertrain/combustionEngine.lua:648
function powertrain_combustionEngine_device:resetTempRevLimiter() end

--- Multiplie la friction courante par un facteur (cumulatif).
---Source : lua/vehicle/powertrain/combustionEngine.lua:254
---@param friction number Facteur multiplicatif.
function powertrain_combustionEngine_device:scaleFriction(friction) end

--- Fixe friction = initialFriction x valeur (repart de la friction jbeam).
---Source : lua/vehicle/powertrain/combustionEngine.lua:250
---@param friction number Facteur appliqué à initialFriction.
function powertrain_combustionEngine_device:scaleFrictionInitial(friction) end

--- Réduit le couple de sortie : outputTorqueState = max(état x state, min(maxReduction, état)). Le minimum ne peut pas ressusciter un moteur déjà à 0. Signale engineReducedTorque au damageTracker.
---Source : lua/vehicle/powertrain/combustionEngine.lua:258
---@param state number Facteur multiplicatif (1 = aucun changement).
---@param maxReduction number|nil Plancher de l'état (0 par défaut).
function powertrain_combustionEngine_device:scaleOutputTorque(state, maxReduction) end

--- Envoie les courbes de couple à l'UI via guihooks.trigger('TorqueCurveChanged', data). Appelée par powertrain.sendTorqueData quand le joueur 1 est assis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:243
---@param data table|nil Données déjà calculées ; getTorqueData() si nil.
function powertrain_combustionEngine_device:sendTorqueData(data) end

--- Fixe le coefficient désiré d'anti-lag, transmis au turbo et au son d'échappement dans updateGFX (plante si le moteur n'a pas de turbocharger défini, voir notes).
---Source : lua/vehicle/powertrain/combustionEngine.lua:1060
---@param coef number 0..1 (borné).
function powertrain_combustionEngine_device:setAntilagCoef(coef) end

--- Fixe le coefficient désiré du frein moteur par compression (appliqué seulement quand les gaz sont à 0).
---Source : lua/vehicle/powertrain/combustionEngine.lua:1056
---@param coef number 0..1 (borné).
function powertrain_combustionEngine_device:setCompressionBrakeCoef(coef) end

--- Envoie un paramètre FMOD au son (via le GE) et le mémorise dans soundConfiguration. Ne met pas à jour les paramètres agrégés (main_gain, muffled) ni les sons de démarreur : utiliser la version liste pour cela. Sans effet si soundID est nil.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1140
---@param soundID integer|nil Identifiant du son.
---@param paramName string Nom du paramètre.
---@param paramValue number Valeur.
---@param reference string 'engine' ou 'exhaust'.
function powertrain_combustionEngine_device:setEngineSoundParameter(soundID, paramName, paramValue, reference) end

--- Envoie une liste complète de paramètres de son. Recalcule main_gain (plafonné à 0 dB) et muffled à partir de base_gain/base_muffled et des décalages, puis ajuste le volume des sons de démarreur et d'extinction.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1153
---@param soundID integer|nil Identifiant du son.
---@param params table Paramètres (base_gain, gainOffset, gainOffsetRevLimiter, base_muffled, mufflingOffset, mufflingOffsetRevLimiter, eq_*…). La table est modifiée.
---@param reference string 'engine' ou 'exhaust'.
function powertrain_combustionEngine_device:setEngineSoundParameterList(soundID, params, reference) end

--- Décale le gain et l'étouffement du son d'échappement (utilisé par les systèmes d'échappement/silencieux). Sans effet si le son d'échappement n'est pas configuré.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1233
---@param mufflingOffset number Décalage d'étouffement.
---@param gainOffset number Décalage de gain en dB.
function powertrain_combustionEngine_device:setExhaustGainMufflingOffset(mufflingOffset, gainOffset) end

--- Même chose pour le décalage dû au limiteur de régime (champs mufflingOffsetRevLimiter / gainOffsetRevLimiter).
---Source : lua/vehicle/powertrain/combustionEngine.lua:1245
---@param mufflingOffset number Décalage d'étouffement.
---@param gainOffset number Décalage de gain en dB.
function powertrain_combustionEngine_device:setExhaustGainMufflingOffsetRevLimiter(mufflingOffset, gainOffset) end

--- Change les noeuds du son d'échappement (core_sounds.setExhaustSoundNodes) et met à jour leur emplacement debug.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1128
---@param soundID integer Identifiant du son d'échappement.
---@param exhaustNodeIDPairs integer[][] Paires {début, fin}.
function powertrain_combustionEngine_device:setExhaustSoundNodes(soundID, exhaustNodeIDPairs) end

--- Règle le contact : ignitionCoef = 1 si value > 0 sinon 0. À 0, arrête le démarreur et, si le régime dépasse 80 % du ralenti, demande le son d'extinction.
---Source : lua/vehicle/powertrain/combustionEngine.lua:1045
---@param value number Niveau d'allumage (0 = coupé).
function powertrain_combustionEngine_device:setIgnition(value) end

--- Applique l'état d'usure (odomètre) et d'intégrité au moteur (sans sous-système : coefficients de friction, ralenti, erreurs d'allumage, thermals, rupture éventuelle) ou à un sous-système : 'radiator', 'exhaust' (thermals) ou 'turbocharger'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:851
---@param subSystem string|nil nil = moteur lui-même ; 'radiator', 'exhaust' ou 'turbocharger'.
---@param odometer number Usure cumulée.
---@param integrity number|table Intégrité 0..1 ou table d'état issue de getPartCondition.
---@param visual any Condition visuelle passée aux sous-modules.
function powertrain_combustionEngine_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Mémorise où se trouve un son (moteur, échappement) pour l'affichage debug des noeuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1215
---@param soundType string 'engine' ou 'exhaust'.
---@param displayText string|nil Texte affiché.
---@param nodeCids integer[] Noeuds concernés.
function powertrain_combustionEngine_device:setSoundLocation(soundType, displayText, nodeCids) end

--- Active un limiteur de régime temporaire (plus bas que le limiteur normal ; le plus bas des deux s'applique), utile pour un launch control ou un limiteur de vitesse.
---Source : lua/vehicle/powertrain/combustionEngine.lua:641
---@param revLimiterAV number Régime limite en rad/s.
---@param maxOvershootAV number|nil Plage de dépassement en rad/s ; 1 % de revLimiterAV si nil.
function powertrain_combustionEngine_device:setTempRevLimiter(revLimiterAV, maxOvershootAV) end

--- Cœur de la simulation, appelée à chaque pas de physique par powertrain.update (racine vers les feuilles). Calcule gaz, couple, charge, frottements, frein moteur, couple du démarreur, puis la nouvelle vitesse de sortie transmise à chaque port actif, le couple de charge renvoyé (somme des torqueDiff des embrayages), la réaction d'inertie appliquée via obj:applyTorqueAxisCouple, l'énergie dépensée et le carburant d'après-feu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:728
---@param dt number Pas de physique en secondes.
function powertrain_combustionEngine_device:torqueUpdate(dt) end

--- Répartit la consommation entre les réservoirs enregistrés du bon type d'énergie qui ont encore de l'énergie (ratio 1/N, 0 si vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:377
function powertrain_combustionEngine_device:updateEnergyStorageRatios() end

--- Pas fixe à 100 Hz appelé depuis torqueUpdate : régulation de la manette de ralenti (P sur l'erreur de régime, avec aléa), remise à 1 de forcedInductionCoef puis mise à jour des pas fixes du turbo et du compresseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:704
---@param dt number Temps accumulé depuis le dernier pas fixe.
function powertrain_combustionEngine_device:updateFixedStep(dt) end

--- Retire spentEnergy des réservoirs (storedEnergy) selon les ratios, met à jour hasFuel et remainingFuelRatio ; désactive le moteur (disable) à la panne sèche et le réactive (enable) au retour de carburant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:390
function powertrain_combustionEngine_device:updateFuelUsage() end

--- Appelée une fois par frame par powertrain.updateGFX. Consommation de carburant, régime en tr/min, logique du démarreur et du calage, erreurs d'allumage aléatoires (lentes et rapides, plus fréquentes en manque de carburant), sons de coupure, dégâts de sur-régime (blocage possible, perte de couple) et de sur-couple, blocage si friction supérieure au couple dispo, frein par compression et anti-lag, délais d'après-feu, mise à jour des sous-modules (turbo, compresseur, N2O, thermals), densité d'air, hydrolock, erreur de lecture du ralenti, et remise à zéro des compteurs d'énergie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:428
---@param dt number Pas de temps en secondes.
function powertrain_combustionEngine_device:updateGFX(dt) end

--- Redessine le texte de debug des noeuds de son (bdebug.setNodeDebugText).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:1220
function powertrain_combustionEngine_device:updateSoundNodeDebug() end

--- Affecté dynamiquement par initSounds uniquement si des sons moteur/échappement sont configurés. Appelée par powertrain.updateGFX : lisse régime et charge, calcule la charge audio, envoie obj:setEngineSound pour le moteur et l'échappement, et met à jour les sons du turbo et du compresseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:304
---@param dt number Pas de temps en secondes.
function powertrain_combustionEngine_device:updateSounds(dt) end

--- Appelée par powertrain.init après la construction de l'arbre. Vérifie que tous les enfants sont de catégorie clutchlike (sinon renvoie false et avorte l'init), ajoute leur additionalEngineInertia à l'inertie du moteur, enregistre le moteur dans powertrain.engineData, configure les ports de sortie actifs et initialise outputAV/outputTorque (régime de ralenti si le contact est mis au spawn).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:930
---@return boolean  false si un enfant n'est pas un embrayage.
function powertrain_combustionEngine_device:validate() end

--- Toujours nop pour un moteur (assigné par selectUpdates) : la vitesse est calculée dans torqueUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/combustionEngine.lua:dyn
function powertrain_combustionEngine_device:velocityUpdate() end

return powertrain_combustionEngine

---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricMotor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `electricMotor` : moteur électrique de catégorie `engine`. Il produit un couple selon une courbe couple/régime (clé jbeam `torque`), le papillon (`electrics.values.throttle`) et la régénération (`regenThrottle`). Il consomme l'énergie de batteries `electricBattery` enregistrées (registerStorage), applique l'efficacité électrique, gère un limiteur de régime temporaire, l'allumage, des sons moteur et la réaction de couple sur la carrosserie. Avec un embrayage enfant (catégorie clutchlike) il intègre sa propre vitesse ; sans embrayage il impose directement le couple de sortie à l'enfant.
--- Accès : type de composant powertrain `electricMotor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_electricMotor
---@field deviceCategories table<string, boolean> {engine=true} : permet aux embrayages et boîtes de reconnaître le moteur comme parent valide.
---@field outputPorts table<integer, boolean> {[1]=true} : un port de sortie.
local powertrain_electricMotor = {}

--- Construit le moteur électrique : lit la courbe de couple (obligatoire), la courbe de régénération (fournie ou calculée à partir de maxRegenPower/maxRegenTorque/regenFadeRPM), le rendement électrique, les nœuds de réaction de couple, et prépare les données de courbe (getTorqueData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:505
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_electricMotor.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). torqueUpdate est updateTorqueWithClutch ou updateTorqueWithoutClutch selon la présence d'un embrayage enfant.
---@class powertrain_electricMotor_device
local powertrain_electricMotor_device = {}

--- Prend l'inertie et le rapport cumulés du premier enfant comme cumulativeInertia et cumulativeGearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:323
function powertrain_electricMotor_device:calculateInertia() end

--- Coupe le moteur : outputTorqueState = 0, isDisabled = true.
---Source : lua/vehicle/powertrain/electricMotor.lua:88
function powertrain_electricMotor_device:disable() end

--- Réactive le moteur : outputTorqueState = 1, isDisabled = false.
---Source : lua/vehicle/powertrain/electricMotor.lua:93
function powertrain_electricMotor_device:enable() end

--- Renvoie la table soundConfiguration (paramètres des sons moteur déjà initialisés, par référence).
---Source : lua/vehicle/powertrain/electricMotor.lua:337
---@return table|nil  Configuration sonore, nil si aucun son n'a été initialisé.
function powertrain_electricMotor_device:getSoundConfiguration() end

--- Calcule les courbes de couple et de puissance nettes du frottement et renvoie {maxRPM, curves, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID}. Utilisé par l'interface et par les embrayages/boîtes (maxTorque).
---Source : lua/vehicle/powertrain/electricMotor.lua:22
---@return table  Données de courbe de couple.
function powertrain_electricMotor_device:getTorqueData() end

--- Mémorise la configuration d'un échantillon sonore et demande au moteur de jeu (GE Lua) de l'initialiser : core_sounds.initEngineSound.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:417
---@param soundID integer Identifiant du son moteur (powertrain.getEngineSoundID).
---@param samplePath string Chemin du fichier sfxBlend2D.
---@param engineNodeIDs table<integer, integer> Nœuds d'où le son est émis.
---@param offLoadGain number Gain hors charge.
---@param onLoadGain number Gain en charge.
---@param reference string Clé de rangement dans soundConfiguration.
function powertrain_electricMotor_device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference) end

--- Crée la configuration sonore depuis la table jbeam désignée par soundConfig (lisseurs, gains, EQ, échantillon) et active updateSounds. Journalise une erreur si la configuration est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:432
---@param jbeamData table Données jbeam du composant (soundConfig).
function powertrain_electricMotor_device:initSounds(jbeamData) end

--- Bloque le moteur : couple 0, vitesse de sortie forcée à 0 (outputAVState = 0) et isDisabled = true. Appelée par onBreak.
---Source : lua/vehicle/powertrain/electricMotor.lua:98
function powertrain_electricMotor_device:lockUp() end

--- Appelée quand la poutre de rupture casse : appelle lockUp.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:292
function powertrain_electricMotor_device:onBreak() end

--- Enregistre une batterie (stockage de type electricBattery avec capacité > 0) comme source d'énergie du moteur et recalcule les ratios.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:311
---@param storageName string Nom du stockage d'énergie (energyStorage.getStorage).
function powertrain_electricMotor_device:registerStorage(storageName) end

--- Réinitialise l'état (vitesses, couple, papillon, charge, énergie, limiteur, coefficients), relit friction, dynamicFriction, inertia, defaultMotorDirection du jbeam et recalcule les données de courbe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:341
---@param jbeamData table Données jbeam du composant.
function powertrain_electricMotor_device:reset(jbeamData) end

--- Remet à zéro les lisseurs de son si la configuration sonore existe ; coupe les anciens sons moteur. Journalise une erreur si soundConfig est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:398
---@param jbeamData table Données jbeam du composant.
function powertrain_electricMotor_device:resetSounds(jbeamData) end

--- Désactive le limiteur de régime temporaire (valeur de coupure très haute, isTempRevLimiterActive = false).
---Source : lua/vehicle/powertrain/electricMotor.lua:303
function powertrain_electricMotor_device:resetTempRevLimiter() end

--- Multiplie le frottement du moteur (friction) par le facteur donné.
---Source : lua/vehicle/powertrain/electricMotor.lua:80
---@param friction number Facteur multiplicatif.
function powertrain_electricMotor_device:scaleFriction(friction) end

--- Multiplie outputTorqueState (0..1) par state. Sert à réduire le couple disponible ; attention, l'effet est cumulatif.
---Source : lua/vehicle/powertrain/electricMotor.lua:84
---@param state number Facteur multiplicatif.
function powertrain_electricMotor_device:scaleOutputTorque(state) end

--- Envoie l'événement GUI 'TorqueCurveChanged' avec les données de courbe (calculées si non fournies).
---Source : lua/vehicle/powertrain/electricMotor.lua:73
---@param data table|nil Résultat de getTorqueData ; nil pour le recalculer.
function powertrain_electricMotor_device:sendTorqueData(data) end

--- Mémorise et envoie (core_sounds.setEngineSoundParameterList) une liste de paramètres sonores pour un son moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:425
---@param soundID integer Identifiant du son moteur.
---@param params table<string, number> Paramètres FMOD (gains, fréquences EQ…).
---@param reference string Clé de rangement dans soundConfiguration.
function powertrain_electricMotor_device:setEngineSoundParameterList(soundID, params, reference) end

--- Règle le coefficient d'allumage : 1 si value > 0, sinon 0. N'a d'effet que si isAffectedByIgnitionLevel est vrai (défaut).
---Source : lua/vehicle/powertrain/electricMotor.lua:288
---@param value number Niveau d'allumage (> 0 = allumé).
function powertrain_electricMotor_device:setIgnition(value) end

--- Active un limiteur de régime temporaire : le papillon est réduit entre revLimiterAV et revLimiterAV + maxOvershootAV.
---Source : lua/vehicle/powertrain/electricMotor.lua:296
---@param revLimiterAV number Vitesse angulaire de coupure en rad/s.
---@param maxOvershootAV number|nil Plage de dépassement en rad/s (défaut 1 % de revLimiterAV).
function powertrain_electricMotor_device:setTempRevLimiter(revLimiterAV, maxOvershootAV) end

--- Appelée à chaque pas physique. Calcule le papillon lissé (avec limiteur de régime temporaire et allumage), le couple depuis la courbe, la charge, le travail brut, l'énergie dépensée et le couple de frottement. Avec embrayage : intègre outputAV1 et prend outputTorque1 = clutch.torqueDiff. Sans embrayage : inclut la régénération et applique le couple inertiel de réaction à la carrosserie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:dyn
---@param dt number Pas de temps en secondes.
function powertrain_electricMotor_device:torqueUpdate(dt) end

--- Recalcule la part d'énergie prélevée (ou rendue en régénération) par chaque batterie enregistrée selon le nombre de batteries avec énergie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:104
function powertrain_electricMotor_device:updateEnergyStorageRatios() end

--- Retire spentEnergy des batteries enregistrées (ou y ajoute en régénération), met à jour les compteurs de batteries non vides et appelle disable/enable selon qu'il reste de l'énergie. Ne fait rien sans device.energyStorage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:116
function powertrain_electricMotor_device:updateEnergyUsage() end

--- Mise à jour par image : appelle updateEnergyUsage, calcule outputRPM et remet à zéro les compteurs de travail et de perte par friction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:154
---@param dt number Durée de l'image en secondes.
function powertrain_electricMotor_device:updateGFX(dt) end

--- Définie seulement si une soundConfig valide est présente (sinon nop). Lisse le régime et la charge et appelle obj:setEngineSound avec la fréquence fondamentale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:163
---@param dt number Durée de l'image en secondes.
function powertrain_electricMotor_device:updateSounds(dt) end

--- Détecte l'embrayage enfant (un seul enfant de catégorie clutchlike), pose clutchChild et l'inertie effective, enregistre le moteur dans powertrain.engineData et sélectionne la version de torqueUpdate. Sans enfant : clutchChild = {torqueDiff = 0}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:273
---@return boolean  Toujours true.
function powertrain_electricMotor_device:validate() end

--- Toujours nop pour un moteur : la vitesse de sortie est calculée dans torqueUpdate ou imposée par l'aval.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricMotor.lua:dyn
function powertrain_electricMotor_device:velocityUpdate() end

return powertrain_electricMotor

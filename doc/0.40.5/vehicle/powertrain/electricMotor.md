# `powertrain_electricMotor`

*Fichier : `lua/vehicle/powertrain/electricMotor.lua` · VM : Véhicule · 724 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `electricMotor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `electricMotor` : moteur électrique de catégorie `engine`. Il produit un couple selon une courbe couple/régime (clé jbeam `torque`), le papillon (`electrics.values.throttle`) et la régénération (`regenThrottle`). Il consomme l'énergie de batteries `electricBattery` enregistrées (registerStorage), applique l'efficacité électrique, gère un limiteur de régime temporaire, l'allumage, des sons moteur et la réaction de couple sur la carrosserie. Avec un embrayage enfant (catégorie clutchlike) il intègre sa propre vitesse ; sans embrayage il impose directement le couple de sortie à l'enfant.

## Exemple

```lua
local m = powertrain.getDevice("mainMotor")
print(m.outputAV1 * 9.5493, m.engineLoad, m.maxPower, m.maxTorque) -- tr/min, 0..1, kW, N·m
m:setTempRevLimiter(5000 * 0.10472) -- limite à 5000 tr/min
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio, cumulativeGearRatio, friction (N·m), dynamicFriction (N·m par rad/s), inertia (kg·m², défaut 0.1), electricsThrottleName ('throttle'), electricsRegenThrottleName ('regenThrottle'), electricsThrottleFactorName ('throttleFactor'), isAffectedByIgnitionLevel (true), defaultMotorDirection (1), torqueReactionNodes_nodes (3 nœuds), torque (table en-tête rpm/torque, obligatoire), regenTorqueCurve (table rpm/torque), regenFadeRPM (1000), maxRegenPower (kW, = maxPower), maxRegenTorque (= maxTorque), minimumWantedRegenTorque (0), maximumWantedRegenTorque (= maxRegenTorque), electricalEfficiency (nombre ou table {charge 0..1, rendement}), energyStorage, breakTriggerBeam, soundConfig (nom d'une table jbeam de configuration sonore).
- Champs principaux : outputAV1 (rad/s, vitesse du rotor ; avec embrayage elle est intégrée par le moteur, sans embrayage elle est imposée par l'enfant), outputRPM (tr/min, mis à jour dans updateGFX), outputTorque1 (N·m vers l'enfant ; avec embrayage = torqueDiff de l'embrayage), inputAV (toujours 0), torqueCurve (table indexée par tr/min entier, N·m), regenCurve (idem pour la régénération), maxRPM (tr/min), maxAV (rad/s), maxTorque (N·m), maxPower (ch/PS selon torqueToPower, = valeur de getTorqueData), maxRegenTorque, throttle (0..1 après lissage), engineLoad et instantEngineLoad (-1..1 sans embrayage, 0..1 avec), torqueCoef (0..1, réduit le couple disponible depuis l'extérieur), maxTorqueLimit (N·m, math.huge par défaut), outputTorqueState (0 ou 1), isDisabled, hasEnergy, spentEnergy (J accumulés avant prélèvement dans les batteries), grossWorkPerUpdate, frictionLossPerUpdate, motorDirection (+1 ou -1), isBroken, torqueReactionNodes ({-1,-1,-1} si absent), engineNodeID.
- velocityUpdate vaut nop : un moteur ne reçoit pas de vitesse de son parent. Sa vitesse vient de l'embrayage (updateTorqueWithClutch intègre outputAV1) ou de la roue/transmission en aval (sans embrayage).
- Sans embrayage, le moteur applique aussi le couple inertiel de réaction (inertia * dOutputAV/dt) via obj:applyTorqueAxisCouple sur torqueReactionNodes ; il faut donc 3 nœuds valides.
- La régénération n'a lieu que si throttle vaut 0 (actualTorque = throttle > 0 and torque or regenTorque) et n'existe que dans la version sans embrayage. Un couple négatif de régénération recharge les batteries car spentEnergy devient négatif.
- Coupure : disable() et lockUp() mettent outputTorqueState à 0 ; lockUp met aussi outputAVState à 0 (rotor bloqué, utilisé par onBreak). enable() est automatiquement appelée quand une batterie reprend de l'énergie.
- Plafond de puissance : le couple est limité à maxPowerThrottleMap = maxPower * 735.499 W / (régime) uniquement dans la version avec embrayage.
- Les champs sont lus depuis `v.data`, donc validate/new doivent s'exécuter dans la VM véhicule après le chargement des données jbeam. M.requiredExternalInertiaOutputs n'est pas défini dans ce module (shallowcopy de nil).
- Bug mineur : reset ne relit pas electricsRegenThrottleName, torque/torqueCurve ni les sons ; resetSounds ne fait que réinitialiser les lisseurs quand soundConfig existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_electricMotor.new(jbeamData)` | Construit le moteur électrique : lit la courbe de couple (obligatoire), la courbe de régénération (fournie ou calculée à partir de maxRegenPower/maxRegenTorque/regenFadeRPM), le rendement électrique, les nœuds de réaction de couple, et prépare les données de courbe (getTorqueData). *(interne)* | 505 |

### Détail des paramètres

#### `powertrain_electricMotor.new(jbeamData)`

Construit le moteur électrique : lit la courbe de couple (obligatoire), la courbe de régénération (fournie ou calculée à partir de maxRegenPower/maxRegenTorque/regenFadeRPM), le rendement électrique, les nœuds de réaction de couple, et prépare les données de courbe (getTorqueData).

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true} : permet aux embrayages et boîtes de reconnaître le moteur comme parent valide. |
| `outputPorts` | table<integer, boolean> | {[1]=true} : un port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData). torqueUpdate est updateTorqueWithClutch ou updateTorqueWithoutClutch selon la présence d'un embrayage enfant.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Prend l'inertie et le rapport cumulés du premier enfant comme cumulativeInertia et cumulativeGearRatio. | 323 |
| `device:disable()` | Coupe le moteur : outputTorqueState = 0, isDisabled = true. | 88 |
| `device:enable()` | Réactive le moteur : outputTorqueState = 1, isDisabled = false. | 93 |
| `device:getSoundConfiguration()` | Renvoie la table soundConfiguration (paramètres des sons moteur déjà initialisés, par référence). | 337 |
| `device:getTorqueData()` | Calcule les courbes de couple et de puissance nettes du frottement et renvoie {maxRPM, curves, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID}. Utilisé par l'interface et par les embrayages/boîtes (maxTorque). | 22 |
| `device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference)` | Mémorise la configuration d'un échantillon sonore et demande au moteur de jeu (GE Lua) de l'initialiser : core_sounds.initEngineSound. | 417 |
| `device:initSounds(jbeamData)` | Crée la configuration sonore depuis la table jbeam désignée par soundConfig (lisseurs, gains, EQ, échantillon) et active updateSounds. Journalise une erreur si la configuration est introuvable. | 432 |
| `device:lockUp()` | Bloque le moteur : couple 0, vitesse de sortie forcée à 0 (outputAVState = 0) et isDisabled = true. Appelée par onBreak. | 98 |
| `device:onBreak()` | Appelée quand la poutre de rupture casse : appelle lockUp. | 292 |
| `device:registerStorage(storageName)` | Enregistre une batterie (stockage de type electricBattery avec capacité > 0) comme source d'énergie du moteur et recalcule les ratios. | 311 |
| `device:reset(jbeamData)` | Réinitialise l'état (vitesses, couple, papillon, charge, énergie, limiteur, coefficients), relit friction, dynamicFriction, inertia, defaultMotorDirection du jbeam et recalcule les données de courbe. | 341 |
| `device:resetSounds(jbeamData)` | Remet à zéro les lisseurs de son si la configuration sonore existe ; coupe les anciens sons moteur. Journalise une erreur si soundConfig est introuvable. | 398 |
| `device:resetTempRevLimiter()` | Désactive le limiteur de régime temporaire (valeur de coupure très haute, isTempRevLimiterActive = false). | 303 |
| `device:scaleFriction(friction)` | Multiplie le frottement du moteur (friction) par le facteur donné. | 80 |
| `device:scaleOutputTorque(state)` | Multiplie outputTorqueState (0..1) par state. Sert à réduire le couple disponible ; attention, l'effet est cumulatif. | 84 |
| `device:sendTorqueData(data)` | Envoie l'événement GUI 'TorqueCurveChanged' avec les données de courbe (calculées si non fournies). | 73 |
| `device:setEngineSoundParameterList(soundID, params, reference)` | Mémorise et envoie (core_sounds.setEngineSoundParameterList) une liste de paramètres sonores pour un son moteur. | 425 |
| `device:setIgnition(value)` | Règle le coefficient d'allumage : 1 si value > 0, sinon 0. N'a d'effet que si isAffectedByIgnitionLevel est vrai (défaut). | 288 |
| `device:setTempRevLimiter(revLimiterAV, maxOvershootAV)` | Active un limiteur de régime temporaire : le papillon est réduit entre revLimiterAV et revLimiterAV + maxOvershootAV. | 296 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique. Calcule le papillon lissé (avec limiteur de régime temporaire et allumage), le couple depuis la courbe, la charge, le travail brut, l'énergie dépensée et le couple de frottement. Avec embrayage : intègre outputAV1 et prend outputTorque1 = clutch.torqueDiff. Sans embrayage : inclut la régénération et applique le couple inertiel de réaction à la carrosserie. | dyn |
| `device:updateEnergyStorageRatios()` | Recalcule la part d'énergie prélevée (ou rendue en régénération) par chaque batterie enregistrée selon le nombre de batteries avec énergie. | 104 |
| `device:updateEnergyUsage()` | Retire spentEnergy des batteries enregistrées (ou y ajoute en régénération), met à jour les compteurs de batteries non vides et appelle disable/enable selon qu'il reste de l'énergie. Ne fait rien sans device.energyStorage. | 116 |
| `device:updateGFX(dt)` | Mise à jour par image : appelle updateEnergyUsage, calcule outputRPM et remet à zéro les compteurs de travail et de perte par friction. | 154 |
| `device:updateSounds(dt)` | Définie seulement si une soundConfig valide est présente (sinon nop). Lisse le régime et la charge et appelle obj:setEngineSound avec la fréquence fondamentale. | 163 |
| `device:validate()` | Détecte l'embrayage enfant (un seul enfant de catégorie clutchlike), pose clutchChild et l'inertie effective, enregistre le moteur dans powertrain.engineData et sélectionne la version de torqueUpdate. Sans enfant : clutchChild = {torqueDiff = 0}. | 273 |
| `device:velocityUpdate()` | Toujours nop pour un moteur : la vitesse de sortie est calculée dans torqueUpdate ou imposée par l'aval. | dyn |

**Évènements UI (guihooks.trigger) :** `TorqueCurveChanged`

## Appels vers le moteur (C++)

- `obj:` `applyTorqueAxisCouple`, `getId`, `queueGameEngineLua`, `setEngineSound`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/electricMotor.lua`.*

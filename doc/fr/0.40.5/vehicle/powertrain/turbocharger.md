# `powertrain_turbocharger`

*Fichier : `lua/vehicle/powertrain/turbocharger.lua` · VM : Véhicule · 554 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `turbocharger` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Sous-système de suralimentation par turbo, rattaché à un moteur (ce n'est pas un device de la chaîne de transmission : init(device, jbeamData) reçoit le moteur). Simule la vitesse de l'arbre du turbo (couple des gaz d'échappement - contre-pression - frottement, inertie), la pression de suralimentation via une courbe pression/régime turbo, une soupape de décharge (wastegate, régulée par un PID), une soupape de décharge à l'admission (BOV/flutter), l'antilag, la température du turbo (dégâts) et les sons (sifflement, rotation, BOV). Écrit le coefficient forcedInductionCoef du moteur et plusieurs valeurs electrics (turboRPM, turboSpin, turboBoost, turboBoostMax, turboRpmRatio).

## Exemple

```lua
-- jbeam (dans le moteur) : "turbocharger":{"inertia":0.1, "pressurePSI":[[0,0],[40000,10],[100000,25]], "engineDef":[[0,0.4,0.2],[8000,1,1]], "wastegateStart":12}
local eng = powertrain.getDevice('mainEngine')
eng.turbocharger.setWastegateOffset(2)  -- +2 psi de consigne
eng.turbocharger.setAntilagCoef(1)
```

## Remarques

- Unités jbeam : pressions en psi (converties en Pa en interne), régimes en tr/min (rpmToAV = 0.10471971768), inertia sans unité (inertie interne = 0.000003 * inertia * 100 * 2.5). Valeurs electrics : turboRPM en tr/min, turboBoost et turboBoostMax en psi (pression relative à l'atmosphère au sens du code : pas de soustraction de 1 atm), turboRpmRatio = AV/AVmax*580 (sert aux sons).
- Clés jbeam (table turbocharger) : pressurePSI (liste de [rpm_turbo, psi], obligatoire), engineDef (liste de [rpm_moteur, efficacité, facteur_échappement], obligatoire ; le 3e est plafonné à 1 ; efficacité = part de pression convertie en puissance, facteur = puissance des gaz), inertia, wastegateStart (psi, nombre ou table par rapport de boîte), wastegateLimit (psi, nombre ou table ; défaut = start + 0.01 psi), wastegatePCoef (0.0001), wastegateICoef (0.0015), wastegateDCoef (0), maxExhaustPower (1), backPressureCoef (0.0005), frictionCoef (0.01), maxAntilagPower (0), damageThresholdTemperature (1000), deformGroupDamageScaleCoef (1), pressureRatePSI (30), bovEnabled (true ; false = flutter à la place du BOV), bovOpenThreshold (0.05), bovOpenChangeThreshold (0.3), electricsRPMName ('turboRPM'), electricsSpinName ('turboSpin'), electricsSpinCoef (0.1), sons : hissLoopEvent, whineLoopEvent, bovSoundFileName, flutterSoundFileName, whinePitchPer10kRPM (0.05), whineVolumePer10kRPM (0.04), hissVolumePerPSI (0.04), turboSizeCoef (1), bovSoundVolumeCoef (0.3), flutterSoundVolumeCoef (0.3).
- Les valeurs de wastegateStart/Limit sont indexées par électrique gearIndex ; si le rapport n'a pas d'entrée, la dernière valeur lue est utilisée (maxWastegateStart/Range).
- La BOV n'existe que pour les moteurs non diesel (needsBov = requiredEnergyType ~= 'diesel'). Elle s'ouvre quand la charge est faible ou chute brutalement, hors limiteur de régime et coupure d'allumage ; la suralimentation est alors purgée.
- updateFixedStep est appelée à chaque pas de physique et multiplie assignedEngine.forcedInductionCoef par (1 + 0.0000087 * pression_Pa * efficacité(rpm_moteur)) (soit environ +6 % de puissance par psi). Elle doit donc être appelée après la remise à 1 de forcedInductionCoef par le moteur.
- Dégâts : applyDeformGroupDamage augmente le frottement et réduit la puissance d'échappement ; une température turbo (échappement + liquide de refroidissement + huile) supérieure à damageThresholdTemperature augmente progressivement le frottement. getPartCondition donne min(intégrité frottement, intégrité échappement).
- Bug/incohérence : init() fait `turbo = deepcopy(jbeamData)` puis lit #turbo.pressurePSI et #turbo.engineDef AVANT de tester leur existence ; si ces tables manquent, l'erreur est une exception Lua et non le log 'No turbocharger.pressurePSI table found!'. M.turboUpdate = nop est posé en cas de jbeamData nil mais n'est jamais utilisé (le champ réel est updateGFX).
- Bug/incohérence : le flux 'forcedInductionInfo' lit electrics.values.boost et electrics.values.boostMax, alors que ce fichier écrit turboBoost et turboBoostMax ; boost/boostMax doivent venir d'ailleurs (moteur), sinon arithmétique sur nil.
- Bug/incohérence : `turbo.turboPressureCurve[floor(turboRPM)] * psiToPascal or turboPressure` : si l'index est hors table, la multiplication de nil lève une erreur avant que le `or` serve. Le dernier index valide est floor(maxTurboAV en tr/min).
- Bug/incohérence : maxWastegateStart/maxWastegateLimit/maxWastegateRange prennent la dernière valeur itérée par pairs() (ordre non garanti si les tables par rapport sont creuses).
- Bug/incohérence : initSounds nomme les emplacements sonores à l'envers : setSoundLocation('turbochargerwhine', 'Turbo Hiss: ...') et ('turbochargerhiss', 'Turbo Whine: ...').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_turbocharger.applyDeformGroupDamage(damageAmount)` | Aggrave le frottement et réduit la puissance d'échappement quand un groupe de déformation du turbo est endommagé ; signale 'inductionSystemDamaged' au suivi de dégâts. *(interne)* | 115 |
| `powertrain_turbocharger.getPartCondition()` | Renvoie l'intégrité du turbo. *(interne)* | 136 |
| `powertrain_turbocharger.getTorqueCoefs()` | Estime, pour chaque régime de la courbe de couple du moteur, le coefficient de gain de couple apporté par le turbo (en supposant le turbo en régime stabilisé et la wastegate à sa consigne moyenne). Sert aux outils de courbes de puissance. | 507 |
| `powertrain_turbocharger.init(device, jbeamData)` | Initialise le turbo pour un moteur donné : copie le jbeam, construit les courbes pression/échappement/efficacité (createCurve), les tables de wastegate par rapport de boîte, les lisseurs, les coefficients et installe updateGFX/updateFixedStep/updateSounds. Appelée par le moteur à l'initialisation. *(interne)* | 324 |
| `powertrain_turbocharger.initSounds(jbeamData)` | Crée les sources audio hiss et whine sur le noeud du moteur et lit les coefficients sonores du jbeam. *(interne)* | 482 |
| `powertrain_turbocharger.reset(jbeamData)` | Remet à zéro l'état du turbo (vitesse, pressions, BOV, PID de wastegate, antilag, coefficients de dégâts/usure) et les lisseurs. Appelée au reset du véhicule. *(interne)* | 290 |
| `powertrain_turbocharger.resetSounds(jbeamData)` | Ne fait rien (fonction vide), appelée au reset des sons. *(interne)* | 504 |
| `powertrain_turbocharger.setAntilagCoef(coef)` | Règle le niveau d'antilag (relance de l'arbre du turbo pendant les levers de pied) : puissance antilag = coef * maxAntilagPower. Est aussi pris en compte dans le calcul de charge pour la BOV. | 533 |
| `powertrain_turbocharger.setPartCondition(odometer, integrity, visual)` | Applique l'usure (odomètre) et l'intégrité d'une pièce chargée depuis une sauvegarde. *(interne)* | 121 |
| `powertrain_turbocharger.setWastegateOffset(offset)` | Décale la consigne de pression de la wastegate (boost control). | 529 |
| `powertrain_turbocharger.updateFixedStep(dt)` | Pas de physique : PID de wastegate, bilan de couple de l'arbre (échappement + antilag, contre-pression, frottement), vitesse du turbo, pression brute puis lissée, et application à forcedInductionCoef du moteur. Remplace le nop initial après init. (assignée dynamiquement) *(interne)* | dyn |
| `powertrain_turbocharger.updateGFX(dt)` | Frame graphique : température et dégâts du turbo, logique de BOV/flutter et ses sons, consigne de wastegate selon le rapport, valeurs electrics (turboRPM, turboSpin, turboRpmRatio, turboBoost) et flux 'forcedInductionInfo' vers l'UI. (assignée dynamiquement) *(interne)* | dyn |
| `powertrain_turbocharger.updateSounds(dt)` | Règle volume/pitch du sifflement de pression (hiss) et du bruit de rotation (whine) du turbo. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `powertrain_turbocharger.applyDeformGroupDamage(damageAmount)`

Aggrave le frottement et réduit la puissance d'échappement quand un groupe de déformation du turbo est endommagé ; signale 'inductionSystemDamaged' au suivi de dégâts.

- `damageAmount` (*number*) : Quantité de dégât.

#### `powertrain_turbocharger.getPartCondition()`

Renvoie l'intégrité du turbo.

- **renvoie** : number Intégrité 0..1.
- **renvoie** : table {damageFrictionCoef, damageExhaustPowerCoef}.

#### `powertrain_turbocharger.getTorqueCoefs()`

Estime, pour chaque régime de la courbe de couple du moteur, le coefficient de gain de couple apporté par le turbo (en supposant le turbo en régime stabilisé et la wastegate à sa consigne moyenne). Sert aux outils de courbes de puissance.

- **renvoie** : table<integer, number> Table indexée par rpm+1 : coefficient (1 = pas de gain).

#### `powertrain_turbocharger.init(device, jbeamData)`

Initialise le turbo pour un moteur donné : copie le jbeam, construit les courbes pression/échappement/efficacité (createCurve), les tables de wastegate par rapport de boîte, les lisseurs, les coefficients et installe updateGFX/updateFixedStep/updateSounds. Appelée par le moteur à l'initialisation.

- `device` (*table*) : Device moteur auquel le turbo est rattaché.
- `jbeamData` (*table|nil*) : Table jbeam 'turbocharger' (voir notes). Si nil, le turbo reste inactif.

#### `powertrain_turbocharger.initSounds(jbeamData)`

Crée les sources audio hiss et whine sur le noeud du moteur et lit les coefficients sonores du jbeam.

- `jbeamData` (*table*) : Non utilisé (la copie interne du jbeam sert).

#### `powertrain_turbocharger.reset(jbeamData)`

Remet à zéro l'état du turbo (vitesse, pressions, BOV, PID de wastegate, antilag, coefficients de dégâts/usure) et les lisseurs. Appelée au reset du véhicule.

- `jbeamData` (*table*) : Non utilisé.

#### `powertrain_turbocharger.resetSounds(jbeamData)`

Ne fait rien (fonction vide), appelée au reset des sons.

- `jbeamData` (*table*) : Non utilisé.

#### `powertrain_turbocharger.setAntilagCoef(coef)`

Règle le niveau d'antilag (relance de l'arbre du turbo pendant les levers de pied) : puissance antilag = coef * maxAntilagPower. Est aussi pris en compte dans le calcul de charge pour la BOV.

- `coef` (*number*) : Coefficient 0..1.

#### `powertrain_turbocharger.setPartCondition(odometer, integrity, visual)`

Applique l'usure (odomètre) et l'intégrité d'une pièce chargée depuis une sauvegarde.

- `odometer` (*number*) : Odomètre de la pièce.
- `integrity` (*number|table*) : Intégrité 0..1 ou table {damageFrictionCoef, damageExhaustPowerCoef}.
- `visual` (*any*) : Non utilisé.

#### `powertrain_turbocharger.setWastegateOffset(offset)`

Décale la consigne de pression de la wastegate (boost control).

- `offset` (*number*) : Décalage en psi (ajouté à la consigne, peut être négatif).

#### `powertrain_turbocharger.updateFixedStep(dt)`

Pas de physique : PID de wastegate, bilan de couple de l'arbre (échappement + antilag, contre-pression, frottement), vitesse du turbo, pression brute puis lissée, et application à forcedInductionCoef du moteur. Remplace le nop initial après init. (assignée dynamiquement)

- `dt` (*number*) : Pas de physique (s).

#### `powertrain_turbocharger.updateGFX(dt)`

Frame graphique : température et dégâts du turbo, logique de BOV/flutter et ses sons, consigne de wastegate selon le rapport, valeurs electrics (turboRPM, turboSpin, turboRpmRatio, turboBoost) et flux 'forcedInductionInfo' vers l'UI. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps de la frame (s).

#### `powertrain_turbocharger.updateSounds(dt)`

Règle volume/pitch du sifflement de pression (hiss) et du bruit de rotation (whine) du turbo. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps (s). Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `isExisting` | boolean | Toujours true : permet au moteur de savoir qu'un module turbo existe. |
| `turboAV` | number|nil | Vitesse angulaire de l'arbre du turbo en rad/s ; nil avant init, mise à jour à chaque pas de physique. |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `playSFX`, `setVolumePitch`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/turbocharger.lua`.*

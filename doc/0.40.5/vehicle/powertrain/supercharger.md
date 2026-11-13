# `powertrain_supercharger`

*Fichier : `lua/vehicle/powertrain/supercharger.lua` · VM : Véhicule · 354 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `supercharger` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Sous-système de compresseur mécanique (supercharger) rattaché à un moteur : le compresseur est entraîné par le vilebrequin (rapport gearRatio, avec un embrayage progressif entre clutchEngageRPM et clutchDisengageRPM). Trois types : 'roots', 'screws', 'centrifugal', chacun avec sa courbe d'efficacité et son niveau de pulsation. Calcule la pression de suralimentation (psi/1000 tr/min, courbe boostController selon l'ouverture des gaz, soupape de décharge), l'applique à engine.forcedInductionCoef et prélève une perte de couple proportionnelle au régime (crankLossPer1kRPM). Génère aussi le sifflement du compresseur.

## Exemple

```lua
-- jbeam du moteur : "supercharger":{"type":"roots", "gearRatio":2, "pressurePSIPer1kRPM":1.2, "lobes":3, "boostController":[[0,0],[100,1]]}
local eng = powertrain.getDevice('mainEngine')
eng.supercharger.setBypassPressure(8) -- soupape de décharge à 8 psi
```

## Remarques

- Unités jbeam : pressions en psi, régimes en tr/min (conversion rpmToAV 0.10471971768, avToRPM 9.5493). Valeur electrics écrite : superchargerBoost (psi), superchargerBoostMax (= pression maximale de la courbe, en psi).
- Clés jbeam : type ('roots', 'screws' ou 'centrifugal', obligatoire ; type inconnu -> log d'erreur et init interrompu), gearRatio (1), maxRPM (régime max du compresseur ; défaut ceil(maxRPM moteur*gearRatio)), pressurePSIPer1kRPM (obligatoire, pente de pression), boostController (liste de [gaz en %, coefficient], obligatoire : index 0..100 de la courbe = ouverture des gaz *100), lobes (2..4, défaut 3 ; screws impose au moins 3 ; centrifugal impose 0), twistedLobes (roots), pulseCoefModifier, crankLossPer1kRPM (5 -> 0.005 de perte par 1000 tr/min), clutchEngageRPM (1000), clutchEngageRange, clutchDisengageRPM (2*maxRPM moteur), clutchDisengageRange, pressureRatePSI (50 psi/s), sons : whineLoopEvent, whinePitchPer10kRPM (0.65), whineVolumePerPSI (0.01), whineVolumePer10kRPM.
- Pulsations : pulseCoefModifier par défaut 0.98 pour screws, 0.95 (roots torsadé) ou 0.9 (roots droit), 1 pour centrifugal ; fréquence = nombre de lobes * vitesse du compresseur.
- La pression de la courbe est calculée par pressionCoef(rpm relatif) * pente * rpm avec un polynôme d'ordre 2 propre au type ; la soupape de décharge coupe la pression au-delà de bypassConditions.maxPressure (très élevée par défaut, réglable avec setBypassPressure) et à 0 si les gaz sont inférieurs à 1 %.
- Gain de couple : forcedInductionCoef *= max(1 + 0.0000087*pression_Pa - perte, 0), appelé dans updateFixedStep à chaque pas de physique.
- Bug/incohérence : setPartCondition construit integrityState avec damageFrictionCoef et damageExhaustPowerCoef (copié du turbo) puis lit integrityState.damagePressureCoef : quand integrity est un nombre, damagePressureCoef revient toujours à 1 (l'intégrité est ignorée).
- Bug/incohérence : getPartCondition appelle min(pressureIntegrityValue) avec un seul argument (équivalent à la valeur elle-même).
- Bug/incohérence : maxPressure est une variable locale du module jamais remise à 0 dans init (cumule le maximum sur les rechargements du module). applyDeformGroupDamage signale 'inductionSystemDamaged' mais reset ne l'efface pas (seul 'superchargerDamaged' l'est).
- Bug/incohérence : le flux 'forcedInductionInfo' lit electrics.values.boost et electrics.values.boostMax, que ce fichier n'écrit pas (il écrit superchargerBoost / superchargerBoostMax) ; sans moteur qui définit boost/boostMax, une arithmétique sur nil est possible.
- Après un retour anticipé de init (type inconnu, boostController absent), updateGFX et updateFixedStep restent à nop et les variables internes (pressureCurve…) sont partiellement initialisées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_supercharger.applyDeformGroupDamage(damageAmount)` | Réduit la pression délivrée (damagePressureCoef, jusqu'à -0.1) quand un groupe de déformation est endommagé, et signale 'inductionSystemDamaged'. *(interne)* | 72 |
| `powertrain_supercharger.getPartCondition()` | Renvoie l'intégrité du compresseur. *(interne)* | 91 |
| `powertrain_supercharger.getTorqueCoefs()` | Estime le coefficient de gain de couple du compresseur pour chaque régime de la courbe de couple du moteur (embrayage et rapport pris en compte). | 320 |
| `powertrain_supercharger.init(device, jbeamData)` | Initialise le compresseur pour un moteur : lit le jbeam, génère la courbe de pression et celle du boostController, calcule la vitesse maximale du compresseur et installe updateGFX/updateFixedStep. Si jbeamData est nil, désactive updateGFX. *(interne)* | 209 |
| `powertrain_supercharger.initSounds(jbeamData)` | Crée le son de sifflement du compresseur (soundObj) sur le noeud du moteur et calcule les coefficients de volume et de pitch. *(interne)* | 183 |
| `powertrain_supercharger.reset(jbeamData)` | Remet à zéro le lisseur de pression et les coefficients de dégâts et d'usure, et efface 'superchargerDamaged'. *(interne)* | 202 |
| `powertrain_supercharger.resetSounds(jbeamData)` | Ne fait rien (fonction vide). *(interne)* | 180 |
| `powertrain_supercharger.setBypassPressure(pressurePSI)` | Règle la pression à partir de laquelle la soupape de décharge limite la pression du compresseur. | 102 |
| `powertrain_supercharger.setPartCondition(odometer, integrity, visual)` | Applique l'usure (odomètre : pression jusqu'à 50 % à 1e9) et l'intégrité d'une pièce chargée depuis une sauvegarde. Voir le bug noté sur damagePressureCoef. *(interne)* | 77 |
| `powertrain_supercharger.updateFixedStep(dt)` | Pas de physique : multiplie assignedEngine.forcedInductionCoef par le gain de couple du compresseur (pression) moins la perte au vilebrequin. (assignée dynamiquement) *(interne)* | dyn |
| `powertrain_supercharger.updateGFX(dt)` | Frame graphique : état de l'embrayage progressif, vitesse et régime du compresseur, pulsations, pression avec soupape de décharge et lissage, perte de couple, electrics.superchargerBoost et flux 'forcedInductionInfo'. (assignée dynamiquement) *(interne)* | dyn |
| `powertrain_supercharger.updateSounds(dt)` | Règle volume et pitch du sifflement selon la pression et le régime du compresseur. *(interne)* | 106 |

### Détail des paramètres

#### `powertrain_supercharger.applyDeformGroupDamage(damageAmount)`

Réduit la pression délivrée (damagePressureCoef, jusqu'à -0.1) quand un groupe de déformation est endommagé, et signale 'inductionSystemDamaged'.

- `damageAmount` (*number*) : Quantité de dégât.

#### `powertrain_supercharger.getPartCondition()`

Renvoie l'intégrité du compresseur.

- **renvoie** : number Intégrité 0..1.
- **renvoie** : table {damagePressureCoef}.

#### `powertrain_supercharger.getTorqueCoefs()`

Estime le coefficient de gain de couple du compresseur pour chaque régime de la courbe de couple du moteur (embrayage et rapport pris en compte).

- **renvoie** : table<integer, number> Table indexée par rpm+1 : coefficient (1 = aucun gain).

#### `powertrain_supercharger.init(device, jbeamData)`

Initialise le compresseur pour un moteur : lit le jbeam, génère la courbe de pression et celle du boostController, calcule la vitesse maximale du compresseur et installe updateGFX/updateFixedStep. Si jbeamData est nil, désactive updateGFX.

- `device` (*table*) : Device moteur.
- `jbeamData` (*table|nil*) : Table jbeam 'supercharger'.

#### `powertrain_supercharger.initSounds(jbeamData)`

Crée le son de sifflement du compresseur (soundObj) sur le noeud du moteur et calcule les coefficients de volume et de pitch.

- `jbeamData` (*table*) : Table jbeam 'supercharger'.

#### `powertrain_supercharger.reset(jbeamData)`

Remet à zéro le lisseur de pression et les coefficients de dégâts et d'usure, et efface 'superchargerDamaged'.

- `jbeamData` (*table*) : Non utilisé.

#### `powertrain_supercharger.resetSounds(jbeamData)`

Ne fait rien (fonction vide).

- `jbeamData` (*table*) : Non utilisé.

#### `powertrain_supercharger.setBypassPressure(pressurePSI)`

Règle la pression à partir de laquelle la soupape de décharge limite la pression du compresseur.

- `pressurePSI` (*number*) : Pression de décharge en psi.

#### `powertrain_supercharger.setPartCondition(odometer, integrity, visual)`

Applique l'usure (odomètre : pression jusqu'à 50 % à 1e9) et l'intégrité d'une pièce chargée depuis une sauvegarde. Voir le bug noté sur damagePressureCoef.

- `odometer` (*number*) : Odomètre de la pièce.
- `integrity` (*number|table*) : Intégrité 0..1 ou table d'état.
- `visual` (*any*) : Non utilisé.

#### `powertrain_supercharger.updateFixedStep(dt)`

Pas de physique : multiplie assignedEngine.forcedInductionCoef par le gain de couple du compresseur (pression) moins la perte au vilebrequin. (assignée dynamiquement)

- `dt` (*number*) : Pas de physique (s). Non utilisé.

#### `powertrain_supercharger.updateGFX(dt)`

Frame graphique : état de l'embrayage progressif, vitesse et régime du compresseur, pulsations, pression avec soupape de décharge et lissage, perte de couple, electrics.superchargerBoost et flux 'forcedInductionInfo'. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps de la frame (s).

#### `powertrain_supercharger.updateSounds(dt)`

Règle volume et pitch du sifflement selon la pression et le régime du compresseur.

- `dt` (*number*) : Pas de temps (s). Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `isExisting` | boolean | Toujours true : indique au moteur qu'un compresseur existe. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/supercharger.lua`.*

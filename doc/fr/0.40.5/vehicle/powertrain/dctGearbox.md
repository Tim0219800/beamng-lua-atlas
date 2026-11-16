# `powertrain_dctGearbox`

*Fichier : `lua/vehicle/powertrain/dctGearbox.lua` · VM : Véhicule · 500 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `dctGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `dctGearbox` : boîte à double embrayage (DCT). Elle contient deux embrayages internes (voie 1 et voie 2) qui reçoivent chacun un rapport pré-sélectionné (setGearIndex1 / setGearIndex2). Elle est de catégorie `clutchlike` et `gearbox` : le moteur la prend directement pour enfant (le parent doit être un moteur) et lit sa valeur `torqueDiff`. Les taux d'embrayage viennent de `electrics.values.clutchRatio1` et `clutchRatio2`, pilotés par un contrôleur de boîte DCT. Modes : 'neutral', 'park', ou autre (marche avant/arrière selon les rapports).

## Exemple

```lua
local dct = powertrain.getDevice("gearbox")
dct:setGearIndex1(1)   -- voie 1 sur le 1er rapport
dct:setGearIndex2(2)   -- voie 2 pré-sélectionnée sur le 2e
-- le contrôleur règle electrics.values.clutchRatio1 / clutchRatio2
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, friction (N·m), dynamicFriction, torqueLossCoef (0..1, lu mais non utilisé dans les calculs de ce fichier), additionalEngineInertia (kg·m², lue par le moteur), electricsClutchRatio1Name ('clutchRatio1'), electricsClutchRatio2Name ('clutchRatio2'), clutchStiffness (1), lockDampRatio1 / lockDampRatio2 (0.15), lockTorque (N·m, sinon 1.25 * couple max moteur + inertie * régime max), lockSpring (N·m/rad, sinon calculé), parkLockTorque (1000), parkLockDampRatio (0.4), parkLockSpring, gearRatios (liste obligatoire, même indexation que manualGearbox), gearWhineCoefs / gearWhineCoefsOutput / gearWhineCoefsInput, gearboxNode_nodes, breakTriggerBeam, et pour les sons : gearWhineOutputEvent, gearWhineInputEvent, forward/reverse Input/Output PitchCoef, gearWhine*Smoothing.
- Indexation des rapports : identique à manualGearbox. gearRatios[0] est le neutre, valeurs >= 0 = marche avant, valeurs < 0 = marche arrière (la première valeur négative de la liste prend l'indice le plus bas).
- Champs principaux : inputAV (rad/s, = parent.outputAV1), outputAV1 (rad/s, posé par l'enfant), outputTorque1 (N·m), gearRatio1 / gearRatio2 (rapports des deux voies), gearIndex1 / gearIndex2, clutchAV1 / clutchAV2 (vitesses en sortie de chaque embrayage, = outputAV1 * gearRatioN * lockCoef), clutchRatio1 / clutchRatio2 (0..1), clutchRatio (max des deux), clutchAngle1 / clutchAngle2 (rad), torqueDiff1 / torqueDiff2 (N·m transmis par chaque embrayage), torqueDiff (somme, vue par le moteur comme couple de charge), lockTorque, minGearIndex, maxGearIndex, maxGearRatio, minGearRatio, cumulativeInertia1/2, cumulativeGearRatio (rapport de la voie la plus embrayée), mode, lockCoef.
- Si le régime d'entrée est inférieur à la moitié du régime de ralenti du moteur (inputAV < idleAV * 0.5), les deux embrayages sont forcés ouverts (anti-calage).
- Incohérences : le device n'a pas de champs gearIndex ni gearRatio utiles (gearRatio vaut toujours 0), alors que updateSounds les lit : les coefficients de bruit d'engrenage utilisent alors gearWhineCoefs[nil] = 0 et gearRatio >= 0 est toujours vrai (hauteur « avant »). setPartCondition ne gère pas isBroken (pas de onBreak sur ce device).
- calculateInertia lit device.clutchRatio1/2 (valeurs de la dernière image) pour choisir cumulativeGearRatio ; il n'y a pas de garde contre une inertie parent nulle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_dctGearbox.new(jbeamData)` | Construit la boîte DCT : table des rapports (avant/arrière), paramètres des deux embrayages et du verrou de parking, coefficients de bruit d'engrenage, puis pré-sélectionne les rapports 1 et 2. *(interne)* | 351 |

### Détail des paramètres

#### `powertrain_dctGearbox.new(jbeamData)`

Construit la boîte DCT : table des rapports (avant/arrière), paramètres des deux embrayages et du verrou de parking, coefficients de bruit d'engrenage, puis pré-sélectionne les rapports 1 et 2.

- `jbeamData` (*table*) : Données jbeam du composant (gearRatios obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, gearbox=true} : le moteur le reconnaît comme embrayage. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData). velocityUpdate/torqueUpdate dépendent du mode (normal, neutral, park).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Réduit le coefficient de couple de verrouillage (damageLockTorqueCoef, minimum 0.2) selon les dégâts. | 145 |
| `device:calculateInertia()` | Calcule les inerties cumulées de chaque voie (bornées à la moitié de l'inertie du moteur), les ressorts et amortissements des deux embrayages, l'angle d'embrayage maximal, le verrou de parking et les rapports cumulés. | 233 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (selon damageLockTorqueCoef) et la table {damageLockTorqueCoef}. | 162 |
| `device:initSounds(jbeamData)` | Crée les boucles sonores d'engrenage (entrée et sortie), les lisseurs et les coefficients de hauteur depuis le jbeam, et règle le paramètre FMOD c_gearboxMaxPower. | 281 |
| `device:reset(jbeamData)` | Réinitialise l'état des deux embrayages, des couples et des coefficients d'usure/dégâts, puis pré-sélectionne les rapports 1 et 2. | 315 |
| `device:resetSounds()` | Remet à zéro les lisseurs et valeurs de son d'engrenage. | 269 |
| `device:setGearIndex1(index)` | Pré-sélectionne le rapport de la voie 1 (indice borné à [minGearIndex, maxGearIndex]) et recalcule l'inertie du groupe motopropulseur. | 211 |
| `device:setGearIndex2(index)` | Pré-sélectionne le rapport de la voie 2 (indice borné) et recalcule l'inertie du groupe motopropulseur. | 220 |
| `device:setLock(enabled)` | Verrouille (lockCoef = 0) ou déverrouille (1) la transmission. | 229 |
| `device:setMode(mode)` | Change le mode ('neutral', 'park' ou autre) sans validation, et sélectionne les fonctions de mise à jour correspondantes. 'park' remet parkEngaged à 0. | 206 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'usure (couple de verrouillage de 1 à 0.7 entre 30000 km et 500000 km) et les dégâts (intégrité nombre 0..1 ou table {damageLockTorqueCoef}). | 149 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : calcule les deux couples d'embrayage (ressort sur l'angle d'embrayage + amortissement, bornés par lockTorque), torqueDiff = somme et outputTorque1 = somme des couples * rapports. En neutre : tout à 0. En park : couple de verrouillage de parking. | 111 |
| `device:updateSounds(dt)` | Met à jour volume et hauteur des boucles sonores d'engrenage (entrée et sortie) d'après vitesses et couples lissés. Appelée à chaque image. | 19 |
| `device:validate()` | Vérifie que le parent est un moteur (sinon erreur loguée et false). Calcule lockTorque par défaut, et les valeurs attendues (couple, vitesse, puissance) pour normaliser les sons. | 172 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = parent.outputAV1 ; clutchAV1/2 = outputAV1 * gearRatio1/2 * lockCoef. N'écrit pas de vitesse dans le parent : le moteur lit torqueDiff directement. | 105 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/dctGearbox.lua`.*

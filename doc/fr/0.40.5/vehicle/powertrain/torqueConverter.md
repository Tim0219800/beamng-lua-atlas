# `powertrain_torqueConverter`

*Fichier : `lua/vehicle/powertrain/torqueConverter.lua` · VM : Véhicule · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `torqueConverter` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Convertisseur de couple hydraulique d'une boîte automatique, avec embrayage de verrouillage (lockup). Il se branche derrière un moteur (le parent doit être un device de catégorie engine) et transmet un couple dépendant de l'écart de vitesse entre pompe (entrée) et turbine (sortie), avec multiplication de couple jusqu'à stallTorqueRatio à bas régime de turbine. Le verrouillage est piloté par la valeur electrics 'lockupClutchRatio' (0 ouvert, 1 verrouillé). Un moddeur l'utilise via le jbeam powertrain (type torqueConverter) et lit device.outputTorque1 / inputAV / outputAV1.

## Exemple

```lua
-- jbeam (section powertrain) : ["torqueConverter", "torqueConverter", "mainEngine", 1, {"stallTorqueRatio":1.8, "lockupClutchTorque":300}]
local tc = powertrain.getDevice('torqueConverter')
print(tc.inputAV, tc.outputAV1, tc.outputTorque1)
```

## Remarques

- Unités : vitesses angulaires en rad/s, couples en N·m, inerties en kg·m², fluidDensity 844 kg/m³ (fixe), converterDiameter en m.
- Clés jbeam : lockupClutchRatioName (nom electrics du verrouillage, 'lockupClutchRatio'), lockupClutchTorque (N·m, 100), lockupClutchSpring (sinon calculé : stabilityCoef² x inertie cumulée), lockupClutchDampRatio (0.15, 1 = amortissement critique), couplingAVRatio (0.85 : rapport de vitesses au-delà duquel il n'y a plus de multiplication), stallTorqueRatio (2 : multiplication de couple maximale), converterStiffness (10), converterDiameter (0.30 m), converterTorque (N·m max ; sinon maxTorque du moteur*1.25 + maxRPM*inertie*pi/30), kFactorSmoothing (75), additionalEngineInertia (0), breakTriggerBeam ('' = annulation), inputName, inputIndex.
- Le couple de sortie est (couple_pompe * torqueRatio + couple_lockup) * impellerClutchCoef ; impellerClutchCoef (1 par défaut) peut être modifié par un contrôleur externe (ex. boîte) pour déconnecter le convertisseur.
- Catégories : clutchlike et viscouscoupling. Un seul port de sortie (outputPorts[1]) ; requiredExternalInertiaOutputs = {1}.
- L'inertie cumulée vue en amont est celle de l'enfant divisée par stallTorqueRatio ; les rapports cumulés sont multipliés par stallTorqueRatio (approximation notée 'todo' dans le code).
- Usure/dégâts : le couple de verrouillage est multiplié par damageLockupClutchTorqueCoef et wearLockupClutchTorqueCoef ; l'usure vaut 1 à 30 000 000 d'odomètre et descend à 0.2 à 500 000 000 (valeurs de l'odomètre dans l'unité interne du jeu, à confirmer).
- Particularité : M.new n'initialise pas les champs avec reset() ; reset(device, jbeamData) retourne le device (contrairement à d'autres devices).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_torqueConverter.new(jbeamData)` | Construit un convertisseur de couple à partir de la définition jbeam du composant. *(interne)* | 136 |

### Détail des paramètres

#### `powertrain_torqueConverter.new(jbeamData)`

Construit un convertisseur de couple à partir de la définition jbeam du composant.

- `jbeamData` (*table*) : Données jbeam du composant (name, type, inputName, inputIndex, clés listées dans notes).
- **renvoie** : table Objet device (voir la classe device).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | Catégories : clutchlike, viscouscoupling. |
| `outputPorts` | table<integer, boolean> | Ports de sortie : {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | Sorties dont l'inertie est fournie de l'extérieur : {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData). Champs utiles : inputAV (rad/s, vitesse pompe = vitesse de sortie du moteur), outputAV1 (rad/s, vitesse turbine, écrite par l'enfant), outputTorque1 (N·m), torqueDiff (N·m, couple de réaction sur l'entrée), lockupClutchAngle (rad), impellerClutchCoef, isBroken, mode.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Réduit le couple de verrouillage quand un groupe de déformation est endommagé (retire jusqu'à 0.05 par 0.01 de dégât) puis recalcule l'inertie. | 52 |
| `device:calculateInertia()` | Calcule inertie cumulée, rapports cumulés, raideur et amortissement du verrouillage (lockupClutchSpring/Damp) et l'angle maximal de lockup à partir du premier enfant. | 97 |
| `device:getPartCondition()` | Renvoie l'état de condition de la pièce. | 73 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, état de casse, angle de lockup, coefficients de dégâts/usure. | 117 |
| `device:setMode(mode)` | Mémorise le mode et réinstalle les fonctions velocityUpdate/torqueUpdate (le mode n'a pas d'autre effet dans ce fichier). | 92 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique un état d'usure/intégrité (jeu de sauvegarde de pièces) : usure selon l'odomètre et coefficient de dégât selon l'intégrité. | 58 |
| `device:torqueUpdate(dt)` | Pas de physique, étape couples : calcule le couple hydraulique (facteur K lissé, limité à converterTorque), la multiplication de couple (jusqu'à stallTorqueRatio) et le couple de lockup (ressort/amortisseur limité à lockupClutchTorque), puis outputTorque1 et torqueDiff. | 21 |
| `device:validate()` | Vérifie que le parent est un moteur (catégorie engine) et fixe converterTorque par défaut. Appelée à l'initialisation du powertrain. | 80 |
| `device:velocityUpdate(dt)` | Pas de physique, étape vitesses : recopie la vitesse de sortie du moteur parent (parent.outputAV1) dans inputAV. Choisi par selectUpdates (modifiable via setMode). | 17 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/torqueConverter.lua`.*

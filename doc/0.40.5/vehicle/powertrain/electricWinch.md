# `powertrain_electricWinch`

*Fichier : `lua/vehicle/powertrain/electricWinch.lua` · VM : Véhicule · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `electricWinch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `electricWinch` : treuil électrique très sommaire, de catégorie `winch` et `torqueConsumer`, sans port de sortie. Son code est un prototype : à chaque pas physique il tire sur la poutre étiquetée `ropeTest` avec une force fixe de 500000 N multipliée par le niveau d'allumage, sans paramètre jbeam de réglage. Un moddeur ne s'en sert pas en pratique ; voir hydraulicWinch (vide) et linearActuator pour des actionneurs réels.

## Remarques

- Aucune clé jbeam propre au treuil n'est lue, hormis name, type, inputName, inputIndex, gearRatio (1), friction et dynamicFriction.
- Le comportement est codé en dur : torqueUpdate appelle obj:actuateBeam(beamstate.tagBeamMap.ropeTest[1], force, 10, 0, 0, 10, 0, 100, 0, 0) avec force = -electrics.values.ignitionLevel * 500000. Si aucune poutre n'est taguée 'ropeTest', beamstate.tagBeamMap.ropeTest est nil et une erreur Lua se produit.
- outputTorque1 est toujours 0. inputAV = outputAV1 * gearRatio ; la valeur est écrite dans le champ de vitesse du parent (device.parent[parentOutputAVName]).
- Incohérences : calculateInertia lit device.maxGearRatio qui n'est jamais défini (maxCumulativeGearRatio devient nil) et la division par gearRatio² avec une inertie de sortie 0 donne 0 ; new ne définit ni onBreak ni validate, alors que setPartCondition appelle device:onBreak() si isBroken. M.requiredExternalInertiaOutputs n'est pas défini dans ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_electricWinch.new(jbeamData)` | Construit le device treuil avec les champs standard (gearRatio, friction, coefficients d'usure/dégâts, inertie) et les fonctions de mise à jour. Il n'appelle pas selectUpdates : velocityUpdate et torqueUpdate sont posées directement. *(interne)* | 77 |

### Détail des paramètres

#### `powertrain_electricWinch.new(jbeamData)`

Construit le device treuil avec les champs standard (gearRatio, friction, coefficients d'usure/dégâts, inertie) et les fonctions de mise à jour. Il n'appelle pas selectUpdates : velocityUpdate et torqueUpdate sont posées directement.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {winch=true, torqueConsumer=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 24 |
| `device:calculateInertia()` | Pose cumulativeInertia = 0 (inertie de sortie nulle) et les rapports cumulés (maxCumulativeGearRatio reste nil, voir notes). | 52 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et la table {damageFrictionCoef, isBroken}. | 43 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, inertie cumulée, coefficients d'usure/dégâts et isBroken ; relit friction. | 61 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure et dégâts selon l'odomètre et l'intégrité ; appelle onBreak si l'état indique isBroken, mais ce device ne définit pas onBreak. | 28 |
| `device:torqueUpdate()` | Appelée à chaque pas physique : met outputTorque1 à 0 et actionne la première poutre étiquetée 'ropeTest' avec une force de -ignitionLevel * 500000 N, vitesse limite 10 et course 0 à 100. | 15 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le parent. | 10 |

## Appels vers le moteur (C++)

- `obj:` `actuateBeam`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/electricWinch.lua`.*

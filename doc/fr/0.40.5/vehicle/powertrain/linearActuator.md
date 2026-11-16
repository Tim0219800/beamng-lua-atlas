# `powertrain_linearActuator`

*Fichier : `lua/vehicle/powertrain/linearActuator.lua` · VM : Véhicule · 211 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `linearActuator` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `linearActuator` : vérin à vis (actionneur linéaire mécanique) entraîné par un arbre. Il transforme le couple d'entrée en force axiale sur des poutres (obj:screwBeam) repérées par les tags `beamTags` et mesure la vitesse d'extension, qu'il renvoie à son parent comme vitesse de rotation (vitesse / pas de vis). Catégorie `torqueConsumer`, sans port de sortie. Utile pour benne, plateforme ou vérin électrique. Il suit l'extension (`currentExtend`, `currentExtendPercent`).

## Exemple

```lua
local act = powertrain.getDevice("tailgateActuator")
print(act.currentExtend, act.currentExtendPercent, act.velocity) -- m, 0..1, m/s
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction, electricsName, virtualInertia (kg·m², 2), minExtend (m, 1), maxExtend (m, 2), frictionForce (N, 1), speedLimit (m/s, 100), movementIntentElectricsName, node, screwDiameter (m, 0.05), leadMillimeterPerRevolution (mm par tour, OBLIGATOIRE), beamTags (liste de tags de poutres), breakTriggerBeam.
- Champs principaux : inputAV (rad/s côté parent = velocity / pas par radian * gearRatio), velocity (m/s, moyenne sur les poutres), currentExtend (m, moyenne des longueurs de poutre), currentExtendPercent (0..1 entre minExtend et maxExtend), minExtend, maxExtend, screwDiameter, invLeadRadian (rad/m), leadAngle (rad), actuatorBeams (liste de cid de poutres), actuatorBeamCount, speedLimit, frictionForce, cumulativeInertia (virtualInertia / gearRatio²), isBroken. outputTorque1/outputAV1 existent mais valent 0.
- La force de vis = couple net * gearRatio / screwDiameter, répartie à parts égales entre les poutres. Si movementIntentElectricsName est défini et que sa valeur est exactement 0, la vitesse remontée est forcée à 0 (le vérin est considéré à l'arrêt).
- Bugs / pièges : new plante si leadMillimeterPerRevolution est absent (division nil), et invActuatorBeamCount = 1 / 0 = inf si aucune poutre ne porte les tags demandés (velocity et currentExtend deviennent alors nan). onBreak ne déconnecte rien (le obj:breakBeam est commenté) : le vérin cassé continue de fonctionner. M.requiredExternalInertiaOutputs n'est pas défini dans ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_linearActuator.new(jbeamData)` | Construit le vérin à vis : géométrie de la vis (diamètre, pas, angle d'hélice), limites d'extension, vitesse limite et liste des poutres motrices à partir des tags beamTags. *(interne)* | 128 |

### Détail des paramètres

#### `powertrain_linearActuator.new(jbeamData)`

Construit le vérin à vis : géométrie de la vis (diamètre, pas, angle d'hélice), limites d'extension, vitesse limite et liste des poutres motrices à partir des tags beamTags.

- `jbeamData` (*table*) : Données jbeam du composant (leadMillimeterPerRevolution obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {torqueConsumer=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 52 |
| `device:calculateInertia()` | Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio. | 90 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}. | 71 |
| `device:onBreak()` | Marque le vérin comme cassé (isBroken = true) et réselectionne les mises à jour (sans effet réel). | 84 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, extension, coefficients d'usure/dégâts et isBroken ; relit gearRatio et friction. | 103 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure (coefficient de 1 à 1.5) et dégâts selon l'odomètre et l'intégrité ; appelle onBreak si isBroken. | 56 |
| `device:torqueUpdate()` | Appelée à chaque pas physique : calcule la force de vis depuis le couple parent (moins frottements), l'applique à chaque poutre par obj:screwBeam avec minExtend/maxExtend/speedLimit, puis met à jour velocity, currentExtend et currentExtendPercent. | 21 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 80 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = velocity * invLeadRadian * gearRatio, écrit dans le parent ; outputAV1 = 0. | 14 |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`, `screwBeam`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/linearActuator.lua`.*

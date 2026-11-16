# `powertrain_centrifugalClutch`

*Fichier : `lua/vehicle/powertrain/centrifugalClutch.lua` · VM : Véhicule · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `centrifugalClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Type de device powertrain `centrifugalClutch` : embrayage centrifuge (catégories clutchlike et clutch) placé directement après un moteur thermique. Il s'engage automatiquement avec le régime d'entrée (entre engageRPMStart et engageRPMEnd) : le taux d'engagement clutchRatio passe de 0 à 1, et le couple transmis suit un ressort/amortisseur sur l'angle d'embrayage, limité par lockTorque. Il modélise aussi l'échauffement (température, efficacité thermique, fumée, dommage permanent) et l'usure. Utile pour scooters, karts, tondeuses… Le parent doit être un moteur (catégorie engine) et il a un seul enfant sur le port 1.

## Exemple

```lua
// jbeam (section powertrain) : {"name":"clutch","type":"centrifugalClutch","inputName":"mainEngine","inputIndex":1, "engageRPMStart":1500, "engageRPMEnd":2500}
```

## Remarques

- CLÉS JBEAM : engageRPMStart (défaut 800), engageRPMEnd (1100), lockTorque (défaut calculé dans validate : couple max moteur x 1.25 + maxRPM x inertie moteur x pi/30), lockSpring (sinon dérivé de powertrain.stabilityCoef), lockSpringCoef (1), lockDampRatio (0.15, 1 = amortissement critique), lockDampSmoothing (0), clutchAngleSmoothing (0), clutchStiffness (1), clutchFreePlay (0.125 rad), additionalEngineInertia (0, ajoutée à l'inertie du moteur), thermalsEnabled (défaut true), coolingCoef (0.8), maxClutchTemp (300, °C, dommage permanent au-delà), warningTemp (100 °C), maxSafeClutchTemp (150 °C), clutchOverheatRange (100 °C), clutchMass (1 kg), clutchSpecificHeat (490), electricsClutchRatioName (lu mais jamais utilisé dans ce fichier).
- CHAMPS : inputAV (rad/s, = outputAV1 du parent), outputAV1 (rad/s vers l'enfant), outputTorque1 et torqueDiff (couple transmis, N·m ; le moteur lit torqueDiff comme charge), clutchRatio (0..1), clutchAngle, lockSpring, lockDamp, maxClutchAngle, lockTorque, clutchTemperature (°C), thermalEfficiency (0.5..1, 0.25 si endommagé), clutchPermanentlyDamaged, frictionLossPerUpdate (énergie dissipée), damage*/wear* Coef. Le rapport du device est fixe (gearRatio = 1).
- Fonctionnement : le couple est clamp(min(1,|angle libre|) x |angle libre| x sign x lockSpring + amortissement x clutchRatio, ± lockTorque x thermalEfficiency x damage x wear) (ressort quadratique puis linéaire après 1 rad) ; la dissipation torqueDiff x ΔAV x dt chauffe l'embrayage, qui se refroidit vers la température extérieure.
- Messages UI de température : « High clutch temperature... », « Clutch overheating... », « Clutch permanently damaged! » (toutes les 0.9 s). Flux UI 'clutchThermalData' envoyé si demandé. Fumée de l'embrayage via obj:addParticleByNodesRelative sur transmissionNodeID de l'enfant.
- Incohérences repérées : le device n'a pas de méthode onBreak ; si une poutre de breakTriggerBeam est définie ou si setPartCondition reçoit isBroken, powertrain appellerait device:onBreak() (nil). validate loggue sous le tag 'frictionClutch.validate' (copié d'un autre fichier). updateGFX suppose device.children[1] existant (plante sans enfant).
- Pas de méthode setMode : powertrain.setDeviceMode ne s'y applique pas (device.availableModes absent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_centrifugalClutch.new(jbeamData)` | Fabrique du device appelée par powertrain.init pour une entrée jbeam de type 'centrifugalClutch'. Lit les clés jbeam (voir notes) et renvoie le device. *(interne)* | 232 |

### Détail des paramètres

#### `powertrain_centrifugalClutch.new(jbeamData)`

Fabrique du device appelée par powertrain.init pour une entrée jbeam de type 'centrifugalClutch'. Lit les clés jbeam (voir notes) et renvoie le device.

- `jbeamData` (*table*) : Données jbeam du device.
- **renvoie** : table Le device centrifugalClutch.

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike = true, clutch = true}. clutchlike est requis par le moteur combustionEngine pour ses enfants. |
| `outputPorts` | table<integer, boolean> | {[1] = true} : un seul port de sortie. |
| `requiredExternalInertiaOutputs` | integer[] | {1} : powertrain ajoute un arbre factice (dummy shaft) sur ce port si aucun enfant n'y est branché. |

## Classe `device`

Objet renvoyé par new(jbeamData). Méthodes appelées par powertrain.lua.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Applique un dégât de déformation : augmente le jeu libre et réduit le couple de verrouillage (plancher 0.2), puis recalcule l'inertie. | 123 |
| `device:calculateInertia()` | Reprend inertie et rapports de l'enfant (inertie plafonnée à la moitié de celle du moteur) et recalcule lockSpring, lockDamp et maxClutchAngle. | 178 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si dommage permanent) et la table d'état {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}. | 149 |
| `device:reset(jbeamData)` | Remet tous les états à leurs valeurs initiales (vitesses, angle, température extérieure, usure et dommages) puis sélectionne les fonctions de mise à jour. | 202 |
| `device:setLock(enabled)` | Verrouille/déverrouille le chauffage de l'embrayage : enabled = true met clutchThermalsCoef à 0 (plus d'énergie dissipée comptée comme chaleur), false à 1. | 119 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure (odomètre) et intégrité (nombre ou table d'état) : coefficients de jeu libre et de couple de verrouillage, état de dommage permanent ; recalcule l'inertie. | 129 |
| `device:torqueUpdate(dt)` | Pas de physique (couples) : calcule clutchRatio d'après le régime d'entrée, l'angle d'embrayage et le couple transmis (torqueDiff = outputTorque1), et accumule la perte par friction. | 84 |
| `device:updateGFX(dt)` | Une fois par frame : calcule l'énergie dissipée dans l'embrayage et son refroidissement, met à jour clutchTemperature (bornée à [température extérieure, maxClutchTemp]) et thermalEfficiency, produit la fumée et les messages d'avertissement, signale un dommage permanent, remet frictionLossPerUpdate à 0 et publie 'clutchThermalData'. | 20 |
| `device:validate()` | Vérifie que le parent est un moteur (catégorie engine), sinon log d'erreur et renvoie false (avorte l'init). Calcule lockTorque par défaut. | 166 |
| `device:velocityUpdate(dt)` | Pas de physique (vitesses) : inputAV = vitesse de sortie du parent (outputAV1 du moteur). | 80 |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/centrifugalClutch.lua`.*

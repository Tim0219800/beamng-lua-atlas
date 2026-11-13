# `powertrain_frictionClutch`

*Fichier : `lua/vehicle/powertrain/frictionClutch.lua` · VM : Véhicule · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `frictionClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `frictionClutch` : embrayage à friction placé juste après un moteur (le parent doit être de catégorie `engine`). Il modélise un ressort de verrouillage sur un angle d'embrayage, un amortissement, un jeu libre, l'usure/dégâts et un modèle thermique (température, efficacité, fumée, messages au joueur, dommage permanent). Le taux d'embrayage vient de `electrics.values.clutchRatio` (1 = embrayé, 0 = débrayé). Un moddeur règle ses paramètres dans le jbeam ou lit sa température.

## Exemple

```lua
local clutch = powertrain.getDevice("clutch")
print(clutch.clutchTemperature, clutch.thermalEfficiency) -- °C, 0.5..1 (0.25 si détruit)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, additionalEngineInertia (kg·m², défaut 0), electricsClutchRatioName (défaut 'clutchRatio'), lockDampRatio (défaut 0.15, 1 = amorti critique), lockDampSmoothing (0), clutchAngleSmoothing (0), clutchStiffness (1), clutchFreePlay (rad, 0.125), lockSpringCoef (1), lockTorque (N·m, sinon calculé dans validate), lockSpring (N·m/rad, sinon calculé), thermalsEnabled (true), coolingCoef (1), maxClutchTemp (°C, 500, dommage permanent), warningTemp (200), maxSafeClutchTemp (300), clutchOverheatRange (100), clutchMass (kg, 10), clutchSpecificHeat (J/kg/K, 490).
- Champs principaux : inputAV (rad/s, = parent.outputAV1), outputAV1 (rad/s, fixé par l'enfant/le powertrain), outputTorque1 (N·m, couple transmis = torqueDiff), torqueDiff, clutchAngle (rad), clutchRatio, lockTorque (N·m max transmissible), lockSpring, lockDamp, maxClutchAngle, thermalEfficiency (0.5 à 1, 0.25 si clutchPermanentlyDamaged), clutchTemperature (°C), clutchPermanentlyDamaged, cumulativeInertia, cumulativeGearRatio (gearRatio fixe à 1).
- Le couple transmis est limité à ± lockTorque * thermalEfficiency * damageLockTorqueCoef * wearLockTorqueCoef. Le ressort est quadratique jusqu'à 1 rad puis linéaire.
- La chaleur injectée est frictionLossPerUpdate = somme de torqueDiff * (inputAV - outputAV1) * dt (joules) ; elle est remise à 0 dans updateGFX. setLock(true) coupe cet apport (clutchThermalsCoef = 0).
- updateGFX envoie le flux GUI 'clutchThermalData' si le flux est demandé, affiche des messages 'High clutch temperature...', 'Clutch overheating...', 'Clutch permanently damaged!' et déclenche damageTracker.setDamage('powertrain', nom, true).
- Bug mineur : si l'enfant 1 n'existe pas, updateGFX indexe device.children[1].transmissionNodeID sans vérification quand le timer de fumée atteint 1 (erreur potentielle si device.children est vide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_frictionClutch.new(jbeamData)` | Construit le device frictionClutch : coefficients d'usure/dégâts, lissages, paramètres thermiques (température d'alerte, de sécurité, de destruction, masse et chaleur spécifique) et sélectionne velocityUpdate/torqueUpdate. *(interne)* | 232 |

### Détail des paramètres

#### `powertrain_frictionClutch.new(jbeamData)`

Construit le device frictionClutch : coefficients d'usure/dégâts, lissages, paramètres thermiques (température d'alerte, de sécurité, de destruction, masse et chaleur spécifique) et sélectionne velocityUpdate/torqueUpdate.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true} : un seul port de sortie. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1} : le port 1 reçoit son inertie de l'extérieur (le powertrain gère l'inertie côté sortie). |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le jeu libre (damageClutchFreePlayCoef) et réduit le couple de verrouillage (min 0.2) selon les dégâts, puis recalcule l'inertie. | 123 |
| `device:calculateInertia()` | Prend l'inertie et les rapports cumulés du premier enfant, borne l'inertie à la moitié de celle du moteur, et calcule lockSpring, lockDamp et maxClutchAngle. | 178 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (minimum entre jeu libre et couple de verrouillage, 0 si détruit) et la table d'état correspondante. | 149 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, angle, lisseurs, température (à celle de l'environnement), coefficients d'usure/dégâts et état de dommage permanent. | 202 |
| `device:setLock(enabled)` | Active ou non le « verrouillage » thermique : si enabled est vrai, l'embrayage ne chauffe plus (clutchThermalsCoef = 0), sinon il chauffe normalement. | 119 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure (selon l'odomètre) et dégâts (selon l'intégrité : nombre 0..1 ou table) puis recalcule l'inertie. Restaure aussi clutchPermanentlyDamaged. | 129 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : intègre l'angle d'embrayage selon la différence de vitesse, applique jeu libre et ressort/amortissement, borne par lockTorque, écrit outputTorque1 et cumule la perte de friction. | 83 |
| `device:updateGFX(dt)` | Mise à jour non physique (une fois par image) : échauffement et refroidissement de l'embrayage, efficacité thermique, fumée, messages d'alerte, dommage permanent, envoi du flux GUI 'clutchThermalData'. Remet frictionLossPerUpdate à 0. | 19 |
| `device:validate()` | Vérifie que le parent est un moteur (deviceCategories.engine), sinon journalise des erreurs et renvoie false. Calcule lockTorque par défaut = 1.25 * couple max du moteur + inertie du moteur * régime max (rad/s). | 166 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = parent.outputAV1. | 79 |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/frictionClutch.lua`.*

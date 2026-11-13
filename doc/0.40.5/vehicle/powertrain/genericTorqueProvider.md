# `powertrain_genericTorqueProvider`

*Fichier : `lua/vehicle/powertrain/genericTorqueProvider.lua` · VM : Véhicule · 198 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `genericTorqueProvider` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `genericTorqueProvider` : source de couple générique, de catégorie `engine`, dont le couple est simplement `desiredOutputTorque` (N·m) fixé de l'extérieur par un contrôleur ou un script (le moteur n'a ni courbe, ni papillon, ni énergie). Il retranche le frottement et expose l'interface minimale d'un moteur (scaleFriction, scaleOutputTorque, disable, enable, lockUp, getTorqueData…) pour que embrayages, boîtes et contrôleurs puissent le traiter comme un moteur. Utile pour un moteur piloté par un contrôleur personnalisé.

## Exemple

```lua
local gen = powertrain.getDevice("torqueSource")
gen.desiredOutputTorque = 120  -- N·m, à réécrire à chaque pas par votre contrôleur
print(gen.outputTorque1, gen.outputAV1)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio, cumulativeGearRatio, friction (N·m), dynamicFriction (N·m par rad/s), inertia (kg·m², défaut 0.1), torqueReactionNodes_nodes (3 nœuds, optionnel, pour la position visuelle), breakTriggerBeam.
- Champs principaux : desiredOutputTorque (N·m, à écrire de l'extérieur), outputTorque1 (N·m = couple voulu * outputTorqueState - frottement), outputAV1 (rad/s, imposée par l'aval ou le parent), outputRPM (tr/min, mis à jour dans updateGFX), outputTorqueState (0..1 ; 0 après disable/lockUp), isDisabled, friction, dynamicFriction, inertia, torqueReactionNodes.
- velocityUpdate vaut nop : un fournisseur de couple ne calcule pas de vitesse. Contrairement à electricMotor, aucune intégration de outputAV1 n'a lieu ici : celle-ci doit venir de l'aval.
- Incohérences : setIgnition, cutIgnition, activateStarter, onBreak et sons valent nop (onBreak = nop : la méthode lockUp n'est jamais appelée à la casse) ; getTorqueData renvoie des courbes vides et des zéros ; calculateInertia ne divise pas par un rapport ; clutchChild vaut {torqueDiff = 0} si aucun enfant mais n'est jamais utilisé dans ce fichier ; validate ajoute {maxRPM = 0} dans powertrain.engineData ; M.requiredExternalInertiaOutputs n'est pas défini dans ce module ; new lit v.data.nodes[...] si torqueReactionNodes_nodes a 3 éléments (erreur si un id est invalide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_genericTorqueProvider.new(jbeamData)` | Construit le fournisseur de couple avec les stubs d'interface moteur (nop pour son, allumage, démarreur) et la position visuelle déduite des nœuds de réaction de couple. *(interne)* | 124 |

### Détail des paramètres

#### `powertrain_genericTorqueProvider.new(jbeamData)`

Construit le fournisseur de couple avec les stubs d'interface moteur (nop pour son, allumage, démarreur) et la position visuelle déduite des nœuds de réaction de couple.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Prend l'inertie et le rapport cumulés du premier enfant comme cumulativeInertia et cumulativeGearRatio. | 92 |
| `device:disable()` | Coupe le couple : outputTorqueState = 0 et isDisabled = true. | 34 |
| `device:enable()` | Rétablit le couple : outputTorqueState = 1 et isDisabled = false. | 39 |
| `device:getTorqueData()` | Renvoie une table de courbe de couple vide : {maxRPM=0, curves={}, maxTorque=0, maxPower=0, maxTorqueRPM=0, maxPowerRPM=0, finalCurveName=1, deviceName, vehicleID}. | 15 |
| `device:lockUp()` | Identique à disable : coupe le couple et marque isDisabled (pas de blocage de vitesse ici). | 44 |
| `device:reset(jbeamData)` | Remet à zéro vitesse, couple, couple voulu, outputTorqueState et isDisabled ; relit friction, dynamicFriction et inertia du jbeam. | 106 |
| `device:scaleFriction(friction)` | Multiplie le frottement (friction) par le facteur donné. | 26 |
| `device:scaleOutputTorque(state)` | Multiplie outputTorqueState par state (cumulatif). | 30 |
| `device:sendTorqueData(data)` | Envoie l'événement GUI 'TorqueCurveChanged' avec les données de courbe (calculées si non fournies). | 19 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : outputTorque1 = desiredOutputTorque * outputTorqueState - couple de frottement (limité par la vitesse * inertie * 2000 pour la stabilité). | 55 |
| `device:updateGFX(dt)` | Mise à jour par image : outputRPM = outputAV1 en tr/min. | 49 |
| `device:validate()` | Si le device n'a pas d'enfant, pose clutchChild = {torqueDiff = 0} ; enregistre le moteur dans powertrain.engineData ; sélectionne les fonctions de mise à jour. | 77 |
| `device:velocityUpdate()` | Toujours nop. | dyn |

**Évènements UI (guihooks.trigger) :** `TorqueCurveChanged`

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/genericTorqueProvider.lua`.*

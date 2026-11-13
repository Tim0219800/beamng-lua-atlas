# `powertrain_cvtGearbox`

*Fichier : `lua/vehicle/powertrain/cvtGearbox.lua` · VM : Véhicule · 256 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `cvtGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `cvtGearbox` : boîte à variation continue (CVT) à rapport variable entre minGearRatio et maxGearRatio. Le rapport n'est pas choisi par ce fichier : un contrôleur extérieur appelle setGearRatio chaque pas. Les modes possibles sont posés par setMode : 'neutral' (masse virtuelle), 'park' (verrou de parking par ressort), 'reverse' (inverse le sens), sinon marche avant. Un accouplement visqueux à sens unique empêche le recul. Le fichier ne contient pas de logique de commande automatique.

## Exemple

```lua
local cvt = powertrain.getDevice("gearbox")
cvt:setMode("drive")      -- tout mode autre que neutral/park/reverse = marche avant
cvt:setGearRatio(1.2)     -- borné à [minGearRatio, maxGearRatio]
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (valeur de départ, immédiatement écrasée par maxGearRatio), friction (N·m), dynamicFriction (N·m par rad/s), torqueLossCoef (0..1), minGearRatio (0.5), maxGearRatio (2.5), parkLockSpring (N·m/rad, sinon calculé), parkLockTorque (N·m, 1000), parkLockDampRatio (0.4), oneWayViscousCoef (5), oneWayViscousTorque (= oneWayViscousCoef * 25), oneWayViscousSmoothing (50), gearboxNode_nodes (premier nœud = transmissionNodeID), breakTriggerBeam.
- Champs principaux : inputAV (rad/s côté moteur/embrayage = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef), outputAV1 (rad/s, posé par l'enfant), outputTorque1 (N·m), gearRatio (rapport courant, borné), minGearRatio, maxGearRatio, mode ('neutral', 'park', 'reverse' ou autre), reverseGearRatioCoef (+1 ou -1), lockCoef (0 si setLock(true)), virtualMassAV, parkEngaged (0 ou 1), parkClutchAngle (rad), cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken. gearCount, minGearIndex, maxGearIndex et gearIndex valent toujours 1 (compatibilité avec les boîtes à rapports).
- Park : le verrou ne s'engage (parkEngaged = 1) que lorsque |outputAV1| < 100 rad/s, puis applique un couple ressort/amortisseur sur parkClutchAngle, borné par maxParkClutchAngle = parkLockTorque / parkLockSpring.
- Le couple de sortie est (couple d'entrée - frottement) * gearRatio - couple visqueux à sens unique, multiplié par reverseGearRatioCoef et lockCoef.
- Bug : setPartCondition appelle device:onBreak() si l'état contient isBroken = true, mais cvtGearbox ne définit pas onBreak (erreur Lua). Il n'y a pas non plus de logique pour isBroken dans selectUpdates.
- calculateInertia divise par maxGearRatio² et calcule invCumulativeInertia = 1 / cumulativeInertia sans garde contre une inertie nulle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_cvtGearbox.new(jbeamData)` | Construit la boîte CVT : paramètres de rapport minimal/maximal, verrou de parking, accouplement à sens unique, puis règle le rapport sur maxGearRatio. *(interne)* | 180 |

### Détail des paramètres

#### `powertrain_cvtGearbox.new(jbeamData)`

Construit la boîte CVT : paramètres de rapport minimal/maximal, verrou de parking, accouplement à sens unique, puis règle le rapport sur maxGearRatio.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData). velocityUpdate/torqueUpdate dépendent du mode (normal, neutral, park).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 82 |
| `device:calculateInertia()` | Prend l'inertie et les rapports cumulés du premier enfant ; calcule cumulativeInertia (divisée par maxGearRatio²), les paramètres du verrou de parking (ressort, amortissement, angle max) et les rapports cumulés. | 130 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}. | 101 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, masse virtuelle, coefficients, lisseur de sens unique et angle de parking, puis règle le rapport sur maxGearRatio. | 152 |
| `device:setGearRatio(ratio)` | Fixe le rapport courant, borné entre minGearRatio et maxGearRatio. Appelée par un contrôleur de CVT. | 120 |
| `device:setLock(enabled)` | Verrouille (lockCoef = 0 : aucune vitesse ni couple transmis) ou déverrouille (1) la transmission. | 126 |
| `device:setMode(mode)` | Change le mode de la boîte (aucune validation de la chaîne). 'reverse' inverse le sens (reverseGearRatioCoef = -1) ; 'neutral' et 'park' sélectionnent des fonctions de mise à jour dédiées avec masse virtuelle ; toute autre valeur = marche avant. | 114 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table {damageFrictionCoef, isBroken}). Appelle onBreak si isBroken, qui n'est pas défini sur ce device (voir notes). | 86 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : calcule outputTorque1 selon le mode. Normal : transmission avec frottement et accouplement à sens unique ; neutre : couple de sortie 0 et accélération de la masse virtuelle ; park : couple de verrouillage ressort/amortisseur. | 48 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 110 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef, écrit dans le parent. En neutre et en park : utilise la masse virtuelle. | 43 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/cvtGearbox.lua`.*

# `powertrain_differential`

*Fichier : `lua/vehicle/powertrain/differential.lua` · VM : Véhicule · 425 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `differential` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `differential` : répartit le couple d'entrée sur deux sorties (port 1 et port 2) et calcule la vitesse d'entrée à partir des deux sorties. Plusieurs types (`diffType` du jbeam, modifiables en jeu via setMode) : `open`, `torqueVectoring`, `lsd`, `viscous`, `locked`, `dually`, `activeLock`. Il gère aussi un rapport de couple conique (gearRatio), les pertes par frottement, une limite de vitesse de glissement, l'usure et les dégâts. Un moddeur le déclare dans le jbeam `powertrain` et peut changer son mode ou régler le verrouillage actif (`activeLockCoef`).

## Exemple

```lua
local diff = powertrain.getDevice("differential_R")
diff:setMode("locked") -- doit figurer dans diffType du jbeam
print(diff.outputTorque1, diff.outputTorque2, diff.outputAV1, diff.outputAV2)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (rapport de pont, défaut 1), friction (N·m), dynamicFriction (N·m par rad/s), torqueLossCoef (0..1, borné), defaultVirtualInertia (kg·m², nil par défaut, repris par les shafts sans enfant), speedLimitCoef (défaut 1, multiplié par 3.5e-7), diffTorqueSplit (part du couple vers la sortie 1, défaut 0.5), diffType (chaîne ou liste de modes ; le premier est le mode initial), defaultToggle, lsdPreload (N·m, 50), lsdLockCoef (0.2), lsdRevLockCoef (= lsdLockCoef), viscousCoef (5), viscousTorque (= viscousCoef*10), viscousExponent (1, jamais utilisé), viscousSmoothing (25), lockTorque (N·m, 500), lockSpring (= lockTorque), lockDampRatio (0.1), activeLockTorque (= lockTorque).
- Champs principaux : inputAV (rad/s, côté parent = moyenne pondérée des sorties * gearRatio), outputAV1 / outputAV2 (rad/s, fixés par les enfants), outputTorque1 / outputTorque2 (N·m, couples envoyés aux enfants), inputTorque (N·m, couple d'entrée après frottement), gearRatio, invGearRatio, diffTorqueSplitA (part sortie 1) et diffTorqueSplitB (= 1 - A), mode, availableModes, defaultMode, diffAngle (rad), lockTorque, lockSpring, lockDamp, maxDiffAngle, activeLockCoef (0..1, commande de verrouillage actif utilisée par un contrôleur externe), activeLockTorque, cumulativeInertia, cumulativeGearRatio.
- Mode lsd : couple de verrouillage = lsdPreload + lsdLockCoef (ou lsdRevLockCoef en décélération) * |couple d'entrée| + activeLockTorque * activeLockCoef, ressort quadratique sur l'angle de différentiel. Mode viscous : couple = viscousCoef * (outputAV1 - outputAV2), borné à ± viscousTorque et lissé. Modes locked et dually : répartition 50/50 forcée avec ressort+amortisseur, limité à lockTorque. Mode activeLock : verrouillage uniquement à hauteur de activeLockTorque * activeLockCoef.
- Mode open et torqueVectoring utilisent la même fonction (un petit couple de verrouillage de 3.4 % du couple d'entrée est ajouté). Un mode inconnu écrit une erreur 'Found unknown differential type' et laisse torqueUpdate non défini.
- La limite de vitesse de glissement réduit le couple d'entrée de (speedLimitCoef * écart de vitesse³), borné à 100 %.
- Si lockSpring et lockTorque sont absents du jbeam, calculateInertia les calcule (lockSpringAutoCalc) à partir de powertrain.stabilityCoef² et de la plus petite inertie des enfants.
- Bug : setPartCondition appelle device:onBreak() si l'intégrité contient isBroken, mais ce device ne définit pas onBreak (erreur Lua si isBroken est vrai). getPartCondition lit device.isBroken, jamais initialisé (nil).
- Bug mineur : viscousTorque2Smoother et viscousExponent sont créés mais jamais utilisés. calculateInertia suppose que children[1] et children[2] existent pour le calcul de lockDamp (erreur si un enfant manque).
- Dans calculateInertia l'inertie de children[1] est multipliée par diffTorqueSplitB et celle de children[2] par diffTorqueSplitA (croisement voulu, car la part de couple est inverse de l'inertie ramenée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_differential.new(jbeamData)` | Construit le device différentiel : lit gearRatio, frottements, répartition de couple, type(s) de différentiel, paramètres LSD, visqueux, verrouillé et verrouillage actif, puis sélectionne la fonction de couple selon le mode. *(interne)* | 333 |

### Détail des paramètres

#### `powertrain_differential.new(jbeamData)`

Construit le device différentiel : lit gearRatio, frottements, répartition de couple, type(s) de différentiel, paramètres LSD, visqueux, verrouillé et verrouillage actif, puis sélectionne la fonction de couple selon le mode.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {differential=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true, [2]=true} : deux ports de sortie. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1, 2} : les deux sorties reçoivent leur inertie de leurs enfants. |

## Classe `device`

Objet renvoyé par new(jbeamData). torqueUpdate est remplacée selon le mode (selectUpdates).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Calcule cumulativeInertia (somme pondérée des inerties des deux enfants, divisée par gearRatio²), les rapports cumulés (journalise un message de debug si les deux sorties ont des rapports différents), et les paramètres de verrouillage lockSpring/lockTorque/lockDamp/maxDiffAngle. | 259 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si isBroken) et la table {damageFrictionCoef, isBroken}. | 163 |
| `device:getState()` | Défini seulement s'il y a plusieurs modes. Renvoie stateData avec la clé '<nom>Mode' = mode courant. | 243 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couples, lisseurs visqueux, diffAngle, activeLockCoef et coefficients d'usure/dégâts ; relit gearRatio et friction du jbeam. | 302 |
| `device:setMode(mode)` | Change le mode du différentiel s'il est dans availableModes (liste diffType du jbeam) ; ignoré sinon. Réselectionne torqueUpdate et met à jour le bouton UI. Mode possibles : open, torqueVectoring, lsd, viscous, locked, dually, activeLock. | 228 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'usure (wearFrictionCoef de 1 à 2 entre 30000 km et 1000 km*1000) et les dégâts (damageFrictionCoef de 1 à 10) selon l'odomètre et l'intégrité (nombre 0..1 ou table). | 141 |
| `device:setState(data)` | Défini seulement s'il y a plusieurs modes. Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel. | 248 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique. Calcule le couple d'entrée (couple du parent moins frottements, réduit par la limite de glissement, multiplié par gearRatio) puis outputTorque1/outputTorque2 selon le mode actif (open, lsd, viscous, locked, activeLock). | 102 |
| `device:updateSimpleControlButtons()` | Si plusieurs modes sont disponibles et uiSimpleModeControl est vrai, met à jour le bouton de l'interface simple avec une icône selon le mode et l'essieu (déduit des mots front, rear, middle, center, transfer du nom). | 220 |
| `device:velocityUpdate()` | Appelée à chaque pas physique : inputAV = (outputAV1 * splitA + outputAV2 * splitB) * gearRatio, écrit dans le champ de vitesse du parent. | 17 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/differential.lua`.*

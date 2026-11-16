# `powertrain_manualGearbox`

*Fichier : `lua/vehicle/powertrain/manualGearbox.lua` · VM : Véhicule · 670 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `manualGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `manualGearbox` : boîte de vitesses manuelle à rapports fixes. Le rapport actif est choisi par setGearIndex (indices entiers : 0 neutre, positifs = marches avant, négatifs = marche arrière). Il simule des synchroniseurs (usure, craquement de vitesse avec couple de « grinding »), le neutre (masse virtuelle), le frottement, le verrouillage (setLock) et les sons de bruit d'engrenage/craquement. Son parent doit être un embrayage (catégorie `clutch`). Un moddeur ou un contrôleur (ex. controller de boîte manuelle) appelle setGearIndex ; le jeu lit gearIndex, gearRatio, outputAV1.

## Exemple

```lua
local gb = powertrain.getDevice("gearbox")
gb:setGearIndex(2)            -- 2e, sans simulation de synchro
gb:setGearIndex(3, 0.15)      -- 3e avec 0.15 s de temps de synchro disponible
print(gb.gearIndex, gb.gearRatio, gb.isGrindingShift)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio, friction (N·m), dynamicFriction (N·m par rad/s), torqueLossCoef (0..1), neutralFriction (= friction), neutralDynamicFriction (= dynamicFriction), gearRatios (liste, obligatoire : valeurs >= 0 = marches avant en commençant à l'indice 0 (neutre, valeur normalement 0), valeurs < 0 = marches arrière), gearDamageThreshold (3000, non utilisé), gearWhineCoefs / gearWhineCoefsOutput / gearWhineCoefsInput, synchronizerSettings (table en-tête avec gearIndex, maxClutchRPMDifference (défaut 50), requiredClutchInput (0.8), maxSynchroRPMDifference (infini), maxSynchroRate (5000), synchroWearCoef (0.000005)), gearboxNode_nodes (premier nœud = transmissionNodeID), breakTriggerBeam, et pour les sons : gearGrindSoundFile, gearGrindEvent, gearWhineOutputEvent, gearWhineInputEvent, forwardInputPitchCoef, forwardOutputPitchCoef, reverseInputPitchCoef (0.7), reverseOutputPitchCoef (0.7), gearWhine*PitchCoefSmoothing (50), gearWhine*VolumeCoefSmoothing (10), gearWhineFixedCoefOutput (0.7), gearWhineFixedCoefInput (0.4).
- Indexation des rapports : la liste jbeam gearRatios sépare les valeurs >= 0 (marche avant, indices 0, 1, 2…) et < 0 (marche arrière). Pour n marches arrière, la première valeur négative de la liste prend l'indice -n, la dernière l'indice -1. gearRatios[0] est le neutre (rapport 0 attendu).
- Champs principaux : gearIndex, gearRatio (rapport courant, signé, 0 = neutre), gearRatios (table indexée par gearIndex), minGearIndex, maxGearIndex, maxGearRatio, minGearRatio, gearCount, inputAV (rad/s, côté embrayage), outputAV1 (rad/s, côté arbre de sortie, posé par l'enfant), outputTorque1 (N·m), inputTorque, lockCoef (0 si verrouillé par setLock), isBroken, isGrindingShift, grindingShiftTargetIndex, grindingTorque, synchroWear (table par rapport, 0..1), virtualMassAV, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, transmissionNodeID.
- Neutre ou boîte cassée (gearRatio == 0 ou isBroken) : velocityUpdate/torqueUpdate passent aux versions « neutral » où l'entrée accélère une masse virtuelle (virtualMassAV) et outputTorque1 ne contient que la réaction du craquement.
- setGearIndex(index) sans availableSyncTime : le passage est toujours réussi (compatibilité). Avec availableSyncTime : le passage échoue (craquement) si la différence de vitesse dépasse la capacité du synchro, si l'embrayage n'est pas assez enfoncé (requiredClutchInput) ou si le temps de synchro disponible est trop court. Un craquement active setGearGrinding et applique un couple (max 50 N·m) jusqu'à ce que l'écart de vitesse tombe sous 20 rad/s.
- L'usure du synchro d'une vitesse atteint 1 : le rapport est mis à 0 (la vitesse devient inutilisable jusqu'au reset).
- Bug mineur : reset appelle device:setGearIndex(0) qui exige un parent valide ; reset met isShiftGrinding = false mais le champ réellement utilisé est isGrindingShift.
- Bug mineur : calculateInertia calcule invCumulativeInertia = 1 / cumulativeInertia sans protection contre une inertie nulle (division par zéro donne inf si aucun enfant).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_manualGearbox.new(jbeamData)` | Construit la boîte : lit gearRatios et construit les tables d'indices avant/arrière, les coefficients de bruit de dents (gearWhine), les réglages de synchronisateurs et le nœud de la transmission, puis passe au neutre via setGearIndex(0). *(interne)* | 486 |

### Détail des paramètres

#### `powertrain_manualGearbox.new(jbeamData)`

Construit la boîte : lit gearRatios et construit les tables d'indices avant/arrière, les coefficients de bruit de dents (gearWhine), les réglages de synchronisateurs et le nœud de la transmission, puis passe au neutre via setGearIndex(0).

- `jbeamData` (*table*) : Données jbeam du composant (gearRatios obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true} : un seul port de sortie. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 289 |
| `device:calculateInertia()` | Prend l'inertie et les rapports cumulés du premier enfant ; cumulativeInertia = inertie aval / gearRatio² (avec 2 * maxGearRatio si neutre). | 372 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassée) et la table {damageFrictionCoef, synchroWear, isBroken}. | 316 |
| `device:initSounds(jbeamData)` | Crée les objets son (craquement, bruit d'engrenage entrée et sortie), les lisseurs et les coefficients de hauteur/volume depuis le jbeam, et règle le paramètre FMOD c_gearboxMaxPower. | 403 |
| `device:onBreak()` | Marque la boîte comme cassée et passe en mode neutre (virtualMassAV). Appelée quand la poutre breakTriggerBeam casse ou via setPartCondition. | 277 |
| `device:reset(jbeamData)` | Réinitialise l'état (vitesses, couple, usure, rapports d'origine, synchros, dégâts) puis repasse au neutre. | 446 |
| `device:resetSounds()` | Remet à zéro les lisseurs et valeurs de son (bruit d'engrenage). | 391 |
| `device:setGearGrinding(active, targetGearIndex, maxGrindingTorque)` | Active ou arrête l'état de craquement : mémorise le rapport visé et le couple max, démarre ou arrête la boucle sonore de craquement. | 150 |
| `device:setGearIndex(index, availableSyncTime)` | Passe un rapport. L'indice est borné à [minGearIndex, maxGearIndex]. Sans availableSyncTime, le passage réussit toujours ; avec, simule les synchros et peut déclencher un craquement (passage refusé : le rapport reste l'ancien). Recalcule l'inertie du groupe motopropulseur si le rapport est non nul. 0 = neutre. | 196 |
| `device:setLock(enabled)` | Verrouille ou déverrouille la transmission : lockCoef = 0 (verrouillé, aucun couple ni vitesse transmis) ou 1. Propage l'appel au parent (embrayage) s'il a setLock. | 282 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure (odomètre), dégâts (intégrité nombre 0..1 ou table) et usure des synchros. Appelle onBreak si la table indique isBroken. | 293 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : outputTorque1 = (couple parent - frottements) * gearRatio * lockCoef, et alimente les lisseurs de son. Au neutre, appelle updateGrinding, intègre la masse virtuelle et renvoie la réaction du craquement. | 71 |
| `device:updateGFX(dt)` | Mise à jour par image : actuellement vide (le code de débogage et de saut de vitesse est en commentaire). | 178 |
| `device:updateGrinding(dt)` | Pendant un passage qui craque : calcule le couple de craquement et son signe, use le synchro de la vitesse visée, enclenche la vitesse quand l'écart de vitesse tombe sous 20 rad/s, joue le son de craquement et affiche des messages « Synchronizer damage ». | 99 |
| `device:updateSounds(dt)` | Met à jour le volume et la hauteur des boucles sonores de bruit d'engrenage (entrée et sortie) d'après les vitesses/couples lissés et le rapport courant. Appelée à chaque image par le powertrain. | 19 |
| `device:validate()` | Vérifie que le parent est un embrayage (ou un faux), journalise une erreur et renvoie false sinon. Détermine transmissionNodeID et les valeurs attendues (couple et vitesse maxima du moteur, puissance) utilisées pour normaliser les sons. | 329 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio * lockCoef (ou masse virtuelle au neutre) et écrit dans le parent. | 66 |

## Appels vers le moteur (C++)

- `obj:` `playSFX`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/manualGearbox.lua`.*

# `powertrain_splitShaft`

*Fichier : `lua/vehicle/powertrain/splitShaft.lua` · VM : Véhicule · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `splitShaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `splitShaft` : répartiteur à deux sorties, typiquement une boîte de transfert 4x4 ou un coupleur d'essieu. Une sortie est « primaire » (reçoit tout le couple d'entrée) et l'autre « secondaire » (reçoit un couple de couplage). Types de couplage (`splitType`) : `viscous` (couple proportionnel à la différence de vitesse, avec exposant) ou `locked` (accouplement à ressort quadratique, borné par lockTorque). Peut être déconnecté (mode `disconnected` : la sortie secondaire ne reçoit plus rien). Catégories `shaft` et `differential`.

## Exemple

```lua
local tc = powertrain.getDevice("transfercase")
tc:setMode("disconnected") -- seulement si canDisconnect=true dans le jbeam (traction 2 roues)
tc.clutchRatio = 0.5       -- affaiblit le couplage en mode locked
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction, torqueLossCoef (0..1), defaultVirtualInertia, splitType ('viscous' par défaut ou 'locked'), primaryOutputID (1 ou 2, défaut 1), canDisconnect, isDisconnected, lockTorque (N·m, 500), defaultClutchRatio (1), lockDampRatio (0.15), clutchStiffness (1), lockSpringCoef (1), lockSpring (N·m/rad, sinon calculé), viscousCoef (10), viscousTorque (= viscousCoef * 10), viscousExponent (1), viscousSmoothing (25), breakTriggerBeam.
- Champs principaux : inputAV (rad/s côté parent = outputAV(primaire) * gearRatio), outputAV1 / outputAV2 (rad/s, posés par les enfants), outputTorque1 / outputTorque2 (N·m), primaryOutputID et secondaryOutputID, splitType, mode ('connected' ou 'disconnected'), availableModes, clutchRatio (0..1, module le couplage en mode locked), shaftAngle (rad), lockTorque, lockSpring, lockDamp, maxShaftAngle, viscousCoef, viscousTorque, viscousExponent, cumulativeInertia, cumulativeGearRatio, isBroken.
- Le couple envoyé au secondaire est borné à ± lockTorque (locked) ou ± viscousTorque (viscous), multipliés par les coefficients d'usure/dégâts. Le primaire reçoit (couple d'entrée - pertes) * gearRatio - couple secondaire. Déconnecté ou cassé : le secondaire reçoit 0 et le primaire tout le couple.
- Piège : l'inertie cumulée ne tient compte que de la sortie primaire ; l'inertie de la sortie secondaire sert seulement à calibrer le ressort et l'amortissement du couplage locked. Un setMode vers 'connected' est ignoré tant que isPhysicallyDisconnected est vrai (état par défaut avant validation par le powertrain).
- Bugs : getPartCondition calcule lockTorqueIntegrityValue et viscousTorqueIntegrityValue à partir de damageFrictionCoef et non de damageLockTorqueCoef / damageViscousTorqueCoef (copier-coller), donc l'intégrité n'a pas l'effet attendu ; onBreak met virtualMassAV = outputAV1 mais virtualMassAV n'est jamais utilisé dans ce fichier ; calculateInertia suppose lockSpring > 0 (division) quand le secondaire n'a pas d'inertie ; getState/setState n'existent que si plusieurs modes sont disponibles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_splitShaft.new(jbeamData)` | Construit le répartiteur : sorties primaire et secondaire, type de couplage (viscous ou locked), modes disponibles et paramètres de couplage. *(interne)* | 223 |

### Détail des paramètres

#### `powertrain_splitShaft.new(jbeamData)`

Construit le répartiteur : sorties primaire et secondaire, type de couplage (viscous ou locked), modes disponibles et paramètres de couplage.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true, differential=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true, [2]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1, 2} : les deux sorties reçoivent leur inertie de leurs enfants. |

## Classe `device`

Objet renvoyé par new(jbeamData). torqueUpdate dépend de splitType et du mode.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente les coefficients de dégâts de frottement, de couple de verrouillage et de couple visqueux selon les dégâts. | 60 |
| `device:calculateInertia()` | Prend l'inertie et les rapports cumulés de la sortie primaire ; calcule lockSpring, lockDamp et maxShaftAngle à partir de l'inertie de la sortie secondaire. | 156 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et la table d'état des dégâts (voir bug dans notes). | 89 |
| `device:getState()` | Défini seulement s'il y a plusieurs modes. Renvoie stateData avec la clé '<nom>Mode' = mode courant. | 124 |
| `device:onBreak()` | Marque isBroken = true et passe aux fonctions de couple déconnectées (secondaire sans couple). | 149 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couples, angle d'arbre, lisseur visqueux, coefficients d'usure/dégâts et mode ; relit gearRatio, friction, viscousCoef et defaultClutchRatio. | 183 |
| `device:setMode(mode)` | Change le mode ('connected' ou 'disconnected', doit figurer dans availableModes). Un device physiquement déconnecté reste 'disconnected'. Réselectionne torqueUpdate. | 106 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique usure (selon l'odomètre) et dégâts (intégrité nombre 0..1 ou table) aux coefficients de frottement, de verrouillage et de viscosité ; appelle onBreak si isBroken. | 66 |
| `device:setState(data)` | Défini seulement s'il y a plusieurs modes. Restaure le mode depuis data['<nom>Mode']. | 129 |
| `device:torqueUpdate()` | Appelée à chaque pas physique : calcule le couple secondaire (viscous : coef * \|ΔAV\|^exposant, ou locked : ressort quadratique sur l'angle d'arbre + amortissement) et le couple primaire. Déconnecté : secondaire à 0. | 42 |
| `device:validate()` | Appelée après construction du powertrain : force le mode 'disconnected' si isPhysicallyDisconnected ; renvoie true. | 140 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = vitesse de la sortie primaire * gearRatio, écrit dans le parent. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/splitShaft.lua`.*

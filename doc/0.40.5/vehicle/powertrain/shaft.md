# `powertrain_shaft`

*Fichier : `lua/vehicle/powertrain/shaft.lua` · VM : Véhicule · 373 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `shaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `shaft` : un arbre de transmission avec rapport de réduction fixe, pertes par frottement et inertie cumulée. Il peut aussi être relié directement à une roue (clé jbeam `connectedWheel`), auquel cas il applique le couple de propulsion et le couple de frottement à la roue. Il peut être déconnecté (mode `disconnected`) ou cassé ; il accélère alors une masse virtuelle au lieu de la chaîne cinématique aval. Un moddeur l'utilise via le jbeam `powertrain` ; le module n'expose que `new`.

## Exemple

```lua
-- jbeam : ["wheelShaftFL", "shaft", "differential_F", 1, {"connectedWheel":"FL", "friction":0.5}]
local d = powertrain.getDevice("wheelShaftFL")
d:setMode("disconnected") -- seulement si canDisconnect=true dans le jbeam
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (défaut 1), friction (N·m, défaut 0), dynamicFriction (N·m par rad/s, défaut 0), torqueLossCoef (fraction du couple d'entrée perdue, défaut 0), electricsName, visualShaftAVName, node, connectedWheel (nom de roue de powertrain.wheels), outputPortOverride (liste d'index de ports de sortie), canDisconnect, isDisconnected, breakTriggerBeam (chaîne vide = annule la poutre).
- Champs principaux du device : inputAV (rad/s, vitesse côté parent = sortie * gearRatio), outputAV1 (rad/s, ou outputAV<N> si outputPortOverride ; vitesse côté enfant ou roue), outputTorque1 (N·m, idem), gearRatio, friction, dynamicFriction, torqueLossCoef, cumulativeInertia (kg·m² ramenée côté entrée), invCumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, virtualInertia (défaut 2 kg·m², utilisé si rien n'est connecté), virtualMassAV (rad/s), isBroken, mode, availableModes, defaultMode, wearFrictionCoef, damageFrictionCoef.
- Les noms outputAV1/outputTorque1 sont en réalité calculés : device.outputAVName / device.outputTorqueName valent 'outputAV'..N et 'outputTorque'..N avec N = dernier index de outputPortOverride (1 par défaut). Idem parentOutputAVName / parentOutputTorqueName, fixés par le powertrain.
- velocityUpdate et torqueUpdate sont réaffectés par selectUpdates selon l'état : normal, relié à une roue, déconnecté/cassé, ou roue déconnectée. Ne pas les appeler en supposant une version fixe.
- Déconnecté ou cassé : outputTorque est mis à 0 et un couple virtuel accélère virtualMassAV avec invCumulativeInertia ; pour une roue, propulsionTorque vaut 0 et frictionTorque vaut friction.
- Mode connecté avec roue : le couple de réaction est cumulé dans powertrain.torqueReactionCoefs[wheel.torsionReactorIdx] en valeur absolue.
- isPhysicallyDisconnected vaut true par défaut dans new ; il est repassé à la valeur réelle par le powertrain. Tant qu'il est true, validate force le mode 'disconnected' et setMode refuse tout autre mode.
- Usure : wearFrictionCoef = linearScale(odometer, 3e7, 1e9, 1, 1.5). Dégâts : damageFrictionCoef passe de 1 à 50 quand l'intégrité tombe de 1 à 0.
- Les champs exportés M.outputPorts = {[1]=true} et M.deviceCategories = {shaft=true} sont copiés dans chaque device. new lit aussi M.requiredExternalInertiaOutputs qui n'est jamais défini dans ce fichier (shallowcopy de nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_shaft.new(jbeamData)` | Construit un device shaft à partir d'une entrée jbeam. Lit gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect et breakTriggerBeam, choisit les noms de champs de sortie et sélectionne les fonctions de mise à jour. *(interne)* | 277 |

### Détail des paramètres

#### `powertrain_shaft.new(jbeamData)`

Construit un device shaft à partir d'une entrée jbeam. Lit gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect et breakTriggerBeam, choisit les noms de champs de sortie et sélectionne les fonctions de mise à jour.

- `jbeamData` (*table*) : Données jbeam du composant (name, type, gearRatio, friction, connectedWheel…).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | Catégories du composant : {shaft=true}. Sert aux recherches comme 'remonter jusqu'au différentiel parent'. |
| `outputPorts` | table<integer, boolean> | Ports de sortie par défaut : {[1]=true}. Copié dans chaque device (remplacé si outputPortOverride). |

## Classe `device`

Objet renvoyé par new(jbeamData). Les méthodes sont posées sur l'instance ; velocityUpdate/torqueUpdate sont affectées dynamiquement.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente damageFrictionCoef proportionnellement aux dégâts reçus (0.01 de dégât = +0.1). | 88 |
| `device:calculateInertia()` | Calcule cumulativeInertia, invCumulativeInertia, cumulativeGearRatio et maxCumulativeGearRatio. Prend l'inertie du premier enfant, ou l'inertie des nœuds de la roue autour de l'axe (somme masse * distance²), ou virtualInertia. Divisée par gearRatio². Appelée par le powertrain lors de l'init. | 219 |
| `device:getPartCondition()` | Renvoie l'état de la pièce pour la sauvegarde : intégrité 0..1 (0 si cassé) et table {damageFrictionCoef, isBroken}. | 107 |
| `device:getState()` | Défini seulement si le shaft a plusieurs modes. Renvoie la table stateData contenant la clé '<nom>Mode' = mode courant. | 197 |
| `device:onBreak()` | Marque le shaft comme cassé (isBroken = true) et passe aux fonctions de mise à jour déconnectées. Appelée par le système de poutres cassées / setPartCondition. | 213 |
| `device:reset(jbeamData)` | Réinitialise l'état dynamique (inputAV, virtualMassAV, coefficients d'usure, isBroken, sorties à 0) et relit gearRatio et friction depuis jbeamData. Appelée au reset du véhicule. | 253 |
| `device:setMode(mode)` | Change le mode ('connected' ou 'disconnected') s'il figure dans availableModes. Ignoré sinon. Un shaft physiquement déconnecté reste 'disconnected'. Réselectionne les fonctions de mise à jour et met à jour le bouton UI. | 178 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'état d'usure/dégâts d'une pièce : wearFrictionCoef selon l'odomètre, damageFrictionCoef selon l'intégrité. Si l'intégrité est une table avec isBroken, appelle onBreak. | 92 |
| `device:setState(data)` | Défini seulement si le shaft a plusieurs modes. Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel. | 202 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas de physique, de l'amont vers l'aval. Calcule le couple de sortie = (couple parent - pertes de frottement) * gearRatio ; pour une roue, écrit propulsionTorque et frictionTorque. Version déconnectée : accélère la masse virtuelle et met outputTorque à 0. | 58 |
| `device:updateSimpleControlButtons()` | Si le shaft a plusieurs modes et uiSimpleModeControl, met à jour le bouton d'interface simple (extensions.ui_simplePowertrainControl.setButton) qui appelle powertrain.toggleDeviceMode(nom). | 157 |
| `device:validate()` | Appelée par le powertrain après construction. Force le mode déconnecté si isPhysicallyDisconnected. Pour un shaft sans enfant ni roue, prend la virtualInertia par défaut du différentiel ancêtre. Pour un shaft de roue, retrouve le torsionReactor ancêtre et déclare ses nœuds de réaction à la roue (setEngineAxisCoupleNodes). | 116 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas de physique, de l'aval vers l'amont. Calcule inputAV = outputAV * gearRatio et l'écrit dans le champ de vitesse du parent. Version roue : lit wheel.angularVelocity * wheelDirection. Version déconnectée : utilise virtualMassAV à la place. | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/shaft.lua`.*

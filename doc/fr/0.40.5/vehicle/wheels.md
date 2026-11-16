# `wheels`

*Fichier : `lua/vehicle/wheels.lua` · VM : Véhicule · 1386 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `wheels`

Gère toutes les roues du véhicule côté Lua : table des roues (wheels), des rotors (rotators) et de l'ensemble des deux (wheelRotators), lecture de leurs vitesses angulaires depuis le noyau physique, calcul des couples de freinage (frein de service + frein de stationnement), ABS (modes realistic / arcade / off, avec vitesse air virtuelle), thermique des freins (température de surface/coeur, fading, glaçage des plaquettes, fumée, lueur), crevaisons, bruit de freins et suivi de dégâts. Un moddeur lit surtout M.wheels[i] pour connaître la vitesse, le glissement, la charge ou la température d'une roue, ou appelle setABSBehavior / scaleBrakeTorque / setWheelBrakeUpdate pour modifier le freinage.

## Exemple

```lua
-- vitesse linéaire de chaque roue (m/s) et glissement
for i = 0, wheels.wheelCount - 1 do
  local wd = wheels.wheels[i]
  print(wd.name, wd.wheelSpeed, wd.lastSlip, wd.downForce)
end
-- couper l'ABS
wheels.setABSBehavior('off')
-- freins à 50 %
wheels.scaleBrakeTorque(0.5)
```

## Remarques

- Trois tables d'objets-roue partagent les MÊMES tables Lua : wheelRotators = toutes (wheels + rotors), indexée par cid (identifiant de roue jbeam, de 0 à wheelRotatorCount-1) ; wheels = seulement celles dont rotatorType == 'wheel', ré-indexée de 0 à wheelCount-1 (indices contigus) ; rotators = celles dont rotatorType == 'rotator', de 0 à rotatorCount-1. Toutes sont indexées à partir de 0 (pas de 1). Utiliser wheelCount/rotatorCount/wheelRotatorCount comme bornes (i = 0..count-1).
- wheelIDs[name], rotatorIDs[name] donnent le wheelID par nom ; wheelRotatorIDs[name] donne le cid. wheels n'existe qu'après initSecondStage (appelé après le init des contrôleurs/powertrain) ; avant, M.wheels contient temporairement toutes les roues indexées par cid.
- wheelCount/rotatorCount diminuent en cours de jeu quand une roue est arrachée (beamBroke) ; wheelRotatorCount n'est pas décrémenté. Les boucles internes utilisent des compteurs initiaux figés (initialWheelCountDec…), donc M.wheels[i] reste valide même pour une roue cassée : tester wd.isBroken.
- Champs d'une roue (wd = M.wheelRotators[cid] ou M.wheels[i]), unités SI :
-   identité : name (string, nom jbeam), wheelID / cid (entiers), wheelSection, rotatorType ('wheel'|'rotator'), wheelDir (±1, sens de rotation par rapport à l'avancement), node1/node2 (noeuds de l'axe), nodes / treadNodes (listes de noeuds), rayCount (nombre de rayons), pressureGroup / pressureGroupId, hasTire (boolean), obj (objet C++ de roue), coreData (structure FFI du noyau : angularVelocity, angularVelocityBrakeCouple, propulsionTorque, brakingTorque, engineReactionTorque, brakeTorqueApplied…).
-   géométrie : radius (m, rayon du pneu ; rayon du moyeu si pas de pneu), hubRadius (m), tireWidth (m), dynamicRadius (m, rayon effectif lissé selon la déformation au contact), inertia (kg·m², somme masse*distance² des noeuds à l'axe), tireVolume (m³, wheels uniquement, calculé dans initSecondStage), startingPressure (Pa absolus, pressurePSI converti, 105000 psi par défaut est un défaut brut du code).
-   cinématique : angularVelocity (rad/s, signée), angularVelocityBrakeCouple (rad/s, vitesse vue par le couple de frein), lastAngularVelocity / lastAngularVelocityBrakeCouple (valeur du pas précédent), wheelSpeed (m/s = angularVelocity*wheelDir*dynamicRadius ou radius pour les rotors, signée), isSpeedo (1/0 : la roue compte pour le compteur de vitesse et avgWheelAV/wheelspeed).
-   contact (mis à jour à chaque updateGFX) : lastSlip (m/s, glissement longitudinal), lastSideSlip (m/s, latéral), slipEnergy (énergie de glissement, valeur brute du moteur), downForceRaw / downForce (N, charge verticale brute / lissée), peakForce (N), contactDepth (m), contactMaterialID1 / contactMaterialID2 (id de matériau de sol ; 32 = herse, 4 = ignoré pour les sons de collision, -1 = aucun), lastTreadContactNode (dernier noeud de bande en contact).
-   couples (N·m) : propulsionTorque (couple moteur reçu, écrit par le powertrain), brakingTorque (frein effectif après délai de pression et efficacité thermique), desiredBrakingTorque (max(frein de service, frein de stationnement)), desiredMainBrakingTorque (frein de service seul), frictionTorque (frottement interne, écrit par le powertrain), brakeTorque / initialBrakeTorque (couple de frein max, jbeam brakeTorque), parkingTorque / initialParkingTorque (frein de stationnement max), brakeInputSplit et brakeSplitCoef (0..1), isPropulsed (boolean, mis à true par powertrain.lua).
-   ABS : hasABS (boolean), absFrequency (Hz, jbeam absHz, 100 par défaut), absTime (s, période = 1/absFrequency en realistic, 0.01 en arcade), absTimer, absActive (boolean, l'ABS module cette roue), lastABSCoef (0..1), slipRatioTarget (jbeam absSlipRatioTarget, 0.18 par défaut), slipErrorIntegral, lastSlipError, ownWheelSide / oppositeWheelSide ('left'|'right', calculé par la position par rapport au centre des roues freinées).
-   thermique frein (si enableBrakeThermals) : brakeSurfaceTemperature / brakeCoreTemperature (°C), brakeThermalEfficiency (0..1, efficacité de freinage finale = efficacité thermique x glaçage), padGlazingFactor (0..1), isBrakeMolten (boolean), brakeMass (kg), brakeDiameter (m, 0.35 par défaut), brakeType ('vented-disc'|'carbon-ceramic-vented-disc'|'disc'|'drum'), rotorMaterial ('steel'|'aluminum'|'carbon-ceramic'), padMaterial ('basic','premium','sport','semi-race','full-race','carbon-ceramic','godmode'), brakeMeltingPoint (°C), brakeGlowElectricsName ('brakeGlow_<name>', valeur electrics 0..1).
-   état : isBroken (boolean, axe cassé), isPunctured (crevaison en cours), isTireDeflated (pneu dégonflé par beamstate), punctureLeakRate (Pa/s, 20000 par défaut), punctureAngle (rad), torsionReactor / torsionReactorIdx (réacteur de torsion associé, voir powertrain).
- Valeurs electrics écrites : avgWheelAV (rad/s, moyenne signée des roues isSpeedo), wheelspeed (m/s, moyenne absolue), virtualAirspeed (m/s), abs (0/1 clignotant pour le voyant), absActive, hasABS, odometer (m, cumul), wheelThermals[nomRoue] = {brakeSurfaceTemperature, brakeCoreTemperature, brakeThermalEfficiency}.
- Les modes ABS sont 'realistic' (par défaut, vitesse air virtuelle estimée à partir des roues et de l'accéléromètre), 'arcade' (utilise electrics.airspeed, ABS actif sur toutes les roues) et 'off'. La valeur par défaut vient du réglage 'absBehavior'.
- Le frein de service lit electrics.values[wd.brakeElectricsName] (défaut 'brake') multiplié par defaultBrakeInputUsageCoef (1 pour les wheels, 0 pour les rotors sauf useDefaultBrakeInput).
- Bug/incohérence : initThermals fait `M.updateThermalsGFX = nop`, mais updateGFX appelle la variable locale updateThermalsGFXMethod ; M.updateThermalsGFX n'est jamais utilisé. De plus updateThermalsGFXMethod n'est jamais remise à nop quand le nouveau véhicule n'a pas de thermique de frein (reste l'ancienne fonction si le module est rechargé sans recréer l'état local).
- Bug/incohérence : M.treadNodeLookup est créé dans initWheels mais jamais rempli ni lu dans ce fichier. M.brakeSurfaceTempOverride (nil par défaut) permet de forcer la température de surface des freins (outil de debug).
- Bug potentiel : updateWheelsGFX indexe v.data.pressureGroups[wd.pressureGroup] sans tester que pressureGroups existe lors de la détection de herse (matériau 32).
- Bug mineur : toggleABSBehavior déclare une locale defaultABSBehavior qui masque celle du module ; aucun effet fonctionnel. Une roue 'brisée' garde ses champs mais angularVelocity est forcée à 0.
- deflateTire(wheelID) indexe M.wheelRotators par cid, pas par nom : passer l'indice numérique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `wheels.beamBroke(id)` | Hook appelé quand une poutre casse : si c'est une poutre d'axe (axleBeams) d'une roue, la roue est déclarée cassée (couples et vitesse à 0, dégâts enregistrés, compteurs wheelCount/rotatorCount et moyennes de vitesse mis à jour). *(interne)* | 119 |
| `wheels.deflateAllTires()` | Marque toutes les roues et rotors comme crevés (isPunctured = true). | 781 |
| `wheels.deflateTire(wheelID)` | Marque une roue comme crevée (isPunctured = true) ; la fuite d'air et le dégonflage final se déroulent ensuite dans updateGFX. | 777 |
| `wheels.init()` | Premier étage d'initialisation : crée l'objet-roue Lua pour chaque roue du jbeam (valeurs par défaut des clés brakeTorque, parkingTorque, absHz, punctureLeakRate…), installe l'ABS par défaut puis initialise la thermique des freins. Désactive updateGFX/updateWheelTorques/updateWheelVelocities s'il n'y a aucune roue. *(interne)* | 1217 |
| `wheels.initSecondStage()` | Second étage (après powertrain et contrôleurs) : sépare wheelRotators en wheels et rotators, calcule le côté gauche/droite de chaque roue, le volume de pneu, les lisseurs de rayon dynamique et les gains de vitesse air virtuelle. *(interne)* | 1244 |
| `wheels.initSounds()` | Crée les sons de grincement de frein (boucle 3D sur node1) et de pneu à plat pour chaque roue. Appelée à l'initialisation des sons du véhicule. *(interne)* | 901 |
| `wheels.isPhysicsStepUsed()` | Indique si le module a besoin d'être appelé à chaque pas de physique (au moins une roue). *(interne)* | 1357 |
| `wheels.nodeCollision(p)` | Hook de collision d'un noeud : mémorise le noeud de bande de roulement en contact et déclenche les sons de collision de carrosserie (sounds.bodyCollision) quand il y a du glissement. *(interne)* | 100 |
| `wheels.reset()` | Réinitialise l'état de toutes les roues (vitesses, couples, ABS, crevaisons, thermique) et restaure les couples de frein initiaux. Appelée au reset du véhicule. *(interne)* | 896 |
| `wheels.resetABSBehavior()` | Remet le mode ABS sur la valeur par défaut du réglage utilisateur 'absBehavior' ('realistic' si absent). Utilisé par .Tech. | 760 |
| `wheels.resetSecondStage()` | Réinitialise les compteurs de roues, le suivi de dégâts et l'état de la vitesse air virtuelle après un reset. *(interne)* | 1222 |
| `wheels.scaleBrakeTorque(coef)` | Met à l'échelle le couple de frein et le couple de frein de stationnement de toutes les wheels à partir de leurs valeurs initiales (initialBrakeTorque * coef). Non cumulatif. Sans argument, coef = 0 (freins coupés). | 154 |
| `wheels.setABSBehavior(behavior)` | Choisit le mode ABS et reconstruit les méthodes de frein de chaque roue (active la vitesse air virtuelle seulement en realistic) ; met à jour electrics.values.hasABS. | 744 |
| `wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS)` | Remplace les fonctions de calcul du frein d'une roue (sans ABS / avec ABS) puis reconstruit les méthodes actives. Permet à un contrôleur de gérer lui-même le couple de frein d'une roue. | 1347 |
| `wheels.setWheelRotatorType(wheelID, rotatorType)` | Change le rotatorType ('wheel' ou 'rotator') d'une roue existante. Les tables wheels/rotators ne sont pas reconstruites automatiquement. | 773 |
| `wheels.settingsChanged()` | Hook appelé quand les réglages utilisateur changent : relit le réglage 'absBehavior' pour le mode ABS par défaut (ne change pas le mode courant). *(interne)* | 756 |
| `wheels.toggleABSBehavior()` | Bascule l'ABS entre 'off' et le mode par défaut (jamais 'off' comme défaut : retombe sur 'realistic') et affiche un message 'ABS behavior: …'. | 764 |
| `wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt)` | Régulateur ABS d'une roue (PID sur l'erreur de glissement). Renvoie le coefficient 0..1 à appliquer au couple de frein désiré, ou 0 si le frein n'est pas actionné. Ne travaille qu'à la période absTime de la roue ; entre deux, renvoie lastABSCoef. Limite aussi la roue au coefficient du côté opposé. | 569 |
| `wheels.updateGFX(dt)` | Appelée à chaque frame graphique : met à jour thermique des freins/sons, puis pour chaque roue le glissement, la charge, le rayon dynamique, les crevaisons (herse et fuite d'air), wheelPower/wheelTorque, et les valeurs electrics abs, absActive et odometer. *(interne)* | 503 |
| `wheels.updateWheelTorques(dt)` | Appelée à chaque pas de physique après le powertrain : applique le délai de pression de frein et l'efficacité thermique, puis écrit propulsionTorque, brakingTorque et engineReactionTorque dans la structure FFI de chaque roue (0 si la roue est cassée). *(interne)* | 702 |
| `wheels.updateWheelVelocities(dt)` | Appelée à chaque pas de physique : lit les vitesses angulaires du noyau, calcule wheelSpeed, avgWheelAV, wheelspeed, la vitesse air virtuelle et les couples de frein désirés (ABS inclus) de chaque roue. *(interne)* | 624 |

### Détail des paramètres

#### `wheels.beamBroke(id)`

Hook appelé quand une poutre casse : si c'est une poutre d'axe (axleBeams) d'une roue, la roue est déclarée cassée (couples et vitesse à 0, dégâts enregistrés, compteurs wheelCount/rotatorCount et moyennes de vitesse mis à jour).

- `id` (*integer*) : Index de la poutre cassée.

#### `wheels.deflateTire(wheelID)`

Marque une roue comme crevée (isPunctured = true) ; la fuite d'air et le dégonflage final se déroulent ensuite dans updateGFX.

- `wheelID` (*integer*) : Index (cid) dans wheelRotators.

#### `wheels.isPhysicsStepUsed()`

Indique si le module a besoin d'être appelé à chaque pas de physique (au moins une roue).

- **renvoie** : boolean wheelRotatorCount > 0.

#### `wheels.nodeCollision(p)`

Hook de collision d'un noeud : mémorise le noeud de bande de roulement en contact et déclenche les sons de collision de carrosserie (sounds.bodyCollision) quand il y a du glissement.

- `p` (*table*) : Données de collision du moteur (id1, slipForce, materialID, materialID2…).

#### `wheels.scaleBrakeTorque(coef)`

Met à l'échelle le couple de frein et le couple de frein de stationnement de toutes les wheels à partir de leurs valeurs initiales (initialBrakeTorque * coef). Non cumulatif. Sans argument, coef = 0 (freins coupés).

- `coef` (*number|nil*) : Coefficient multiplicateur (0 si nil).

#### `wheels.setABSBehavior(behavior)`

Choisit le mode ABS et reconstruit les méthodes de frein de chaque roue (active la vitesse air virtuelle seulement en realistic) ; met à jour electrics.values.hasABS.

- `behavior` (*string*) : 'realistic', 'arcade' ou 'off'.

#### `wheels.setWheelBrakeUpdate(wheelName, brakeUpdateMethodNoABS, brakeUpdateMethodABS)`

Remplace les fonctions de calcul du frein d'une roue (sans ABS / avec ABS) puis reconstruit les méthodes actives. Permet à un contrôleur de gérer lui-même le couple de frein d'une roue.

- `wheelName` (*string*) : Nom de la roue (name jbeam).
- `brakeUpdateMethodNoABS` (*function*) : function(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt) -> couple de frein désiré (N·m) sans ABS.
- `brakeUpdateMethodABS` (*function*) : Même signature, version avec ABS.

#### `wheels.setWheelRotatorType(wheelID, rotatorType)`

Change le rotatorType ('wheel' ou 'rotator') d'une roue existante. Les tables wheels/rotators ne sont pas reconstruites automatiquement.

- `wheelID` (*integer*) : Index cid dans wheelRotators.
- `rotatorType` (*string*) : 'wheel' ou 'rotator'.

#### `wheels.updateABSCoef(wd, brake, invAirspeed, airspeed, airspeedCutOff, dt)`

Régulateur ABS d'une roue (PID sur l'erreur de glissement). Renvoie le coefficient 0..1 à appliquer au couple de frein désiré, ou 0 si le frein n'est pas actionné. Ne travaille qu'à la période absTime de la roue ; entre deux, renvoie lastABSCoef. Limite aussi la roue au coefficient du côté opposé.

- `wd` (*table*) : Objet roue.
- `brake` (*number*) : Entrée de frein 0..1.
- `invAirspeed` (*number*) : 1 / vitesse air (s/m).
- `airspeed` (*number*) : Vitesse air (m/s) : virtuelle en realistic, electrics.airspeed en arcade.
- `airspeedCutOff` (*boolean*) : Vrai si la vitesse dépasse 5 m/s ; sinon l'ABS ne module pas (coef 1).
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : number Coefficient ABS entre 0 et 1.

#### `wheels.updateGFX(dt)`

Appelée à chaque frame graphique : met à jour thermique des freins/sons, puis pour chaque roue le glissement, la charge, le rayon dynamique, les crevaisons (herse et fuite d'air), wheelPower/wheelTorque, et les valeurs electrics abs, absActive et odometer.

- `dt` (*number*) : Pas de temps de la frame (s).

#### `wheels.updateWheelTorques(dt)`

Appelée à chaque pas de physique après le powertrain : applique le délai de pression de frein et l'efficacité thermique, puis écrit propulsionTorque, brakingTorque et engineReactionTorque dans la structure FFI de chaque roue (0 si la roue est cassée).

- `dt` (*number*) : Pas de physique (s). Non utilisé.

#### `wheels.updateWheelVelocities(dt)`

Appelée à chaque pas de physique : lit les vitesses angulaires du noyau, calcule wheelSpeed, avgWheelAV, wheelspeed, la vitesse air virtuelle et les couples de frein désirés (ABS inclus) de chaque roue.

- `dt` (*number*) : Pas de physique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `brakeSurfaceTempOverride` | number|nil | Si non nil, impose la température de surface (°C) de tous les freins dans la simulation thermique. nil par défaut. |
| `rotatorCount` | integer | Nombre de rotors intacts. |
| `rotatorIDs` | table<string, integer> | Nom de rotor -> wheelID. |
| `rotators` | table<integer, table> | Éléments de type 'rotator' (rotors sans pneu comme des hélices ou disques), indices 0..rotatorCount-1. |
| `wheelCount` | integer | Nombre de roues intactes de type wheel (décrémenté quand un axe casse). |
| `wheelIDs` | table<string, integer> | Nom de roue -> wheelID pour les wheels. |
| `wheelPower` | number | Puissance totale transmise aux roues en W (somme propulsionTorque*angularVelocity des roues intactes), recalculée à chaque updateGFX. |
| `wheelRotatorCount` | integer | Nombre total de roues et rotors reconnus par le moteur. Non décrémenté en cas de casse d'axe. |
| `wheelRotatorIDs` | table<string, integer> | Nom de roue/rotor -> cid dans wheelRotators. |
| `wheelRotators` | table<integer, table> | Toutes les roues et rotors, indexés par cid à partir de 0. Voir notes pour les champs d'une roue. |
| `wheelTorque` | number | Couple de propulsion total en N·m (somme propulsionTorque*wheelDir), recalculé à chaque updateGFX. |
| `wheels` | table<integer, table> | Roues de type 'wheel' uniquement, indices contigus 0..wheelCount-1 (remplie par initSecondStage). |

## Appels vers le moteur (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `cutSFX`, `getEnvTemperature`, `getGroupPressure`, `getNodeTemperature`, `getPosition`, `getWheel`, `getWheelAvgTemperature`, `getWheelCoreTemperature`, `getWheelFFI`, `inSameNodeCluster`, `inWater`, `nodeLineSectionDistance`, `playSFX`, `setBeamSpringDamp`, `setGroupPressure`, `setVolumePitchCT`, `setWheelTorqueAndBrakeTorque`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/wheels.lua`.*

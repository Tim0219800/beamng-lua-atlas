# `controller_playerController`

*Fichier : `lua/vehicle/controller/playerController.lua` · VM : Véhicule · 599 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `playerController` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur principal (type "main", defaultOrder 500) du véhicule « unicycle » utilisé pour le joueur à pied (mode marche). Le personnage est une boule physique (nœuds tag "ball") sur laquelle un torque propulse le joueur, avec des forces de stabilisation par PID qui gardent le corps vertical et le tournent vers la direction de la caméra. Il gère marche, sprint, saut, accroupissement (pression de la boule), blocage de la boule à l'arrêt et gel. Il implémente aussi, en nop, l'API obligatoire des contrôleurs principaux (boîte de vitesses, démarreur...) pour être interchangeable avec un contrôleur de véhicule.

## Exemple

```lua
local pc = controller.mainController
pc.setCameraControlData({cameraRotation = quat(0, 0, 0, 1)})
pc.walkUpDownRaw(1)   -- avancer
pc.setSpeedCoef(1)    -- sprint
pc.jump(1)
```

## Remarques

- Clés jbeam lues dans init (défaut) : movementSpeedNormal (5, m/s), movementSpeedSprint (11, m/s), maxBallTorque (700, N·m), stabilizationMaxForce (8000, N), yawMaxForce (200, N), ballPressureNormal (1.0), ballPressureCrouch (0.5), jumpForce (50000, N), jumpForceTime (0.01, s), slipUsageCoef (1). Nœuds (noms/cid de nœuds) : stabilizationTopCenter/TopFront/TopRear/TopLeft/TopRight, stabilizationBottomCenter/BottomFront/BottomRear/BottomLeft/BottomRight, ballCenter. Tags de poutres : stabilizationBeamFront/Rear/Left/Right/FrontLeft/FrontRight/RearLeft/RearRight/BottomTop (valeurs de tags à retrouver sur les poutres) ; les poutres de tag "lockBeam" servent au blocage de la boule.
- Le code suppose des noms de nœuds fixes : ib7, ib2, ib8 (définissent le plan d'application du torque de propulsion) et un groupe de pression "ball" (v.data.pressureGroups.ball) ; les nœuds de tag "ball" définissent la boule.
- walkLeftRight/walkUpDown ajoutent à la valeur courante, les versions *Raw la remplacent ; walkVector n'est remis à zéro qu'au reset. Le vecteur est exprimé relativement à l'orientation (en lacet seul) de la caméra fournie par setCameraControlData.
- setSpeedCoef : 0 = marche (movementSpeedNormal), 1 = sprint (movementSpeedSprint), interpolé linéairement entre les deux.
- Sans marche (walkVector nul) la boule se verrouille (poutres lockBeam raides) ; pendant la marche elle est déverrouillée. La montée du verrou prend 0.4 s + 0.3 s * speedCoef.
- electrics.values : head_rotation (erreur de lacet corps/caméra, rad), head_tilt, gearboxMode="none", freezeState (booléen). M.engineInfo est un tableau de 21 éléments fixe (valeurs par défaut) pour compatibilité avec les contrôleurs de moteur.
- Champs throttle, brake, clutchRatio, fireEngineTemperature : valeurs constantes à 0 fournies pour l'interface de contrôleur principal. Les fonctions shiftUp, shiftDown, shiftToGearIndex, cycleGearboxModes, setGearboxMode, smartParkingBrake, setStarter, setEngineIgnition, sendTorqueData, vehicleActivated, setAggressionOverride, setDefaultForwardMode sont toutes nop (nop = fonction globale du moteur qui ne fait rien).
- Les tableaux lockBeams, ballNodes et ballTorqueNodes ne sont pas vidés dans init : ils s'accumulent si init est rappelé sur le même état Lua (déduit du code).
- update(dt) applique chaque pas physique les forces préparées par updateFixedStep ; nodeCollision(p) est appelé par le moteur à chaque collision de particules de nœud et accumule le taux de particules pour estimer la vitesse de la boule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_playerController.crouch(value)` | Value < 0 : s'accroupit (réduit la pression de la boule à ballPressureCrouch) ; value > 0 : relève progressivement. | 428 |
| `controller_playerController.debugDraw(focusPos)` | Dessine les vecteurs de debug stockés dans debugVectors (vide en pratique). *(interne)* | 143 |
| `controller_playerController.init(jbeamData)` | Lit les paramètres jbeam, repère nœuds et poutres de stabilisation, de boule et de verrouillage, active le suivi mapmgr et désactive la mise en veille physique du véhicule. *(interne)* | 480 |
| `controller_playerController.jump(value)` | Déclenche un saut si le personnage touche le sol, hors délai de 0.5 s et hors gel. | 417 |
| `controller_playerController.nodeCollision(p)` | Appelé par le moteur à chaque particule de collision d'un nœud ; estime la vitesse du joueur à partir de la vitesse de la boule et du glissement. *(interne)* | 149 |
| `controller_playerController.reset()` | Remet à zéro gel, verrouillage, accroupissement, vecteur de marche, forces et PID. *(interne)* | 455 |
| `controller_playerController.setCameraControlData(controlData)` | Fournit l'orientation de la caméra qui détermine direction de marche et direction de regard. | 556 |
| `controller_playerController.setFreeze(mode)` | Gèle ou dégèle le personnage (plus de déplacement, saut ni accroupissement). | 451 |
| `controller_playerController.setSpeedCoef(value)` | Fixe le coefficient de vitesse (0 marche, 1 sprint). | 409 |
| `controller_playerController.toggleCrouch()` | Alterne accroupi/debout. | 442 |
| `controller_playerController.toggleSpeedCoef()` | Inverse le coefficient de vitesse (1 - valeur). | 413 |
| `controller_playerController.update(dt)` | Chaque pas physique : applique forces de stabilisation, forces de lacet, torque de propulsion de la boule et force de saut. *(interne)* | 170 |
| `controller_playerController.updateFixedStep(dt)` | Pas fixe : calcule inclinaison, PID de stabilisation et de lacet, torque de propulsion selon la vitesse désirée et gère le verrouillage de la boule. *(interne)* | 249 |
| `controller_playerController.updateGFX(dt)` | Chaque image : détecte contact sol/eau, gère la remontée de pression après accroupissement, décrémente le délai de saut et écrit electrics.values.gearboxMode et freezeState. *(interne)* | 360 |
| `controller_playerController.walkLeftRight(value)` | Ajoute à la composante gauche/droite (pour combiner plusieurs touches). | 397 |
| `controller_playerController.walkLeftRightRaw(value)` | Fixe la composante gauche/droite de la marche (+1 = droite). | 393 |
| `controller_playerController.walkUpDown(value)` | Ajoute à la composante avant/arrière. | 405 |
| `controller_playerController.walkUpDownRaw(value)` | Fixe la composante avant/arrière de la marche (+1 = avant). | 401 |

### Détail des paramètres

#### `controller_playerController.crouch(value)`

Value < 0 : s'accroupit (réduit la pression de la boule à ballPressureCrouch) ; value > 0 : relève progressivement.

- `value` (*number*) : Valeur d'entrée ; seul le signe compte.

#### `controller_playerController.debugDraw(focusPos)`

Dessine les vecteurs de debug stockés dans debugVectors (vide en pratique).

- `focusPos` (*vec3*) : Position de focus (non utilisée).

#### `controller_playerController.init(jbeamData)`

Lit les paramètres jbeam, repère nœuds et poutres de stabilisation, de boule et de verrouillage, active le suivi mapmgr et désactive la mise en veille physique du véhicule.

- `jbeamData` (*table*) : Données jbeam du contrôleur (voir notes).

#### `controller_playerController.jump(value)`

Déclenche un saut si le personnage touche le sol, hors délai de 0.5 s et hors gel.

- `value` (*number*) : Valeur d'entrée (non utilisée).

#### `controller_playerController.nodeCollision(p)`

Appelé par le moteur à chaque particule de collision d'un nœud ; estime la vitesse du joueur à partir de la vitesse de la boule et du glissement.

- `p` (*table*) : Particule physique (champs slipVec, nodeVel, id1).

#### `controller_playerController.setCameraControlData(controlData)`

Fournit l'orientation de la caméra qui détermine direction de marche et direction de regard.

- `controlData` (*table*) : Table avec cameraRotation (quat).

#### `controller_playerController.setFreeze(mode)`

Gèle ou dégèle le personnage (plus de déplacement, saut ni accroupissement).

- `mode` (*integer*) : 1 = gelé, toute autre valeur = libre.

#### `controller_playerController.setSpeedCoef(value)`

Fixe le coefficient de vitesse (0 marche, 1 sprint).

- `value` (*number*) : 0 à 1.

#### `controller_playerController.update(dt)`

Chaque pas physique : applique forces de stabilisation, forces de lacet, torque de propulsion de la boule et force de saut.

- `dt` (*number*) : Pas de temps (s).

#### `controller_playerController.updateFixedStep(dt)`

Pas fixe : calcule inclinaison, PID de stabilisation et de lacet, torque de propulsion selon la vitesse désirée et gère le verrouillage de la boule.

- `dt` (*number*) : Pas de temps (s).

#### `controller_playerController.updateGFX(dt)`

Chaque image : détecte contact sol/eau, gère la remontée de pression après accroupissement, décrémente le délai de saut et écrit electrics.values.gearboxMode et freezeState.

- `dt` (*number*) : Pas de temps graphique (s).

#### `controller_playerController.walkLeftRight(value)`

Ajoute à la composante gauche/droite (pour combiner plusieurs touches).

- `value` (*number*) : Incrément.

#### `controller_playerController.walkLeftRightRaw(value)`

Fixe la composante gauche/droite de la marche (+1 = droite).

- `value` (*number*) : -1 à 1.

#### `controller_playerController.walkUpDown(value)`

Ajoute à la composante avant/arrière.

- `value` (*number*) : Incrément.

#### `controller_playerController.walkUpDownRaw(value)`

Fixe la composante avant/arrière de la marche (+1 = avant).

- `value` (*number*) : -1 à 1.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Toujours 0. |
| `clutchRatio` | number | Toujours 0. |
| `cycleGearboxModes` | function | nop. |
| `defaultOrder` | number | Ordre par défaut (500). |
| `engineInfo` | table | Tableau de 21 valeurs statiques (index 14 = "manual", index 15 = id de l'objet véhicule, index 18 = 1) compatible avec le format d'info moteur des autres contrôleurs principaux. |
| `fireEngineTemperature` | number | Toujours 0 (API de contrôleur principal). |
| `sendTorqueData` | function | nop. |
| `setAggressionOverride` | function | nop. |
| `setDefaultForwardMode` | function | nop. |
| `setEngineIgnition` | function | nop. |
| `setGearboxMode` | function | nop. |
| `setStarter` | function | nop. |
| `shiftDown` | function | nop. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop (API principale obligatoire). |
| `smartParkingBrake` | function | nop. |
| `throttle` | number | Toujours 0. |
| `type` | string | "main" (contrôleur principal obligatoire pour ce véhicule). |
| `vehicleActivated` | function | nop. |

## Appels vers le moteur (C++)

- `obj:` `apply3nodeTorque`, `applyForce`, `applyForceVector`, `get3nodeAngularVelocity`, `getBeamLength`, `getBeamVectorFromNode`, `getId`, `getNodeVelocityVector`, `getNodesVector`, `inWater`, `isNodeColliding`, `setBeamLength`, `setBeamSpringDamp`, `setGroupPressureRel`, `setSleepingEnabled`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/playerController.lua`.*

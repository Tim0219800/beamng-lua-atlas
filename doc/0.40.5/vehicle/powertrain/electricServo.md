# `powertrain_electricServo`

*Fichier : `lua/vehicle/powertrain/electricServo.lua` · VM : Véhicule · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `electricServo` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `electricServo` : servomoteur électrique qui fait tourner une roue « rotor » (clé jbeam `connectedRotator`, une roue déclarée comme rotator) vers un angle cible, avec un régulateur proportionnel (angularSpring) et un couple limité (stallTorque). Catégorie `engine` mais sans port de sortie : il n'a pas de parent powertrain et applique directement `propulsionTorque` à la roue. L'angle cible se règle par setTargetAngle ou par une valeur electrics (`electricsTargetAngleName`). Un moddeur l'utilise pour des bras, bennes ou articulations motorisés.

## Exemple

```lua
local servo = powertrain.getDevice("armServo")
servo:setMinMaxAngles(-math.pi/2, math.pi/2)
servo:setTargetAngle(math.rad(45)) -- radians
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction (N·m par rad/s), angularSpring (1, gain en 1/rad : le « papillon » vaut min(|erreur| * angularSpring, 1)), rotationMode ('absolute' par défaut ou 'shortest'), electricsTargetAngleName (si absent, le servo se pilote uniquement par l'API), stallTorque (N·m, 1000), maxRPM (OBLIGATOIRE), connectedRotator, canDisconnect, isDisconnected, breakTriggerBeam.
- Tous les angles sont en radians. En mode 'absolute', currentAngle est le cumul de rotation de la roue depuis le reset (pas de repli). En mode 'shortest', l'angle cible est ramené dans ]-2π, 2π[ avec le signe conservé, borné par minAngle/maxAngle si définis, et currentAngle est replié pour prendre le chemin le plus court.
- Champs principaux : targetAngle, currentAngle (rad), torqueDirection (+1 ou -1), outputTorque1 (N·m, couple appliqué à la roue avant wheelDirection), outputAV1 (toujours 0), maxTorque (= stallTorque), maxRPM, maxAV (rad/s), wheel, wheelObj, wheelDirection, connectedRotator, mode ('connected' ou 'disconnected'), isBroken, rotationMode, minAngle, maxAngle.
- Le couple diminue avec la vitesse de la roue (effet « back-EMF ») quand il va dans le sens du mouvement : coefficient 1 - min(|wheelAV| / maxAV, 1) ; il n'est pas atténué s'il freine la roue.
- updateGFX n'existe que si electricsTargetAngleName est défini : il lit electrics.values[nom] (0 par défaut) et appelle setTargetAngle.
- Bug : new suppose maxRPM défini (device.maxRPM * rpmToAV) : une erreur Lua survient si la clé jbeam maxRPM est absente. M.outputPorts = {} (aucun port). M.requiredExternalInertiaOutputs n'est pas défini dans ce module. reset ne remet pas virtualMassAV, isBroken ni le mode ; si la roue n'est pas trouvée (connectedRotator invalide) device.wheel est nil et torqueUpdate plante.
- setTargetAngle accepte n'importe quel nombre : en mode 'shortest', l'angle ≥ 2π est replié (un angle de 2π devient 0).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_electricServo.new(jbeamData)` | Construit le servo, le relie à la roue rotor connectedRotator (déclarée via wheels.setWheelRotatorType(wheelID, 'rotator')), calcule maxTorque et maxAV, détermine les modes disponibles. *(interne)* | 147 |

### Détail des paramètres

#### `powertrain_electricServo.new(jbeamData)`

Construit le servo, le relie à la roue rotor connectedRotator (déclarée via wheels.setWheelRotatorType(wheelID, 'rotator')), calcule maxTorque et maxAV, détermine les modes disponibles.

- `jbeamData` (*table*) : Données jbeam du composant (maxRPM obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie (le servo agit directement sur la roue). |

## Classe `device`

Objet renvoyé par new(jbeamData). velocityUpdate vaut nop (ou une fonction vide si déconnecté) ; torqueUpdate est servoUpdateTorque ou la version déconnectée.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Calcule l'inertie de la roue rotor autour de son axe (somme masse * distance² des nœuds de la roue) puis cumulativeInertia = inertie / gearRatio². Appelée à l'initialisation du powertrain. | 118 |
| `device:onBreak()` | Marque le servo comme cassé, met le couple de sortie et le couple de la roue à 0 et passe aux fonctions déconnectées. | 107 |
| `device:reset(jbeamData)` | Remet à zéro le couple, la vitesse de sortie et les angles cible et courant. | 140 |
| `device:setMinMaxAngles(minAngle, maxAngle)` | Définit les bornes d'angle utilisées par le mode 'shortest' (sans effet en mode 'absolute'). | 68 |
| `device:setMode(mode)` | Change le mode ('connected' ou 'disconnected') sans vérifier availableModes, puis réselectionne les fonctions de mise à jour. 'disconnected' : couple nul. | 102 |
| `device:setTargetAngle(angle)` | Fixe l'angle cible en radians. Mode 'absolute' : valeur telle quelle. Mode 'shortest' : repliée sur ]-2π, 2π[, bornée à [minAngle, maxAngle] si définis, et currentAngle est ajusté pour choisir le chemin le plus court. | 47 |
| `device:setTargetAngleRelative(angle)` | Ajoute angle à l'angle cible actuel (via setTargetAngle). | 64 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : intègre l'angle courant avec la vitesse de la roue, calcule l'erreur d'angle, un couple proportionnel borné par stallTorque et atténué par la vitesse, soustrait le frottement, et écrit wheel.propulsionTorque. Déconnecté ou cassé : couple 0. | 39 |
| `device:updateGFX(dt)` | Défini seulement si electricsTargetAngleName est renseigné. Lit l'angle cible dans electrics.values et appelle setTargetAngle. Appelée à chaque image. | 73 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 98 |
| `device:velocityUpdate()` | Appelée à chaque pas physique ; ne fait rien (nop ou fonction vide en mode déconnecté ou cassé). | 36 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/electricServo.lua`.*

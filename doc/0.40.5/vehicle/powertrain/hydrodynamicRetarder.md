# `powertrain_hydrodynamicRetarder`

*Fichier : `lua/vehicle/powertrain/hydrodynamicRetarder.lua` · VM : Véhicule · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `hydrodynamicRetarder` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `hydrodynamicRetarder` : ralentisseur hydrodynamique (frein moteur de camion/bus) monté en dérivation sur l'arbre. Il possède un rotor virtuel (inertie `virtualInertia`) dont il intègre lui-même la vitesse `outputAV1` ; il renvoie à son parent `inputAV = outputAV1 * gearRatio`. Quand le coefficient demandé est > 0, il applique un couple de freinage lu dans la courbe `brakeTorque` (couple selon le régime du rotor), lissé par `strengthSmoothing`. La puissance dissipée peut être renvoyée au liquide de refroidissement du moteur (`thermals.additionalCoolantEnergyPerStep`). Catégories `retarder` et `torqueConsumer`, sans port de sortie.

## Exemple

```lua
local ret = powertrain.getDevice("retarder")
ret:setRetarderCoef(0.6) -- freinage à 60 % (0..1)
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, friction (N·m), dynamicFriction, strengthSmoothing (10), gearRatio (1, rapport entre arbre d'entrée et rotor), virtualInertia (kg·m², 0.1), torqueDropOffRange (tr/min, défaut 500, min 10, arrondi vers le bas), brakeTorque (table en-tête {rpm, torque}, OBLIGATOIRE, au moins deux lignes, rpm distincts, torque en N·m), coolantEnergyCoef (0..1, défaut 1, part de la puissance dissipée envoyée au liquide de refroidissement), breakTriggerBeam, retarderWhineEvent, retarderWhinePitchCoefSmoothing (100).
- Champs principaux : inputAV (rad/s côté parent), outputAV1 (rad/s, vitesse du rotor), outputTorque1 (toujours 0), gearRatio, desiredRetarderCoef (0..1 demandé par setRetarderCoef), brakeTorqueCurve (table indexée par tr/min entier du rotor, N·m), torqueDropOffRange, virtualInertia, invVirtualInertia, coolantEnergyCoef, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken.
- Le couple de freinage = -signe(rotorAV) * brakeTorqueCurve[|rotorRPM|] * coefficient lissé. Au-delà de la dernière ligne de la courbe, le couple descend linéairement jusqu'à 0 sur torqueDropOffRange tr/min. Le couple de freinage de la courbe est tabulé en tr/min du ROTOR (outputAV1), pas de l'arbre d'entrée.
- validate renvoie false si la courbe brakeTorque est absente ou invalide : le device est alors rejeté. Un rotor cassé ou sans courbe passe à updateTorqueBroken (le rotor accélère librement sans frein).
- Le thermique n'est alimenté que si le moteur propulseur (powertrain.getPropulsionDeviceForDevice) possède thermals.additionalCoolantEnergyPerStep.
- Bugs mineurs : les messages de log citent 'hydrodynamicRetarder2.new' (ancien nom) ; calculateInertia divise par gearRatio² sans protéger gearRatio == 0 ; M.requiredExternalInertiaOutputs n'est pas défini dans ce module ; initSounds utilise obj:createSFXSource (et non createSFXSource2).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_hydrodynamicRetarder.new(jbeamData)` | Construit le ralentisseur : lit et valide la courbe brakeTorque, construit la courbe par tr/min avec la zone de décroissance, règle l'inertie virtuelle et les lisseurs. *(interne)* | 154 |

### Détail des paramètres

#### `powertrain_hydrodynamicRetarder.new(jbeamData)`

Construit le ralentisseur : lit et valide la courbe brakeTorque, construit la courbe par tr/min avec la zone de décroissance, règle l'inertie virtuelle et les lisseurs.

- `jbeamData` (*table*) : Données jbeam du composant (brakeTorque obligatoire).
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {retarder=true, torqueConsumer=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData). velocityUpdate et torqueUpdate sont posées par selectUpdates.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1). | 75 |
| `device:calculateInertia()` | cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio ; calcule invVirtualInertia. | 112 |
| `device:getPartCondition()` | Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}. | 94 |
| `device:initSounds(jbeamData)` | Crée la boucle sonore du ralentisseur (désactivée au départ) et le lisseur de vitesse. | 126 |
| `device:onBreak()` | Marque le ralentisseur comme cassé et passe à la version de couple sans freinage. | 107 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, coefficient demandé, lisseur, coefficients d'usure/dégâts ; relit friction et dynamicFriction. | 136 |
| `device:resetSounds()` | Remet à zéro le lisseur de vitesse du son. | 122 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table {damageFrictionCoef, isBroken}) ; appelle onBreak si isBroken. | 79 |
| `device:setRetarderCoef(coef)` | Règle la force de freinage demandée (0 = aucun, 1 = maximum de la courbe). Le couple réel suit via un lisseur. À appeler depuis un contrôleur (levier de ralentisseur). | 17 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : intègre la vitesse du rotor avec le couple du parent (moins frottement) plus le couple de freinage, et ajoute la puissance dissipée à l'énergie du circuit de refroidissement. Version « cassé ou sans courbe » : sans freinage. | dyn |
| `device:updateGFX(dt)` | Mise à jour par image : ne fait rien. | 66 |
| `device:updateSounds(dt)` | Règle volume, hauteur et couleur du son de sifflement du ralentisseur d'après la vitesse lissée et le coefficient demandé. | 21 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie false si la courbe brakeTorque est absente ou invalide. | 103 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le champ de vitesse du parent. | 31 |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/hydrodynamicRetarder.lua`.*

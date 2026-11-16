# `powertrain_viscousClutch`

*Fichier : `lua/vehicle/powertrain/viscousClutch.lua` · VM : Véhicule · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `viscousClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Coupleur visqueux placé derrière un moteur : transmet un couple proportionnel à l'écart de vitesse angulaire entre entrée et sortie (viscousCoef, en N·m par rad/s), plafonné à viscousTorque. Peut être « engagé » progressivement au-dessus d'un régime cutInRPM (cutInRPM, stallRPM). Sert d'embrayage simple automatique (ex. petits véhicules, boîtes sans embrayage piloté). Catégories clutchlike et viscouscoupling ; un port de sortie.

## Exemple

```lua
-- jbeam : ["viscousClutch", "clutch", "mainEngine", 1, {"viscousCoef":20, "cutInRPM":1000, "stallRPM":300}]
```

## Remarques

- Clés jbeam : viscousCoef (10 N·m par rad/s), viscousTorque (N·m max ; sinon maxTorque du moteur*1.25 + maxRPM*inertie*pi/30), viscousSmoothing (25, lissage exponentiel du couple), cutInRPM (tr/min, optionnel), stallRPM (0.1 tr/min par défaut), additionalEngineInertia (0), breakTriggerBeam ('' = annulation), inputName, inputIndex.
- Quand cutInRPM est défini, le coefficient d'embrayage interne vaut clamp((inputAV - cutInAV) / stallAV, 0, 1) : engagé entre cutInRPM et cutInRPM + stallRPM ; avec le défaut stallRPM = 0.1 la transition est presque instantanée.
- device.clutchRatio (1 par défaut) peut être modifié de l'extérieur pour désengager ; le couple final = clamp(viscousCoef*(inputAV-outputAV1), ±viscousTorque) * min(clutchRatio, ratio interne), lissé.
- Conversion rpm -> rad/s : facteur 0.104719755. Unités : AV en rad/s, couples en N·m.
- Anomalie : reset() relit viscousCoef depuis jbeamData (défaut 10), donc un viscousCoef modifié dynamiquement est restauré au reset ; il n'est pas relu pour viscousTorque.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_viscousClutch.new(jbeamData)` | Construit le coupleur visqueux à partir du jbeam. *(interne)* | 89 |

### Détail des paramètres

#### `powertrain_viscousClutch.new(jbeamData)`

Construit le coupleur visqueux à partir du jbeam.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Objet device.

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, viscouscoupling=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Classe `device`

Objet renvoyé par new(jbeamData). Champs : inputAV, outputAV1 (rad/s), outputTorque1 et torqueDiff (N·m), clutchRatio (0..1), viscousCoef, viscousTorque, cutInAV, stallAV (rad/s), isBroken, mode.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:calculateInertia()` | Reprend inertie et rapports cumulés du premier enfant (le coupleur n'ajoute pas d'inertie). | 55 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, couple, clutchRatio=1, relit viscousCoef et réinitialise le lisseur. | 71 |
| `device:setMode(mode)` | Mémorise le mode et réinstalle velocityUpdate/torqueUpdate (le mode n'a pas d'autre effet ici). | 50 |
| `device:torqueUpdate(dt)` | Pas de physique : calcule le couple visqueux (écart de vitesse), applique clutchRatio et l'engagement à cutInRPM, lisse et place le résultat dans torqueDiff et outputTorque1. | 20 |
| `device:validate()` | Vérifie que le parent est un moteur et fixe viscousTorque par défaut. | 38 |
| `device:velocityUpdate(dt)` | Pas de physique : inputAV = vitesse de sortie du parent (moteur). | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/viscousClutch.lua`.*

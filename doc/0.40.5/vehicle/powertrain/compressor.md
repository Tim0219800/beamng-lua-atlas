# `powertrain_compressor`

*Fichier : `lua/vehicle/powertrain/compressor.lua` · VM : Véhicule · 313 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `compressor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `compressor` : compresseur d'air pneumatique (freins à air, suspension pneumatique de camions). C'est un consommateur de couple sans port de sortie (feuille de l'arbre powertrain) : il reçoit la vitesse de son parent, pompe de l'air vers un réservoir `pressureTank` enregistré (energyStorage) et renvoie à son parent un couple résistant `torqueDiff`. Il se débraye (deload) au-dessus de la pression de coupure et se rembraye sous la pression d'enclenchement. Il joue des sons de compresseur et de purge, et envoie les données au flux GUI 'pneumaticsData'.

## Exemple

```lua
local comp = powertrain.getDevice("airCompressor")
print(comp.engaged, comp.pumpPressure, comp.pumpedAirFlow) -- bool, Pa, m^3/s
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction, dynamicFriction, electricsName, visualShaftAVName, node, requiredEnergyType ('air'), energyStorage, pumpDisplacement (m³ par tour, défaut 0.00035), pumpEfficiency (0.8), cutOutPressure (Pa relatifs, 900000), cutInPressure (80 % de cutOutPressure), motorThrottleElectricsName (nom + 'Throttle', non utilisé dans ce fichier), deloadWhenDisengaged (true), breakTriggerBeam, et pour les sons : purgeSoundNode, pumpPurgeEvent, purgeSoundVolume (0.5), compressorSoundNode, compressorLoopEvent, compressorSoundVolume (0.5).
- Champs principaux : inputAV (rad/s, = vitesse du parent), torqueDiff (N·m, couple résistant renvoyé au parent), pumpedAirFlow (m³/s), pumpedEnergy (J ajoutés au réservoir ce pas), pumpPressure (Pa relatifs), engaged (true si le compresseur charge), deloadCoef (0 = en charge, 1 = délesté), pressureTank (stockage de type pressureTank ou nil), cumulativeInertia (virtualInertia = 1 kg·m² ramenée par gearRatio²), isBroken.
- Le moteur du jeu doit connaître les catégories : le compresseur est déclaré clutchlike, clutch, pneumaticPowerSource et torqueConsumer. Il n'a pas de port de sortie (outputPorts = {}), mais outputTorque1/outputAV1 existent à 0.
- Les pressions du réservoir sont absolues dans pressureTank.currentPressure ; engaged/cutOut/cutIn utilisent la pression relative (courante - powertrain.currentEnvPressure).
- Incohérences : updateVelocity réécrit parent[parentOutputAVName] = inputAV avec la valeur qu'il vient de lire (sans effet) ; applyDeformGroupDamage et selectUpdates (cas isBroken) sont vides ; un compresseur cassé continue de fonctionner. M.requiredExternalInertiaOutputs n'est pas défini dans ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_compressor.new(jbeamData)` | Construit le compresseur : cylindrée (pumpDisplacement), rendement, pressions de coupure/enclenchement, mode et nom des sorties. *(interne)* | 228 |

### Détail des paramètres

#### `powertrain_compressor.new(jbeamData)`

Construit le compresseur : cylindrée (pumpDisplacement), rendement, pressions de coupure/enclenchement, mode et nom des sorties.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true, pneumaticPowerSource=true, torqueConsumer=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Ne fait rien (corps vide). | 113 |
| `device:calculateInertia()` | Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio. | 161 |
| `device:getPartCondition()` | Renvoie 1 (0 si cassé) et la table {isBroken}. | 128 |
| `device:initSounds(jbeamData)` | Crée la boucle sonore du compresseur (lancée à volume 0), lit les nœuds et événements de son depuis le jbeam (par défaut le nœud moteur du parent) et crée le lisseur de hauteur. | 177 |
| `device:onBreak()` | Marque isBroken = true (sans autre effet réel car selectUpdates est vide dans ce cas). | 141 |
| `device:registerStorage(storageName)` | Enregistre un réservoir d'air : le stockage doit être de type pressureTank et de même energyType que requiredEnergyType, sinon une erreur est journalisée. Mémorise le réservoir dans pressureTank. | 146 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, pression, débit et énergie pompée, coefficients d'usure/dégâts, deloadCoef = 1 et lisseur de son ; relit gearRatio et friction. | 195 |
| `device:resetSounds(jbeamData)` | Ne fait rien. | 174 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin. | 116 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : torqueDiff = pumpPressure * pumpDisplacement / (2π) si inputAV > 0, sinon 0 (couple résistant du compresseur). | 70 |
| `device:updateGFX(dt)` | Mise à jour par image : envoie au flux GUI 'pneumaticsData' la pression du réservoir (kPa relatifs) et l'état 'Engaged' ou 'Disengaged', seulement si le flux est demandé. | 78 |
| `device:updateSounds(dt)` | Règle le volume (selon inputAV de 10 à 20 rad/s), la hauteur (régime lissé) et la couleur (1 - deloadCoef) du son de compresseur. | 94 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 137 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : lit inputAV du parent, calcule le débit d'air (max(0, inputAV/(2π) * pumpDisplacement * pumpEfficiency * (1 - deloadCoef))), ajoute l'énergie pompée au réservoir, gère l'enclenchement/délestage selon les pressions de coupure (joue le son de purge au délestage) et calcule pumpPressure. | 17 |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `playSFX`, `playSFXOnce`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/compressor.lua`.*

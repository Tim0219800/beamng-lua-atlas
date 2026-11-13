# `powertrain_hydraulicAccumulator`

*Fichier : `lua/vehicle/powertrain/hydraulicAccumulator.lua` · VM : Véhicule · 472 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `hydraulicAccumulator` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `hydraulicAccumulator` : accumulateur hydraulique autonome (réservoir sous pression, sans pompe ni entraînement mécanique). Il alimente des consommateurs hydrauliques (`hydraulicCylinder`, déclarés dans `v.data.powertrainHydros` avec `connectedPump` = nom de l'accumulateur) et peut se remplir à distance depuis la pompe d'un autre véhicule couplé (remorque, outil) via des valeurs electrics partagées (PTO hydraulique). Catégorie `hydraulicPowerSource`, sans port de sortie ni couple.

## Exemple

```lua
local acc = powertrain.getDevice("trailerAccumulator")
print(acc.accumulatorPressure, acc.accumulatorInFlow, acc.accumulatorOutFlow) -- Pa, m^3/s, m^3/s
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio, friction, dynamicFriction, electricsName, visualShaftAVName, node, showDebugGraph, accumulatorWorkingPressure (Pa, 25000000), accumulatorMaxVolume (m³, 0.001), initialAccumulatorPressure (Pa) ou initialAccumulatorOilVolume (m³) (sinon plein à la pression de travail), reliefOpeningPressure (1.05 * pression de travail), reliefPressureRange (2000000), reliefValveArea (m², 0.0001), hydraulicPTOPressureElectricsName / hydraulicPTOMaxFlowRateElectricsName / hydraulicPTOFlowElectricsName (lus mais peu utilisés), hydraulicPTOPressureBaseSyncName ('hydraulicPTOPressure'), hydraulicPTOFlowBaseSyncName ('hydraulicPTOFlow'), hydraulicPTOMaxFlowRateBaseSyncName ('hydraulicPTOMaxFlowRate'), hydraulicPTOSupplyCouplerNodeNames (nœuds par lesquels l'accumulateur se connecte à son alimentation), hydraulicPTOConsumerCouplerNodeNames (nœuds par lesquels un autre véhicule se connecte à lui), consumerPressureDiffFlowRateCoef (0.001), breakTriggerBeam.
- Champs principaux : accumulatorPressure (Pa) = accumulatorWorkingPressure / accumulatorMaxVolume * accumulatorOilVolume ; accumulatorOilVolume (m³, borné à 0..2*accumulatorMaxVolume) ; accumulatorMaxVolume ; accumulatorOutFlow (m³/s, consommateurs + décharge) ; accumulatorInFlow (m³/s, débit reçu de l'alimentation distante) ; reliefFlow (m³/s) ; connectedConsumers ; isBroken. outputTorque1/outputAV1 valent 0.
- Alimentation distante : l'accumulateur lit electrics.values[<PressureBase>_<idAlimentation>] et [<MaxFlowRateBase>_<idAlimentation>] et écrit son débit dans [<FlowBase>_<idAlimentation>_<monId>]. Le débit entrant est min((P_alim - P_locale) * consumerPressureDiffFlowRateCoef, 1.1 * débit max de l'alimentation), jamais négatif (pas de reflux).
- Il se comporte aussi comme alimentation pour d'autres véhicules : il publie sa pression dans electrics '<PressureBase>_<monId>' et reçoit les débits demandés par les consommateurs distants (soustraits de son volume).
- Un accumulateur cassé (onBreak) est vidé (pression et volume à 0) et cesse de recevoir de l'alimentation.
- Bugs : updateGFX écrit device.pumpFlowRate (jamais défini sur ce device, donc nil) dans l'electrics de débit max publié ('hydraulicPTOMaxFlowRate_<id>') ; les véhicules en aval qui lisent cette valeur reçoivent donc 0 d'après leur « or 0 ». Le champ device.inputAV ne change jamais (0). applyDeformGroupDamage est vide. M.requiredExternalInertiaOutputs n'est pas défini dans ce module. Un seul consommateur par alimentation est supporté (commentaire TODO dans le code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_hydraulicAccumulator.new(jbeamData)` | Construit l'accumulateur : pression de travail, volume, état initial, soupape de décharge, noms electrics de PTO, nœuds de coupleurs d'alimentation et de consommation, puis crée les consommateurs hydrauliques déclarés pour lui dans v.data.powertrainHydros. *(interne)* | 303 |

### Détail des paramètres

#### `powertrain_hydraulicAccumulator.new(jbeamData)`

Construit l'accumulateur : pression de travail, volume, état initial, soupape de décharge, noms electrics de PTO, nœuds de coupleurs d'alimentation et de consommation, puis crée les consommateurs hydrauliques déclarés pour lui dans v.data.powertrainHydros.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {hydraulicPowerSource=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData). velocityUpdate vaut nop.

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Ne fait rien (corps vide). | 155 |
| `device:calculateInertia()` | Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio. | 198 |
| `device:getPartCondition()` | Renvoie 1 (0 si cassé) et la table {isBroken}. | 170 |
| `device:getState()` | Renvoie l'état sauvegardable : volume d'huile (clé '<nom>_accumulatorOilVolume') fusionné avec l'état des consommateurs. | 211 |
| `device:initSounds(jbeamData)` | Initialise les sons de chaque consommateur ; l'accumulateur n'a pas de son propre. | 243 |
| `device:onBreak()` | Marque isBroken = true et vide l'accumulateur : pression, volume, débits et electrics de PTO remis à 0. | 183 |
| `device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook de coupleur. Côté consommateur : quand le coupleur d'alimentation est attaché, crée les noms electrics partagés avec le véhicule alimentant et lui envoie les noms à exporter. Côté alimentation : quand un véhicule se connecte à un coupleur de consommation, crée la valeur electrics de débit pour lui et la lui exporte. | 87 |
| `device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook de coupleur. Côté consommateur : supprime les valeurs electrics de l'alimentation. Côté alimentation : supprime la valeur de débit du consommateur parti. | 119 |
| `device:reset(jbeamData)` | Remet à zéro l'état (pression et volume initiaux, débits, electrics de PTO, noms d'alimentation), puis réinitialise les consommateurs. | 259 |
| `device:resetSounds(jbeamData)` | Appelle resetSounds de chaque consommateur. | 251 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin. | 158 |
| `device:setState(data)` | Restaure le volume d'huile (nombre fini, borné, ignoré si l'accumulateur est cassé) et la pression, puis transmet l'état aux consommateurs. | 225 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : calcule la pression, interroge chaque consommateur (consumer:update) pour obtenir ses débits, calcule le débit de la soupape de décharge, met outputTorque1 à 0 et retranche les débits sortants du volume d'huile. | 17 |
| `device:updateGFX(dt)` | Mise à jour par image : met à jour les consommateurs, reçoit le débit de l'alimentation distante (côté consommateur), publie la pression dans les electrics (côté alimentation) et soustrait les débits demandés par les consommateurs distants. | 42 |
| `device:updateSounds(dt)` | Appelle updateSounds de chaque consommateur (l'accumulateur n'a pas de son propre). | 81 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 179 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/hydraulicAccumulator.lua`.*

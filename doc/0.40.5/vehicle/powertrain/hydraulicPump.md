# `powertrain_hydraulicPump`

*Fichier : `lua/vehicle/powertrain/hydraulicPump.lua` · VM : Véhicule · 516 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** type de composant powertrain `hydraulicPump` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`

Composant powertrain `hydraulicPump` : pompe hydraulique (à cylindrée variable ou fixe) entraînée par un arbre, avec un accumulateur intégré et une soupape de décharge. C'est un consommateur de couple sans port de sortie (feuille de l'arbre powertrain). Il crée aussi les consommateurs hydrauliques (`hydraulicCylinder`) déclarés dans `v.data.powertrainHydros` avec `connectedPump` = nom de la pompe, et les met à jour. Il peut alimenter un autre véhicule par un coupleur (PTO hydraulique) grâce à des valeurs electrics partagées.

## Exemple

```lua
local pump = powertrain.getDevice("hydraulicPump")
pump:setConnected(true) -- embrayer la pompe (prise de force)
print(pump.accumulatorPressure, pump.pumpFlowRate) -- Pa, m^3/s
```

## Remarques

- Clés jbeam lues : name, type, inputName, inputIndex, gearRatio (1), friction, dynamicFriction, electricsName, visualShaftAVName, node, isConnected (si absent ou false, la pompe démarre DÉBRAYÉE : isConnectedCoef = 0), stallProtectionPumpRPM (500), showDebugGraph, showDebugGraphSound, pumpMaxDisplacement (m³/tr, 0.0002), pumpType ('variableDisplacement' par défaut ou 'fixedDisplacement'), pumpRegulationRange (Pa, 10000000), pumpWorkingPressure (Pa, 25000000), accumulatorMaxVolume (m³, 0.001), initialAccumulatorPressure (Pa) ou initialAccumulatorOilVolume (m³) (sinon 90 % de la pression et du volume), reliefOpeningPressure (1.05 * pression de travail), reliefPressureRange (2000000), reliefValveArea (m², 0.00001), unloadValveMaxFlow (m³/s, 0), hydraulicPTOPressureBaseSyncName ('hydraulicPTOPressure'), hydraulicPTOFlowBaseSyncName ('hydraulicPTOFlow'), hydraulicPTOMaxFlowRateBaseSyncName ('hydraulicPTOMaxFlowRate'), hydraulicPTOConsumerCouplerNodeNames (liste de noms de nœuds de coupleur), breakTriggerBeam, et pour les sons : pumpLoopEvent, pumpLoopNode, pumpSoundVolume (0.5), pumpSoundMaxFlowRate, pumpSoundMinRPM, pumpSoundMaxRPM, pumpSoundMinPitch, pumpSoundMaxPitch.
- Champs principaux : inputAV (rad/s, vitesse d'entrée = parent / gearRatio * isConnectedCoef), torqueDiff (N·m, couple résistant renvoyé à l'entraîneur), currentDisplacement (m³/tr), pumpFlowRate (m³/s), accumulatorPressure (Pa), accumulatorOilVolume (m³, borné à 2 * accumulatorMaxVolume), accumulatorMaxVolume, accumulatorOutFlow (m³/s sortant vers les consommateurs), reliefFlow, unloadFlow, pumpWorkingPressure, connectedConsumers (liste de consommateurs hydrauliques), isConnectedCoef, isBroken. outputTorque1/outputAV1 existent à 0.
- Pression de l'accumulateur : accumulatorPressure = pumpWorkingPressure * accumulatorOilVolume / accumulatorMaxVolume (modèle linéaire). La cylindrée variable diminue linéairement de 100 % à 10 % entre (pression de travail - plage de régulation) et la pression de travail, et est coupée progressivement sous 500 tr/min de pompe (protection anti-calage).
- La pompe publie sur electrics.values : <PressureBase>_<objectId> (pression, Pa) et <MaxFlowRateBase>_<objectId> (débit max, m³/s) ; un consommateur sur un autre véhicule envoie son débit via <FlowBase>_<objectId>_<objectId2>. Le coupleur doit être l'un des nœuds listés dans hydraulicPTOConsumerCouplerNodeNames.
- Les consommateurs sont construits par factory.new(consumerJbeamData, device) ; seul le type 'hydraulicCylinder' existe (hydraulicRotator est en commentaire). Un type inconnu ou un nom de consommateur dupliqué écrit une erreur dans le log.
- Incohérences : applyDeformGroupDamage est vide ; un pump cassé (isBroken) passe à updateVelocityBroken qui vide l'accumulateur ; hydraulicPTOPressureElectricsName, hydraulicPTOMaxFlowRateElectricsName et hydraulicPTOFlowElectricsName sont lus mais jamais utilisés (seuls les noms avec suffixe d'objet servent). M.requiredExternalInertiaOutputs n'est pas défini dans ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `powertrain_hydraulicPump.new(jbeamData)` | Construit la pompe : paramètres de cylindrée, pression de travail, accumulateur, soupape de décharge et PTO, puis crée les consommateurs hydrauliques déclarés pour cette pompe dans v.data.powertrainHydros. *(interne)* | 349 |

### Détail des paramètres

#### `powertrain_hydraulicPump.new(jbeamData)`

Construit la pompe : paramètres de cylindrée, pression de travail, accumulateur, soupape de décharge et PTO, puis crée les consommateurs hydrauliques déclarés pour cette pompe dans v.data.powertrainHydros.

- `jbeamData` (*table*) : Données jbeam du composant.
- **renvoie** : table Le device (classe `device`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true, hydraulicPowerSource=true, torqueConsumer=true}. |
| `outputPorts` | table | Table vide : aucun port de sortie. |

## Classe `device`

Objet renvoyé par new(jbeamData).

Objet `device` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Ne fait rien (corps vide). | 173 |
| `device:calculateInertia()` | Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio. | 206 |
| `device:getPartCondition()` | Renvoie 1 (0 si cassé) et la table {isBroken}. | 188 |
| `device:getState()` | Renvoie l'état sauvegardable : volume d'huile de l'accumulateur (clé '<nom>_accumulatorOilVolume') fusionné avec les états des consommateurs. | 219 |
| `device:initSounds(jbeamData)` | Crée la boucle sonore de la pompe (volume 0), calcule vitesse et débit maxima pour le son à partir du moteur entraîneur, lit les réglages de son du jbeam et initialise les sons des consommateurs. | 252 |
| `device:onBreak()` | Marque isBroken = true et passe à la version « cassée » de velocityUpdate (l'accumulateur se vide). | 201 |
| `device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook de coupleur : quand un coupleur de prise PTO de cette pompe s'attache à un autre véhicule, crée la valeur electrics de débit pour ce véhicule et lui envoie son nom via beamstate.sendExportCouplerData. | 134 |
| `device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook de coupleur : quand le coupleur PTO de cette pompe se détache, supprime la valeur electrics de débit de l'autre véhicule. | 148 |
| `device:reset(jbeamData)` | Remet à zéro vitesses, débits, accumulateur (pression et volume initiaux), état, valeurs electrics du PTO, puis réinitialise chaque consommateur. | 301 |
| `device:resetSounds(jbeamData)` | Appelle resetSounds de chaque consommateur ; ne touche pas au son de la pompe elle-même. | 293 |
| `device:setConnected(isConnected)` | Embraye (true) ou débraye (false) la pompe de son entraîneur : isConnectedCoef = 1 ou 0. Peut être appelée par un contrôleur de PTO. | 159 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin. | 176 |
| `device:setState(data)` | Restaure le volume d'huile de l'accumulateur (nombre fini, borné à 2 * accumulatorMaxVolume) et la pression correspondante, puis transmet l'état aux consommateurs. | 233 |
| `device:torqueUpdate(dt)` | Appelée à chaque pas physique : calcule la pression d'accumulateur, le couple résistant torqueDiff = pression * cylindrée / (2π) / gearRatio, interroge chaque consommateur (consumer:update) pour obtenir ses débits, puis calcule le débit de décharge (déchargeur et soupape de décharge progressive). | 51 |
| `device:updateGFX(dt)` | Mise à jour par image : met à jour les consommateurs (updateGFX), publie la pression et le débit max sur electrics, soustrait le débit demandé par les consommateurs distants (PTO) de l'accumulateur et affiche un graphe de débogage si showDebugGraph. | 74 |
| `device:updateSounds(dt)` | Règle volume, hauteur (selon la vitesse de la pompe) et couleur (selon la puissance hydraulique) du son de pompe et appelle updateSounds des consommateurs. | 96 |
| `device:validate()` | Appelée après construction du powertrain ; renvoie toujours true. | 197 |
| `device:velocityUpdate(dt)` | Appelée à chaque pas physique : calcule la cylindrée courante (variable ou fixe), inputAV = vitesse du parent / gearRatio * isConnectedCoef, le débit de la pompe et met à jour le volume d'huile de l'accumulateur (débit entrant moins sorties, décharge, déchargeur). Version cassée : tout à 0 et vidange. | 44 |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/powertrain/hydraulicPump.lua`.*

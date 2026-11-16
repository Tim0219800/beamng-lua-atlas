# `controller_gauges_customModules_combustionEngineData`

*Fichier : `lua/vehicle/controller/gauges/customModules/combustionEngineData.lua` · VM : Véhicule · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/combustionEngineData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : calcule consommation de carburant (l/100 km), affichage de consommation, puissance et couple des moteurs à combustion et autonomie restante. Les calculs ne sont faits que pour les propriétés demandées.

## Remarques

- La consommation instantanée vient de la variation de electrics.values.fuelVolume divisée par dt*wheelspeed, bornée à 0..50 l/100 km ; la moyenne est lissée sur ~10 minutes et initialisée à 10 l/100 km.
- Puissance = somme de outputTorque1 * outputAV1 des dispositifs "combustionEngine", convertie en ch (W * 0.001 * 1.35962). Le véhicule est considéré en mouvement au-dessus de 0.5 m/s (wheelspeed).
- setupGaugeData ajoute les réservoirs de chaque moteur dans fuelTanks sans vider la liste : un second appel les duplique.
- updateGaugeData lit electrics.values.wheelspeed sans valeur par défaut : erreur Lua si nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_combustionEngineData.init(jbeamData)` | Initialise la consommation moyenne lissée à 10 l/100 km. *(interne)* | 133 |
| `controller_gauges_customModules_combustionEngineData.reset()` | Réinitialise l'état interne du module. *(interne)* | 123 |
| `controller_gauges_customModules_combustionEngineData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange (remainingRange ; active aussi fuelConsumption). *(interne)* | 107 |
| `controller_gauges_customModules_combustionEngineData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 40 |
| `controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 43 |

### Détail des paramètres

#### `controller_gauges_customModules_combustionEngineData.init(jbeamData)`

Initialise la consommation moyenne lissée à 10 l/100 km.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_combustionEngineData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange (remainingRange ; active aussi fuelConsumption).

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_combustionEngineData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/combustionEngineData.lua`.*

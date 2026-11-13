# `controller_gauges_customModules_dynamicRedlineData`

*Fichier : `lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua` · VM : Véhicule · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/dynamicRedlineData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : calcule une zone rouge/jaune de compte-tours qui dépend de la température d'huile (moteur froid = régime max réduit) et un voyant de changement de rapport. Les valeurs sont converties en une échelle de sortie entière (ex. nombre de segments d'une barre de LED).

## Remarques

- Clés jbeam du module (défaut) : minOutput (0), maxOutput (20), minOutputRPM (0), maxOutputRPM (10000), minOilTemp (50, °C), maxOilTemp (90), yellowOutputOffset (-2), coldOilRPMCoef (0.5).
- Régime rouge ajusté = maxrpm * interpolation linéaire du coefficient entre coldOilRPMCoef (huile froide) et 1 (huile chaude). shiftLight vrai à partir de 95 % de ce régime, sauf au dernier rapport (gearIndex >= maxGearIndex).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_dynamicRedlineData.init(jbeamData)` | Lit les paramètres jbeam de l'échelle de sortie et de la température d'huile. *(interne)* | 42 |
| `controller_gauges_customModules_dynamicRedlineData.reset()` | Réinitialise l'état interne du module. *(interne)* | 39 |
| `controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours yellow, red (entiers) et shiftLight (booléen). *(interne)* | 36 |
| `controller_gauges_customModules_dynamicRedlineData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 21 |
| `controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 24 |

### Détail des paramètres

#### `controller_gauges_customModules_dynamicRedlineData.init(jbeamData)`

Lit les paramètres jbeam de l'échelle de sortie et de la température d'huile.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours yellow, red (entiers) et shiftLight (booléen).

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_dynamicRedlineData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua`.*

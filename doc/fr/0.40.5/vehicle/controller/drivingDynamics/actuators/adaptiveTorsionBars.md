# `controller_drivingDynamics_actuators_adaptiveTorsionBars`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua` · VM : Véhicule · 125 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/adaptiveTorsionBars` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : barres de torsion (anti-roulis) à raideur variable. Il regroupe des barres de torsion par nom et applique, selon un mode nommé, des coefficients multiplicatifs à leur raideur et amortissement jbeam via `obj:setTorsionbarSpringDamp`. Le mode se choisit par `setParameters({torsionBarMode = "nom"})`, typiquement depuis un mode `driveModes` de type "controller". Ordre d'appel : `defaultOrder = 80`.

## Exemple

```lua
controller.getControllerSafe("drivingDynamics/adaptiveTorsionBars").setParameters({torsionBarMode = "stiff"})
```

## Remarques

- Clés jbeam lues par init : `torsionBarNames` (liste de noms de barres jbeam), `modes` (table d'en-tête : `name`, `springCoef`, `dampCoef`, 1 par défaut), `name`.
- Les coefficients multiplient les valeurs de base de `v.data.torsionbars` (spring, damp) : le changement n'est pas cumulatif d'un mode à l'autre.
- Aucune mise à jour périodique ; un nom de mode inconnu est logué en erreur. `shutdown` met isActive à false et retire update/updateGFX (nil) sans rétablir les valeurs de base.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig()` | Renvoie une copie des paramètres. | 103 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData)` | Retrouve les barres de torsion par nom et lit les modes. *(interne)* | 43 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.initLastStage()` | Vide. *(interne)* | 76 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 83 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.reset()` | Vide (les barres ne sont pas remises à l'état initial). *(interne)* | 40 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 107 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable)` | Remplace la table de paramètres (sans effet sur les modes). *(interne)* | 99 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled)` | Mémorise le mode debug (sans autre effet). *(interne)* | 79 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters)` | Applique un mode de raideur si `parameters.torsionBarMode` est fourni. | 93 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.shutdown()` | Arrête l'actionneur (isActive = false). *(interne)* | 87 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde ({isEnabled = true} par défaut).

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData)`

Retrouve les barres de torsion par nom et lit les modes.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable)`

Remplace la table de paramètres (sans effet sur les modes).

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled)`

Mémorise le mode debug (sans autre effet).

- `debugEnabled` (*boolean*) : État du mode debug.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters)`

Applique un mode de raideur si `parameters.torsionBarMode` est fourni.

- `parameters` (*table*) : Champ : torsionBarMode (nom d'un mode défini dans `modes`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | false : jamais modifié dans ce fichier. |
| `isActive` | boolean | true après init. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `setTorsionbarSpringDamp`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua`.*

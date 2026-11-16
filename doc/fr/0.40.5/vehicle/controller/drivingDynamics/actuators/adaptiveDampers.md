# `controller_drivingDynamics_actuators_adaptiveDampers`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua` · VM : Véhicule · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/adaptiveDampers` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : amortisseurs à amortissement variable. Il regroupe des poutres d'amortisseur (par nom) et applique, selon un mode nommé (Comfort, Sport...), des coefficients multiplicatifs à leurs valeurs jbeam d'amortissement via `obj:setBoundedBeamDamp`. Le mode se choisit par `setParameters({damperMode = "nom"})`, typiquement depuis un mode `driveModes` de type "controller". Ordre d'appel : `defaultOrder = 80`.

## Exemple

```lua
controller.getControllerSafe("drivingDynamics/adaptiveDampers").setParameters({damperMode = "sport"})
```

## Remarques

- Clés jbeam lues par init : `dampBeamNames` (liste de noms de poutres jbeam), `modes` (table d'en-tête : `name`, `beamDampCoef`, `beamDampFastCoef`, `beamDampReboundCoef`, `beamDampReboundFastCoef`, `beamDampVelocitySplitCoef`, tous à 1 par défaut), `name`.
- Les coefficients multiplient les valeurs de base de `v.data.beams` (beamDamp, beamDampRebound, beamDampFast, beamDampReboundFast, beamDampVelocitySplit) : le changement n'est donc pas cumulatif d'un mode à l'autre. La même valeur de seuil de vitesse (VelocitySplit) sert pour compression et détente.
- Aucune mise à jour périodique : ni update ni updateGFX. `controlParameters.isEnabled` n'est pas utilisé. Un nom de mode inconnu est logué en erreur.
- `shutdown` met isActive à false et retire update/updateGFX (nil) mais ne rétablit pas l'amortissement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_adaptiveDampers.getConfig()` | Renvoie une copie des paramètres. | 110 |
| `controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData)` | Retrouve les poutres d'amortisseur par nom et lit les modes. *(interne)* | 47 |
| `controller_drivingDynamics_actuators_adaptiveDampers.initLastStage()` | Vide. *(interne)* | 83 |
| `controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 90 |
| `controller_drivingDynamics_actuators_adaptiveDampers.reset()` | Vide (l'amortissement n'est pas remis à l'état initial). *(interne)* | 44 |
| `controller_drivingDynamics_actuators_adaptiveDampers.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 114 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable)` | Remplace la table de paramètres (sans effet sur les modes). *(interne)* | 106 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled)` | Mémorise le mode debug (sans autre effet). *(interne)* | 86 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters)` | Applique un mode d'amortissement si `parameters.damperMode` est fourni. | 100 |
| `controller_drivingDynamics_actuators_adaptiveDampers.shutdown()` | Arrête l'actionneur (isActive = false). *(interne)* | 94 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_adaptiveDampers.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde ({isEnabled = true} par défaut).

#### `controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData)`

Retrouve les poutres d'amortisseur par nom et lit les modes.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable)`

Remplace la table de paramètres (sans effet sur les modes).

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled)`

Mémorise le mode debug (sans autre effet).

- `debugEnabled` (*boolean*) : État du mode debug.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters)`

Applique un mode d'amortissement si `parameters.damperMode` est fourni.

- `parameters` (*table*) : Champ : damperMode (nom d'un mode défini dans `modes`).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | false : jamais modifié dans ce fichier. |
| `isActive` | boolean | true après init. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `setBoundedBeamDamp`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua`.*

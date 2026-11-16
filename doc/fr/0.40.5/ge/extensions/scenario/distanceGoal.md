# `scenario_distanceGoal`

*Fichier : `lua/ge/extensions/scenario/distanceGoal.lua` · VM : Game Engine (GE) · 129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_distanceGoal` : `extensions.load("scenario_distanceGoal")`, puis la globale `scenario_distanceGoal`

Objectif de scénario « distance » (goals.vehicles avec id = 'distance') : la distance entre le véhicule du goal et un objet cible du scenetree ne doit pas sortir de [minDistance, maxDistance]. Utile pour des scénarios de poursuite ou de convoi. Appelé par le système de goals de scenario_scenarios.

## Exemple

```lua
-- JSON du scénario :
-- {"id":"distance", "value":{"target":"police", "maxDistance":80, "minDistance":5, "distanceEnable":60, "purpose":"fail", "msg":"Trop loin"}}
```

## Remarques

- Options de instance.value : target (nom d'un objet du scenetree, obligatoire en pratique), maxDistance, minDistance, distanceEnable (tous number, mètres), purpose ('fail' par défaut ou 'win'), msg.
- distanceEnable : tant que le véhicule n'est jamais passé sous cette distance de la cible, les limites ne sont pas contrôlées. Une fois passé en dessous, status.checkForCarDistance reste true.
- Les contrôles se font sur l'état 'onRaceTick'.
- Si scenario.targetName existe, le goal échoue en plus dès que le véhicule est à 5 m ou moins de cet objet (message 'DistanceBetweenSceneObjects.fail.msg'), sinon status.result = 'passed'.
- Bug probable : si target est nil, le log d'erreur concatène instance.value.target (nil) et plante ; getVehicleByName(nil) est aussi appelé sans garde.
- Dans showMsg, l'expression {txt = ...} or {...} ne se rabat jamais sur le message par défaut de victoire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_distanceGoal.init(scenario)` | Réinitialise instances et ajoute chaque goal id='distance' dont les options numériques sont valides ; purpose vaut 'fail' si absent ; checkForCarDistance est mis à false. *(interne)* | 88 |
| `scenario_distanceGoal.processState(scenario, state, stateData)` | Appelé à chaque état du scénario ; sur 'onRaceTick' mesure la distance au véhicule cible et termine le scénario (victoire ou défaite selon purpose) si elle sort des bornes. *(interne)* | 37 |
| `scenario_distanceGoal.updateFinalStatus(scenario, instance)` | Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario. *(interne)* | 118 |

### Détail des paramètres

#### `scenario_distanceGoal.init(scenario)`

Réinitialise instances et ajoute chaque goal id='distance' dont les options numériques sont valides ; purpose vaut 'fail' si absent ; checkForCarDistance est mis à false.

- `scenario` (*table*) : Scénario courant.

#### `scenario_distanceGoal.processState(scenario, state, stateData)`

Appelé à chaque état du scénario ; sur 'onRaceTick' mesure la distance au véhicule cible et termine le scénario (victoire ou défaite selon purpose) si elle sort des bornes.

- `scenario` (*table*) : Scénario courant.
- `state` (*string*) : Nom de l'état ; 'onRaceTick' traité.
- `stateData` (*table*) : Données de l'état (non utilisées).

#### `scenario_distanceGoal.updateFinalStatus(scenario, instance)`

Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario.

- `scenario` (*table*) : Scénario courant.
- `instance` (*table|nil*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'distance' valides, remplie par init(). |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/distanceGoal.lua`.*

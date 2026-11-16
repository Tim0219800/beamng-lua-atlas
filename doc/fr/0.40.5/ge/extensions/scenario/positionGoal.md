# `scenario_positionGoal`

*Fichier : `lua/ge/extensions/scenario/positionGoal.lua` · VM : Game Engine (GE) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_positionGoal` : `extensions.load("scenario_positionGoal")`, puis la globale `scenario_positionGoal`

Objectif de scénario « position » (goals.vehicles avec id = 'position') : en fin de course, le véhicule doit se trouver dans la zone d'un objet du scenetree (par exemple une zone de freinage). La zone est définie par la distance au centre de l'objet endPoint, comparée à son scale.x.

## Exemple

```lua
-- JSON du scénario :
-- {"id":"position", "value":{"endPoint":"brake_zone", "purpose":"fail", "msg":"Vous n'êtes pas dans la zone"}}
```

## Remarques

- Options de instance.value : endPoint (nom d'objet du scenetree), purpose ('fail' par défaut ou 'win'), msg.
- La vérification n'a lieu que sur l'état 'onRaceResult' : si la distance au centre de endPoint dépasse endPoint.scale.x, showMsg termine le scénario ; sinon status.result = 'passed'.
- Bug probable : en purpose 'win', instance.value.msg .. timeStr plante si msg est nil (le 'or' de repli est évalué trop tard).
- Le message d'échec par défaut ('Not in brake area') est en anglais codé en dur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_positionGoal.init(scenario)` | Réinitialise instances et ajoute chaque goal id='position' ; purpose vaut 'fail' si absent. *(interne)* | 60 |
| `scenario_positionGoal.processState(scenario, state, stateData)` | Appelé à chaque état du scénario. Sur 'onRaceResult', vérifie que le véhicule est dans la zone de l'objet endPoint. *(interne)* | 38 |
| `scenario_positionGoal.updateFinalStatus(scenario, instance)` | Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress. *(interne)* | 78 |

### Détail des paramètres

#### `scenario_positionGoal.init(scenario)`

Réinitialise instances et ajoute chaque goal id='position' ; purpose vaut 'fail' si absent.

- `scenario` (*table*) : Scénario courant.

#### `scenario_positionGoal.processState(scenario, state, stateData)`

Appelé à chaque état du scénario. Sur 'onRaceResult', vérifie que le véhicule est dans la zone de l'objet endPoint.

- `scenario` (*table*) : Scénario courant.
- `state` (*string*) : Nom de l'état.
- `stateData` (*table*) : Données de l'état (non utilisées).

#### `scenario_positionGoal.updateFinalStatus(scenario, instance)`

Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress.

- `scenario` (*table*) : Scénario courant.
- `instance` (*table|nil*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'position' valides, remplie par init(). |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/positionGoal.lua`.*

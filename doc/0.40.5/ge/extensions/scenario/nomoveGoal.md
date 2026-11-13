# `scenario_nomoveGoal`

*Fichier : `lua/ge/extensions/scenario/nomoveGoal.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_nomoveGoal` : `extensions.load("scenario_nomoveGoal")`, puis la globale `scenario_nomoveGoal`

Objectif de scénario « nomove » (goals.vehicles avec id = 'nomove') : le véhicule ne doit pas bouger de plus de 0.1 m par rapport à sa position de départ. Appelé par le système de goals de scenario_scenarios.

## Exemple

```lua
-- JSON du scénario :
-- {"id":"nomove", "value":{"msg":"Ne bougez pas", "triggerEndOnly":false}}
```

## Remarques

- Options de instance.value : msg (message d'échec), triggerEndOnly (boolean).
- La position de départ est relevée à init puis rafraîchie sur l'état 'onCountdownEnded'.
- Contrôle sur 'onRaceTick' et 'onRaceResult' : si le véhicule s'est éloigné de plus de 0.1 m, échec (scenario_scenarios.finish({failed = msg})). Avec triggerEndOnly, le mouvement termine simplement le scénario via scenario_scenarios.endScenario(0.25) et aucun résultat n'est enregistré.
- Si le véhicule n'est pas présent (vId absent), une erreur est loguée une seule fois et l'instance est ignorée ; à l'init elle n'est pas ajoutée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_nomoveGoal.init(scenario)` | Réinitialise instances et ajoute chaque goal id='nomove' dont le véhicule existe, en mémorisant sa position de départ. *(interne)* | 45 |
| `scenario_nomoveGoal.processState(scenario, state, stateData)` | Appelé à chaque état du scénario. Met à jour la position de départ sur 'onCountdownEnded' puis vérifie l'immobilité sur 'onRaceTick' et 'onRaceResult'. *(interne)* | 9 |
| `scenario_nomoveGoal.updateFinalStatus(scenario, instance)` | Sauf si triggerEndOnly, envoie le résultat à statistics_statistics.setGoalProgress pour le véhicule du goal et pour le véhicule du joueur 0. *(interne)* | 61 |

### Détail des paramètres

#### `scenario_nomoveGoal.init(scenario)`

Réinitialise instances et ajoute chaque goal id='nomove' dont le véhicule existe, en mémorisant sa position de départ.

- `scenario` (*table*) : Scénario courant.

#### `scenario_nomoveGoal.processState(scenario, state, stateData)`

Appelé à chaque état du scénario. Met à jour la position de départ sur 'onCountdownEnded' puis vérifie l'immobilité sur 'onRaceTick' et 'onRaceResult'.

- `scenario` (*table*) : Scénario courant.
- `state` (*string*) : Nom de l'état.
- `stateData` (*table*) : Données de l'état (non utilisées).

#### `scenario_nomoveGoal.updateFinalStatus(scenario, instance)`

Sauf si triggerEndOnly, envoie le résultat à statistics_statistics.setGoalProgress pour le véhicule du goal et pour le véhicule du joueur 0.

- `scenario` (*table*) : Scénario courant.
- `instance` (*table|nil*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'nomove' valides, remplie par init(). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/nomoveGoal.lua`.*

# `scenario_damageGoal`

*Fichier : `lua/ge/extensions/scenario/damageGoal.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_damageGoal` : `extensions.load("scenario_damageGoal")`, puis la globale `scenario_damageGoal`

Objectif de scénario « damage » (goals.vehicles avec id = 'damage'). Il surveille le dégât du véhicule (map.objects[...].damage) à chaque tick de course et fait gagner ou perdre le scénario quand le dégât dépasse damageLimit. Il est appelé par le système de goals de scenario_scenarios (init au chargement, processState à chaque état, updateFinalStatus à la fin).

## Exemple

```lua
-- dans le JSON du scénario, goal d'un véhicule :
-- {"id":"damage", "value":{"damageLimit":5000, "damageThreshold":500, "purpose":"fail", "msg":"Trop de dégâts"}}
```

## Remarques

- Options lues dans instance.value : damageLimit (number), damageThreshold (number), purpose ('fail' par défaut, ou 'win'), msg (texte final). Un type incorrect fait ignorer l'instance avec une erreur dans le log.
- Tout se passe sur l'état 'onRaceTick'. Si le véhicule n'est pas encore dans map.objects, l'objectif appelle helper.trackVehicle pour activer le suivi et attend le tick suivant.
- Quand le dégât progresse d'au moins damageThreshold (en pourcentage de damageLimit) depuis le dernier message, un flashUiMessage de 1 s est affiché (clés de traduction checkDamage.win.msg ou checkDamage.fail.msg avec le contexte damage en pourcentage).
- Dans showMsg, l'expression {txt = instance.value.msg, ...} or {...} ne se rabat jamais sur le message par défaut (une table est toujours vraie) : si purpose='win' et msg absent, txt vaut nil.
- Tant que le dégât est sous la limite, status.result est mis à 'passed' à chaque tick.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_damageGoal.init(scenario)` | Réinitialise instances et y ajoute chaque goal id='damage' de scenario.goals.vehicles après vérification des types (purpose vaut 'fail' si absent, lastProgress initialisé à 0). *(interne)* | 68 |
| `scenario_damageGoal.processState(scenario, state, stateData)` | Appelé par le système de goals à chaque changement d'état du scénario. Sur 'onRaceTick', compare le dégât du véhicule à damageLimit, affiche la progression et termine le scénario (scenario_scenarios.finish) en victoire ou défaite selon purpose. *(interne)* | 36 |
| `scenario_damageGoal.updateFinalStatus(scenario, instance)` | Enregistre le résultat de chaque instance dans statistics_statistics.setGoalProgress en fin de scénario. *(interne)* | 95 |

### Détail des paramètres

#### `scenario_damageGoal.init(scenario)`

Réinitialise instances et y ajoute chaque goal id='damage' de scenario.goals.vehicles après vérification des types (purpose vaut 'fail' si absent, lastProgress initialisé à 0).

- `scenario` (*table*) : Table du scénario courant.

#### `scenario_damageGoal.processState(scenario, state, stateData)`

Appelé par le système de goals à chaque changement d'état du scénario. Sur 'onRaceTick', compare le dégât du véhicule à damageLimit, affiche la progression et termine le scénario (scenario_scenarios.finish) en victoire ou défaite selon purpose.

- `scenario` (*table*) : Scénario courant (scenario.timer sert à formater le temps).
- `state` (*string*) : Nom de l'état ; seul 'onRaceTick' est traité.
- `stateData` (*table*) : Données de l'état (non utilisées).

#### `scenario_damageGoal.updateFinalStatus(scenario, instance)`

Enregistre le résultat de chaque instance dans statistics_statistics.setGoalProgress en fin de scénario.

- `scenario` (*table*) : Scénario courant.
- `instance` (*table|nil*) : Non utilisé : la boucle parcourt M.instances.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'damage' valides, remplie par init(). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/damageGoal.lua`.*

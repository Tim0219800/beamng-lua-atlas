# `scenario_timeLimit`

*Fichier : `lua/ge/extensions/scenario/timeLimit.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_timeLimit` : `extensions.load("scenario_timeLimit")`, puis la globale `scenario_timeLimit`

But de scénario « timeLimit » : le scénario doit être terminé en moins de maxTime secondes. Chargé par scenario_raceGoals (init, processState, updateFinalStatus) ; déclaré dans goals.vehicles avec id 'timeLimit'. Peut afficher un compte à rebours sur les dernières secondes et échoue si le temps est dépassé.

## Exemple

```lua
-- JSON : {"id":"timeLimit", "value":{"maxTime":60, "waitTime":2, "countdown":10, "msg":"Trop long"}}
```

## Remarques

- Champs de instance.value : maxTime (s), waitTime (s de tolérance après maxTime pendant la course), countdown (s : seuil d'affichage du compte à rebours), msg (message d'échec).
- Pendant 'onRaceTick' (uniquement si waitTime est défini et maxTime ~= 0) : si countdown est fourni, affiche un message chaque seconde sous le seuil ; si scenario.timer > maxTime + waitTime, échec (failedGoal -> scenario_scenarios.finish({failed=...})). Sur 'onRaceResult' : échec si scenario.finalStatus.finalTime > maxTime, sinon le statut devient 'passed'.
- Bug/incohérence : init rejette l'instance seulement si maxTime ET waitTime ne sont PAS des nombres (opérateur and) ; une seule valeur invalide passe.
- Bug/incohérence : sans waitTime, le contrôle 'onRaceTick' est ignoré (seul 'onRaceResult' vérifie la limite). L'instance.wait est initialisé à countdown (peut être nil, ce qui ferait échouer la comparaison timeleft < instance.wait si countdown est nul mais défini autrement).
- Bug/incohérence : updateFinalStatus ignore son argument instance et redéclare la variable de boucle du même nom.
- Le message d'échec par défaut est {txt = 'extensions.scenario.timeLimit.failedGoal', context = {maxTime}} ; valeur non traduite dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_timeLimit.init(scenario)` | Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'timeLimit') après validation des types de maxTime/waitTime/countdown ; instance.wait reçoit countdown. *(interne)* | 55 |
| `scenario_timeLimit.processState(scenario, state, stateData)` | Appelée par scenario_raceGoals à chaque évènement : gère 'onRaceTick' (compte à rebours et dépassement de maxTime + waitTime) et 'onRaceResult' (comparaison du temps final à maxTime). *(interne)* | 21 |
| `scenario_timeLimit.updateFinalStatus(scenario, instance)` | Appelée en fin de scénario : publie le statut de chaque instance dans statistics_statistics. *(interne)* | 76 |

### Détail des paramètres

#### `scenario_timeLimit.init(scenario)`

Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'timeLimit') après validation des types de maxTime/waitTime/countdown ; instance.wait reçoit countdown.

- `scenario` (*table*) : scénario courant

#### `scenario_timeLimit.processState(scenario, state, stateData)`

Appelée par scenario_raceGoals à chaque évènement : gère 'onRaceTick' (compte à rebours et dépassement de maxTime + waitTime) et 'onRaceResult' (comparaison du temps final à maxTime).

- `scenario` (*table*) : scénario courant
- `state` (*string*) : nom du hook
- `stateData` (*table|nil*) : données du hook (non utilisées)

#### `scenario_timeLimit.updateFinalStatus(scenario, instance)`

Appelée en fin de scénario : publie le statut de chaque instance dans statistics_statistics.

- `scenario` (*table*) : scénario courant
- `instance` (*table*) : non utilisé (déduit du code)

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | Instances du but 'timeLimit' pour le scénario courant, remplies par init. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/timeLimit.lua`.*

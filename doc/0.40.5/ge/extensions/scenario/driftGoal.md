# `scenario_driftGoal`

*Fichier : `lua/ge/extensions/scenario/driftGoal.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_driftGoal` : `extensions.load("scenario_driftGoal")`, puis la globale `scenario_driftGoal`

Objectif de scénario « drift » (goals.vehicles avec id = 'drift'). Il calcule un score de dérive à partir de l'écart entre la direction du véhicule (dirVec) et celle de sa vitesse (vel), avec combos et messages d'encouragement affichés via scenariohelper.realTimeUiDisplay. Le scénario se termine quand le temps imparti (timeAllowance) est dépassé ou à l'état 'onRaceResult'.

## Exemple

```lua
-- JSON du scénario :
-- {"id":"drift", "value":{"minDrift":2000, "maxDrift":10000, "timeAllowance":60, "msg":"Bravo", "failMsg":"Raté"}}
```

## Remarques

- Options de instance.value : minDrift (score minimal pour réussir), maxDrift (plafond de la progression enregistrée), timeAllowance (secondes de scenario.timer), msg et failMsg (textes finaux, reçoivent context.score).
- Le score instantané = floor(angleBonus) * speedBonus ; angleBonus = floor(10 * écart des vecteurs), ignoré s'il vaut 1 ou moins (dérive trop faible) ou 11 et plus (tête-à-queue) ; speedBonus = vitesse * 0.15, ignoré s'il vaut 1 ou moins. Un combo multiplie le score par (combo + 1) tant que le délai de grâce n'est pas écoulé.
- Les compteurs de dérive (driftState, driftCombo...) sont des variables locales du module, partagées entre toutes les instances : le goal ne gère correctement qu'un seul véhicule.
- Les compteurs de cooldown décroissent par appel de processState (0.25 par appel, message 0.1), pas en secondes réelles.
- Si la vitesse est nulle, fobjData.vel:length() vaut 0 et la division donne des valeurs non finies (nan) dans le calcul d'angle.
- updateFinalStatus plante si value.minDrift est nil ; sessionEnd aussi (comparaison avec nil).
- Le message de réussite par défaut utilise instance.value.driftPoints, qui n'est jamais défini ailleurs dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_driftGoal.init(scenario)` | Réinitialise instances et l'état de dérive ; ajoute chaque goal id='drift' (minDrift et maxDrift doivent être numériques) avec driftScore = 0 et status.completed = false. *(interne)* | 118 |
| `scenario_driftGoal.processState(scenario, state, stateData)` | Appelé à chaque état du scénario : met à jour le score de dérive du véhicule d'après map.objects, affiche le message temps réel, et termine le scénario (sessionEnd) sur 'onRaceResult' ou si timeAllowance est dépassé. Réactive le suivi mapmgr si le véhicule n'est pas encore dans map.objects. *(interne)* | 53 |
| `scenario_driftGoal.updateFinalStatus(scenario, instance)` | Fixe passed ou failed selon driftScore >= minDrift et envoie points (driftScore) et maxPoints (maxDrift) à statistics_statistics.setGoalProgress. *(interne)* | 147 |

### Détail des paramètres

#### `scenario_driftGoal.init(scenario)`

Réinitialise instances et l'état de dérive ; ajoute chaque goal id='drift' (minDrift et maxDrift doivent être numériques) avec driftScore = 0 et status.completed = false.

- `scenario` (*table*) : Scénario courant.

#### `scenario_driftGoal.processState(scenario, state, stateData)`

Appelé à chaque état du scénario : met à jour le score de dérive du véhicule d'après map.objects, affiche le message temps réel, et termine le scénario (sessionEnd) sur 'onRaceResult' ou si timeAllowance est dépassé. Réactive le suivi mapmgr si le véhicule n'est pas encore dans map.objects.

- `scenario` (*table*) : Scénario courant (scenario.timer).
- `state` (*string*) : Nom de l'état ; 'onRaceResult' termine la session.
- `stateData` (*table*) : Données de l'état (non utilisées).

#### `scenario_driftGoal.updateFinalStatus(scenario, instance)`

Fixe passed ou failed selon driftScore >= minDrift et envoie points (driftScore) et maxPoints (maxDrift) à statistics_statistics.setGoalProgress.

- `scenario` (*table*) : Scénario courant.
- `instance` (*table|nil*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'drift' valides, remplie par init(). |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/driftGoal.lua`.*

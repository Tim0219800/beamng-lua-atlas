# `gameplayStatistic`

*Fichier : `lua/vehicle/extensions/gameplayStatistic.lua` · VM : Véhicule · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayStatistic` : `extensions.load (VM véhicule)("gameplayStatistic")`, puis la globale `gameplayStatistic`

Relais de statistiques de gameplay côté véhicule : transmet des métriques au module GE gameplay_statistic (metricAdd/metricSet) et exécute à tour de rôle, une par frame, des fonctions de surveillance enregistrées (planificateur). Au chargement il active les modules watchAirtime (temps en l'air) et watchBurnout (temps de burnout).

## Exemple

```lua
extensions.gameplayStatistic.metricAdd('vehicle/monCompteur', 3.5, true)
```

## Remarques

- metricAdd/metricSet envoient une commande Lua au GE : gameplay_statistic.metricAdd(nom, valeur, aggregate). Le nom est sérialisé avec dumps, valeur et aggregate avec tostring.
- Le planificateur exécute une seule fonction de statSchedule par frame, en rotation. Rien n'est exécuté si aucun joueur n'est assis et que ai.mode n'est pas 'disabled' (condition `not anyPlayerSeated and ai.mode ~= 'disabled'`).
- onExtensionLoaded renvoie false (déchargement) si le véhicule n'a aucune roue et n'utilise ni hydros ni powertrain en pas de physique.
- updateGFX vaut nil au repos et est activé par addSchedule via extensions.hookUpdate.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayStatistic.addSchedule(fn)` | Ajoute une fonction au planificateur (exécutée une fois tous les N frames où N = nombre de fonctions) et active updateGFX. | 31 |
| `gameplayStatistic.metricAdd(name, value, aggregate)` | Ajoute une valeur à une métrique du GE. | 14 |
| `gameplayStatistic.metricSet(name, value, aggregate)` | Fixe la valeur d'une métrique du GE. | 18 |
| `gameplayStatistic.onExtensionLoaded()` | Appelé au chargement : se décharge pour les véhicules sans roues ni physique de powertrain/hydros, sinon charge watchAirtime et watchBurnout et enregistre leur workload dans le planificateur. *(interne)* *(hook)* | 53 |
| `gameplayStatistic.removeSchedule(fn)` | Retire une fonction du planificateur ; désactive updateGFX s'il n'en reste plus. | 38 |
| `gameplayStatistic.updateGFX(dt)` | Vaut nil au repos ; quand actif, exécute une fonction du planificateur par frame. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `gameplayStatistic.addSchedule(fn)`

Ajoute une fonction au planificateur (exécutée une fois tous les N frames où N = nombre de fonctions) et active updateGFX.

- `fn` (*function*) : Fonction sans argument à exécuter périodiquement.

#### `gameplayStatistic.metricAdd(name, value, aggregate)`

Ajoute une valeur à une métrique du GE.

- `name` (*string*) : Nom de la métrique (ex. 'vehicle/airtime.time').
- `value` (*number*) : Valeur à ajouter.
- `aggregate` (*boolean|nil*) : Transmis tel quel au GE (agrégation, déduit du code).

#### `gameplayStatistic.metricSet(name, value, aggregate)`

Fixe la valeur d'une métrique du GE.

- `name` (*string*) : Nom de la métrique.
- `value` (*number*) : Valeur.
- `aggregate` (*boolean|nil*) : Transmis tel quel au GE.

#### `gameplayStatistic.onExtensionLoaded()`

Appelé au chargement : se décharge pour les véhicules sans roues ni physique de powertrain/hydros, sinon charge watchAirtime et watchBurnout et enregistre leur workload dans le planificateur.

- **renvoie** : boolean|nil false pour demander le déchargement.

#### `gameplayStatistic.removeSchedule(fn)`

Retire une fonction du planificateur ; désactive updateGFX s'il n'en reste plus.

- `fn` (*function*) : Fonction précédemment ajoutée.
- **renvoie** : boolean true si retirée, false si introuvable.

#### `gameplayStatistic.updateGFX(dt)`

Vaut nil au repos ; quand actif, exécute une fonction du planificateur par frame. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps en secondes.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `updateGFX`

## Appels vers le moteur (C++)

- `obj:` `queueGameEngineLua`

**Charge les extensions :** `gameplayStatisticModules/watchAirtime`, `gameplayStatisticModules/watchBurnout`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayStatistic.lua`.*

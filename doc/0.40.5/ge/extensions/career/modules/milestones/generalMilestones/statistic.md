# `career_modules_milestones_generalMilestones_statistic`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_statistic` : `extensions.load("career_modules_milestones_generalMilestones_statistic")`, puis la globale `career_modules_milestones_generalMilestones_statistic`

Jalons basés sur les statistiques de gameplay (gameplay_statistic) : distance parcourue (vehicle/total_odometer.length, en m, 8 paliers de 10 à 300 km), temps de jeu en carrière (general/mode/career.time, en s, paliers de 5 h), tonneaux (vehicle/rollover) et temps en l'air (vehicle/airtime.time, en s). Récompense majorLinear. La notification repose sur des callbacks de statistique enregistrés pour le prochain palier.

## Remarques

- registerStastisticCallback (faute de frappe d'origine dans le nom) teste `step < milestone.maxStep` au lieu de <= : le dernier palier (8) n'est jamais notifié.
- Le callback est enregistré avec gameplay_statistic.callbackRegister et retiré avec callbackRemove ; _statCallback et _callbackTrigger servent à le mémoriser.
- onGeneralMilestoneClaimed est un alias de registerStastisticCallback : après une réclamation, le callback est ré-enregistré pour le palier suivant.
- onGeneralMilestonesSetupCallbacks déclare un paramètre `milestone` inutilisé (masqué par la boucle).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone)` | Retire le callback de statistique du jalon s'il existe. | 88 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone)` | Hook appelé après la réclamation d'un jalon : alias de registerStastisticCallback pour ré-enregistrer la surveillance. *(interne)* *(hook)* | 95 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList)` | Hook : construit les quatre jalons statistiques (stat_distance, stat_playtime, stat_rollover, jump) et les ajoute à milestonesList. *(interne)* *(hook)* | 8 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone)` | Hook : enregistre le callback de statistique de chaque jalon. *(interne)* *(hook)* | 81 |
| `career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone)` | Enregistre un callback déclenché quand la statistique surveillée atteint la cible du prochain palier ; le callback notifie le jalon et mémorise notificationStep. | 95 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone)`

Retire le callback de statistique du jalon s'il existe.

- `milestone` (*table*) : Configuration du jalon.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone)`

Hook appelé après la réclamation d'un jalon : alias de registerStastisticCallback pour ré-enregistrer la surveillance.

- `milestone` (*table*) : Configuration du jalon réclamé.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList)`

Hook : construit les quatre jalons statistiques (stat_distance, stat_playtime, stat_rollover, jump) et les ajoute à milestonesList.

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone)`

Hook : enregistre le callback de statistique de chaque jalon.

- `milestone` (*any*) : Non utilisé.

#### `career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone)`

Enregistre un callback déclenché quand la statistique surveillée atteint la cible du prochain palier ; le callback notifie le jalon et mémorise notificationStep.

- `milestone` (*table*) : Configuration du jalon (watchStatisticKey, getTarget...).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua`.*

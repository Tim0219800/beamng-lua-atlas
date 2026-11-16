# `career_modules_milestones_generalMilestones_money`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_money` : `extensions.load("career_modules_milestones_generalMilestones_money")`, puis la globale `career_modules_milestones_generalMilestones_money`

Jalons d'argent de la carrière. Chaque jalon cumule, pour un mode (gains ou losses) et des tags, les montants suivis par career_modules_playerAttributes.getAttribute("money")[mode][tag] (valeur absolue). Sept jalons : gains (tag reward), dépenses (buying), pièces achetées (partsBought), véhicules achetés (vehicleBought), ventes (selling), livraisons (delivery), amendes (fine). Deux succès Steam sont liés aux gains : FIRST_PAYCHECK (10 000) et SIX_FIGURES (100 000).

## Remarques

- Paliers génériques (gains/dépenses) : 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000. Autres jalons : valeurs courtes propres (ex. fine {500,1500,5000}).
- Seuls les jalons gains « reward » et dépenses « buying » ont le filtre general ; tous ont money.
- id du jalon = money_<mode>--<tags joints par ->.
- Les succès sont débloqués via gameplay_achievement.unlockAchievement dès que le cumul dépasse le montant, à chaque notification de palier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList)` | Hook : crée un jalon par configuration de mode et l'ajoute à milestonesList (sauvegarde créée si absente). *(interne)* *(hook)* | 75 |
| `career_modules_milestones_generalMilestones_money.onGeneralMilestonesSetupCallbacks()` | Hook : fixe la cible de notification de chaque jalon d'argent. *(interne)* *(hook)* | 111 |
| `career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change)` | Hook : si l'attribut money a changé, vérifie chaque jalon, débloque les succès éventuels, notifie le palier atteint et avance notificationStep. *(interne)* *(hook)* | 129 |
| `career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig)` | Stocke dans milestoneConfig._target la cible du prochain palier à notifier (rien si tous notifiés). | 119 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList)`

Hook : crée un jalon par configuration de mode et l'ajoute à milestonesList (sauvegarde créée si absente).

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change)`

Hook : si l'attribut money a changé, vérifie chaque jalon, débloque les succès éventuels, notifie le palier atteint et avance notificationStep.

- `change` (*table<string, number>*) : Variation par attribut.

#### `career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig)`

Stocke dans milestoneConfig._target la cible du prochain palier à notifier (rien si tous notifiés).

- `milestoneConfig` (*table*) : Configuration du jalon.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua`.*

# `career_modules_milestones_generalMilestones_branches`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_branches` : `extensions.load("career_modules_milestones_generalMilestones_branches")`, puis la globale `career_modules_milestones_generalMilestones_branches`

Jalons de niveaux de branches et de compétences de la carrière. Pour chaque branche non « isInDevelopment » de career_branches.getSortedBranches(), crée un jalon branch_<id> dont les paliers sont les niveaux (requiredValue). Les branches donnent une récompense majorLinear et apparaissent aussi dans le filtre general ; les compétences (isSkill) une récompense minorLinear. Notifie le joueur quand le seuil du niveau suivant est atteint.

## Remarques

- Dans onPlayerAttributesChanged, `return` est utilisé quand l'attribut modifié n'a pas de jalon : les attributs suivants de la table change ne sont alors pas traités (probablement `goto continue` voulu).
- Déclenche le hook onBranchTierReached(branchKey, step+1) à l'atteinte d'un palier.
- Icônes par branche parente : motorsport raceFlag, labourer deliveryTruckArrows, specialized carChase01, adventurer jump.
- Si la branche n'a pas de color, elle prend celle de sa branche parente.

**Dépendances (chargées avant) :** `career_branches`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList)` | Hook : ajoute à milestonesList un jalon par branche/compétence et crée sa sauvegarde si absente. *(interne)* *(hook)* | 16 |
| `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesSetupCallbacks()` | Hook : fixe la prochaine cible de notification de chaque jalon de branche. *(interne)* *(hook)* | 57 |
| `career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change)` | Hook : quand un attribut de branche augmente et dépasse la cible, déclenche onBranchTierReached, affiche le toast de jalon, avance notificationStep et recalcule la cible. *(interne)* *(hook)* | 76 |
| `career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey)` | Calcule la cible du palier suivant à notifier (notificationStep + 1) et la stocke dans milestoneConfig._target ; ne fait rien si tous les paliers sont notifiés. | 65 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList)`

Hook : ajoute à milestonesList un jalon par branche/compétence et crée sa sauvegarde si absente.

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change)`

Hook : quand un attribut de branche augmente et dépasse la cible, déclenche onBranchTierReached, affiche le toast de jalon, avance notificationStep et recalcule la cible.

- `change` (*table<string, number>*) : Variation par attribut.

#### `career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey)`

Calcule la cible du palier suivant à notifier (notificationStep + 1) et la stocke dans milestoneConfig._target ; ne fait rien si tous les paliers sont notifiés.

- `attKey` (*string*) : Clé d'attribut de la branche.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_branches. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBranchTierReached` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua`.*

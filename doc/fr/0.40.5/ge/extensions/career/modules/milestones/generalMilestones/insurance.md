# `career_modules_milestones_generalMilestones_insurance`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_insurance` : `extensions.load("career_modules_milestones_generalMilestones_insurance")`, puis la globale `career_modules_milestones_generalMilestones_insurance`

Jalon sur le nombre de réclamations d'assurance pour réparation (id insurance_repair_claims). Paliers : 1, 5, 10, 20, 50 réclamations (career_modules_insurance_history.getInsuranceClaimsCount), récompense minorLinear.

## Remarques

- onInsuranceRepairClaim n'appelle pas de setNotificationTarget : il compare directement le compteur à la cible du palier suivant (notificationStep + 1).
- Le hook peut être appelé avant onGeneralMilestonesCollect ; dans ce cas currMilestone est vide et getTarget n'existe pas (non protégé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList)` | Hook : crée la configuration du jalon, la sauvegarde si absente et l'ajoute à milestonesList. *(interne)* *(hook)* | 10 |
| `career_modules_milestones_generalMilestones_insurance.onInsuranceRepairClaim()` | Hook appelé à chaque réclamation d'assurance pour réparation : si le compteur atteint la cible du palier suivant, notifie le jalon et avance notificationStep. *(interne)* *(hook)* | 32 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList)`

Hook : crée la configuration du jalon, la sauvegarde si absente et l'ajoute à milestonesList.

- `milestonesList` (*table[]*) : Liste à compléter.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua`.*

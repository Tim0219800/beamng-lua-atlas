# `career_modules_milestones_general`

*Fichier : `lua/ge/extensions/career/modules/milestones/general.lua` · VM : Game Engine (GE) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_general` : `extensions.load("career_modules_milestones_general")`, puis la globale `career_modules_milestones_general`

Gestionnaire des « jalons généraux » (milestones) de la carrière. À l'activation de la carrière, il collecte via le hook onGeneralMilestonesCollect les configurations fournies par les sous-systèmes (generalMilestones/*), initialise leur sauvegarde ({claimedStep, notificationStep}) dans career_modules_milestones_milestones.saveData.general, puis appelle onGeneralMilestonesSetupCallbacks. Il construit l'entrée d'UI de chaque jalon (getMilestone) et gère la réclamation des récompenses (claim).

## Exemple

```lua
career_modules_milestones_general.claim("stat_distance")
```

## Remarques

- Une configuration de jalon contient : id, filter, maxStep, icon, color, getValue(), getLabel(step, value, target), getDescription(...), getProgressLabel(...), getTarget(step), getRewards(step) ; getTarget(0) doit valoir 0 si minValueIsPreviousStepTarget ou pour la barre de progression.
- Les récompenses sont des listes {attributeKey, rewardAmount} ; claim les additionne par attribut et les ajoute via playerAttributes.addAttributes (tags milestone, reward, gameplay).
- Bug probable : le tri en fin d'onCareerActive s'applique à la table module `milestones` (career_modules_milestones_milestones) et non à milestoneConfigs, donc il n'a aucun effet utile. L'ordre reste celui de collecte.
- printDebug écrit milestones.csv et suppose que getRewards(s) renvoie au moins deux récompenses (r[1], r[2]) : plante sinon (les récompenses linéaires n'en donnent qu'une).

**Dépendances (chargées avant) :** `career_modules_milestones_milestones`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_general.claim(id)` | Réclame le palier courant du jalon : somme les récompenses de getRewards(claimedStep), les crédite, incrémente claimedStep, appelle le hook onGeneralMilestoneClaimed(config) et affiche un toast de succès. | 47 |
| `career_modules_milestones_general.getMilestone(id)` | Construit la fiche UI du jalon pour le palier suivant : label, description, barre de progression, récompenses, claimable (valeur >= cible), claimFunction et claimRefreshFunction. Si tous les paliers sont faits (maxStep dépassé), renvoie une fiche completed = true. | 69 |
| `career_modules_milestones_general.onCareerActive(active)` | Hook : réinitialise et recollecte les configurations de jalons (hook onGeneralMilestonesCollect), crée les données de sauvegarde manquantes (avertit si claimedStep absent) et appelle le hook onGeneralMilestonesSetupCallbacks. *(interne)* *(hook)* | 16 |
| `career_modules_milestones_general.onGetMilestones(list, filter)` | Hook de la liste de jalons : ajoute à list la fiche de chaque jalon dont le filter contient l'un des filtres demandés (tous si filtre vide). *(interne)* *(hook)* | 131 |
| `career_modules_milestones_general.printDebug()` | Outil de debug : exporte tous les paliers (id, step, nom, description, cible, deux premières récompenses) dans milestones.csv. | 151 |

### Détail des paramètres

#### `career_modules_milestones_general.claim(id)`

Réclame le palier courant du jalon : somme les récompenses de getRewards(claimedStep), les crédite, incrémente claimedStep, appelle le hook onGeneralMilestoneClaimed(config) et affiche un toast de succès.

- `id` (*string*) : Identifiant du jalon.

#### `career_modules_milestones_general.getMilestone(id)`

Construit la fiche UI du jalon pour le palier suivant : label, description, barre de progression, récompenses, claimable (valeur >= cible), claimFunction et claimRefreshFunction. Si tous les paliers sont faits (maxStep dépassé), renvoie une fiche completed = true.

- `id` (*string*) : Identifiant du jalon.
- **renvoie** : table Fiche de jalon pour l'interface.

#### `career_modules_milestones_general.onCareerActive(active)`

Hook : réinitialise et recollecte les configurations de jalons (hook onGeneralMilestonesCollect), crée les données de sauvegarde manquantes (avertit si claimedStep absent) et appelle le hook onGeneralMilestonesSetupCallbacks.

- `active` (*boolean*) : Rien si false.

#### `career_modules_milestones_general.onGetMilestones(list, filter)`

Hook de la liste de jalons : ajoute à list la fiche de chaque jalon dont le filter contient l'un des filtres demandés (tous si filtre vide).

- `list` (*table[]*) : Liste à compléter.
- `filter` (*string[]|nil*) : Identifiants de filtres demandés.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_modules_milestones_milestones. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGeneralMilestoneClaimed` — écouté par 1 module(s)
- `onGeneralMilestonesCollect` — écouté par 7 module(s)
- `onGeneralMilestonesSetupCallbacks` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/general.lua`.*

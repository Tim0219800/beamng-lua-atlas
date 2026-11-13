# `career_modules_uiUtils`

*Fichier : `lua/ge/extensions/career/modules/uiUtils.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_uiUtils` : `extensions.load("career_modules_uiUtils")`, puis la globale `career_modules_uiUtils`

Fonctions utilitaires pour l'interface de la carrière : données du bandeau de statut (argent, beamXP, bons, score d'assurance), statistiques simples par branche, boutons contextuels du menu pause de carrière, et niveau (map) courant. Appelé par les composants Vue (CareerStatus, CareerSimpleStats, menu pause).

## Remarques

- Les boutons de pause sont stockés par indice (functionId) dans une table locale ; callCareerPauseContextButtons(functionId) appelle ensuite la fonction correspondante. Chaque appel à getCareerPauseContextButtons reconstruit et remplace cette table.
- Boutons possibles : carte (ou « mon chargement » en mode livraison), journal de bord, page de progression et jalons (seulement hors tutoriel et après achat du véhicule de départ), annulation de certification, annulation d'essai routier.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_uiUtils.callCareerPauseContextButtons(functionId)` | Exécute la fonction du bouton de pause d'indice functionId, si elle existe. | 58 |
| `career_modules_uiUtils.getCareerCurrentLevelName()` | Retourne l'entrée de core_levels.getList() correspondant au niveau chargé (comparaison en minuscules avec getCurrentLevelIdentifier()). | 130 |
| `career_modules_uiUtils.getCareerPauseContextButtons()` | Construit la liste des boutons contextuels du menu pause de carrière (selon livraison, tutoriel, certification, essai routier) et les mémorise. | 62 |
| `career_modules_uiUtils.getCareerSimpleStats()` | Données du composant Vue CareerSimpleStats : nom de la sauvegarde et, pour chaque branche non-compétence, nom, libellé de niveau, valeur et bornes min/max du niveau. | 21 |
| `career_modules_uiUtils.getCareerStatusData()` | Données du composant Vue CareerStatus : argent, beamXP, bons (vouchers) et score de conduite d'assurance. | 10 |
| `career_modules_uiUtils.storeCareerPauseContextButtons(data)` | Mémorise les fonctions des boutons de pause et leur affecte un functionId (indice) ; vide l'ancienne table. | 51 |

### Détail des paramètres

#### `career_modules_uiUtils.callCareerPauseContextButtons(functionId)`

Exécute la fonction du bouton de pause d'indice functionId, si elle existe.

- `functionId` (*integer*) : Indice fourni par getCareerPauseContextButtons.

#### `career_modules_uiUtils.getCareerCurrentLevelName()`

Retourne l'entrée de core_levels.getList() correspondant au niveau chargé (comparaison en minuscules avec getCurrentLevelIdentifier()).

- **renvoie** : table|nil Informations du niveau, nil si introuvable.

#### `career_modules_uiUtils.getCareerPauseContextButtons()`

Construit la liste des boutons contextuels du menu pause de carrière (selon livraison, tutoriel, certification, essai routier) et les mémorise.

- **renvoie** : table {buttons = {...}}.

#### `career_modules_uiUtils.getCareerSimpleStats()`

Données du composant Vue CareerSimpleStats : nom de la sauvegarde et, pour chaque branche non-compétence, nom, libellé de niveau, valeur et bornes min/max du niveau.

- **renvoie** : table {saveSlotName, branches = {{name, levelLabel, min, value, max}, ...}}.

#### `career_modules_uiUtils.getCareerStatusData()`

Données du composant Vue CareerStatus : argent, beamXP, bons (vouchers) et score de conduite d'assurance.

- **renvoie** : table {money, beamXP, vouchers, insuranceScore}.

#### `career_modules_uiUtils.storeCareerPauseContextButtons(data)`

Mémorise les fonctions des boutons de pause et leur affecte un functionId (indice) ; vide l'ancienne table.

- `data` (*table*) : Table avec buttons (liste de {label, icon, fun, showIndicator}) ; chaque bouton reçoit functionId.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/uiUtils.lua`.*

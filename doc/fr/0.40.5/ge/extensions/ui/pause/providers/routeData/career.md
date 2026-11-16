# `ui_pause_providers_routeData_career`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/career.lua` · VM : Game Engine (GE) · 222 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_career` : `extensions.load("ui_pause_providers_routeData_career")`, puis la globale `ui_pause_providers_routeData_career`

Fournisseur de données du menu pause pour les écrans de carrière : progression (digest et missions APM suggérées), historique (financier, gameplay, jalons, journal de bord) et détail d'un historique. Les fonctions renvoient des tables décrivant le contenu (panneaux, composants Vue, rail de boutons) que l'UI pause affiche. Les données viennent de career_modules_playerAttributes, career_modules_milestones_milestones et career_career.

## Remarques

- La navigation des boutons passe par extensions.ui_router.navigate dans un pcall ; le succès est ok and result and result.result ~= false.
- Les entrées d'historique du digest sont limitées à 5 (getHistoryChanges(type, 5)) ; la vue complète n'a pas de limite.
- Les types d'historique connus : "financial" (défaut) et "gameplay".

**Dépendances (chargées avant) :** `career_career`, `career_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_career.getCareerHistoryData(context)` | Renvoie les données de la page d'historique : un rail de quatre boutons (financier, gameplay, jalons avec indicateur s'il y en a de non réclamés, journal de bord) et les panneaux latéraux d'aperçu (5 dernières entrées, digest des jalons). | 150 |
| `ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType)` | Renvoie la vue complète d'un historique (composant CareerHistoryDigest avec full = true), avec le titre fourni par career_modules_playerAttributes.getCareerHistoryInfo ou un titre par défaut. | 200 |
| `ui_pause_providers_routeData_career.getCareerProgressData(context)` | Renvoie les données de la page de progression : titre ui.career.landingPage.name, panneau principal (ProgressDigest, ApmSuggestedMissions) et panneaux latéraux ProgressDomainInfo pour les domaines apm, bmra, logistics et freestyle. | 127 |
| `ui_pause_providers_routeData_career.isCareerProgressAvailable()` | Indique si l'écran de progression de carrière est disponible : faux pendant le tutoriel de carrière, sinon vrai seulement si le véhicule de départ a été acheté. | 26 |

### Détail des paramètres

#### `ui_pause_providers_routeData_career.getCareerHistoryData(context)`

Renvoie les données de la page d'historique : un rail de quatre boutons (financier, gameplay, jalons avec indicateur s'il y en a de non réclamés, journal de bord) et les panneaux latéraux d'aperçu (5 dernières entrées, digest des jalons).

- `context` (*table*) : Contexte du menu pause (champ lu : mode).
- **renvoie** : table {mode, heading, rail, focusSidePanelContents}

#### `ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType)`

Renvoie la vue complète d'un historique (composant CareerHistoryDigest avec full = true), avec le titre fourni par career_modules_playerAttributes.getCareerHistoryInfo ou un titre par défaut.

- `context` (*table*) : Contexte du menu pause (champ lu : mode).
- `historyType` (*string*) : "financial" ou "gameplay".
- **renvoie** : table {mode, heading, mainCardClass, mainPanelContent}

#### `ui_pause_providers_routeData_career.getCareerProgressData(context)`

Renvoie les données de la page de progression : titre ui.career.landingPage.name, panneau principal (ProgressDigest, ApmSuggestedMissions) et panneaux latéraux ProgressDomainInfo pour les domaines apm, bmra, logistics et freestyle.

- `context` (*table*) : Contexte du menu pause (champ lu : mode).
- **renvoie** : table {mode, heading, mainPanelContent, focusSidePanelContents}

#### `ui_pause_providers_routeData_career.isCareerProgressAvailable()`

Indique si l'écran de progression de carrière est disponible : faux pendant le tutoriel de carrière, sinon vrai seulement si le véhicule de départ a été acheté.

- **renvoie** : boolean|nil Disponibilité (peut valoir nil si career_career est absent).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career", "career_saveSystem"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/career.lua`.*

# `ui_pause_providers_routeData_home`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/home.lua` · VM : Game Engine (GE) · 278 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_home` : `extensions.load("ui_pause_providers_routeData_home")`, puis la globale `ui_pause_providers_routeData_home`

Fournit les données de l'écran d'accueil du menu pause (route « pause »). Selon le mode de jeu (career, mission, multiplayer, freeroam, freeroamTutorial, scenario) et l'état de la première conduite, il compose le contenu du panneau principal et des panneaux latéraux (composants Vue par nom), ajoute les boutons de carrière et le rail de boutons de ui_pause_features_homeRail. Fournit aussi les données de détail du véhicule sélectionné.

## Remarques

- Chaque élément de panneau est une table {id, type = "component", componentName, props}.
- Priorité dans getHomeData : le récapitulatif des aides à la conduite (si activé), puis la première conduite guidée, puis le mode normal ; en mode multiplayer, la réponse est celle de ui_pause_providers_routeData_multiplayer.getMultiplayerData.
- En freeroam avec multiseat actif, le composant PauseMultiseatVehiclesDigest remplace PauseNearbyVehicles et PauseNearbyActivitiesTab.
- Bug mineur : getHomeData renvoie un champ panels = panels, mais panels est une variable globale jamais définie ; le champ vaut donc nil (absent de la table).
- Un bloc if vide (livraison de carrière) subsiste dans getHomeData sans effet.

**Dépendances (chargées avant) :** `career_career`, `career_saveSystem`, `ui_pause_providers_nearbyActivities`, `ui_pause_providers_missionObjectives`, `ui_pause_providers_routeData_multiplayer`, `ui_pause_providers_vehicleTabInteractions`, `ui_pause_features_homeRail`, `ui_vehicleSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_home.getHomeData(context)` | Construit les données de la route d'accueil du pause : mode, mainPanelContent, sidePanelContents, rail, et selon le cas heading, mainCardClass, nearbyActivities et missionObjectives. En carrière, ajoute des boutons (carte du chargement, annuler la certification, annuler l'essai) ; en mission, la liste de tâches et les objectifs. | 117 |
| `ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context)` | Données de la route de détails du véhicule apparu sélectionné : titre (label), composant PauseVehicleSpawnedSelected et spawnedVehicleSelected. | 262 |
| `ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled()` | Indique si le récapitulatif des aides à la conduite est actif (faux par défaut). | 94 |
| `ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled)` | Active ou désactive l'affichage du récapitulatif des aides à la conduite (composant DrivingAssistsDigest) à la place de l'accueil normal. | 90 |

### Détail des paramètres

#### `ui_pause_providers_routeData_home.getHomeData(context)`

Construit les données de la route d'accueil du pause : mode, mainPanelContent, sidePanelContents, rail, et selon le cas heading, mainCardClass, nearbyActivities et missionObjectives. En carrière, ajoute des boutons (carte du chargement, annuler la certification, annuler l'essai) ; en mission, la liste de tâches et les objectifs.

- `context` (*table*) : Contexte du pause : mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isCareerActive…
- **renvoie** : table Données de la route d'accueil.

#### `ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context)`

Données de la route de détails du véhicule apparu sélectionné : titre (label), composant PauseVehicleSpawnedSelected et spawnedVehicleSelected.

- `context` (*table*) : Contexte du pause, transmis à vehicleTabInteractions.
- **renvoie** : table {heading, mainPanelContent, spawnedVehicleSelected}.

#### `ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled()`

Indique si le récapitulatif des aides à la conduite est actif (faux par défaut).

- **renvoie** : boolean true si actif.

#### `ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled)`

Active ou désactive l'affichage du récapitulatif des aides à la conduite (composant DrivingAssistsDigest) à la place de l'accueil normal.

- `enabled` (*boolean*) : true pour activer (toute autre valeur désactive).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, career_saveSystem, ui_pause_providers_nearbyActivities, ui_pause_providers_missionObjectives, ui_pause_providers_routeData_multiplayer, ui_pause_providers_vehicleTabInteractions, ui_pause_features_homeRail, ui_vehicleSelector_general. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/home.lua`.*

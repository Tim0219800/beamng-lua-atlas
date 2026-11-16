# `ui_pause_providers_nearbyActivities`

*Fichier : `lua/ge/extensions/ui/pause/providers/nearbyActivities.lua` · VM : Game Engine (GE) · 278 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_nearbyActivities` : `extensions.load("ui_pause_providers_nearbyActivities")`, puis la globale `ui_pause_providers_nearbyActivities`

Fournisseur du menu pause pour la section « activités à proximité ». Il lit les points d'intérêt de la grande carte (freeroam_vueBigMap.getPoiData) et les POI bruts du niveau (gameplay_rawPois), calcule la distance au joueur (position caméra, rayon du marqueur déduit), puis retient jusqu'à 6 éléments : 2 plus proches, 2 de distance moyenne et le reste au hasard, triés par distance. Chaque élément porte deux boutons : voir sur la carte et définir un itinéraire.

## Remarques

- Les POI de type spawnPoint et playerVehicle sont exclus ; un POI sans marqueur bigmap ou sans position est ignoré.
- Le bouton « view » ouvre la grande carte (freeroam_bigMapMode.enterBigMap, instant, routeTarget pause.bigmap) avec autoSelectPoiId et un zoom de 0,75 ; il est désactivé si context.isBigMapAllowed est faux.
- Le bouton « route » appelle freeroam_bigMapMode.navigateToMission(poiId) ; il est désactivé pendant un test drive de carrière (career_modules_testDrive.isActive()).
- Si aucune activité n'est trouvée, getData renvoie un élément factice d'id nearby.none.
- La sélection utilise math.random : le contenu change à chaque appel.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload)` | Exécute le bouton (voir/itinéraire) identifié par buttonId. Renvoie false si buttonId est nil. | 88 |
| `ui_pause_providers_nearbyActivities.getData(context)` | Construit les données de la section : {mode, sections = {{id = "nearbyActivities", title, items}}}. Chaque item contient id, title, icon, description (type de POI traduit), actionLabel, poiType, distanceM (m, arrondi) et actions {view, route}. | 250 |

### Détail des paramètres

#### `ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload)`

Exécute le bouton (voir/itinéraire) identifié par buttonId. Renvoie false si buttonId est nil.

- `buttonId` (*any*) : buttonId présent dans items[].actions.view / .route.
- `payload` (*any*) : Données transmises au callback du bouton.
- **renvoie** : any Résultat du bouton (true/false).

#### `ui_pause_providers_nearbyActivities.getData(context)`

Construit les données de la section : {mode, sections = {{id = "nearbyActivities", title, items}}}. Chaque item contient id, title, icon, description (type de POI traduit), actionLabel, poiType, distanceM (m, arrondi) et actions {view, route}.

- `context` (*table|nil*) : Champs lus : mode (défaut "freeroam") et isBigMapAllowed.
- **renvoie** : table Données de section pour l'UI pause.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/nearbyActivities.lua`.*

# `freeroam_bigMapMarkers`

*Fichier : `lua/ge/extensions/freeroam/bigMapMarkers.lua` · VM : Game Engine (GE) · 333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_bigMapMarkers` : `extensions.load("freeroam_bigMapMarkers")`, puis la globale `freeroam_bigMapMarkers`

Gère les marqueurs de la grande carte (big map) : regroupe les points d'intérêt (POI) bruts de gameplay_rawPois qui ont un bigmapMarker en grappes (clusters) selon un rayon, crée un marqueur par grappe (gameplay/markers/bigmapMarker), les met à jour/affiche à chaque image et détecte quel marqueur est survolé par la souris ou le réticule. Utilisé par freeroam_bigMapMode ; un moddeur n'y touche normalement pas.

## Remarques

- Un « filtre » (setupFilter) = rayon de regroupement + liste d'ids de POI valides. Son identifiant est « rayon#-ids concaténés » ; les anciens filtres restent en mémoire et leurs marqueurs sont masqués en fondu puis nettoyés.
- Les grappes sont recalculées quand la génération de gameplay_rawPois augmente (getAllClustersBySettings).
- Bug/incohérence : M.buildPoiList = buildPoiList référence une variable locale jamais définie, donc vaut nil.
- displayBigMapMarkers commence par profilerPopEvent("BigMapMarkers parkingSpeedFactor") sans push correspondant dans ce fichier (reste d'un ancien code de profilage).
- Champs iconCounter, iconsById et printNext existent mais ne sont pas utilisés dans ce fichier (debug).
- Dans clusterBySettings, un POI ne contient jamais de .cluster avant fusion, donc chaque grappe ne reçoit en pratique que son POI de départ (les voisins du rayon ne sont ajoutés que si bmi.cluster est défini) ; comportement à vérifier en jeu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_bigMapMarkers.clearMarkers()` | Détruit les objets de rendu de tous les marqueurs (courants et anciens) et vide les listes. | 225 |
| `freeroam_bigMapMarkers.displayBigMapMarkers(dtReal)` | À appeler à chaque image tant que la grande carte est affichée : met à jour tous les marqueurs des grappes du filtre actif (affichés) et des filtres précédents (masqués en fondu), ainsi que les anciens marqueurs en cours de disparition. | 72 |
| `freeroam_bigMapMarkers.getAllClustersBySettings(settingsId)` | Renvoie (en calculant si besoin) les grappes de POI pour un filtre : POI dont l'id est valide et qui ont un bigmapMarker, triés par id, regroupés par quadtree puis fusionnés via bigmapMarker.merge. | 314 |
| `freeroam_bigMapMarkers.getClusterMarker(cluster)` | Renvoie le marqueur d'une grappe, en le créant s'il n'existe pas (ou en réutilisant l'ancien marqueur de même id). | 191 |
| `freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id)` | Pour un id de POI, renvoie les ids de tous les POI de sa grappe dans le filtre actif. | 182 |
| `freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected)` | Détermine quelle grappe est survolée : lance un rayon depuis la souris (si elle a bougé) ou depuis le centre de la caméra, et teste la distance rayon/icône avec une sphère dont le rayon dépend du zoom (fov) et de la distance (ou fixe en caméra orthogonale). Ne fait rien en mode manette quand un POI est déjà sélectionné. | 145 |
| `freeroam_bigMapMarkers.hideMarkers()` | Masque (fondu) tous les marqueurs courants et anciens, sans les détruire. | 214 |
| `freeroam_bigMapMarkers.setNextMarkersFullAlphaInstant()` | Fait apparaître instantanément en pleine opacité les marqueurs actifs lors de la prochaine mise à jour (une seule fois). | 328 |
| `freeroam_bigMapMarkers.setupFilter(validIds, radius)` | Définit le filtre actif : le rayon de regroupement est arrondi au multiple de 5 (20 par défaut), les ids sont triés, et les marqueurs actuels sont déplacés vers la liste des anciens et masqués pour une transition douce. Les anciens marqueurs invisibles sont détruits. | 23 |

### Détail des paramètres

#### `freeroam_bigMapMarkers.displayBigMapMarkers(dtReal)`

À appeler à chaque image tant que la grande carte est affichée : met à jour tous les marqueurs des grappes du filtre actif (affichés) et des filtres précédents (masqués en fondu), ainsi que les anciens marqueurs en cours de disparition.

- `dtReal` (*number*) : Temps réel écoulé (s).

#### `freeroam_bigMapMarkers.getAllClustersBySettings(settingsId)`

Renvoie (en calculant si besoin) les grappes de POI pour un filtre : POI dont l'id est valide et qui ont un bigmapMarker, triés par id, regroupés par quadtree puis fusionnés via bigmapMarker.merge.

- `settingsId` (*string*) : Identifiant de filtre créé par setupFilter (nommé currentClusterSettingsId en interne).
- **renvoie** : table[] Liste de grappes (champs id, containedIds, containedIdsLookup…).

#### `freeroam_bigMapMarkers.getClusterMarker(cluster)`

Renvoie le marqueur d'une grappe, en le créant s'il n'existe pas (ou en réutilisant l'ancien marqueur de même id).

- `cluster` (*table*) : Grappe issue de getAllClustersBySettings.
- **renvoie** : table Objet marqueur de la grande carte.

#### `freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id)`

Pour un id de POI, renvoie les ids de tous les POI de sa grappe dans le filtre actif.

- `id` (*string*) : Id d'un POI.
- **renvoie** : string[]|nil Ids contenus dans la grappe, nil si le POI n'est dans aucune grappe.

#### `freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected)`

Détermine quelle grappe est survolée : lance un rayon depuis la souris (si elle a bougé) ou depuis le centre de la caméra, et teste la distance rayon/icône avec une sphère dont le rayon dépend du zoom (fov) et de la distance (ou fixe en caméra orthogonale). Ne fait rien en mode manette quand un POI est déjà sélectionné.

- `camMode` (*table*) : Mode caméra de la grande carte (utilise camMode.manualzoom.fov).
- `mouseMoved` (*boolean*) : true si le rayon vient de la souris, false si de la caméra.
- `poiIsSelected` (*boolean*) : true si un POI est déjà sélectionné.
- **renvoie** : string|nil Id du premier POI de la grappe survolée, nil sinon.

#### `freeroam_bigMapMarkers.setupFilter(validIds, radius)`

Définit le filtre actif : le rayon de regroupement est arrondi au multiple de 5 (20 par défaut), les ids sont triés, et les marqueurs actuels sont déplacés vers la liste des anciens et masqués pour une transition douce. Les anciens marqueurs invisibles sont détruits.

- `validIds` (*string[]*) : Ids de POI à afficher (la table est triée sur place).
- `radius` (*number|nil*) : Rayon de regroupement en mètres monde (20 par défaut).

## Champs

| Champ | Type | Description |
|---|---|---|
| `buildPoiList` | nil | Toujours nil (référence à une variable non définie). ⚠ référence `buildPoiList` non définie dans le fichier (vaut probablement nil) |
| `iconCounter` | number | Compteur d'icônes, initialisé à 0 (non utilisé dans ce fichier). |
| `iconsById` | table | Table vide réservée au debug. |
| `printNext` | boolean | Drapeau de debug (impressions commentées), false. |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/bigMapMarkers.lua`.*

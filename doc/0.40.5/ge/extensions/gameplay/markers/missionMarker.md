# `gameplay_markers_missionMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/missionMarker.lua` · VM : Game Engine (GE) · 534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_missionMarker` : `extensions.load("gameplay_markers_missionMarker")`, puis la globale `gameplay_markers_missionMarker`

Marqueur de mission en mode jeu : une icône (exclamation par défaut) flottant au-dessus d'un point, reliée au sol par un trait, plus deux décalques au sol (un point et un anneau). Quand le joueur s'approche, l'icône apparaît en fondu ; quand son véhicule touche la sphère du marqueur (rayon fixe 1.2 m), l'anneau s'allume et le marqueur devient interactif (liste des missions du cluster). Plusieurs missions proches (moins de 3 m) sont fusionnées en un cluster avec une icône numérotée. Le module renvoie {create, cluster}.

## Remarques

- Deux rendus d'icône : l'icon renderer C++ (par défaut) ou render_skiaIcons si la variable locale useSkiaIcons est true ; elle vaut false dans ce fichier, donc le chemin Skia est inactif ; son changement n'agit qu'à la création des marqueurs.
- Rayon fixe hardcodedRadius = 1.2 m pour la zone et le test de présence ; la fusion de clusters utilise un rayon de 1.5 m (deux POI fusionnent si distance au carré < (1.5 + 1.5)^2).
- merge : trie les POI par date décroissante (data.date), icône = mission_no-NN_triangle (NN = min(count, 9)) si plusieurs ; si les iconFontIcon diffèrent, markerText = nombre de missions ("9+" au-delà de 9). visibleBySetting = "showMissionMarkers" ; visibilityRadius = rayon + 5.
- Les POI doivent fournir markerInfo.missionMarker.{pos, rot, icon, iconFontIcon} et data.
- Distances d'affichage : icône jusqu'à 50 m (100 m si le cluster est en focus), décalques jusqu'à 40 m ; tout s'efface en fondu quand la grande carte est active ou quand une mission est au premier plan (globalAlpha).
- isInAreaChanged ("in"/"out") n'est mis à jour que lorsque le joueur marche (data.isWalking) ; le véhicule déclenche l'interaction via interactInPlayMode.
- Le maillage d'icône (iconMesh / createObject) est présent mais son appel dans createObjects est commenté : iconMeshId reste nil.
- setVisibilityInBigmap et instantFade sont des méthodes vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_missionMarker.cluster(pois, allClusters)` | Regroupe les POI missionMarker qui se chevauchent (quadtree, rayon 1.5 m) et ajoute un cluster fusionné par groupe à allClusters. *(interne)* | 488 |
| `gameplay_markers_missionMarker.create(...)` | Fabrique un marqueur de mission (instance de C). | 436 |

### Détail des paramètres

#### `gameplay_markers_missionMarker.cluster(pois, allClusters)`

Regroupe les POI missionMarker qui se chevauchent (quadtree, rayon 1.5 m) et ajoute un cluster fusionné par groupe à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.missionMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_missionMarker.create(...)`

Fabrique un marqueur de mission (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de mission avec icône, trait et décalques.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Libère l'icône (Skia ou icon renderer), supprime le maillage éventuel et vide les références. | 387 |
| `C:createObject(shapeName, objectName)` | Crée et enregistre un objet TSStatic avec couleur d'instance ; utilitaire non utilisé par défaut. | 318 |
| `C:createObjects()` | Nettoie les objets existants (la création du maillage est commentée). | 333 |
| `C:drawOnMinimap(td, dpi)` | Dessine un marqueur triangle bleu sur la minimap (couche GAMEPLAY_MARKERS). | 428 |
| `C:hide()` | Passe invisible, réinitialise les lisseurs et rend l'icône transparente immédiatement. | 345 |
| `C:init()` | Attribue un id, rayon par défaut 1.2 m et crée les lisseurs ; visible = true. | 61 |
| `C:instantFade(visible)` | Ne fait rien. | 380 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le véhicule touche la sphère, ajoute les données (elemData) des missions du cluster aux éléments interactifs. | 414 |
| `C:playerIsInArea(data)` | Teste si la boîte englobante orientée du véhicule du joueur recouvre la sphère du marqueur (overlapsOBB_Sphere). | 86 |
| `C:setVisibilityInBigmap(vis, instant)` | Ne fait rien. | 383 |
| `C:setup(cluster)` | Mémorise pos et cluster, crée l'icône (cluster.icon ou poi_exclamationmark ; ou icône Skia), initialise les lisseurs et crée groundDecalData (point dot_128 et anneau outline_512). | 250 |
| `C:show()` | Repasse visible. | 375 |
| `C:update(data)` | Chaque frame : calcule les distances, masque l'icône derrière la géométrie (rayon), anime l'opacité et la hauteur de l'icône, dessine le trait vers le sol, pilote l'opacité du point et de l'anneau au sol et met à jour isInAreaChanged. | 100 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

**Charge les extensions :** `render_skiaIcons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/missionMarker.lua`.*

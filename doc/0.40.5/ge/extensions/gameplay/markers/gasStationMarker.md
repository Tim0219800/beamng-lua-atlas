# `gameplay_markers_gasStationMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/gasStationMarker.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_gasStationMarker` : `extensions.load("gameplay_markers_gasStationMarker")`, puis la globale `gameplay_markers_gasStationMarker`

Marqueur de station-service (carburant ou recharge électrique) en mode jeu. Pour chaque pompe (paire de noms d'objets de scène : zone, icône), il crée une icône (poi_fuel_round, ou poi_charge_round pour une station électrique) qui apparaît quand le véhicule du joueur, roulant doucement, chevauche la zone de la pompe (test OBB/OBB), et rend la station interactive. Le module renvoie {create, cluster}.

## Remarques

- cluster : un cluster par POI (id 'gasStationMarker#<poi.id>'). Lit poi.markerInfo.gasStationMarker.{pumps, electric, pos, radius} ; pumps = liste de paires {nomZone, nomIcône} d'objets de scène.
- Le chevauchement n'est évalué que si data.cruisingSpeedFactor < 1, c'est-à-dire sous environ 20 km/h (hystérésis 20 à 30 km/h).
- Bug probable : setup construit l'id d'icône avec cluster.clusterId, champ que cluster() ne renseigne pas (il met id) ; tous les ids d'icône deviennent « nil-gsIcon-N » et peuvent entrer en collision entre stations.
- L'icône est masquée si un obstacle statique est entre la caméra et l'icône (castRayStatic).
- isInAreaChanged vaut "in"/"out" pendant une frame lors d'un changement de chevauchement, sinon nil.
- drawAxisBox appelle color(...) comme constructeur de couleur ; la fonction n'est utilisée nulle part dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_gasStationMarker.cluster(pois, allClusters)` | Transforme chaque POI gasStationMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters. *(interne)* | 233 |
| `gameplay_markers_gasStationMarker.create(...)` | Fabrique un marqueur de station-service (instance de C). | 224 |

### Détail des paramètres

#### `gameplay_markers_gasStationMarker.cluster(pois, allClusters)`

Transforme chaque POI gasStationMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.gasStationMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_gasStationMarker.create(...)`

Fabrique un marqueur de station-service (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de station-service avec une icône par pompe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire les icônes de l'icon renderer et efface la liste des pompes. | 135 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas). | 113 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte de debug (arêtes et faces) par debugDrawer. | 159 |
| `C:drawOnMinimap(td)` | Dessine un cercle sur la minimap pour chaque pompe. | 218 |
| `C:hide()` | Passe invisible et met l'opacité de toutes les icônes à 0. | 117 |
| `C:init()` | Initialise visible = true. | 19 |
| `C:instantFade(visible)` | Ne fait rien. | 155 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le véhicule est sur une pompe, ajoute les données (elemData) du cluster aux éléments interactifs. | 145 |
| `C:setup(cluster)` | Pour chaque pompe, retrouve les objets de scène (zone et icône), calcule la boîte de la zone (position, axes mis à l'échelle) et crée l'icône d'opacité initiale 0. | 23 |
| `C:show()` | Repasse visible. | 130 |
| `C:update(data)` | Chaque frame : teste le chevauchement OBB/OBB entre le véhicule et chaque pompe, fait monter l'icône de 0.25 m et ajuste son opacité (visible si pas d'obstacle), met à jour isInAreaChanged et anyOverlap. | 79 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/gasStationMarker.lua`.*

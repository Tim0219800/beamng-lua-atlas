# `gameplay_markers_crawlMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/crawlMarker.lua` · VM : Game Engine (GE) · 276 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_crawlMarker` : `extensions.load("gameplay_markers_crawlMarker")`, puis la globale `gameplay_markers_crawlMarker`

Marqueur de zone de crawling (rock crawling) en mode jeu : une icône flottante au-dessus d'une zone sphérique. Le véhicule du joueur qui entre dans la sphère (centre de sa boîte englobante à moins de radius, 2 m par défaut) fait monter l'icône et la rend interactive (liste d'activités à accepter). Le module renvoie {create, cluster} : cluster regroupe les POI crawlMarker, create fabrique l'objet marqueur (classe C).

## Remarques

- cluster regroupe les POI ayant la même pos et la même iconPos (clé = tostring(pos)..tostring(iconPos)) ; l'icône par défaut est mission_rockcrawling01_triangle.
- Les POI doivent fournir markerInfo.crawlMarker avec pos, radius, iconPos et icon (facultative) ; cluster.elemData reprend poi.data de chaque POI.
- L'icône n'est visible que si la caméra est à moins de 35 m et qu'un rayon statique (castRayStatic) ne rencontre pas d'obstacle ; elle est masquée quand la grande carte est active.
- isInAreaChanged vaut "in" ou "out" pendant une frame lors d'une entrée/sortie de zone, sinon nil.
- update ne fait rien si le joueur n'a pas de véhicule (data.veh nil) ; la marche n'est pas exigée.
- drawAxisBox dessine une boîte de debug (debugDrawer) mais n'est appelée nulle part dans ce fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_crawlMarker.cluster(pois, allClusters)` | Regroupe les POI crawlMarker identiques (même pos et iconPos) en clusters et les ajoute à allClusters. *(interne)* | 245 |
| `gameplay_markers_crawlMarker.create(...)` | Fabrique un objet marqueur de crawling (instance de C) et appelle init. | 236 |

### Détail des paramètres

#### `gameplay_markers_crawlMarker.cluster(pois, allClusters)`

Regroupe les POI crawlMarker identiques (même pos et iconPos) en clusters et les ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.crawlMarker.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_crawlMarker.create(...)`

Fabrique un objet marqueur de crawling (instance de C) et appelle init.

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de zone de crawling avec icône animée.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire l'icône de l'icon renderer et efface triggerArea. | 145 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas de nouveaux). | 123 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte alignée (arêtes et faces semi-transparentes) par debugDrawer ; utilitaire de debug. | 170 |
| `C:drawOnMinimap(td)` | Dessine un cercle à la position de l'icône sur la minimap (ui_apps_minimap_utils.simpleCircle). | 228 |
| `C:hide()` | Passe invisible et met l'opacité de l'icône à 0. | 127 |
| `C:init()` | Initialise visible = true. | 22 |
| `C:instantFade(visible)` | Ne fait rien. | 166 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le joueur est dans la zone, ajoute les données (elemData) du cluster à la liste des éléments interactifs. | 156 |
| `C:setup(cluster)` | Lit pos, rot, scl du cluster et crée l'icône (id <cluster.id>-gsIcon) avec ses lisseurs ; décalage d'icône 0.5 m, levée 1.0 m. | 26 |
| `C:show()` | Repasse visible. | 140 |
| `C:update(data)` | Chaque frame : teste l'entrée dans la sphère, anime la hauteur et l'opacité de l'icône, dessine un trait quand l'icône est levée, met à jour isInAreaChanged, anyOverlap. | 65 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/crawlMarker.lua`.*

# `gameplay_markers_vehicleTrigger`

*Fichier : `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua` · VM : Game Engine (GE) · 241 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_vehicleTrigger` : `extensions.load("gameplay_markers_vehicleTrigger")`, puis la globale `gameplay_markers_vehicleTrigger`

Marqueur de « portes » pour véhicule (par exemple l'entrée d'un garage ou d'un atelier) en mode jeu. Chaque porte est une paire d'objets de scène (zone, icône) : quand la boîte englobante du véhicule du joueur recouvre une zone, l'icône monte légèrement, un écran 3D facultatif s'affiche pendant 5 s avec un son d'ordinateur de carrière, et le marqueur devient interactif. Le module renvoie {create, cluster}.

## Remarques

- cluster : un par POI (id 'vehicleTrigger#<poi.id>'). Lit poi.markerInfo.vehicleTrigger.{doors, icon, iconLift, iconOffsetHeight, pos, radius, screens} ; icône par défaut poi_exclamationmark_round, rayon par défaut 6 m.
- doors = liste de {nomObjetZone, nomObjetIcône, distanceVisibleMax?} ; distance visible max par défaut 15 m. screens[idx] est le nom d'un objet de scène affiché en regard de la porte idx.
- Le test de recouvrement ne s'applique qu'au véhicule du joueur (data.veh) ; si une porte recouvre le véhicule, toutes les portes sont marquées recouvertes (anyOverlap).
- L'icône n'est visible que si la caméra est assez proche et sans obstacle statique (castRayStatic) ; hors grande carte.
- isInAreaChanged vaut "in"/"out" pendant une frame.
- Sans setup préalable (doors nil), plusieurs méthodes parcourent {} par sécurité ; hide() suppose en revanche que area.iconInfo existe quand l'icon renderer est disponible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_vehicleTrigger.cluster(pois, allClusters)` | Transforme chaque POI vehicleTrigger en un cluster distinct et l'ajoute à allClusters. *(interne)* | 216 |
| `gameplay_markers_vehicleTrigger.create(...)` | Fabrique un marqueur de portes (instance de C). | 208 |

### Détail des paramètres

#### `gameplay_markers_vehicleTrigger.cluster(pois, allClusters)`

Transforme chaque POI vehicleTrigger en un cluster distinct et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.vehicleTrigger.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_vehicleTrigger.create(...)`

Fabrique un marqueur de portes (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de portes pour véhicule.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire les icônes, cache les écrans et efface la liste des portes. | 171 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas). | 144 |
| `C:drawOnMinimap(td)` | Dessine un cercle sur la minimap à la position de chaque icône de porte. | 202 |
| `C:hide()` | Passe invisible, rend les icônes transparentes et cache les écrans. | 148 |
| `C:init()` | Initialise visible = true. | 19 |
| `C:instantFade(visible)` | Ne fait rien. | 195 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et qu'une porte recouvre le véhicule, ajoute les données (elemData) du cluster aux éléments interactifs. | 187 |
| `C:setHidden(value)` | Ne fait rien. | 198 |
| `C:setup(cluster)` | Pour chaque porte, retrouve l'objet de zone et l'objet d'icône dans la scène, calcule la boîte de la zone, cache l'écran associé et crée l'icône (id <cluster.id>-vtIcon-<idx>). | 23 |
| `C:show()` | Repasse visible. | 166 |
| `C:update(data)` | Chaque frame : teste le recouvrement OBB/OBB avec le véhicule, gère le minuteur et l'affichage des écrans, anime hauteur et opacité des icônes, dessine un trait, met à jour isInAreaChanged et anyOverlap. | 79 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua`.*

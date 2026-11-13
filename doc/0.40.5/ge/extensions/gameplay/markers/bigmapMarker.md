# `gameplay_markers_bigmapMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/bigmapMarker.lua` · VM : Game Engine (GE) · 283 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_bigmapMarker` : `extensions.load("gameplay_markers_bigmapMarker")`, puis la globale `gameplay_markers_bigmapMarker`

Type de marqueur utilisé par la grande carte (bigmap) : pour chaque cluster de POI, affiche une icône et une colonne (icônes d'icon renderer) qui apparaissent en fondu quand la grande carte est active et qui grossissent au survol ou à la sélection. Le module renvoie une table {createMarker, merge} : createMarker crée l'objet marqueur (classe C), merge fusionne plusieurs POI proches en un seul cluster avec une icône numérotée.

## Remarques

- Ce fichier ne définit pas de champs containsAnyMission / containsAnyDelivery sur le module : ce sont des variables locales de merge (la page automatique les signale à tort comme champs).
- merge : position du cluster = moyenne des positions des POI ; id = idPrefix.. '#' suivi des ids de POI ; icône par défaut = celle du dernier POI ; si count > 1, icône numérotée poi_no-NN_round_orange_green (NN = min(count, 9)), _orange_blue si tous les POI sont des missions ou tous de type logisticsParking, _orange si un POI a data.hasPlayerCargo.
- Icône par défaut du cluster : mission_primary_triangle ; colonne : marker_column ; taille d'icône 20 ; hauteur de colonne 3.5 m.
- Les POI doivent fournir markerInfo.bigmapMarker.{pos, icon} et data.type ; l'objet cluster fournit containedIdsLookup, utilisé pour savoir si le POI sélectionné ou survolé est dans le cluster.
- setHidden et instantFade sont des méthodes vides (présentes pour respecter l'interface des marqueurs).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_bigmapMarker.createMarker(...)` | Fabrique un objet marqueur de grande carte (instance de la classe C) et appelle son init. | 235 |
| `gameplay_markers_bigmapMarker.merge(pois, idPrefix)` | Fusionne une liste de POI en un seul cluster de grande carte (position moyenne, ids contenus, icône numérotée si plusieurs). | 242 |

### Détail des paramètres

#### `gameplay_markers_bigmapMarker.createMarker(...)`

Fabrique un objet marqueur de grande carte (instance de la classe C) et appelle son init.

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

#### `gameplay_markers_bigmapMarker.merge(pois, idPrefix)`

Fusionne une liste de POI en un seul cluster de grande carte (position moyenne, ids contenus, icône numérotée si plusieurs).

- `pois` (*table[]*) : POI à fusionner (avec markerInfo.bigmapMarker et data).
- `idPrefix` (*string*) : Préfixe de l'id du cluster.
- **renvoie** : table Cluster {id, containedIds, containedIdsLookup, pos, icon}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `containsAnyDelivery` | boolean |  |
| `containsAnyMission` | boolean |  |

## Classe `C`

Marqueur de grande carte : une icône plus une colonne, dont l'opacité suit l'état de la grande carte.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Retire les icônes de l'icon renderer et réinitialise les références internes. | 214 |
| `C:hide()` | Marque le marqueur invisible (l'opacité retombe en fondu). | 199 |
| `C:init()` | Initialise l'id, le lisseur d'opacité et visible = true, sans créer d'objet. | 29 |
| `C:instantFade(visible)` | Ne fait rien (interface commune des marqueurs). | 208 |
| `C:setFullAlphaInstant()` | Met l'opacité du lisseur à 1 immédiatement. | 191 |
| `C:setHidden(value)` | Ne fait rien (interface commune des marqueurs). | 196 |
| `C:setup(cluster)` | Associe le marqueur à un cluster : enregistre pos et cluster, ajoute l'icône (cluster.icon) et la colonne dans l'icon renderer de gameplay_playmodeMarkers, et remet l'opacité à 0. | 156 |
| `C:show()` | Marque le marqueur visible. | 203 |
| `C:update(data)` | Appelée chaque frame : lisse l'opacité (apparition en 0.2 s quand la grande carte est active et sans transition), place l'icône et la colonne devant la caméra (ou en projection orthographique), agrandit l'icône à 1.5 si le cluster est survolé ou sélectionné. | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/bigmapMarker.lua`.*

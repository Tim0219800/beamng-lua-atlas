# `gameplay_playmodeMarkers`

*Fichier : `lua/ge/extensions/gameplay/playmodeMarkers.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_playmodeMarkers` : `extensions.load("gameplay_playmodeMarkers")`, puis la globale `gameplay_playmodeMarkers`

Gère les marqueurs de jeu en freeroam/carrière (missions, parkings, zones, stations-service, etc.). Il regroupe les POI bruts de gameplay_rawPois en clusters par type de marqueur (fabriques dans gameplay/markers/<type>.lua), crée à la demande l'objet marqueur d'un cluster, et fournit les deux rendus d'icônes (BeamNGWorldIconsRenderer) du monde et de la grande carte. Un kd-tree 2D sert à retrouver les clusters visibles autour d'une position.

## Remarques

- Les clusters sont invalidés dès que gameplay_rawPois.getRawPoiGeneration() augmente.
- Types de marqueurs gérés : missionMarker, parkingMarker, zoneMarker, walkingMarker, gasStationMarker, driftLineMarker, invisibleTrigger, inspectVehicleMarker, crawlMarker, vehicleTrigger (liste codée en dur).
- Les deux rendus d'icônes sont supprimés à la fin du niveau et à la sérialisation (rechargement Lua).
- Les rendus d'icônes sont créés paresseusement par les getters ; le rendu du monde charge l'atlas core/art/gui/images/iconAtlas.

**Dépendances (chargées avant) :** `gameplay_rawPois`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_playmodeMarkers.clear()` | Vide les clusters, le kd-tree et supprime les objets des marqueurs créés. | 49 |
| `gameplay_playmodeMarkers.getBigmapRendererId()` | Id du rendu d'icônes de la grande carte 'bigmapIconRenderer' (créé si besoin). | 102 |
| `gameplay_playmodeMarkers.getBigmapRendererObj()` | Objet du rendu d'icônes de la grande carte (créé si besoin). | 106 |
| `gameplay_playmodeMarkers.getIconRendererId()` | Id de l'objet BeamNGWorldIconsRenderer 'markerIconRenderer' (créé si besoin). | 94 |
| `gameplay_playmodeMarkers.getIconRendererObj()` | Objet du rendu d'icônes du monde (créé si besoin). | 98 |
| `gameplay_playmodeMarkers.getMarkerForCluster(cluster)` | Renvoie l'objet marqueur du cluster ; le crée au premier appel (cluster.create(), createObjects, setup). | 178 |
| `gameplay_playmodeMarkers.getPlaymodeClusters()` | Liste triée par id des clusters de marqueurs du niveau courant (calculée puis mise en cache). Chaque cluster doit avoir id, visibilityPos et visibilityRadius, sinon une erreur est loguée. | 153 |
| `gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree()` | kd-tree 2D (kdtreebox2d) des clusters, indexé par boîte englobant visibilityPos ± visibilityRadius. | 164 |
| `gameplay_playmodeMarkers.isStateWithPlaymodeMarkers()` | Indique si l'état de jeu courant est dans validPlaymodeMarkersStates. | 196 |
| `gameplay_playmodeMarkers.onClientEndMission()` | Hook de fin de niveau : vide clusters et marqueurs, supprime les rendus d'icônes. *(interne)* *(hook)* | 205 |
| `gameplay_playmodeMarkers.onClientStartMission()` | Hook de début de niveau : crée les deux rendus d'icônes. *(interne)* *(hook)* | 79 |
| `gameplay_playmodeMarkers.onSerialize()` | Hook avant rechargement Lua : mêmes nettoyages que onClientEndMission. *(interne)* *(hook)* | 211 |

### Détail des paramètres

#### `gameplay_playmodeMarkers.getBigmapRendererId()`

Id du rendu d'icônes de la grande carte 'bigmapIconRenderer' (créé si besoin).

- **renvoie** : integer Id d'objet.

#### `gameplay_playmodeMarkers.getBigmapRendererObj()`

Objet du rendu d'icônes de la grande carte (créé si besoin).

- **renvoie** : userdata|nil Objet de la scène.

#### `gameplay_playmodeMarkers.getIconRendererId()`

Id de l'objet BeamNGWorldIconsRenderer 'markerIconRenderer' (créé si besoin).

- **renvoie** : integer Id d'objet.

#### `gameplay_playmodeMarkers.getIconRendererObj()`

Objet du rendu d'icônes du monde (créé si besoin).

- **renvoie** : userdata|nil Objet de la scène.

#### `gameplay_playmodeMarkers.getMarkerForCluster(cluster)`

Renvoie l'objet marqueur du cluster ; le crée au premier appel (cluster.create(), createObjects, setup).

- `cluster` (*table*) : Cluster issu de getPlaymodeClusters.
- **renvoie** : table Objet marqueur.

#### `gameplay_playmodeMarkers.getPlaymodeClusters()`

Liste triée par id des clusters de marqueurs du niveau courant (calculée puis mise en cache). Chaque cluster doit avoir id, visibilityPos et visibilityRadius, sinon une erreur est loguée.

- **renvoie** : table[] Clusters.

#### `gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree()`

kd-tree 2D (kdtreebox2d) des clusters, indexé par boîte englobant visibilityPos ± visibilityRadius.

- **renvoie** : table Objet kd-tree construit.

#### `gameplay_playmodeMarkers.isStateWithPlaymodeMarkers()`

Indique si l'état de jeu courant est dans validPlaymodeMarkersStates.

- **renvoie** : boolean true si les marqueurs sont autorisés.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_rawPois'}, extension chargée avant. |
| `validPlaymodeMarkersStates` | table<string, boolean> | États de jeu où les marqueurs sont actifs : freeroam et career. Modifiable pour en ajouter. |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/playmodeMarkers.lua`.*

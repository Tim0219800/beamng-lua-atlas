# `gameplay_markers_zoneMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/zoneMarker.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_zoneMarker` : `extensions.load("gameplay_markers_zoneMarker")`, puis la globale `gameplay_markers_zoneMarker`

Marqueur de zone sans visuel : rend un POI interactif quand le véhicule du joueur (ses quatre coins au sol de la boîte englobante) est entièrement dans l'un des polygones de zone donnés. Aucune icône ni décalque n'est dessiné. Le module renvoie {create, cluster} ; chaque POI zoneMarker forme son propre cluster.

## Remarques

- cluster : un par POI (id 'zoneMarker#<poi.id>'). Lit poi.markerInfo.zoneMarker.{zones, pos, radius} ; elemData = {poi.data}.
- interactInPlayMode ne fait rien si le joueur marche (interactData.isWalking). La distance 2D du véhicule au centre doit être <= rayon + 2 m, puis les points 1, 4, 5 et 8 de bbPoints (coins du bas ou du haut de la boîte, déduit du code) doivent tous être dans une zone (containsPoint2D).
- Le résultat 'inside' est évalué même sans canInteract ; l'ajout aux éléments interactifs exige canInteract.
- Toutes les autres méthodes (update, hide, show, createObjects, clearObjects, setHidden, instantFade) sont vides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_zoneMarker.cluster(pois, allClusters)` | Transforme chaque POI zoneMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters. *(interne)* | 57 |
| `gameplay_markers_zoneMarker.create(...)` | Fabrique un marqueur de zone (instance de C). | 48 |

### Détail des paramètres

#### `gameplay_markers_zoneMarker.cluster(pois, allClusters)`

Transforme chaque POI zoneMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.zoneMarker {zones, pos, radius}.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_zoneMarker.create(...)`

Fabrique un marqueur de zone (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de zone sans rendu.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Ne fait rien. | 24 |
| `C:createObjects()` | Ne fait rien. | 20 |
| `C:hide()` | Ne fait rien. | 21 |
| `C:init()` | Ne fait rien. | 7 |
| `C:instantFade(visible)` | Ne fait rien. | 23 |
| `C:interactInPlayMode(interactData, interactableElements)` | Ajoute les données (elemData) du cluster aux éléments interactifs si le véhicule est entièrement dans une zone et que canInteract est vrai ; sans effet à pied. | 27 |
| `C:setHidden(value)` | Ne fait rien. | 19 |
| `C:setup(cluster)` | Mémorise zones, cluster, centre 2D (visibilityPos avec z = 0) et rayon (visibilityRadius). | 12 |
| `C:show()` | Ne fait rien. | 22 |
| `C:update(data)` | Ne fait rien. | 9 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/zoneMarker.lua`.*

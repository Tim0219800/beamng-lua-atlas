# `gameplay_markers_invisibleTrigger`

*Fichier : `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_invisibleTrigger` : `extensions.load("gameplay_markers_invisibleTrigger")`, puis la globale `gameplay_markers_invisibleTrigger`

Déclencheur sphérique invisible : à partir d'un POI invisibleTrigger (pos, radius, onEnter, onInside, onExit), appelle les callbacks Lua quand le véhicule d'un joueur entre dans la sphère, y reste, ou en sort. L'état dedans/dehors est suivi par joueur (multiseat) et conservé par id de cluster. Le module renvoie {create, cluster}. Utile pour des déclencheurs de gameplay sans aucun visuel.

## Exemple

```lua
-- POI fournissant markerInfo.invisibleTrigger
markerInfo = { invisibleTrigger = {
  pos = vec3(0,0,0), radius = 10,
  onEnter = function(interactData) log('I','', 'entre') end,
  onExit  = function(interactData) log('I','', 'sort') end
}}
```

## Remarques

- Les callbacks reçoivent interactData : vehPos, isWalking, playerIndex (0 si absent), etc.
- Rien n'est déclenché quand le joueur marche (isWalking) ; l'état dedans/dehors n'est alors pas mis à jour.
- L'état insideByCluster est conservé entre recréations du marqueur (régénération des POI) pour ne pas redéclencher onEnter pour un joueur déjà dedans ; hide() efface cet état du cluster.
- Cluster : un par POI, id 'invisibleTrigger#<poi.id>', visibilityRadius = 0, showOnMinimap = false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_invisibleTrigger.cluster(pois, allClusters)` | Transforme chaque POI invisibleTrigger en un cluster distinct (pas de fusion) et l'ajoute à allClusters. *(interne)* | 81 |
| `gameplay_markers_invisibleTrigger.create(...)` | Fabrique un marqueur déclencheur invisible (instance de C). | 72 |

### Détail des paramètres

#### `gameplay_markers_invisibleTrigger.cluster(pois, allClusters)`

Transforme chaque POI invisibleTrigger en un cluster distinct (pas de fusion) et l'ajoute à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.invisibleTrigger {pos, radius, onEnter, onInside, onExit}.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_invisibleTrigger.create(...)`

Fabrique un marqueur déclencheur invisible (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Déclencheur sphérique sans visuel.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | Ne fait rien. | 68 |
| `C:createObjects()` | Ne fait rien. | 60 |
| `C:hide()` | Efface l'état dedans/dehors de tous les joueurs pour ce cluster. | 63 |
| `C:init()` | Ne fait rien. | 11 |
| `C:instantFade(visible)` | Ne fait rien. | 70 |
| `C:interactInPlayMode(interactData, interactableElements)` | Ne fait rien. | 23 |
| `C:interactWhileMoving(interactData)` | Appelée chaque frame : si le véhicule du joueur est dans la sphère, appelle onEnter (à la première frame dedans) puis onInside ; en sortant, appelle onExit. | 24 |
| `C:setHidden(value)` | Ne fait rien. | 61 |
| `C:setup(cluster)` | Mémorise cluster, pos, radius et les trois callbacks ; relie l'état dedans/dehors par joueur à celui de l'id du cluster. | 48 |
| `C:show()` | Ne fait rien. | 62 |
| `C:update(data)` | Ne fait rien (le dessin de debug est commenté). | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua`.*

# `gameplay_markers_parkingMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/parkingMarker.lua` · VM : Game Engine (GE) · 544 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_parkingMarker` : `extensions.load("gameplay_markers_parkingMarker")`, puis la globale `gameplay_markers_parkingMarker`

Marqueur de place de parking en mode jeu (par exemple pour livrer ou déposer un véhicule) : un décalque rayé au sol, un contour 3D (park_outline_marker.dae) dont la hauteur et l'opacité dépendent de la vitesse, et une icône flottante (poi_parking_rect par défaut). Le véhicule du joueur est « garé » quand sa boîte englobante recouvre (mode overlap) ou est contenue dans (mode contained) la place, à moins de 15 m et sous environ 20 km/h ; le marqueur devient alors interactif. Le module renvoie {create, cluster}.

## Remarques

- mode d'un cluster : "overlap" (défaut, la boîte du véhicule touche une boîte de 1 m x 1 m centrée) ou "contained" (le véhicule doit tenir entièrement dans la place agrandie de 1 m en x/y).
- cluster regroupe les POI par chemin (markerInfo.parkingMarker.path) ; sans chemin, ils vont dans le groupe "noPath". Les POI reprennent pos, rot, scl, mode, icon, focus du premier POI du groupe ; visibilityRadius = 5.
- Bug : cluster calcule count = #poisByPath sur une table indexée par chaîne : la valeur est toujours 0, la condition count > 1 est donc fausse et l'icône numérotée (poi_no-0N) n'est jamais utilisée.
- Bug : C:setup lit la variable globale parkDelay, jamais définie dans ce fichier : self.stopTimer vaut nil.
- distance est une variable locale du module partagée par tous les marqueurs (mise à jour par checkParking juste avant update) ; distanceToHeight ignore son argument et lit cette variable.
- Distances : l'icône apparaît à moins de 60 m (farDist) hors focus et se lève au-dessus du véhicule à moins de 15 m (nearDist) ; avec focus elle reste affichée de loin avec rebond.
- Le décalque de sol est fourni dans groundDecalData (texture parkDecalStripes.png) et dessiné par le gestionnaire de marqueurs ; sa distance de fondu s'allonge de 20 m quand le véhicule est garé.
- isInAreaChanged vaut "in"/"out" pendant une frame ; la fonction drawAxisBox et l'ancienne version hexagonale de drawOnMinimap (commentée) ne sont pas utilisées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_parkingMarker.cluster(pois, allClusters)` | Regroupe les POI parkingMarker par chemin identique et ajoute un cluster par groupe à allClusters. *(interne)* | 497 |
| `gameplay_markers_parkingMarker.create(...)` | Fabrique un marqueur de place de parking (instance de C). | 487 |

### Détail des paramètres

#### `gameplay_markers_parkingMarker.cluster(pois, allClusters)`

Regroupe les POI parkingMarker par chemin identique et ajoute un cluster par groupe à allClusters.

- `pois` (*table[]*) : POI avec markerInfo.parkingMarker {path, pos, rot, scl, mode, icon, focus}.
- `allClusters` (*table[]*) : Liste de clusters complétée en place.

#### `gameplay_markers_parkingMarker.create(...)`

Fabrique un marqueur de place de parking (instance de C).

- `...` (*any*) : Arguments transmis à C:init (non utilisés).
- **renvoie** : table Instance de marqueur.

## Classe `C`

Marqueur de place de parking.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkParking(data)` | Calcule la distance joueur/caméra à la place et détermine overlap (et parked) selon le mode, à moins de 15 m et sous la vitesse de croisière ; met la distance à 0 si garé. | 257 |
| `C:clearObjects()` | Supprime le contour (notifie l'éditeur si présent) et l'icône flottante. | 329 |
| `C:createObject(shapeName, objectName)` | Crée et enregistre un TSStatic à couleur d'instance (utilisé pour le contour). | 288 |
| `C:createObjects()` | Nettoie les objets existants (n'en crée pas de nouveaux ; le contour est créé dans setup). | 302 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte de debug (arêtes et faces) par debugDrawer ; non utilisée ici. | 430 |
| `C:drawOnMinimap(td)` | Dessine un cercle bleu à la position de la place sur la minimap. | 368 |
| `C:hide()` | Passe invisible, rend le contour et l'icône transparents. | 306 |
| `C:init()` | Attribue un numId et crée les lisseurs (position d'icône, croisière, opacité, distance, recouvrement) ; visible = true. | 26 |
| `C:instantFade(visible)` | Ne fait rien. | 360 |
| `C:interactInPlayMode(interactData, interactableElements)` | Si canInteract et que le véhicule est garé, ajoute les données (elemData) du cluster aux éléments interactifs. | 352 |
| `C:setup(cluster)` | Lit pos, rot, scl, mode du cluster, calcule les demi-axes de la boîte de test, crée l'objet de contour (TSStatic) positionné et mis à l'échelle sur la place, l'icône et le décalque au sol. | 41 |
| `C:show()` | Repasse visible et force la mise à jour du contour. | 323 |
| `C:update(data)` | Chaque frame : appelle checkParking, anime la hauteur et l'opacité de l'icône, dessine le trait vers le sol, ajuste hauteur et opacité du contour, met à jour isInAreaChanged et la distance de fondu du décalque. | 135 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawTriSolid`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/parkingMarker.lua`.*

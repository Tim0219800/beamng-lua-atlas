# `editor_roadArchitect_roads`

*Fichier : `lua/ge/extensions/editor/roadArchitect/roads.lua` · VM : Game Engine (GE) · 1645 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_roads` : `extensions.load("editor_roadArchitect_roads")`, puis la globale `editor_roadArchitect_roads`

Conteneur central du Road Architect : il stocke la liste des routes de la session (chaque route = nœuds, profil latéral, options d'affichage, pont, tunnels) et fournit toutes les opérations d'édition (ajout/suppression de nœuds, déplacement, hauteur, rotation latérale, découpe, retournement, copie, sérialisation). Il gère aussi le passage entre l'état « edit » et l'état « finalised » (création des maillages procéduraux, statiques, tunnels et décalcomanies). Un moddeur s'en sert pour créer ou manipuler des routes par script depuis l'éditeur ; les modules du Road Architect (geometry, profiles, decals, roadMesh…) lisent ses tables.

## Exemple

```lua
local roads = extensions.editor_roadArchitect_roads
local idx = #roads.roads + 1
roads.roads[idx] = roads.createRoadFromTemplate('Two Lane')  -- nom de modèle de profil (exemple)
roads.map[roads.roads[idx].name] = idx
roads.addNodeToRoad(idx, vec3(0, 0, 0))
roads.addNodeToRoad(idx, vec3(50, 0, 0))
roads.updateRoads()
```

## Remarques

- Une route est une table (champs : name, displayName (im.ArrayChar), nodes, profile, isVis/isDirty…, renderData, tunnels, groupIdx). Beaucoup de paramètres sont des pointeurs ImGui (im.BoolPtr, im.FloatPtr, im.IntPtr) : lire/écrire avec [0].
- Un nœud = {p (vec3), isLocked, rot (FloatPtr, degrés), widths/heightsL/heightsR (tables FloatPtr indexées par clé de voie, -20..20), incircleRad, isAutoBanked, offset}.
- Limites internes : hauteur des nœuds bornée à ±1000 m, rotation latérale bornée à ±50 degrés, largeur locale (setLocalWidth) bornée à [0.5, 10] m par voie.
- createRoadFromProfile/createRoadFromTemplate renvoient seulement la table route : elles ne l'ajoutent PAS à roads.roads ni à roads.map (voir convertDecalRoads2RoadArchitect pour l'ajout manuel).
- Les routes modifiées sont marquées isDirty via setDirty ; updateRoads() recalcule ensuite leur renderData (les routes à moins de 2 nœuds sont ignorées).
- Une route nommée 'temp' (isHidden = true) sert à prévisualiser les profils (manageTempRoadSection).
- BUG/incohérence : M.isAuditionProfileDirty est une copie booléenne figée au chargement (le flag réel est une variable locale) ; lire ce champ ne donne pas l'état courant.
- BUG probable : reparameteriseDecalRoad (interne) utilise `while isError or iter > maxIter` (la borne est inversée) et construit ses points de largeur avec pp1.x/pp1.y pour tous les points.
- BUG probable : updateBridgeParameters fait im.FloatPtr(road.bridgeWidth) alors que bridgeWidth est déjà un FloatPtr (il faudrait [0]).
- convertDecalRoads2RoadArchitect : le commentaire dit que les DecalRoad d'origine sont supprimés, mais l'appel sel:delete() est commenté dans le code ; la fonction ne les supprime donc pas. De plus elle ne l'ajoute pas à roadMap via recomputeMap.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie)` | Ajoute un nœud entre le nœud sélectionné et son voisin (point milieu, valeurs moyennées). Aux extrémités de la route, copie le nœud et le place 3 m plus loin dans l'axe de la route. | 404 |
| `editor_roadArchitect_roads.addNodeToRoad(rIdx, pos)` | Ajoute un nœud à la fin de la route, avec les largeurs/hauteurs par voie issues du profil. Marque la route dirty. | 191 |
| `editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx)` | Insère un nœud à l'indice donné de la route. Marque la route dirty. | 210 |
| `editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx)` | Modifie la hauteur d'un nœud (bornée à ±1000 m) et propage la variation aux autres nœuds (rigide ou champ de force). Marque dirty. | 555 |
| `editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx)` | Modifie la rotation latérale (devers) d'un nœud et propage aux autres (bornée à ±50 degrés). Sans effet si le profil est en auto-banking. | 602 |
| `editor_roadArchitect_roads.clearAllRoads()` | Supprime toutes les routes qui ne sont pas des routes de jonction (isJctRoad). | 452 |
| `editor_roadArchitect_roads.clearBridges()` | Vide la table des ponts du module roadMesh (sans supprimer les objets de scène). | 910 |
| `editor_roadArchitect_roads.computeAABB2D(rIdx)` | Boîte englobante 2D des nœuds d'une route. Renvoie nil pour un pont ou un overlay. (Le commentaire annonce que la largeur du profil est incluse, mais le code ne prend en compte que les nœuds.) | 314 |
| `editor_roadArchitect_roads.computeAllRoadRenderData()` | Recalcule le renderData de toutes les routes à 2 nœuds ou plus (via geometry). | 1115 |
| `editor_roadArchitect_roads.computeRoadAABB_2D(r)` | Calcule la boîte englobante 2D alignée sur les axes des nœuds d'une route (utilisée uniquement par l'arbre d'accélération). | 137 |
| `editor_roadArchitect_roads.computeRoadRenderDataSingle(i)` | Recalcule le renderData d'une seule route. | 1126 |
| `editor_roadArchitect_roads.convertDecalRoads2RoadArchitect()` | Pour chaque DecalRoad sélectionné dans l'éditeur, crée une route Road Architect (nœuds re-paramétrés, profil selon lanesLeft/lanesRight) et l'ajoute à roads. Voir notes : les DecalRoad ne sont pas supprimés. | 1213 |
| `editor_roadArchitect_roads.copyNode(n)` | Copie profonde d'un nœud (nouveaux pointeurs ImGui et nouveau vec3). | 285 |
| `editor_roadArchitect_roads.copyRoad(r)` | Copie profonde d'une route (nœuds, profil, options, paramètres de pont/tunnel). Le nom est conservé identique, renderData est vidé, tunnels est vide et isDirty = true. | 663 |
| `editor_roadArchitect_roads.createMultiSelect(gPolygon)` | Remplit roads.multi avec tous les nœuds de toutes les routes situés dans le polygone (en 2D). | 1075 |
| `editor_roadArchitect_roads.createRoadFromProfile(profile)` | Construit une nouvelle table route à partir d'un profil latéral (met à jour les drapeaux de voies du profil, calcule les clés de voies). La route n'a aucun nœud et n'est pas ajoutée à la liste. | 61 |
| `editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName)` | Comme createRoadFromProfile, mais le profil est créé à partir du nom d'un modèle de profil (avec un identifiant généré par Engine.generateUUID()). | 129 |
| `editor_roadArchitect_roads.deserialiseRoad(rSer)` | Reconstruit une route (avec pointeurs ImGui, isDirty = true) à partir d'une table sérialisée par serialiseRoad. | 1505 |
| `editor_roadArchitect_roads.finalise()` | Passe à l'état « finalised » : recalcule tous les renderData, crée un dossier de scène par route (« Road Architect - Road <i> »), génère les maillages de ponts puis de routes, les maillages statiques et les tunnels, recharge la collision (be:reloadCollision), pose les décalcomanies puis recharge le navgraph (map.reset()). | 1270 |
| `editor_roadArchitect_roads.flipRoad(rIdx)` | Inverse le sens de la route (ordre des nœuds) et recalcule immédiatement son renderData. Utile pour corriger des imports. | 873 |
| `editor_roadArchitect_roads.getCurrentMap()` | Renvoie le nom/identifiant de la carte (niveau) actuellement mémorisée par le module. | 55 |
| `editor_roadArchitect_roads.getMultiSelectionCentroid()` | Centre de la boîte englobante 3D des nœuds de la multi-sélection. | 1100 |
| `editor_roadArchitect_roads.getRoadsFromGroup(group)` | Renvoie les routes (sans doublon) appartenant à un groupe placé ; si group est nil, renvoie toutes les routes de la session. | 330 |
| `editor_roadArchitect_roads.getTree()` | Renvoie le quadtree 2D utilisé pour le culling de l'affichage en édition (nil s'il n'existe pas encore). | 182 |
| `editor_roadArchitect_roads.goToRoad(rIdx)` | Place la caméra libre à la verticale du centre de la route, à une hauteur qui cadre toute la route (selon le champ de vision). Ne fait rien si la route est trop petite (moins de 0.1 m d'étendue). | 478 |
| `editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos)` | Teste si la position de la souris est proche (tolérance 3.5 m en 2D) d'un segment de la route, entre deux nœuds, pour proposer l'insertion d'un nœud. | 230 |
| `editor_roadArchitect_roads.manageTempRoadSection(pIdx)` | Crée ou met à jour la route temporaire 'temp' (segment droit de 20 m à 1000 m d'altitude) qui montre le profil en cours d'édition, place la caméra libre dessus et la fait tourner autour. Appelée à chaque frame pendant l'audition. | 959 |
| `editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast)` | Translate une route : soit rigide (tous les nœuds non verrouillés), soit en champ de force (le nœud central suit la souris, les autres bougent proportionnellement à la distance, jusqu'au premier nœud verrouillé). Marque la route dirty. | 515 |
| `editor_roadArchitect_roads.offsetByValue(offset)` | Ajoute un décalage vertical à tous les nœuds de toutes les routes et les marque dirty. | 1257 |
| `editor_roadArchitect_roads.offsetRoads2Terrain()` | Active isConformRoadToTerrain sur toutes les routes (elles se posent sur le terrain) et les marque dirty. | 1249 |
| `editor_roadArchitect_roads.recomputeMap()` | Reconstruit la table nom -> indice (roads.map). À appeler après toute insertion/suppression manuelle dans roads. | 353 |
| `editor_roadArchitect_roads.removeAll()` | Supprime toutes les décalcomanies, maillages de routes, statiques, ponts et tunnels, puis vide roads et la map. | 913 |
| `editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx)` | Retire un indice de groupe placé de la liste groupIdx de la route. | 1129 |
| `editor_roadArchitect_roads.removeHiddenRoads()` | Supprime de roads toutes les routes masquées (isHidden) et leurs maillages, puis recalcule la map. | 462 |
| `editor_roadArchitect_roads.removeNode(rIdx, nIdx)` | Supprime un nœud d'une route (table.remove). Ne marque pas la route dirty. | 385 |
| `editor_roadArchitect_roads.removeRoad(roadName)` | Supprime une route par son nom : retire décalcomanies, maillages de route et statiques, entrée du quadtree, dossier de pont éventuel, puis l'entrée de roads et reconstruit la map. | 362 |
| `editor_roadArchitect_roads.removeTree()` | Oublie le quadtree (il sera recréé au prochain setDirty). | 185 |
| `editor_roadArchitect_roads.serialiseRoad(r)` | Convertit une route en table simple (valeurs plain, sans pointeurs ImGui) pour la sauvegarde JSON. | 1446 |
| `editor_roadArchitect_roads.setAllDirty()` | Appelle setDirty sur toutes les routes. | 175 |
| `editor_roadArchitect_roads.setAuditionProfileDirty()` | Demande la reconstruction de la route temporaire d'audition de profil au prochain appel de manageTempRoadSection. | 188 |
| `editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow)` | Affiche ou masque tous les ponts. | 1426 |
| `editor_roadArchitect_roads.setCurrentMap(cMap)` | Mémorise la carte (niveau) actuellement chargée. | 58 |
| `editor_roadArchitect_roads.setDirty(r)` | Marque la route comme à recalculer (isDirty), met à jour la condition du profil et réinsère la route dans le quadtree d'édition (créé à la demande avec l'étendue du terrain, ou 5000 m par défaut). | 149 |
| `editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset)` | Modifie la largeur de toutes les voies de type 'road_lane' d'un nœud : nouvelle largeur = largeur de départ + offset, bornée à [0.5, 10]. | 260 |
| `editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow)` | Affiche ou masque tous les overlays. | 1436 |
| `editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow)` | Affiche ou masque toutes les routes ordinaires (ni ponts ni overlays) en remplaçant leur isVis. | 1416 |
| `editor_roadArchitect_roads.splitRoad(rIdx, nIdx)` | Coupe une route au nœud donné en deux nouvelles routes ([A] et [B], chacune avec une copie du nœud de coupure repoussé de 1 m), supprime l'ancienne route et les ajoute à roads. Utile pour créer des jonctions. | 737 |
| `editor_roadArchitect_roads.unfinalise()` | Quitte l'état « finalised » : supprime décalcomanies, maillages, statiques et tunnels générés par finalise et revient à l'édition. | 1334 |
| `editor_roadArchitect_roads.updateBridgeParameters(road)` | Applique la largeur et la profondeur de pont de la route aux deux premiers nœuds (voies -1 et 1). Voir notes : bug probable de pointeur. | 1054 |
| `editor_roadArchitect_roads.updateMultiAfterRemove()` | Retire de roads.multi les entrées dont la route ou le nœud n'existe plus. | 1202 |
| `editor_roadArchitect_roads.updateRoads()` | Recalcule le renderData de chaque route dirty ayant au moins 2 nœuds ; pour les ponts, met à jour aussi le maillage de pont dans le dossier de scène « Road Architect - Bridge <nom> ». À appeler à chaque frame d'édition. | 889 |
| `editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups)` | Reconstruit les groupIdx de toutes les routes à partir de la liste des groupes placés restants (renumérotation après suppression d'un groupe). | 1188 |
| `editor_roadArchitect_roads.updateWAndHToNewProfile(road)` | Réinitialise les largeurs et hauteurs par voie de tous les nœuds de la route selon son profil actuel (après changement de profil). | 304 |

### Détail des paramètres

#### `editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie)`

Ajoute un nœud entre le nœud sélectionné et son voisin (point milieu, valeurs moyennées). Aux extrémités de la route, copie le nœud et le place 3 m plus loin dans l'axe de la route.

- `rIdx` (*integer*) : Indice de la route.
- `nIdx` (*integer*) : Indice du nœud sélectionné.
- `lie` (*string*) : 'above' (avec le nœud précédent) ou 'below' (avec le nœud suivant).

#### `editor_roadArchitect_roads.addNodeToRoad(rIdx, pos)`

Ajoute un nœud à la fin de la route, avec les largeurs/hauteurs par voie issues du profil. Marque la route dirty.

- `rIdx` (*integer*) : Indice de la route dans roads.
- `pos` (*vec3*) : Position monde du nœud.

#### `editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx)`

Insère un nœud à l'indice donné de la route. Marque la route dirty.

- `rIdx` (*integer*) : Indice de la route.
- `pos` (*vec3*) : Position monde.
- `idx` (*integer*) : Indice d'insertion dans route.nodes (table.insert).

#### `editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx)`

Modifie la hauteur d'un nœud (bornée à ±1000 m) et propage la variation aux autres nœuds (rigide ou champ de force). Marque dirty.

- `hNew` (*number*) : Nouvelle hauteur du nœud central, en mètres.
- `hOld` (*number*) : Ancienne hauteur (sert à calculer la variation dz).
- `nIdx` (*integer*) : Indice du nœud central.
- `rIdx` (*integer*) : Indice de la route.

#### `editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx)`

Modifie la rotation latérale (devers) d'un nœud et propage aux autres (bornée à ±50 degrés). Sans effet si le profil est en auto-banking.

- `rotNew` (*number*) : Nouvelle rotation du nœud central, en degrés.
- `rotOld` (*number*) : Ancienne rotation.
- `nIdx` (*integer*) : Indice du nœud central.
- `rIdx` (*integer*) : Indice de la route.

#### `editor_roadArchitect_roads.computeAABB2D(rIdx)`

Boîte englobante 2D des nœuds d'une route. Renvoie nil pour un pont ou un overlay. (Le commentaire annonce que la largeur du profil est incluse, mais le code ne prend en compte que les nœuds.)

- `rIdx` (*integer*) : Indice de la route.
- **renvoie** : table|nil {xMin, xMax, yMin, yMax} ou nil.

#### `editor_roadArchitect_roads.computeRoadAABB_2D(r)`

Calcule la boîte englobante 2D alignée sur les axes des nœuds d'une route (utilisée uniquement par l'arbre d'accélération).

- `r` (*table*) : Route.
- **renvoie** : number xMin
- **renvoie** : number xMax
- **renvoie** : number yMin
- **renvoie** : number yMax

#### `editor_roadArchitect_roads.computeRoadRenderDataSingle(i)`

Recalcule le renderData d'une seule route.

- `i` (*integer*) : Indice de la route.

#### `editor_roadArchitect_roads.copyNode(n)`

Copie profonde d'un nœud (nouveaux pointeurs ImGui et nouveau vec3).

- `n` (*table*) : Nœud.
- **renvoie** : table Copie du nœud.

#### `editor_roadArchitect_roads.copyRoad(r)`

Copie profonde d'une route (nœuds, profil, options, paramètres de pont/tunnel). Le nom est conservé identique, renderData est vidé, tunnels est vide et isDirty = true.

- `r` (*table*) : Route.
- **renvoie** : table Copie de la route.

#### `editor_roadArchitect_roads.createMultiSelect(gPolygon)`

Remplit roads.multi avec tous les nœuds de toutes les routes situés dans le polygone (en 2D).

- `gPolygon` (*table<integer, vec3>*) : Sommets du polygone de sélection.

#### `editor_roadArchitect_roads.createRoadFromProfile(profile)`

Construit une nouvelle table route à partir d'un profil latéral (met à jour les drapeaux de voies du profil, calcule les clés de voies). La route n'a aucun nœud et n'est pas ajoutée à la liste.

- `profile` (*table*) : Profil latéral (voir editor/roadArchitect/profiles).
- **renvoie** : table La route créée (valeurs par défaut : visible, 15 divisions radiales de tunnel, pont de demi-largeur 5.5, profondeur 4, arche -6, etc.).

#### `editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName)`

Comme createRoadFromProfile, mais le profil est créé à partir du nom d'un modèle de profil (avec un identifiant généré par Engine.generateUUID()).

- `profileTemplateName` (*string*) : Nom du modèle de profil.
- **renvoie** : table La route créée.

#### `editor_roadArchitect_roads.deserialiseRoad(rSer)`

Reconstruit une route (avec pointeurs ImGui, isDirty = true) à partir d'une table sérialisée par serialiseRoad.

- `rSer` (*table*) : Route sérialisée.
- **renvoie** : table Route utilisable dans roads.

#### `editor_roadArchitect_roads.flipRoad(rIdx)`

Inverse le sens de la route (ordre des nœuds) et recalcule immédiatement son renderData. Utile pour corriger des imports.

- `rIdx` (*integer*) : Indice de la route.

#### `editor_roadArchitect_roads.getCurrentMap()`

Renvoie le nom/identifiant de la carte (niveau) actuellement mémorisée par le module.

- **renvoie** : any Valeur stockée par setCurrentMap (nil au départ).

#### `editor_roadArchitect_roads.getMultiSelectionCentroid()`

Centre de la boîte englobante 3D des nœuds de la multi-sélection.

- **renvoie** : vec3 Centre (valeurs absurdes si la sélection est vide).

#### `editor_roadArchitect_roads.getRoadsFromGroup(group)`

Renvoie les routes (sans doublon) appartenant à un groupe placé ; si group est nil, renvoie toutes les routes de la session.

- `group` (*table|nil*) : Groupe avec group.list = liste d'entrées {r = nom de route, n = indice de nœud}.
- **renvoie** : table Liste de routes.

#### `editor_roadArchitect_roads.getTree()`

Renvoie le quadtree 2D utilisé pour le culling de l'affichage en édition (nil s'il n'existe pas encore).

- **renvoie** : table|nil Le quadtree.

#### `editor_roadArchitect_roads.goToRoad(rIdx)`

Place la caméra libre à la verticale du centre de la route, à une hauteur qui cadre toute la route (selon le champ de vision). Ne fait rien si la route est trop petite (moins de 0.1 m d'étendue).

- `rIdx` (*integer*) : Indice de la route.

#### `editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos)`

Teste si la position de la souris est proche (tolérance 3.5 m en 2D) d'un segment de la route, entre deux nœuds, pour proposer l'insertion d'un nœud.

- `rIdx` (*integer*) : Indice de la route.
- `mousePos` (*vec3*) : Position de la souris sur la carte.
- **renvoie** : boolean true si la souris est sur un segment.
- **renvoie** : vec3|nil Position interpolée sur le segment.
- **renvoie** : integer|nil Indice du nœud qui suit le point trouvé.

#### `editor_roadArchitect_roads.manageTempRoadSection(pIdx)`

Crée ou met à jour la route temporaire 'temp' (segment droit de 20 m à 1000 m d'altitude) qui montre le profil en cours d'édition, place la caméra libre dessus et la fait tourner autour. Appelée à chaque frame pendant l'audition.

- `pIdx` (*integer*) : Indice du profil dans profileMgr.profiles.

#### `editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast)`

Translate une route : soit rigide (tous les nœuds non verrouillés), soit en champ de force (le nœud central suit la souris, les autres bougent proportionnellement à la distance, jusqu'au premier nœud verrouillé). Marque la route dirty.

- `road` (*table*) : Route (table, pas un indice).
- `nodeIdx` (*integer*) : Nœud saisi.
- `mouseNow` (*vec3*) : Position actuelle de la souris.
- `mouseLast` (*vec3*) : Position précédente.

#### `editor_roadArchitect_roads.offsetByValue(offset)`

Ajoute un décalage vertical à tous les nœuds de toutes les routes et les marque dirty.

- `offset` (*number*) : Décalage en mètres (positif = vers le haut).

#### `editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx)`

Retire un indice de groupe placé de la liste groupIdx de la route.

- `r` (*table*) : Route.
- `groupIdx` (*integer*) : Indice de groupe à retirer.

#### `editor_roadArchitect_roads.removeNode(rIdx, nIdx)`

Supprime un nœud d'une route (table.remove). Ne marque pas la route dirty.

- `rIdx` (*integer*) : Indice de la route.
- `nIdx` (*integer*) : Indice du nœud.

#### `editor_roadArchitect_roads.removeRoad(roadName)`

Supprime une route par son nom : retire décalcomanies, maillages de route et statiques, entrée du quadtree, dossier de pont éventuel, puis l'entrée de roads et reconstruit la map.

- `roadName` (*string*) : Nom (identifiant) de la route, pas son displayName.

#### `editor_roadArchitect_roads.serialiseRoad(r)`

Convertit une route en table simple (valeurs plain, sans pointeurs ImGui) pour la sauvegarde JSON.

- `r` (*table*) : Route.
- **renvoie** : table Route sérialisée.

#### `editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow)`

Affiche ou masque tous les ponts.

- `isShow` (*boolean*) : true pour afficher.

#### `editor_roadArchitect_roads.setCurrentMap(cMap)`

Mémorise la carte (niveau) actuellement chargée.

- `cMap` (*any*) : Valeur à mémoriser (déduit du code).

#### `editor_roadArchitect_roads.setDirty(r)`

Marque la route comme à recalculer (isDirty), met à jour la condition du profil et réinsère la route dans le quadtree d'édition (créé à la demande avec l'étendue du terrain, ou 5000 m par défaut).

- `r` (*table|nil*) : Route ; ne fait rien si nil.

#### `editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset)`

Modifie la largeur de toutes les voies de type 'road_lane' d'un nœud : nouvelle largeur = largeur de départ + offset, bornée à [0.5, 10].

- `rIdx` (*integer*) : Indice de la route.
- `nIdx` (*integer*) : Indice du nœud.
- `offset` (*number*) : Variation de largeur de voie, en mètres.

#### `editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow)`

Affiche ou masque tous les overlays.

- `isShow` (*boolean*) : true pour afficher.

#### `editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow)`

Affiche ou masque toutes les routes ordinaires (ni ponts ni overlays) en remplaçant leur isVis.

- `isShow` (*boolean*) : true pour afficher.

#### `editor_roadArchitect_roads.splitRoad(rIdx, nIdx)`

Coupe une route au nœud donné en deux nouvelles routes ([A] et [B], chacune avec une copie du nœud de coupure repoussé de 1 m), supprime l'ancienne route et les ajoute à roads. Utile pour créer des jonctions.

- `rIdx` (*integer*) : Indice de la route.
- `nIdx` (*integer*) : Indice du nœud de coupure ; doit avoir un voisin de chaque côté (le code lit nodes[nIdx-1] et nodes[nIdx+1]).

#### `editor_roadArchitect_roads.updateBridgeParameters(road)`

Applique la largeur et la profondeur de pont de la route aux deux premiers nœuds (voies -1 et 1). Voir notes : bug probable de pointeur.

- `road` (*table*) : Route de type pont.

#### `editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups)`

Reconstruit les groupIdx de toutes les routes à partir de la liste des groupes placés restants (renumérotation après suppression d'un groupe).

- `placedGroups` (*table*) : Liste des groupes placés, chacun avec list = {{r = nom, n = indice}, ...}.

#### `editor_roadArchitect_roads.updateWAndHToNewProfile(road)`

Réinitialise les largeurs et hauteurs par voie de tous les nœuds de la route selon son profil actuel (après changement de profil).

- `road` (*table*) : Route.

## Champs

| Champ | Type | Description |
|---|---|---|
| `isAuditionProfileDirty` | boolean | Copie initiale (false) du flag d'audition de profil ; voir notes, la valeur réelle n'est pas exposée. |
| `map` | table<string, integer> | Table de hachage nom de route -> indice dans roads. Reconstruite par recomputeMap(). |
| `multi` | table<integer, {r: integer, n: integer}> | Multi-sélection de nœuds : chaque entrée donne l'indice de route (r) et de nœud (n). |
| `roads` | table<integer, table> | Liste des routes de la session (même table que celle utilisée en interne : la modifier agit directement). |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/roads.lua`.*

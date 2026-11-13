# `editor_roadArchitect_junctions`

*Fichier : `lua/ge/extensions/editor/roadArchitect/junctions.lua` · VM : Game Engine (GE) · 10439 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_junctions` : `extensions.load("editor_roadArchitect_junctions")`, puis la globale `editor_roadArchitect_junctions`

Gestion des jonctions de l'éditeur Road Architect : passage piéton, carrefour en croix, T, Y, rond-point, transitions rural/urbain et autoroute/urbain, fusions, séparateurs, fondu de bande d'arrêt d'urgence et bretelle d'autoroute. Une jonction est un enregistrement (nom, type, paramètres ImGui im.FloatPtr/IntPtr/BoolPtr, liste de noms de routes) dont les routes sont générées dans roadMgr (editor/roadArchitect/roads) à partir de profils. Le module permet aussi de déplacer/tourner/copier/sauvegarder/charger une jonction, de la finaliser (elle devient des routes ordinaires) et d'importer un réseau routier issu de l'outil L-System. Réservé à l'éditeur (GE).

## Exemple

```lua
local j = extensions.editor_roadArchitect_junctions
j.addTJunction(true)            -- crée une jonction en T (dernière de la liste)
local idx = #j.junctions
j.junctions[idx].numLanesX[0] = 2   -- paramètre ImGui (pointeur)
j.updateJunctionAfterChange(idx)  -- régénère les routes
j.goToJunction(idx)
j.finaliseJunction(idx)         -- fige les routes, retire la jonction de la liste
```

## Remarques

- Les paramètres d'une jonction sont des pointeurs ImGui (im.FloatPtr, im.IntPtr, im.BoolPtr, im.ArrayChar) : on lit/écrit avec [0] et le nom avec ffi.string(jct.name).
- Types de jonction reconnus par updateJunctionAfterChange : crossing, crossroads, t-junction, y-junction, roundabout, rural_urban_transition, urban_merge, urban_separator, highway_merge, highway_urban_transition, highway_separator, shoulder_fade, highway_slip. Tout autre type est ignoré (commentaire TODO dans le code).
- Les fonctions addXxx(isNew) : avec isNew=true elles créent un nouvel enregistrement avec les valeurs par défaut ; avec isNew=false elles réutilisent la dernière jonction de la liste (utilisé par loadJunction après deserialiseJct). Elles construisent ensuite les routes puis appellent updateJunctionAfterChange(#junctions).
- Bug probable : clearAllJunctions parcourt la liste en avant avec for i = 1, #junctions tout en appelant removeJunction(i), qui fait table.remove ; un élément sur deux est sauté et la borne #junctions est évaluée une seule fois (risque d'indice nil). À éviter ou à appeler en boucle jusqu'à ce que la liste soit vide.
- setAllMeshProperty ne fait rien d'utile : la boucle récupère chaque route dans une variable locale r sans rien modifier.
- finaliseJunction ne supprime pas les routes : elle les renomme (nom de la jonction + ' R' + n, ou 'Overlay n'), met isJctRoad = false, puis retire seulement l'enregistrement de la liste junctions.
- removeJunction supprime les routes de la jonction via roadMgr.removeRoad puis l'entrée de la liste.
- La jonction 'shoulder_fade' est gérée par getJunctionCentroid/computeInitRot, mais le centroïde dépend de jct.isY1Outwards[0].
- Constante interne jctFlattenRad = 20 m (rayon d'aplanissement autour des jonctions, L-System).
- importRoadsFromLSystem suppose des routes à deux sens, une voie par sens, et ignore road_type (commentaires TODO du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_junctions.addCrossroads(isNew)` | Ajoute un carrefour à 4 branches, type 'crossroads'. | 8381 |
| `editor_roadArchitect_junctions.addHighwayMergeJunction(isNew)` | Ajoute une fusion d'autoroute (par exemple 2 voies vers 1, 3 vers 2...), type 'highway_merge'. | 9056 |
| `editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew)` | Ajoute un séparateur d'autoroute : scinde une autoroute à double sens en deux sections à sens unique pour les relier séparément, type 'highway_separator'. | 9246 |
| `editor_roadArchitect_junctions.addHighwaySlipJunction(isNew)` | Ajoute une bretelle d'autoroute (slip), type 'highway_slip'. | 9429 |
| `editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew)` | Ajoute une transition autoroute / urbain (réduit le terre-plein central jusqu'à une simple ligne centrale), type 'highway_urban_transition'. | 9155 |
| `editor_roadArchitect_junctions.addPedXJunction(isNew)` | Ajoute une jonction de passage piéton à 2 sens (passage + feux de signalisation seulement), type 'crossing'. | 8280 |
| `editor_roadArchitect_junctions.addRoundaboutJunction(isNew)` | Ajoute un rond-point à 4 branches, type 'roundabout'. | 8684 |
| `editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew)` | Ajoute une transition urbain (avec trottoirs) / rural (sans trottoirs), type 'rural_urban_transition'. | 8785 |
| `editor_roadArchitect_junctions.addShoulderFadeJunction(isNew)` | Ajoute un fondu de bande d'arrêt d'urgence : la bande d'arrêt d'une autoroute à sens unique s'efface pour devenir une route rurale à sens unique, type 'shoulder_fade'. | 9330 |
| `editor_roadArchitect_junctions.addTJunction(isNew)` | Ajoute une jonction en T à 3 branches, type 't-junction'. | 8482 |
| `editor_roadArchitect_junctions.addUrbanMergeJunction(isNew)` | Ajoute une fusion urbaine (par exemple 2 voies vers 1, 3 vers 2...), type 'urban_merge'. | 8869 |
| `editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew)` | Ajoute un séparateur urbain, type 'urban_separator'. | 8970 |
| `editor_roadArchitect_junctions.addYJunction(isNew)` | Ajoute une jonction en Y à 3 branches inclinées, type 'y-junction'. | 8583 |
| `editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad)` | Pour chaque route listée, supprime les nœuds situés à l'intérieur de la sphère (cercle en 2D) et projette le premier ou dernier nœud sur le cercle, selon que la route touche la jonction par son début ('start') ou sa fin. | 10076 |
| `editor_roadArchitect_junctions.clearAllJunctions()` | Tente de supprimer toutes les jonctions en appelant removeJunction(i) dans une boucle croissante. Voir notes : la boucle modifie la liste pendant le parcours. | 9537 |
| `editor_roadArchitect_junctions.computeInitRot(jIdx)` | Calcule l'angle de rotation autour de l'axe Z de la jonction à partir de la direction de ses routes, par rapport à l'axe X (util.getRotationBetweenVecs). Dépend du type de jonction. | 97 |
| `editor_roadArchitect_junctions.copyJunction(jct)` | Copie en profondeur une jonction (nouveaux pointeurs ImGui, liste des routes dupliquée avec deepcopy). | 9672 |
| `editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen)` | Crée automatiquement des routes overlay entre les routes qui arrivent à une même jonction (par paire, selon les cas start/end), à partir des données de rendu des routes. Aucun commentaire dans le code ; description déduite du code. | 10146 |
| `editor_roadArchitect_junctions.deserialiseJct(jSer)` | Opération inverse de serialiseJct : reconstruit un enregistrement de jonction avec ses pointeurs ImGui à partir d'une table lue depuis le JSON ; certaines valeurs absentes reçoivent un défaut (par exemple arrowMat). | 9788 |
| `editor_roadArchitect_junctions.finaliseJunction(jIdx)` | Finalise la jonction : renomme ses routes (nom de la jonction + ' R' + n, ou 'Overlay n' pour les overlays), les marque comme routes normales (isJctRoad = false), puis retire la jonction de la liste. Les routes restent dans l'éditeur. | 9651 |
| `editor_roadArchitect_junctions.getJunctionCentroid(jIdx)` | Calcule le centre de la jonction d'indice jIdx. Le calcul dépend du type : milieu entre un nœud de deux routes (crossing, crossroads, t, y, roundabout, merges, slip), entre début et fin de la 3e route (transitions), dernier nœud de la 1re route (séparateurs), ou milieu entre extrémités de deux routes (shoulder_fade, selon isY1Outwards). Renvoie nil pour un type non géré. | 65 |
| `editor_roadArchitect_junctions.goToJunction(jIdx)` | Place la caméra libre au-dessus de la jonction, regardant vers le bas, à une hauteur qui fait entrer toute la jonction dans le champ de vision (calcul avec le FOV de core_camera). Ne fait rien si la boîte englobante est inférieure à 0,1 m. | 9588 |
| `editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform)` | Importe un réseau routier issu de l'outil L-System : crée une route Road Architect par route unique (profil 1 voie par sens, largeur de l'import), puis pour chaque intersection coupe les routes à la sphère du rayon donné et crée les overlays de jonction. Si doTerraform est vrai, terraforme ensuite le terrain sous tout le réseau. | 10329 |
| `editor_roadArchitect_junctions.loadJunction()` | Ouvre la boîte de dialogue d'ouverture (editor_fileDialog), lit le JSON, désérialise la jonction, l'ajoute à la liste puis régénère ses routes avec la fonction addXxx(false) correspondant à son type. | 9861 |
| `editor_roadArchitect_junctions.removeJunction(jIdx)` | Supprime les routes de la jonction (roadMgr.removeRoad) puis l'entrée de la liste junctions. | 9528 |
| `editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta)` | Fait tourner la jonction autour de l'axe Z passant par cen, de l'angle theta ; la hauteur z des nœuds est conservée. | 9557 |
| `editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q)` | Fait tourner tous les nœuds de la jonction autour de cen selon le quaternion q (util.rotateVecByQuaternion). | 9575 |
| `editor_roadArchitect_junctions.saveJunction(jIdx)` | Ouvre la boîte de dialogue d'enregistrement (editor_fileDialog) puis écrit un JSON contenant la jonction sérialisée (nom = nom du fichier), sa position (centroïde) et sa rotation initiale. | 9846 |
| `editor_roadArchitect_junctions.serialiseJct(jct)` | Convertit une jonction en table simple, sans pointeurs ImGui (valeurs lues avec [0], nom avec ffi.string), prête à être écrite en JSON. Note : la liste roads est partagée, pas copiée. | 9730 |
| `editor_roadArchitect_junctions.setAllMeshProperty(jIdx)` | Destinée à faire utiliser (ou non) des meshes à toutes les routes de la jonction, mais le corps ne modifie rien (voir notes). | 9629 |
| `editor_roadArchitect_junctions.translateJunction(jIdx, offset)` | Translate tous les nœuds de toutes les routes de la jonction du vecteur donné et marque les routes comme modifiées (roadMgr.setDirty). | 9544 |
| `editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx)` | Vide roadMgr.multi puis régénère les routes de la jonction selon son type après modification d'un paramètre, et réapplique la condition de la chaussée. | 8244 |
| `editor_roadArchitect_junctions.updateJunctionCondition(jct)` | Propage l'état d'usure de la jonction (condition, graine, nombre de rustines et de nids-de-poule) à toutes ses routes non overlay, puis appelle profileMgr.updateCondition. Les rustines et nids-de-poule des routes valent 15 % (arrondi au supérieur) des valeurs de la jonction ; la graine est décalée d'un rang par route. | 152 |
| `editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove()` | Retire de la liste les jonctions dont au moins une route n'existe plus dans roadMgr. À appeler après la suppression d'une route. | 9637 |

### Détail des paramètres

#### `editor_roadArchitect_junctions.addCrossroads(isNew)`

Ajoute un carrefour à 4 branches, type 'crossroads'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addHighwayMergeJunction(isNew)`

Ajoute une fusion d'autoroute (par exemple 2 voies vers 1, 3 vers 2...), type 'highway_merge'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew)`

Ajoute un séparateur d'autoroute : scinde une autoroute à double sens en deux sections à sens unique pour les relier séparément, type 'highway_separator'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addHighwaySlipJunction(isNew)`

Ajoute une bretelle d'autoroute (slip), type 'highway_slip'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew)`

Ajoute une transition autoroute / urbain (réduit le terre-plein central jusqu'à une simple ligne centrale), type 'highway_urban_transition'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addPedXJunction(isNew)`

Ajoute une jonction de passage piéton à 2 sens (passage + feux de signalisation seulement), type 'crossing'.

- `isNew` (*boolean*) : true : crée un nouvel enregistrement par défaut ; false : réutilise la dernière jonction de la liste.

#### `editor_roadArchitect_junctions.addRoundaboutJunction(isNew)`

Ajoute un rond-point à 4 branches, type 'roundabout'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew)`

Ajoute une transition urbain (avec trottoirs) / rural (sans trottoirs), type 'rural_urban_transition'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addShoulderFadeJunction(isNew)`

Ajoute un fondu de bande d'arrêt d'urgence : la bande d'arrêt d'une autoroute à sens unique s'efface pour devenir une route rurale à sens unique, type 'shoulder_fade'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addTJunction(isNew)`

Ajoute une jonction en T à 3 branches, type 't-junction'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addUrbanMergeJunction(isNew)`

Ajoute une fusion urbaine (par exemple 2 voies vers 1, 3 vers 2...), type 'urban_merge'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew)`

Ajoute un séparateur urbain, type 'urban_separator'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.addYJunction(isNew)`

Ajoute une jonction en Y à 3 branches inclinées, type 'y-junction'.

- `isNew` (*boolean*) : true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.

#### `editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad)`

Pour chaque route listée, supprime les nœuds situés à l'intérieur de la sphère (cercle en 2D) et projette le premier ou dernier nœud sur le cercle, selon que la route touche la jonction par son début ('start') ou sa fin.

- `jNodes` (*table<integer, {rName: string, lie: string}>*) : Extrémités de routes concernées : rName = nom de la route, lie = 'start' ou 'end'.
- `jCen` (*vec3*) : Centre de la sphère.
- `jRad` (*number*) : Rayon, en mètres.

#### `editor_roadArchitect_junctions.computeInitRot(jIdx)`

Calcule l'angle de rotation autour de l'axe Z de la jonction à partir de la direction de ses routes, par rapport à l'axe X (util.getRotationBetweenVecs). Dépend du type de jonction.

- `jIdx` (*integer*) : Indice dans junctions.
- **renvoie** : any Rotation renvoyée par util.getRotationBetweenVecs (nil pour un type non géré).

#### `editor_roadArchitect_junctions.copyJunction(jct)`

Copie en profondeur une jonction (nouveaux pointeurs ImGui, liste des routes dupliquée avec deepcopy).

- `jct` (*table*) : Enregistrement de jonction à copier.
- **renvoie** : table Nouvel enregistrement indépendant.

#### `editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen)`

Crée automatiquement des routes overlay entre les routes qui arrivent à une même jonction (par paire, selon les cas start/end), à partir des données de rendu des routes. Aucun commentaire dans le code ; description déduite du code.

- `jNodes` (*table<integer, {rName: string, lie: string}>*) : Extrémités de routes de la jonction (rName, lie = 'start' ou 'end').
- `laneWidth` (*number*) : Largeur de voie, en mètres (déduit du code).
- `jctCen` (*vec3*) : Centre de la jonction (sa hauteur z est utilisée).

#### `editor_roadArchitect_junctions.deserialiseJct(jSer)`

Opération inverse de serialiseJct : reconstruit un enregistrement de jonction avec ses pointeurs ImGui à partir d'une table lue depuis le JSON ; certaines valeurs absentes reçoivent un défaut (par exemple arrowMat).

- `jSer` (*table*) : Table sérialisée.
- **renvoie** : table Enregistrement de jonction utilisable dans junctions.

#### `editor_roadArchitect_junctions.finaliseJunction(jIdx)`

Finalise la jonction : renomme ses routes (nom de la jonction + ' R' + n, ou 'Overlay n' pour les overlays), les marque comme routes normales (isJctRoad = false), puis retire la jonction de la liste. Les routes restent dans l'éditeur.

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.getJunctionCentroid(jIdx)`

Calcule le centre de la jonction d'indice jIdx. Le calcul dépend du type : milieu entre un nœud de deux routes (crossing, crossroads, t, y, roundabout, merges, slip), entre début et fin de la 3e route (transitions), dernier nœud de la 1re route (séparateurs), ou milieu entre extrémités de deux routes (shoulder_fade, selon isY1Outwards). Renvoie nil pour un type non géré.

- `jIdx` (*integer*) : Indice dans junctions.
- **renvoie** : vec3|nil Position du centre de la jonction.

#### `editor_roadArchitect_junctions.goToJunction(jIdx)`

Place la caméra libre au-dessus de la jonction, regardant vers le bas, à une hauteur qui fait entrer toute la jonction dans le champ de vision (calcul avec le FOV de core_camera). Ne fait rien si la boîte englobante est inférieure à 0,1 m.

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform)`

Importe un réseau routier issu de l'outil L-System : crée une route Road Architect par route unique (profil 1 voie par sens, largeur de l'import), puis pour chaque intersection coupe les routes à la sphère du rayon donné et crée les overlays de jonction. Si doTerraform est vrai, terraforme ensuite le terrain sous tout le réseau.

- `roadNetwork` (*table*) : Routes uniques indexées ; chaque élément a id, type, width, splineNodes (avec pos) et nodes (avec id).
- `intersections` (*table*) : Intersections indexées par id de nœud ; chaque élément a connectedRoads, radius et pos.
- `DOI` (*number*) : Paramètre transmis à terra.terraformMultiRoads (domaine d'influence, déduit du code).
- `margin` (*number*) : Marge transmise à terra.terraformMultiRoads.
- `doTerraform` (*boolean*) : true pour terraformer le terrain après l'import.

#### `editor_roadArchitect_junctions.removeJunction(jIdx)`

Supprime les routes de la jonction (roadMgr.removeRoad) puis l'entrée de la liste junctions.

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta)`

Fait tourner la jonction autour de l'axe Z passant par cen, de l'angle theta ; la hauteur z des nœuds est conservée.

- `jIdx` (*integer*) : Indice dans junctions.
- `cen` (*vec3*) : Centre de rotation.
- `theta` (*number*) : Angle en radians.

#### `editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q)`

Fait tourner tous les nœuds de la jonction autour de cen selon le quaternion q (util.rotateVecByQuaternion).

- `jIdx` (*integer*) : Indice dans junctions.
- `cen` (*vec3*) : Centre de rotation.
- `q` (*quat*) : Rotation à appliquer.

#### `editor_roadArchitect_junctions.saveJunction(jIdx)`

Ouvre la boîte de dialogue d'enregistrement (editor_fileDialog) puis écrit un JSON contenant la jonction sérialisée (nom = nom du fichier), sa position (centroïde) et sa rotation initiale.

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.serialiseJct(jct)`

Convertit une jonction en table simple, sans pointeurs ImGui (valeurs lues avec [0], nom avec ffi.string), prête à être écrite en JSON. Note : la liste roads est partagée, pas copiée.

- `jct` (*table*) : Enregistrement de jonction.
- **renvoie** : table Table sérialisable.

#### `editor_roadArchitect_junctions.setAllMeshProperty(jIdx)`

Destinée à faire utiliser (ou non) des meshes à toutes les routes de la jonction, mais le corps ne modifie rien (voir notes).

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.translateJunction(jIdx, offset)`

Translate tous les nœuds de toutes les routes de la jonction du vecteur donné et marque les routes comme modifiées (roadMgr.setDirty).

- `jIdx` (*integer*) : Indice dans junctions.
- `offset` (*vec3*) : Vecteur de translation, en mètres.

#### `editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx)`

Vide roadMgr.multi puis régénère les routes de la jonction selon son type après modification d'un paramètre, et réapplique la condition de la chaussée.

- `jIdx` (*integer*) : Indice dans junctions.

#### `editor_roadArchitect_junctions.updateJunctionCondition(jct)`

Propage l'état d'usure de la jonction (condition, graine, nombre de rustines et de nids-de-poule) à toutes ses routes non overlay, puis appelle profileMgr.updateCondition. Les rustines et nids-de-poule des routes valent 15 % (arrondi au supérieur) des valeurs de la jonction ; la graine est décalée d'un rang par route.

- `jct` (*table*) : Enregistrement de jonction.

## Champs

| Champ | Type | Description |
|---|---|---|
| `junctions` | table<integer, table> | Liste des jonctions de la session d'édition (même table que celle utilisée en interne : les modifications sont visibles des deux côtés). Chaque élément contient au minimum name, type, roads (noms de routes) et les paramètres de condition (condition, conditionSeed, numPatches, numPotholes). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/junctions.lua`.*

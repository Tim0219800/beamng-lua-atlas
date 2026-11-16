# `editor_roadSpline_groupMgr`

*Fichier : `lua/ge/extensions/editor/roadSpline/groupMgr.lua` · VM : Game Engine (GE) · 887 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline_groupMgr` : `extensions.load("editor_roadSpline_groupMgr")`, puis la globale `editor_roadSpline_groupMgr`

Gestionnaire des « groupes » de l'outil Road Spline : un groupe = une route (nœuds, largeurs, normales, couches, options de couches automatiques, peinture de terrain, verrouillage) avec son dossier SimGroup dans MissionGroup. Gère création/suppression, reconstruction des groupes sales (updateDirtyGroups : échantillonnage Catmull-Rom ou géométrie « engineered », points de côtes, puis couches), copie profonde, découpe/jointure, sérialisation (buffer ou table JSON de session), annulation/rétablissement et liaison avec la Master Spline. Un moddeur l'utilise pour créer ou modifier des routes par script.

## Exemple

```lua
local gm = require('editor/roadSpline/groupMgr')
gm.addNewGroup('Ma route')
local g = gm.getGroups()[#gm.getGroups()]
g.nodes = {vec3(0,0,0), vec3(50,0,0), vec3(100,20,0)}
g.widths = {8, 8, 8}
g.nmls = {vec3(0,0,1), vec3(0,0,1), vec3(0,0,1)}
g.isDirty = true -- reconstruit au prochain updateDirtyGroups()
```

## Remarques

- Champs d'un groupe utilisés dans le code : name, id (UUID), isLoop, sceneTreeFolderId, isEnabled (false = verrouillé), isDirty, isLink/linkId, nodes (vec3[]), widths, nmls, layers, corners, geometryMode, roadLength, ribPoints, divPoints, divWidths, tangents, binormals, normals, discMap, chunkStartIndices/chunkEndIndices/numChunks, isPainting + paint*.
- Le nom exporté convertPathsToRoadGroups correspond à la fonction locale convertPathsToRoadSplines.
- convertPathsToRoadGroups crée le groupe (addNewGroup) AVANT de tester la taille du tracé : un chemin trop petit laisse un groupe vide, et le message de log « paths too small » compte #paths - #groups, donc toujours 0.
- Un groupe verrouillé (isEnabled = false) dont les DecalRoads existent n'est pas reconstruit (keepLocked) : l'outil ne les déplace plus et ne repeint pas le terrain.
- Les ids de groupes sont des UUID (chaînes) ; groupMap associe id -> indice et doit être recalculé après toute insertion/suppression (util.computeIdToIdxMap).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline_groupMgr.addGroupToGroupArray(group)` | Ajoute un groupe déjà construit à la liste, avec un nom unique ; crée son dossier SimGroup (cansave = false) dans MissionGroup s'il n'existe pas encore. | 55 |
| `editor_roadSpline_groupMgr.addNewGroup(name)` | Crée un nouveau groupe vide (nom unique, UUID, dossier SimGroup transitoire sous MissionGroup, couches automatiques initiales) et l'ajoute à la liste. | 281 |
| `editor_roadSpline_groupMgr.adopt(group, ids)` | Reprend les DecalRoads listés par release() (seulement ceux encore présents dans la scène) et fixe l'état de verrouillage appliqué. *(interne)* | 129 |
| `editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths)` | Convertit des tracés issus d'un bitmap en Road Splines : points de grille convertis en coordonnées monde via le terrain, normales prises sur le terrain ; un tracé dont la plus petite dimension est inférieure ou égale à 10 m n'est pas importé. | 567 |
| `editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup)` | Copie le « profil » d'un groupe : ses couches non cachées (serializeLayer, sans ids de scène) et ses options/réglages de couches automatiques (largeurs et décalages de lignes et fondus). | 381 |
| `editor_roadSpline_groupMgr.deepCopyAllGroups()` | Copie profonde de tous les groupes (pour l'historique d'annulation). | 483 |
| `editor_roadSpline_groupMgr.deepCopyGroup(group)` | Copie profonde d'un groupe via string.buffer ; vide la géométrie dérivée (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) qui sera recalculée. | 470 |
| `editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject)` | Désérialise un groupe, soit depuis un blob (string), soit depuis une table JSON : garantit toutes les tables, ré-hydrate les couches et les vec3, remplit les valeurs par défaut des décors de bord et crée le dossier de scène si demandé (sauf si un dossier gardé existe encore). Marque le groupe sale. | 632 |
| `editor_roadSpline_groupMgr.findGroup(id)` | Cherche un groupe par id. | 143 |
| `editor_roadSpline_groupMgr.getCurrentRoadSplineList()` | Liste les Road Splines actifs (isEnabled), pour les menus de liaison d'autres outils. | 785 |
| `editor_roadSpline_groupMgr.getEditModeKey()` | Renvoie la clé du mode d'édition de l'outil (« roadSplineEditor »). | 52 |
| `editor_roadSpline_groupMgr.getGroups()` | Renvoie le tableau vivant des groupes (routes) de l'outil. | 43 |
| `editor_roadSpline_groupMgr.getIdToIdxMap()` | Renvoie la table id de groupe -> indice dans getGroups(). | 46 |
| `editor_roadSpline_groupMgr.getToolPrefixStr()` | Renvoie le préfixe de nom de l'outil (« Road Spline »). | 49 |
| `editor_roadSpline_groupMgr.isLinked(id)` | Indique si la route est liée à une Master Spline. | 798 |
| `editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2)` | Joint deux routes non bouclées en une seule : group1 est modifié, group2 est supprimé. Ne fait rien si un groupe est introuvable ou si les indices de nœuds sont invalides. | 538 |
| `editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile)` | Applique un profil au groupe cible : supprime ses couches, recrée celles du profil, recopie les options (valeurs par défaut si absentes), puis régénère les couches automatiques et marque le groupe sale. | 426 |
| `editor_roadSpline_groupMgr.recomputeIdMap()` | Recalcule la table id -> indice (appelé par l'assistant de session après un chargement qui ajoute des routes). | 782 |
| `editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group)` | Supprime les couches cachées (automatiques) puis recrée celles dont l'option du groupe est active (marques de pneus, réparations, fissures, rustines, asphalte abîmé, ligne centrale, lignes de rive/de voie, fondus de bord 1 à 3), et marque le groupe sale. | 177 |
| `editor_roadSpline_groupMgr.release(group)` | Avant un rechargement Lua : renvoie, par id de couche, les ids de DecalRoad du groupe verrouillé, pour que adopt() les reprenne ensuite (routes, dossier et peinture restent dans la scène). *(interne)* | 120 |
| `editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled)` | Supprime les groupes. Avec isIncludeDisabled, supprime tout et vide la liste ; sinon seulement les groupes activés et non liés (les verrouillés et liés restent). | 157 |
| `editor_roadSpline_groupMgr.removeGroup(idx)` | Supprime le groupe à l'indice donné : annule la peinture de terrain, supprime ses couches (DecalRoads) et son dossier de scène, puis recalcule la table id -> indice. | 75 |
| `editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId)` | Supprime une spline liée par son id (appelé quand la couche correspondante de la Master Spline est retirée). | 149 |
| `editor_roadSpline_groupMgr.serializeGroup(group)` | Sérialise un groupe en blob string.buffer : annule la peinture de terrain si activé et vide les tables dérivées avant encodage. | 600 |
| `editor_roadSpline_groupMgr.serializeGroupToTable(group)` | Sérialise un groupe en table portable pour un fichier de session JSON : sans géométrie dérivée ni poignées de scène, couches réduites aux champs auteur (serializeLayer). Le groupe vivant n'est pas modifié. | 615 |
| `editor_roadSpline_groupMgr.setFixedWidth(group, width)` | Met la même largeur à chaque nœud du groupe et le marque sale. | 273 |
| `editor_roadSpline_groupMgr.setLink(id, groupId, isLink)` | Active ou désactive la liaison d'une route avec une autre spline (champ linkId) et la marque sale. | 804 |
| `editor_roadSpline_groupMgr.singleGroupEditRedo(data)` | Rétablissement d'une édition d'un seul groupe : restaure data.new. *(interne)* | 760 |
| `editor_roadSpline_groupMgr.singleGroupEditUndo(data)` | Annulation d'une édition d'un seul groupe : restaure data.old (couches recopiées, tous les champs de la route, peinture, nom du dossier si renommé). *(interne)* | 759 |
| `editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx)` | Coupe un groupe au nœud donné. Une boucle devient une route ouverte réordonnée ; une route ouverte est remplacée par deux nouveaux groupes « nom (1) » et « nom (2) » (nouveaux UUID). Les réglages par virage (corners) suivent. | 492 |
| `editor_roadSpline_groupMgr.transGroupEditRedo(groupsData)` | Rétablissement d'une édition multi-groupes : réinsère les copies de groupsData.new. *(interne)* | 779 |
| `editor_roadSpline_groupMgr.transGroupEditUndo(groupsData)` | Annulation d'une édition touchant plusieurs groupes : supprime tous les groupes et réinsère les copies de groupsData.old. *(interne)* | 778 |
| `editor_roadSpline_groupMgr.unlinkAll()` | Détache toutes les routes liées (isLink = false, linkId = nil) et marque tous les groupes sales. | 828 |
| `editor_roadSpline_groupMgr.updateDirtyGroups(dragging)` | Reconstruit les groupes marqués sales (isDirty) : ignore les groupes de moins de 2 nœuds (couches supprimées), plaque les nœuds au terrain (raycast vertical), échantillonne la spline (Catmull-Rom, ou clothoïde en mode engineered), calcule les points de côtes et la longueur, repeint le terrain si actif, régénère les couches automatiques et met à jour les DecalRoads. Met aussi à jour les couches seules marquées sales. Pendant un glissement de poignée, seul l'échantillonnage est fait et le groupe reste sale. | 204 |
| `editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Remplace la géométrie (nœuds, largeurs, normales, boucle) d'une route liée et la marque sale. | 818 |

### Détail des paramètres

#### `editor_roadSpline_groupMgr.addGroupToGroupArray(group)`

Ajoute un groupe déjà construit à la liste, avec un nom unique ; crée son dossier SimGroup (cansave = false) dans MissionGroup s'il n'existe pas encore.

- `group` (*table*) : Groupe à ajouter.

#### `editor_roadSpline_groupMgr.addNewGroup(name)`

Crée un nouveau groupe vide (nom unique, UUID, dossier SimGroup transitoire sous MissionGroup, couches automatiques initiales) et l'ajoute à la liste.

- `name` (*string|nil*) : Nom de base ; par défaut « Road Spline N ».

#### `editor_roadSpline_groupMgr.adopt(group, ids)`

Reprend les DecalRoads listés par release() (seulement ceux encore présents dans la scène) et fixe l'état de verrouillage appliqué.

- `group` (*table*) : Groupe recréé.
- `ids` (*table*) : Valeur renvoyée par release().

#### `editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths)`

Convertit des tracés issus d'un bitmap en Road Splines : points de grille convertis en coordonnées monde via le terrain, normales prises sur le terrain ; un tracé dont la plus petite dimension est inférieure ou égale à 10 m n'est pas importé.

- `paths` (*table[]*) : Liste de {points = {{x=,y=},...}, widths = {...}} en coordonnées de grille.

#### `editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup)`

Copie le « profil » d'un groupe : ses couches non cachées (serializeLayer, sans ids de scène) et ses options/réglages de couches automatiques (largeurs et décalages de lignes et fondus).

- `sourceGroup` (*table*) : Groupe source.
- **renvoie** : table Profil prêt pour pasteGroupProfile ou JSON.

#### `editor_roadSpline_groupMgr.deepCopyAllGroups()`

Copie profonde de tous les groupes (pour l'historique d'annulation).

- **renvoie** : table[] Liste de copies.

#### `editor_roadSpline_groupMgr.deepCopyGroup(group)`

Copie profonde d'un groupe via string.buffer ; vide la géométrie dérivée (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) qui sera recalculée.

- `group` (*table*) : Groupe.
- **renvoie** : table Copie indépendante.

#### `editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject)`

Désérialise un groupe, soit depuis un blob (string), soit depuis une table JSON : garantit toutes les tables, ré-hydrate les couches et les vec3, remplit les valeurs par défaut des décors de bord et crée le dossier de scène si demandé (sauf si un dossier gardé existe encore). Marque le groupe sale.

- `data` (*string|table*) : Blob string.buffer ou table de session.
- `isCreateObject` (*boolean*) : true pour créer le dossier SimGroup dans MissionGroup.
- **renvoie** : table Le groupe prêt à être ajouté.

#### `editor_roadSpline_groupMgr.findGroup(id)`

Cherche un groupe par id.

- `id` (*string*) : UUID du groupe.
- **renvoie** : table|nil Le groupe ou nil.

#### `editor_roadSpline_groupMgr.getCurrentRoadSplineList()`

Liste les Road Splines actifs (isEnabled), pour les menus de liaison d'autres outils.

- **renvoie** : table[] Éléments { name, id, type = « Road Spline » }.

#### `editor_roadSpline_groupMgr.getEditModeKey()`

Renvoie la clé du mode d'édition de l'outil (« roadSplineEditor »).

- **renvoie** : string « roadSplineEditor »

#### `editor_roadSpline_groupMgr.getGroups()`

Renvoie le tableau vivant des groupes (routes) de l'outil.

- **renvoie** : table[] Liste des groupes, modifiable en place.

#### `editor_roadSpline_groupMgr.getIdToIdxMap()`

Renvoie la table id de groupe -> indice dans getGroups().

- **renvoie** : table<string, integer> Table vivante.

#### `editor_roadSpline_groupMgr.getToolPrefixStr()`

Renvoie le préfixe de nom de l'outil (« Road Spline »).

- **renvoie** : string « Road Spline »

#### `editor_roadSpline_groupMgr.isLinked(id)`

Indique si la route est liée à une Master Spline.

- `id` (*string*) : UUID du groupe.
- **renvoie** : boolean true si liée (false si inconnue).

#### `editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2)`

Joint deux routes non bouclées en une seule : group1 est modifié, group2 est supprimé. Ne fait rien si un groupe est introuvable ou si les indices de nœuds sont invalides.

- `groupIdx1` (*integer*) : Indice du premier groupe.
- `nodeIdx1` (*integer*) : Nœud d'extrémité du premier groupe.
- `groupIdx2` (*integer*) : Indice du second groupe.
- `nodeIdx2` (*integer*) : Nœud d'extrémité du second groupe.

#### `editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile)`

Applique un profil au groupe cible : supprime ses couches, recrée celles du profil, recopie les options (valeurs par défaut si absentes), puis régénère les couches automatiques et marque le groupe sale.

- `targetGroup` (*table*) : Groupe cible.
- `profile` (*table*) : Profil de copyGroupProfile.

#### `editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group)`

Supprime les couches cachées (automatiques) puis recrée celles dont l'option du groupe est active (marques de pneus, réparations, fissures, rustines, asphalte abîmé, ligne centrale, lignes de rive/de voie, fondus de bord 1 à 3), et marque le groupe sale.

- `group` (*table*) : Groupe.

#### `editor_roadSpline_groupMgr.release(group)`

Avant un rechargement Lua : renvoie, par id de couche, les ids de DecalRoad du groupe verrouillé, pour que adopt() les reprenne ensuite (routes, dossier et peinture restent dans la scène).

- `group` (*table*) : Groupe.
- **renvoie** : table { [layerId] = {id = decalRoadId, ids = {...}} }

#### `editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled)`

Supprime les groupes. Avec isIncludeDisabled, supprime tout et vide la liste ; sinon seulement les groupes activés et non liés (les verrouillés et liés restent).

- `isIncludeDisabled` (*boolean|nil*) : true pour tout supprimer, y compris verrouillés et liés.

#### `editor_roadSpline_groupMgr.removeGroup(idx)`

Supprime le groupe à l'indice donné : annule la peinture de terrain, supprime ses couches (DecalRoads) et son dossier de scène, puis recalcule la table id -> indice.

- `idx` (*integer*) : Indice dans la liste des groupes.

#### `editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId)`

Supprime une spline liée par son id (appelé quand la couche correspondante de la Master Spline est retirée).

- `splineId` (*string*) : UUID du groupe.

#### `editor_roadSpline_groupMgr.serializeGroup(group)`

Sérialise un groupe en blob string.buffer : annule la peinture de terrain si activé et vide les tables dérivées avant encodage.

- `group` (*table*) : Groupe.
- **renvoie** : string Données encodées.

#### `editor_roadSpline_groupMgr.serializeGroupToTable(group)`

Sérialise un groupe en table portable pour un fichier de session JSON : sans géométrie dérivée ni poignées de scène, couches réduites aux champs auteur (serializeLayer). Le groupe vivant n'est pas modifié.

- `group` (*table*) : Groupe.
- **renvoie** : table Table JSON-compatible.

#### `editor_roadSpline_groupMgr.setFixedWidth(group, width)`

Met la même largeur à chaque nœud du groupe et le marque sale.

- `group` (*table*) : Groupe.
- `width` (*number*) : Largeur en mètres.

#### `editor_roadSpline_groupMgr.setLink(id, groupId, isLink)`

Active ou désactive la liaison d'une route avec une autre spline (champ linkId) et la marque sale.

- `id` (*string*) : UUID de la route.
- `groupId` (*string*) : UUID de la spline maître (ignoré si isLink est false).
- `isLink` (*boolean*) : true pour lier.

#### `editor_roadSpline_groupMgr.singleGroupEditRedo(data)`

Rétablissement d'une édition d'un seul groupe : restaure data.new.

- `data` (*table*) : { old = groupe, new = groupe }

#### `editor_roadSpline_groupMgr.singleGroupEditUndo(data)`

Annulation d'une édition d'un seul groupe : restaure data.old (couches recopiées, tous les champs de la route, peinture, nom du dossier si renommé).

- `data` (*table*) : { old = groupe, new = groupe }

#### `editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx)`

Coupe un groupe au nœud donné. Une boucle devient une route ouverte réordonnée ; une route ouverte est remplacée par deux nouveaux groupes « nom (1) » et « nom (2) » (nouveaux UUID). Les réglages par virage (corners) suivent.

- `group` (*table*) : Groupe à couper.
- `groupIdx` (*integer*) : Indice du groupe.
- `selectedNodeIdx` (*integer*) : Indice du nœud de coupe.

#### `editor_roadSpline_groupMgr.transGroupEditRedo(groupsData)`

Rétablissement d'une édition multi-groupes : réinsère les copies de groupsData.new.

- `groupsData` (*table*) : { old = groupes[], new = groupes[] }

#### `editor_roadSpline_groupMgr.transGroupEditUndo(groupsData)`

Annulation d'une édition touchant plusieurs groupes : supprime tous les groupes et réinsère les copies de groupsData.old.

- `groupsData` (*table*) : { old = groupes[], new = groupes[] }

#### `editor_roadSpline_groupMgr.updateDirtyGroups(dragging)`

Reconstruit les groupes marqués sales (isDirty) : ignore les groupes de moins de 2 nœuds (couches supprimées), plaque les nœuds au terrain (raycast vertical), échantillonne la spline (Catmull-Rom, ou clothoïde en mode engineered), calcule les points de côtes et la longueur, repeint le terrain si actif, régénère les couches automatiques et met à jour les DecalRoads. Met aussi à jour les couches seules marquées sales. Pendant un glissement de poignée, seul l'échantillonnage est fait et le groupe reste sale.

- `dragging` (*boolean|nil*) : true pendant un glissement en direct (reconstruction lourde différée).

#### `editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Remplace la géométrie (nœuds, largeurs, normales, boucle) d'une route liée et la marque sale.

- `id` (*string*) : UUID de la route liée.
- `points` (*vec3[]*) : Nouveaux nœuds.
- `widths` (*number[]*) : Largeurs en m.
- `nmls` (*vec3[]*) : Normales.
- `isLoop` (*boolean*) : État de boucle du maître.
- `isConformToTerrain` (*boolean*) : Reçu mais non utilisé dans le code.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline/groupMgr.lua`.*

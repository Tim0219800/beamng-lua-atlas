# `editor_meshSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/meshSpline/splineMgr.lua` · VM : Game Engine (GE) · 1410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_splineMgr` : `extensions.load("editor_meshSpline_splineMgr")`, puis la globale `editor_meshSpline_splineMgr`

Gestionnaire d'état de l'outil Mesh Spline : détient la liste des mesh splines (meshSplines) et la table id vers indice (splineMap). Il crée, copie, découpe, joint, supprime, sérialise et reconstruit les splines, applique les presets, gère les liens avec le Master Spline et fournit les callbacks undo/redo de l'éditeur. Chaque spline possède un dossier SimGroup dans MissionGroup (non sauvegardé tant qu'elle n'est pas « bakée ») et reçoit un UUID via Engine.generateUUID().

## Remarques

- Une spline est une table : nodes, widths, nmls (données source) et divPoints, divWidths, tangents, binormals, normals, discMap (géométrie dérivée, recalculée). isDirty = true demande une reconstruction au prochain updateDirtyMeshSplines.
- isEnabled = false signifie spline verrouillée (bakée) : ses meshes restent dans la scène.
- isLink / linkId marquent une spline pilotée par un Master Spline ; removeAllMeshSplines(false) ne supprime que les splines actives et non liées.
- deepCopyMeshSpline passe par buffer.encode/decode et vide les tables dérivées de la copie.
- Le preset par défaut d'une nouvelle spline est 'concrete_barrier'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_splineMgr.addNewMeshSpline()` | Ajoute une nouvelle mesh spline vide : nom unique, UUID, dossier de scène, flags par défaut (isEnabled, normalMode = 2, isAliasRoundRobin...), puis applique le preset 'concrete_barrier' et met à jour la table id vers indice. | 610 |
| `editor_meshSpline_splineMgr.conformNodesToTerrain(spline)` | Action ponctuelle : pose les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline dirty. La construction reste libre en 3D ; à relancer après un terraformage pour re-coller. | 1246 |
| `editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths)` | Convertit des chemins tracés depuis une bitmap en mesh splines : une spline par chemin, points convertis en coordonnées monde via le terrain editor, normales prises sur le terrain. Un chemin trop petit n'est pas importé (la spline vide créée reste dans la liste). | 1256 |
| `editor_meshSpline_splineMgr.copyMeshSplineProfile(spline)` | Copie le profil d'une spline (tous ses paramètres sans les nœuds, largeurs, normales ni géométrie dérivée) pour le coller sur une autre. | 1083 |
| `editor_meshSpline_splineMgr.deepCopyMeshSpline(spline)` | Copie profonde d'une spline (buffer.encode/decode), avec les tables de géométrie dérivée vidées. | 707 |
| `editor_meshSpline_splineMgr.deepCopyMeshSplineState()` | Copie profonde de la liste complète des splines (pour l'historique undo/redo). | 719 |
| `editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject)` | Désérialise une spline. data est soit le blob encodé de l'éditeur (string), soit une table issue d'un fichier de session JSON ; dans ce dernier cas les tables dérivées sont créées vides et les positions {x,y,z} redeviennent des vec3 avant la première reconstruction. | 1180 |
| `editor_meshSpline_splineMgr.findMeshSpline(id)` | Trouve une spline vivante par son id. | 672 |
| `editor_meshSpline_splineMgr.getCurrentMeshSplineList()` | Renvoie la liste simplifiée des splines actives (isEnabled) pour l'interface : nom, id et type. | 1289 |
| `editor_meshSpline_splineMgr.getDefaultSliderParams()` | Renvoie les paramètres par défaut des curseurs de l'interface (bornes, valeurs). | 607 |
| `editor_meshSpline_splineMgr.getEditModeKey()` | Renvoie la clé du mode d'édition de l'outil. | 476 |
| `editor_meshSpline_splineMgr.getMeshSplines()` | Renvoie la table vivante des mesh splines (non copiée). | 479 |
| `editor_meshSpline_splineMgr.getSplineMap()` | Renvoie la table vivante id vers indice des splines. | 482 |
| `editor_meshSpline_splineMgr.getToolPrefixStr()` | Renvoie le préfixe de nom de l'outil (« Mesh Spline »). | 473 |
| `editor_meshSpline_splineMgr.isLinked(id)` | Dit si la spline d'id donné est liée à un Master Spline. | 1303 |
| `editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joint deux mesh splines ouvertes en une seule : la géométrie concaténée (geom.joinSplineGeometry) est écrite dans la première, la seconde est supprimée. Ne fait rien si un indice est invalide ou si les nœuds ne permettent pas la jonction. | 885 |
| `editor_meshSpline_splineMgr.objectSelectRedo(data)` | Callback de rétablissement pour une opération de sélection d'objet : remet data.new à la place de la spline de même id. *(interne)* | 1080 |
| `editor_meshSpline_splineMgr.objectSelectUndo(data)` | Callback d'annulation pour une opération de sélection d'objet : remet data.old à la place de la spline de même id, retire ses meshes et la marque dirty. *(interne)* | 1077 |
| `editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile)` | Colle un profil sur la spline : retire d'abord ses meshes, reprend les paramètres du profil (normalMode, espacement, jitter, décalage vertical, etc.) et marque la spline dirty. | 1098 |
| `editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData)` | Rétablit le choix d'un preset (retire les meshes avant d'appliquer le nouvel état). *(interne)* | 1029 |
| `editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData)` | Annule le choix d'un preset (retire les meshes avant d'appliquer l'ancien état). *(interne)* | 1015 |
| `editor_meshSpline_splineMgr.recomputeIdMap()` | Recalcule la table id vers indice (appelée par l'utilitaire de session après un chargement qui ajoute des splines). | 1063 |
| `editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled)` | Supprime toutes les splines. Avec isIncludeDisabled à true, y compris les verrouillées et liées ; sinon seulement les actives non liées. | 688 |
| `editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId)` | Supprime une spline liée par son id (appelée quand une couche du Master Spline est retirée). Ne fait rien si l'id est inconnu. | 678 |
| `editor_meshSpline_splineMgr.removeMeshSpline(idx)` | Supprime la spline d'indice donné : ses meshes, son dossier de scène, puis l'entrée de la liste ; met à jour la table id vers indice. Plante si l'indice n'existe pas (la spline est lue sans test avant tryRemove). | 656 |
| `editor_meshSpline_splineMgr.serializeMeshSpline(spline)` | Sérialise une spline pour le tampon d'éditeur : vide d'abord les tables dérivées de la spline vivante (elle est donc modifiée), puis renvoie buffer.encode(spline). | 1158 |
| `editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline)` | Sérialise une spline en table simple et portable pour un fichier de session (toolUtilities/session). Copie profonde via le codec pour ne jamais modifier la spline vivante ; la géométrie dérivée est vidée (reconstruite ensuite) et le handle de scène retiré. | 1171 |
| `editor_meshSpline_splineMgr.setLink(id, groupId, isLink)` | Active ou désactive le lien d'une spline (isLink, linkId), retire ses meshes et la marque dirty. Ne fait rien si l'id est inconnu. | 1309 |
| `editor_meshSpline_splineMgr.setMeshSpline(spline, idx)` | Place la spline à l'indice donné, crée son dossier de scène (SimGroup dans MissionGroup, cansave = false) s'il n'existe pas et la marque dirty. | 485 |
| `editor_meshSpline_splineMgr.setMeshSplines(splines)` | Enregistre toutes les splines de la table à leurs indices (appelle setMeshSpline pour chacune). | 505 |
| `editor_meshSpline_splineMgr.setPreset(spline, presetStr)` | Applique un preset (mesh central, capuchons, espacement, décalages, etc., issus de la table des presets) à la spline : supprime d'abord ses meshes de la scène, copie les paramètres du preset, mesure le mesh et marque la spline dirty. Ne fait rien si la spline ou le nom est nil ; un nom inconnu se contente de la vider et de la marquer dirty. | 512 |
| `editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData)` | Callback de rétablissement pour l'édition d'une seule spline. *(interne)* | 1007 |
| `editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData)` | Callback d'annulation pour l'édition d'une seule spline (historique de l'éditeur). *(interne)* | 999 |
| `editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx)` | Coupe la spline sélectionnée en deux au nœud sélectionné. Une spline en boucle est simplement ouverte au point de coupe. Sinon la spline d'origine est supprimée et remplacée par deux nouvelles splines nommées <nom>_split_A et <nom>_split_B qui reprennent ses paramètres. | 728 |
| `editor_meshSpline_splineMgr.transSplineEditRedo(data)` | Rétablit une édition transverse à plusieurs mesh splines. *(interne)* | 1053 |
| `editor_meshSpline_splineMgr.transSplineEditUndo(data)` | Annule une édition transverse à plusieurs mesh splines. *(interne)* | 1043 |
| `editor_meshSpline_splineMgr.unlinkAll()` | Délie toutes les mesh splines (isLink = false, linkId = nil) et les marque dirty. | 1347 |
| `editor_meshSpline_splineMgr.updateDirtyMeshSplines()` | Reconstruit les splines marquées dirty : moins de 2 nœuds, retire meshes et géométrie ; sinon recalcule la géométrie (populationEngine.updateGeometry), repeuple les meshes (populate.populateMeshSpline) et met à jour roadLength. Signale ensuite une édition à la session « meshSpline ». | 1218 |
| `editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Met à jour une spline liée avec la géométrie du Master Spline (nodes, widths, nmls, isLoop, isConformToTerrain). S'il y a moins de 2 points, vide la géométrie dérivée et retire les meshes. Marque la spline dirty. | 1324 |

### Détail des paramètres

#### `editor_meshSpline_splineMgr.conformNodesToTerrain(spline)`

Action ponctuelle : pose les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline dirty. La construction reste libre en 3D ; à relancer après un terraformage pour re-coller.

- `spline` (*table*) : Spline à modifier.

#### `editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths)`

Convertit des chemins tracés depuis une bitmap en mesh splines : une spline par chemin, points convertis en coordonnées monde via le terrain editor, normales prises sur le terrain. Un chemin trop petit n'est pas importé (la spline vide créée reste dans la liste).

- `paths` (*table[]*) : Chemins avec points ({x,y} en grille) et widths.

#### `editor_meshSpline_splineMgr.copyMeshSplineProfile(spline)`

Copie le profil d'une spline (tous ses paramètres sans les nœuds, largeurs, normales ni géométrie dérivée) pour le coller sur une autre.

- `spline` (*table*) : Spline source.
- **renvoie** : table Profil copié.

#### `editor_meshSpline_splineMgr.deepCopyMeshSpline(spline)`

Copie profonde d'une spline (buffer.encode/decode), avec les tables de géométrie dérivée vidées.

- `spline` (*table*) : Spline à copier.
- **renvoie** : table Copie indépendante.

#### `editor_meshSpline_splineMgr.deepCopyMeshSplineState()`

Copie profonde de la liste complète des splines (pour l'historique undo/redo).

- **renvoie** : table Liste de copies.

#### `editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject)`

Désérialise une spline. data est soit le blob encodé de l'éditeur (string), soit une table issue d'un fichier de session JSON ; dans ce dernier cas les tables dérivées sont créées vides et les positions {x,y,z} redeviennent des vec3 avant la première reconstruction.

- `data` (*string|table*) : Blob ou table de session.
- `isCreateObject` (*boolean*) : true pour créer le dossier SimGroup de scène de la spline (sauf si une spline verrouillée en garde déjà un après rechargement Lua).
- **renvoie** : table La spline désérialisée.

#### `editor_meshSpline_splineMgr.findMeshSpline(id)`

Trouve une spline vivante par son id.

- `id` (*string*) : UUID de la spline.
- **renvoie** : table|nil La spline, ou nil si absente.

#### `editor_meshSpline_splineMgr.getCurrentMeshSplineList()`

Renvoie la liste simplifiée des splines actives (isEnabled) pour l'interface : nom, id et type.

- **renvoie** : table[] Éléments {name, id, type}.

#### `editor_meshSpline_splineMgr.getDefaultSliderParams()`

Renvoie les paramètres par défaut des curseurs de l'interface (bornes, valeurs).

- **renvoie** : table Paramètres de curseurs.

#### `editor_meshSpline_splineMgr.getEditModeKey()`

Renvoie la clé du mode d'édition de l'outil.

- **renvoie** : string Clé du mode d'édition.

#### `editor_meshSpline_splineMgr.getMeshSplines()`

Renvoie la table vivante des mesh splines (non copiée).

- **renvoie** : table Liste des splines, base 1.

#### `editor_meshSpline_splineMgr.getSplineMap()`

Renvoie la table vivante id vers indice des splines.

- **renvoie** : table<string, integer> Indice par id.

#### `editor_meshSpline_splineMgr.getToolPrefixStr()`

Renvoie le préfixe de nom de l'outil (« Mesh Spline »).

- **renvoie** : string Préfixe de l'outil.

#### `editor_meshSpline_splineMgr.isLinked(id)`

Dit si la spline d'id donné est liée à un Master Spline.

- `id` (*string*) : UUID de la spline.
- **renvoie** : boolean true si liée, false sinon (ou si absente).

#### `editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joint deux mesh splines ouvertes en une seule : la géométrie concaténée (geom.joinSplineGeometry) est écrite dans la première, la seconde est supprimée. Ne fait rien si un indice est invalide ou si les nœuds ne permettent pas la jonction.

- `splineIdx1` (*integer*) : Indice de la première spline.
- `nodeIdx1` (*integer*) : Nœud d'extrémité de la première.
- `splineIdx2` (*integer*) : Indice de la seconde spline.
- `nodeIdx2` (*integer*) : Nœud d'extrémité de la seconde.

#### `editor_meshSpline_splineMgr.objectSelectRedo(data)`

Callback de rétablissement pour une opération de sélection d'objet : remet data.new à la place de la spline de même id.

- `data` (*table*) : Données d'action avec old et new.

#### `editor_meshSpline_splineMgr.objectSelectUndo(data)`

Callback d'annulation pour une opération de sélection d'objet : remet data.old à la place de la spline de même id, retire ses meshes et la marque dirty.

- `data` (*table*) : Données d'action avec old et new.

#### `editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile)`

Colle un profil sur la spline : retire d'abord ses meshes, reprend les paramètres du profil (normalMode, espacement, jitter, décalage vertical, etc.) et marque la spline dirty.

- `spline` (*table*) : Spline cible.
- `profile` (*table*) : Profil renvoyé par copyMeshSplineProfile.

#### `editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData)`

Rétablit le choix d'un preset (retire les meshes avant d'appliquer le nouvel état).

- `meshSplineData` (*table*) : Données d'action.

#### `editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData)`

Annule le choix d'un preset (retire les meshes avant d'appliquer l'ancien état).

- `meshSplineData` (*table*) : Données d'action.

#### `editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled)`

Supprime toutes les splines. Avec isIncludeDisabled à true, y compris les verrouillées et liées ; sinon seulement les actives non liées.

- `isIncludeDisabled` (*boolean*) : true pour tout supprimer.

#### `editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId)`

Supprime une spline liée par son id (appelée quand une couche du Master Spline est retirée). Ne fait rien si l'id est inconnu.

- `splineId` (*string*) : UUID de la spline.

#### `editor_meshSpline_splineMgr.removeMeshSpline(idx)`

Supprime la spline d'indice donné : ses meshes, son dossier de scène, puis l'entrée de la liste ; met à jour la table id vers indice. Plante si l'indice n'existe pas (la spline est lue sans test avant tryRemove).

- `idx` (*integer*) : Indice de la spline (base 1).

#### `editor_meshSpline_splineMgr.serializeMeshSpline(spline)`

Sérialise une spline pour le tampon d'éditeur : vide d'abord les tables dérivées de la spline vivante (elle est donc modifiée), puis renvoie buffer.encode(spline).

- `spline` (*table*) : Spline à sérialiser.
- **renvoie** : string Données encodées (déduit du code).

#### `editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline)`

Sérialise une spline en table simple et portable pour un fichier de session (toolUtilities/session). Copie profonde via le codec pour ne jamais modifier la spline vivante ; la géométrie dérivée est vidée (reconstruite ensuite) et le handle de scène retiré.

- `spline` (*table*) : Spline à sérialiser.
- **renvoie** : table Table JSON-compatible.

#### `editor_meshSpline_splineMgr.setLink(id, groupId, isLink)`

Active ou désactive le lien d'une spline (isLink, linkId), retire ses meshes et la marque dirty. Ne fait rien si l'id est inconnu.

- `id` (*string*) : UUID de la spline.
- `groupId` (*string*) : Identifiant du groupe de lien, utilisé comme linkId si isLink est vrai.
- `isLink` (*boolean*) : true pour lier, false pour délier.

#### `editor_meshSpline_splineMgr.setMeshSpline(spline, idx)`

Place la spline à l'indice donné, crée son dossier de scène (SimGroup dans MissionGroup, cansave = false) s'il n'existe pas et la marque dirty.

- `spline` (*table*) : Spline à enregistrer.
- `idx` (*integer*) : Indice de destination (base 1).

#### `editor_meshSpline_splineMgr.setMeshSplines(splines)`

Enregistre toutes les splines de la table à leurs indices (appelle setMeshSpline pour chacune).

- `splines` (*table*) : Liste de splines.

#### `editor_meshSpline_splineMgr.setPreset(spline, presetStr)`

Applique un preset (mesh central, capuchons, espacement, décalages, etc., issus de la table des presets) à la spline : supprime d'abord ses meshes de la scène, copie les paramètres du preset, mesure le mesh et marque la spline dirty. Ne fait rien si la spline ou le nom est nil ; un nom inconnu se contente de la vider et de la marquer dirty.

- `spline` (*table*) : Spline cible.
- `presetStr` (*string*) : Nom du preset, par exemple 'concrete_barrier'.

#### `editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData)`

Callback de rétablissement pour l'édition d'une seule spline.

- `meshSplineData` (*table*) : Données d'action contenant le nouvel état.

#### `editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData)`

Callback d'annulation pour l'édition d'une seule spline (historique de l'éditeur).

- `meshSplineData` (*table*) : Données d'action contenant l'ancien état.

#### `editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx)`

Coupe la spline sélectionnée en deux au nœud sélectionné. Une spline en boucle est simplement ouverte au point de coupe. Sinon la spline d'origine est supprimée et remplacée par deux nouvelles splines nommées <nom>_split_A et <nom>_split_B qui reprennent ses paramètres.

- `selectedSplineIdx` (*integer*) : Indice de la spline (base 1).
- `selectedNodeIdx` (*integer*) : Indice du nœud de coupe (base 1).

#### `editor_meshSpline_splineMgr.transSplineEditRedo(data)`

Rétablit une édition transverse à plusieurs mesh splines.

- `data` (*table*) : Données d'action.

#### `editor_meshSpline_splineMgr.transSplineEditUndo(data)`

Annule une édition transverse à plusieurs mesh splines.

- `data` (*table*) : Données d'action.

#### `editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Met à jour une spline liée avec la géométrie du Master Spline (nodes, widths, nmls, isLoop, isConformToTerrain). S'il y a moins de 2 points, vide la géométrie dérivée et retire les meshes. Marque la spline dirty.

- `id` (*string*) : UUID de la spline liée.
- `points` (*table*) : Nœuds.
- `widths` (*table*) : Largeurs par nœud.
- `nmls` (*table*) : Normales par nœud.
- `isLoop` (*boolean*) : Spline en boucle.
- `isConformToTerrain` (*boolean*) : Épouse la surface en dessous.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/splineMgr.lua`.*

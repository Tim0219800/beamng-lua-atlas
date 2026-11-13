# `editor_masterSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/masterSpline/splineMgr.lua` · VM : Game Engine (GE) · 1343 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline_splineMgr` : `extensions.load("editor_masterSpline_splineMgr")`, puis la globale `editor_masterSpline_splineMgr`

Gestionnaire de données de l'outil Master Spline de l'éditeur. Il stocke la liste des Master Splines (nodes, widths, nmls, layers, mode de géométrie « engineered » à clothoïdes ou « spline » Catmull-Rom, homologation), reconstruit la géométrie des splines « dirty », pilote les couches liées (via layerMgr) et fournit copies profondes, sérialisation, séparation/jonction, callbacks undo/redo et sauvegarde/chargement de session groupée (masters + enfants mesh/assembly/decal/road/tree).

## Remarques

- Constantes : préfixe d'outil « Master Spline », clé de mode d'édition « masterSpline », 10 subdivisions minimum par segment, taille minimale d'import d'un tracé 10 m.
- Une Master Spline contient notamment : name, id (UUID), isEnabled, isDirty, isLoop, isConformToTerrain, isAutoBanking, bankStrength, autoBankFalloff, geometryMode, engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners, nodes, widths, nmls, tableaux secondaires (ribPoints, divPoints, divWidths, tangents, binormals, normals, discMap), layers, roadLength, splineAnalysisMode, homologationPreset, isOptimising et les tableaux d'erreur eXxxNorm.
- updateDirtyMasterSplines : avec moins de 2 nœuds, la géométrie secondaire est vidée ; en mode conform, les nœuds sont posés sur le terrain ; sinon engineeredGeom.sampleInto, avec repli Catmull-Rom (conform, auto-dévers ou libre).
- Chargement de session : de nouveaux UUID sont générés pour tous les masters, enfants et couches ; les liens dont l'enfant n'est pas dans le lot sont supprimés.
- addToMasterSplineArray n'actualise pas la table id vers indice (appeler recomputeIdMap ensuite).
- Bug mineur probable : dans convertPathsToMasterSplines, une Master Spline vide est créée même pour un tracé trop petit, et le message de log calcule « trop petits » par #paths - #masterSplines, qui compte aussi les splines préexistantes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline_splineMgr.addNewMasterSpline(name)` | Crée une Master Spline vide (mode engineered, nom unique, UUID) et l'ajoute à la liste, puis recalcule la table id vers indice. | 84 |
| `editor_masterSpline_splineMgr.addToMasterSplineArray(spline)` | Ajoute une Master Spline à la liste sans recalculer la table id vers indice. | 152 |
| `editor_masterSpline_splineMgr.captureLinkedSplinesState()` | Copie profonde de toutes les splines enfants liées par les couches de toutes les Master Splines, regroupées par outil. | 261 |
| `editor_masterSpline_splineMgr.captureTransTierState()` | Capture l'état complet pour undo/redo multi-splines : Master Splines et splines liées. | 345 |
| `editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths)` | Convertit des tracés issus d'une bitmap en Master Splines : points grille convertis en monde via le terrain editor, normales du terrain ; importe seulement si la plus petite dimension de l'AABB dépasse 10 m. Écrit un log. | 1259 |
| `editor_masterSpline_splineMgr.deepCopyAllMasterSplines()` | Copie profonde de toute la liste des Master Splines. | 255 |
| `editor_masterSpline_splineMgr.deepCopyMasterSpline(spline)` | Copie profonde d'une Master Spline (string.buffer). | 252 |
| `editor_masterSpline_splineMgr.deserializeMasterSpline(data)` | Reconstruit une Master Spline (vec3, couches, géométrie secondaire vide à régénérer) depuis des données sérialisées. | 614 |
| `editor_masterSpline_splineMgr.getEditModeKey()` | Renvoie la clé de mode d'édition « masterSpline ». | 66 |
| `editor_masterSpline_splineMgr.getIdToIdxMap()` | Renvoie la table id vers indice des Master Splines. | 72 |
| `editor_masterSpline_splineMgr.getMasterSplines()` | Renvoie le tableau (vivant, non copié) des Master Splines. | 69 |
| `editor_masterSpline_splineMgr.getToolPrefixStr()` | Renvoie le préfixe d'outil « Master Spline ». | 63 |
| `editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joint deux Master Splines ouvertes : la première reçoit la géométrie concaténée et la seconde est supprimée. Ne fait rien si les indices sont invalides. | 539 |
| `editor_masterSpline_splineMgr.lightSplineRedo(data)` | Redo des modifications légères : applique data.new. *(interne)* | 765 |
| `editor_masterSpline_splineMgr.lightSplineUndo(data)` | Undo des modifications légères d'une Master Spline : applique data.old. *(interne)* | 762 |
| `editor_masterSpline_splineMgr.loadSessionState(state, replace)` | Charge un état de session : nouveaux UUID pour masters, enfants et couches, insertion des enfants dans leurs outils, relinkage et marquage dirty. Retourne 0 si state n'est pas une table. | 1030 |
| `editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx)` | Si la spline sélectionnée a isOptimising vrai et plus de 2 divPoints, lance homologation.optimiseSpline avec le nombre d'itérations par image. | 243 |
| `editor_masterSpline_splineMgr.recomputeIdMap()` | Recalcule la table id vers indice (appelé par l'assistant de session après un chargement). | 258 |
| `editor_masterSpline_splineMgr.redoAddNewMasterSpline(data)` | Redo de la création : recrée une Master Spline avec l'id data.masterSplineId. *(interne)* | 1241 |
| `editor_masterSpline_splineMgr.redoLayerAdd(data)` | Redo de l'ajout d'une couche. *(interne)* | 1117 |
| `editor_masterSpline_splineMgr.redoLayerRemove(data)` | Redo de la suppression d'une couche. *(interne)* | 1206 |
| `editor_masterSpline_splineMgr.removeAllMasterSplines()` | Supprime toutes les Master Splines de la session, avec leurs couches et enfants liés. | 165 |
| `editor_masterSpline_splineMgr.removeMasterSpline(idx)` | Supprime la Master Spline d'indice idx, toutes ses couches et leurs splines liées, puis recalcule la table id vers indice. | 155 |
| `editor_masterSpline_splineMgr.serializeMasterSpline(spline)` | Sérialise une Master Spline en table sûre pour JSON (nœuds et normales en {x,y,z}, couches, paramètres). | 570 |
| `editor_masterSpline_splineMgr.serializeSessionState()` | État pour l'assistant de session partagé : toutes les Master Splines plus chaque enfant lié (dédupliqué par id), en tables JSON. | 1005 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data)` | Redo d'une édition d'une seule Master Spline (data.new) ; recrée par défaut les splines enfants supprimées pendant l'action, nomme et relie les nouvelles. *(interne)* | 940 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data)` | Undo d'une édition d'une seule Master Spline (applique data.old). *(interne)* | 831 |
| `editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx)` | Coupe la Master Spline au nœud choisi. Une boucle devient une spline ouverte re-démarrée au point de coupure ; sinon deux copies « nom (1) » et « nom (2) » sont créées avec leurs overrides de virage, et les couches sont gérées pour chaque moitié. | 353 |
| `editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData)` | Redo d'une édition multi-splines. *(interne)* | 966 |
| `editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData)` | Undo d'une édition multi-splines (état complet, masters et enfants). *(interne)* | 935 |
| `editor_masterSpline_splineMgr.undoAddNewMasterSpline(data)` | Undo de la création d'une Master Spline : la supprime par data.masterSplineId. *(interne)* | 1232 |
| `editor_masterSpline_splineMgr.undoLayerAdd(data)` | Undo de l'ajout d'une couche : retire la couche de la Master Spline (data.masterSplineId). *(interne)* | 1095 |
| `editor_masterSpline_splineMgr.undoLayerRemove(data)` | Undo de la suppression d'une couche : la restaure. *(interne)* | 1162 |
| `editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline)` | Délie toutes les splines liées de la Master Spline (isLink = false, linkId = nil), sans passer par undo/redo. | 1248 |
| `editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled)` | Reconstruit la géométrie des splines isDirty (terrain, engineered ou Catmull-Rom, élargissement des virages, rib points, homologation si activée), met à jour les couches liées et roadLength. Les splines non dirty ne mettent à jour que leurs couches dirty. Signale la modification à la session si quelque chose a été reconstruit. | 173 |
| `editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName)` | Renomme la spline liée pour qu'elle suive le nom de la couche (via setNameJumpTable). | 1229 |

### Détail des paramètres

#### `editor_masterSpline_splineMgr.addNewMasterSpline(name)`

Crée une Master Spline vide (mode engineered, nom unique, UUID) et l'ajoute à la liste, puis recalcule la table id vers indice.

- `name` (*string|nil*) : Nom de base ; par défaut « Master Spline N ».
- **renvoie** : table La nouvelle Master Spline.

#### `editor_masterSpline_splineMgr.addToMasterSplineArray(spline)`

Ajoute une Master Spline à la liste sans recalculer la table id vers indice.

- `spline` (*table*) : Master Spline à ajouter.

#### `editor_masterSpline_splineMgr.captureLinkedSplinesState()`

Copie profonde de toutes les splines enfants liées par les couches de toutes les Master Splines, regroupées par outil.

- **renvoie** : table Table avec les listes meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline.

#### `editor_masterSpline_splineMgr.captureTransTierState()`

Capture l'état complet pour undo/redo multi-splines : Master Splines et splines liées.

- **renvoie** : table Table { masterSplines, linkedSplines }.

#### `editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths)`

Convertit des tracés issus d'une bitmap en Master Splines : points grille convertis en monde via le terrain editor, normales du terrain ; importe seulement si la plus petite dimension de l'AABB dépasse 10 m. Écrit un log.

- `paths` (*table*) : Liste de tracés { points (x, y grille), widths }.

#### `editor_masterSpline_splineMgr.deepCopyAllMasterSplines()`

Copie profonde de toute la liste des Master Splines.

- **renvoie** : table Copie.

#### `editor_masterSpline_splineMgr.deepCopyMasterSpline(spline)`

Copie profonde d'une Master Spline (string.buffer).

- `spline` (*table*) : Spline à copier.
- **renvoie** : table Copie.

#### `editor_masterSpline_splineMgr.deserializeMasterSpline(data)`

Reconstruit une Master Spline (vec3, couches, géométrie secondaire vide à régénérer) depuis des données sérialisées.

- `data` (*table*) : Table produite par serializeMasterSpline.
- **renvoie** : table Master Spline.

#### `editor_masterSpline_splineMgr.getEditModeKey()`

Renvoie la clé de mode d'édition « masterSpline ».

- **renvoie** : string Clé.

#### `editor_masterSpline_splineMgr.getIdToIdxMap()`

Renvoie la table id vers indice des Master Splines.

- **renvoie** : table<string, integer> Table id vers indice.

#### `editor_masterSpline_splineMgr.getMasterSplines()`

Renvoie le tableau (vivant, non copié) des Master Splines.

- **renvoie** : table Tableau de Master Splines.

#### `editor_masterSpline_splineMgr.getToolPrefixStr()`

Renvoie le préfixe d'outil « Master Spline ».

- **renvoie** : string Préfixe.

#### `editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joint deux Master Splines ouvertes : la première reçoit la géométrie concaténée et la seconde est supprimée. Ne fait rien si les indices sont invalides.

- `splineIdx1` (*integer*) : Indice de la première spline (conservée).
- `nodeIdx1` (*integer*) : Nœud de jonction de la première.
- `splineIdx2` (*integer*) : Indice de la seconde spline (supprimée).
- `nodeIdx2` (*integer*) : Nœud de jonction de la seconde.

#### `editor_masterSpline_splineMgr.lightSplineRedo(data)`

Redo des modifications légères : applique data.new.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.lightSplineUndo(data)`

Undo des modifications légères d'une Master Spline : applique data.old.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.loadSessionState(state, replace)`

Charge un état de session : nouveaux UUID pour masters, enfants et couches, insertion des enfants dans leurs outils, relinkage et marquage dirty. Retourne 0 si state n'est pas une table.

- `state` (*table*) : État produit par serializeSessionState.
- `replace` (*boolean*) : Si vrai, supprime d'abord tout le graphe de masters courant (et leurs enfants).
- **renvoie** : integer Nombre de Master Splines chargées.

#### `editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx)`

Si la spline sélectionnée a isOptimising vrai et plus de 2 divPoints, lance homologation.optimiseSpline avec le nombre d'itérations par image.

- `selectedSplineIdx` (*integer*) : Indice de la spline sélectionnée.

#### `editor_masterSpline_splineMgr.redoAddNewMasterSpline(data)`

Redo de la création : recrée une Master Spline avec l'id data.masterSplineId.

- `data` (*table*) : Action { masterSplineId }.

#### `editor_masterSpline_splineMgr.redoLayerAdd(data)`

Redo de l'ajout d'une couche.

- `data` (*table*) : Données de l'action.

#### `editor_masterSpline_splineMgr.redoLayerRemove(data)`

Redo de la suppression d'une couche.

- `data` (*table*) : Données de l'action.

#### `editor_masterSpline_splineMgr.removeMasterSpline(idx)`

Supprime la Master Spline d'indice idx, toutes ses couches et leurs splines liées, puis recalcule la table id vers indice.

- `idx` (*integer*) : Indice (à partir de 1).

#### `editor_masterSpline_splineMgr.serializeMasterSpline(spline)`

Sérialise une Master Spline en table sûre pour JSON (nœuds et normales en {x,y,z}, couches, paramètres).

- `spline` (*table*) : Spline.
- **renvoie** : table Données sérialisées.

#### `editor_masterSpline_splineMgr.serializeSessionState()`

État pour l'assistant de session partagé : toutes les Master Splines plus chaque enfant lié (dédupliqué par id), en tables JSON.

- **renvoie** : table { masterSplines = {...}, children = { [linkType] = {...} } }.

#### `editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data)`

Redo d'une édition d'une seule Master Spline (data.new) ; recrée par défaut les splines enfants supprimées pendant l'action, nomme et relie les nouvelles.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data)`

Undo d'une édition d'une seule Master Spline (applique data.old).

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx)`

Coupe la Master Spline au nœud choisi. Une boucle devient une spline ouverte re-démarrée au point de coupure ; sinon deux copies « nom (1) » et « nom (2) » sont créées avec leurs overrides de virage, et les couches sont gérées pour chaque moitié.

- `spline` (*table*) : Master Spline à couper.
- `splineIdx` (*integer*) : Indice de la spline dans la liste.
- `selectedNodeIdx` (*integer*) : Indice du nœud de coupure.

#### `editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData)`

Redo d'une édition multi-splines.

- `splinesData` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData)`

Undo d'une édition multi-splines (état complet, masters et enfants).

- `splinesData` (*table*) : Action { old, new } issue de captureTransTierState.

#### `editor_masterSpline_splineMgr.undoAddNewMasterSpline(data)`

Undo de la création d'une Master Spline : la supprime par data.masterSplineId.

- `data` (*table*) : Action { masterSplineId }.

#### `editor_masterSpline_splineMgr.undoLayerAdd(data)`

Undo de l'ajout d'une couche : retire la couche de la Master Spline (data.masterSplineId).

- `data` (*table*) : Données de l'action.

#### `editor_masterSpline_splineMgr.undoLayerRemove(data)`

Undo de la suppression d'une couche : la restaure.

- `data` (*table*) : Données de l'action.

#### `editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline)`

Délie toutes les splines liées de la Master Spline (isLink = false, linkId = nil), sans passer par undo/redo.

- `masterSpline` (*table*) : Master Spline.

#### `editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled)`

Reconstruit la géométrie des splines isDirty (terrain, engineered ou Catmull-Rom, élargissement des virages, rib points, homologation si activée), met à jour les couches liées et roadLength. Les splines non dirty ne mettent à jour que leurs couches dirty. Signale la modification à la session si quelque chose a été reconstruit.

- `isSplineAnalysisEnabled` (*boolean*) : Si vrai, lance homologation.analyseSpline sur les splines de plus de 2 points discrétisés.

#### `editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName)`

Renomme la spline liée pour qu'elle suive le nom de la couche (via setNameJumpTable).

- `splineId` (*string*) : Id de la spline liée.
- `linkType` (*string*) : Type de lien (préfixe d'outil de la spline liée).
- `newName` (*string*) : Nouveau nom.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline/splineMgr.lua`.*

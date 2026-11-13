# `editor_drivePathEditor_splineMgr`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua` · VM : Game Engine (GE) · 1048 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_splineMgr` : `extensions.load("editor_drivePathEditor_splineMgr")`, puis la globale `editor_drivePathEditor_splineMgr`

Gestionnaire des splines du Drive Path Editor (préfixe « Drive Path Spline », mode d'édition drivePathSplineEditMode). Une spline de chemin décrit un trajet pour une IA : nœuds, largeurs, normales, vitesses (vels) et limites de vitesse (velLimits) en mode libre, ou liste de nœuds du navgraph (graphNodes/graphPath) en mode graphe. Le module tient la liste des splines et la table id vers index, gère création, suppression, coupe, jonction, inversion, undo/redo, sérialisation, liens spline-véhicule (qui replacent le véhicule au départ) et le cache du navgraph de la carte (map.getGraphpath()).

## Remarques

- Paramètres par défaut d'une spline : isFreeMode true, delayTime 0 s, aggression 0.3, numLaps 1, routeSpeed 31.3 (m/s), routeSpeedMode 'off', isAvoidCars true, isDriveInLane true, isLoop false, startingNode 1, speedProfileMode 0 (0 aucun, 1 vitesses cibles, 2 limites de vitesse, script libre seulement).
- Constantes : subdivisions minimales 10 ; écart à la coupe 1.0 m ; taille minimale d'import 10 m ; décalage vertical des véhicules 0.3 m (vehShiftZ) ; points de ruban relevés par raycast avec zExtra 3.0 et zFloat 0.15.
- Un véhicule de scène est une table {vid, veh, name, isLink, linkSplineId} ; une spline liée a isVehicleLink et linkVehId. linkSpline replace immédiatement le véhicule au départ et mémorise sa pose d'origine ; unlinkSpline la restaure.
- Les splines sont recalculées par updateDirtyDrivePathSplines quand isDirty est vrai. En mode graphe, une spline reste dirty tant que le navgraph n'est pas disponible.
- getNavGraph renvoie nil tant que map.getGraphpath() n'existe pas ; sinon il met en cache {graph, nodes (positions), widths (radius), lines} pour toutes les arêtes (une fois par arête).
- convertPathsToDrivePathSplines crée une spline par chemin même trop petit (elle reste vide) et son log compte #paths - #drivePathSplines (inexact s'il existait déjà des splines).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_splineMgr.addNewDrivePathSpline()` | Ajoute à la fin une nouvelle spline vide avec un nom unique, un UUID Engine.generateUUID() et les paramètres par défaut. | 202 |
| `editor_drivePathEditor_splineMgr.computeActiveVehicles()` | Reconstruit la liste des véhicules actifs de la scène (activeVehiclesIterator) avec vid, veh, name et liens remis à zéro. | 84 |
| `editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths)` | Convertit des tracés issus d'une image en splines (voir notes pour les cas des tracés trop petits). | 967 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline)` | Copie profonde d'une spline (pour l'historique). | 283 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState()` | Copie profonde de toutes les splines. | 350 |
| `editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data)` | Reconstruit une spline depuis une table sérialisée. | 811 |
| `editor_drivePathEditor_splineMgr.flipSpline(spline)` | Inverse le sens d'une spline : nœuds, largeurs, normales, vitesses et limites de vitesse sont renversés. | 577 |
| `editor_drivePathEditor_splineMgr.getActiveVehicles(isForce)` | Renvoie la liste des véhicules actifs ; la recalcule si elle est vide ou si isForce est vrai. | 94 |
| `editor_drivePathEditor_splineMgr.getDefaultSliderParams()` | Renvoie les valeurs par défaut des paramètres de spline. | 183 |
| `editor_drivePathEditor_splineMgr.getDrivePathSplines()` | Renvoie la table des splines (référence). | 65 |
| `editor_drivePathEditor_splineMgr.getEditModeKey()` | Renvoie la clé du mode d'édition (« drivePathSplineEditMode »). | 62 |
| `editor_drivePathEditor_splineMgr.getNavGraph()` | Renvoie les données du navgraph de la carte (cache), les calcule au premier appel si possible. | 141 |
| `editor_drivePathEditor_splineMgr.getSplineMap()` | Renvoie la table id de spline vers index. | 68 |
| `editor_drivePathEditor_splineMgr.getToolPrefixStr()` | Renvoie le préfixe de l'outil (« Drive Path Spline »). | 59 |
| `editor_drivePathEditor_splineMgr.getVehicleById(vid)` | Cherche un véhicule dans la liste déjà calculée (sans la recalculer). | 102 |
| `editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joint deux splines non bouclées : la première reçoit la géométrie concaténée, la seconde est supprimée. | 486 |
| `editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle)` | Lie une spline à un véhicule (isVehicleLink, linkVehId, linkSplineId) et replace le véhicule au départ. | 635 |
| `editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines()` | Relie toutes les splines à leur véhicule (via linkVehId) en cherchant dans la liste des véhicules calculée. | 673 |
| `editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled)` | Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées. | 264 |
| `editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx)` | Supprime la spline d'index donné et met à jour la table d'index. | 256 |
| `editor_drivePathEditor_splineMgr.resetGeometry(spline)` | Vide toute la géométrie d'une spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) et la marque isDirty. | 186 |
| `editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle)` | Place le véhicule au nœud de départ (startingNode) de la spline, orienté selon les nœuds voisins, avec 0.3 m de décalage vertical. Mémorise une seule fois sa pose d'origine. En mode graphe, utilise les nœuds du navgraph (nécessite le cache). | 602 |
| `editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline)` | Sérialise une spline en table. | 756 |
| `editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx)` | Place une spline à un index et la marque isDirty. | 71 |
| `editor_drivePathEditor_splineMgr.setDrivePathSplines(splines)` | Place toutes les splines d'un tableau (chacune marquée isDirty). | 77 |
| `editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData)` | Rétablit une édition de spline unique à partir de drivePathSplineData.new. *(interne)* | 724 |
| `editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData)` | Annule une édition de spline unique à partir de drivePathSplineData.old, puis relie à nouveau les véhicules. *(interne)* | 716 |
| `editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx)` | Coupe une spline en deux au nœud donné (écart de 1.0 m entre les deux parties). | 360 |
| `editor_drivePathEditor_splineMgr.transSplineEditRedo(data)` | Rétablit une édition globale avec data.new. *(interne)* | 744 |
| `editor_drivePathEditor_splineMgr.transSplineEditUndo(data)` | Annule une édition globale (toutes les splines) avec data.old. *(interne)* | 732 |
| `editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle)` | Supprime le lien spline-véhicule et rend au véhicule sa pose d'origine mémorisée. | 646 |
| `editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines()` | Recalcule la géométrie des splines isDirty (raycasts terrain, barres de vitesse, ruban en mode libre ; chemin de graphe en mode navgraph). Appelée chaque frame par onEditorGui. *(interne)* | 913 |

### Détail des paramètres

#### `editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths)`

Convertit des tracés issus d'une image en splines (voir notes pour les cas des tracés trop petits).

- `paths` (*table*) : tableau de {points, widths}

#### `editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline)`

Copie profonde d'une spline (pour l'historique).

- `spline` (*table*) : spline
- **renvoie** : table copie

#### `editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState()`

Copie profonde de toutes les splines.

- **renvoie** : table tableau de copies

#### `editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data)`

Reconstruit une spline depuis une table sérialisée.

- `data` (*table*) : table issue de serializeDrivePathSpline
- **renvoie** : table spline

#### `editor_drivePathEditor_splineMgr.flipSpline(spline)`

Inverse le sens d'une spline : nœuds, largeurs, normales, vitesses et limites de vitesse sont renversés.

- `spline` (*table*) : spline

#### `editor_drivePathEditor_splineMgr.getActiveVehicles(isForce)`

Renvoie la liste des véhicules actifs ; la recalcule si elle est vide ou si isForce est vrai.

- `isForce` (*boolean|nil*) : forcer le recalcul
- **renvoie** : table tableau de {vid, veh, name, isLink, linkSplineId}

#### `editor_drivePathEditor_splineMgr.getDefaultSliderParams()`

Renvoie les valeurs par défaut des paramètres de spline.

- **renvoie** : table paramètres par défaut

#### `editor_drivePathEditor_splineMgr.getDrivePathSplines()`

Renvoie la table des splines (référence).

- **renvoie** : table tableau de splines

#### `editor_drivePathEditor_splineMgr.getEditModeKey()`

Renvoie la clé du mode d'édition (« drivePathSplineEditMode »).

- **renvoie** : string clé

#### `editor_drivePathEditor_splineMgr.getNavGraph()`

Renvoie les données du navgraph de la carte (cache), les calcule au premier appel si possible.

- **renvoie** : table|nil {graph, nodes, widths, lines} ou nil si le graphe n'est pas encore disponible

#### `editor_drivePathEditor_splineMgr.getSplineMap()`

Renvoie la table id de spline vers index.

- **renvoie** : table<string, integer> id vers index

#### `editor_drivePathEditor_splineMgr.getToolPrefixStr()`

Renvoie le préfixe de l'outil (« Drive Path Spline »).

- **renvoie** : string préfixe

#### `editor_drivePathEditor_splineMgr.getVehicleById(vid)`

Cherche un véhicule dans la liste déjà calculée (sans la recalculer).

- `vid` (*integer*) : id du véhicule
- **renvoie** : table|nil entrée de véhicule

#### `editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joint deux splines non bouclées : la première reçoit la géométrie concaténée, la seconde est supprimée.

- `splineIdx1` (*integer*) : spline conservée
- `nodeIdx1` (*integer*) : nœud d'extrémité de la première
- `splineIdx2` (*integer*) : spline supprimée
- `nodeIdx2` (*integer*) : nœud d'extrémité de la seconde

#### `editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle)`

Lie une spline à un véhicule (isVehicleLink, linkVehId, linkSplineId) et replace le véhicule au départ.

- `spline` (*table*) : spline
- `vehicle` (*table*) : entrée de véhicule

#### `editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled)`

Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées.

- `isIncludeDisabled` (*boolean*) : inclure les splines désactivées

#### `editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx)`

Supprime la spline d'index donné et met à jour la table d'index.

- `idx` (*integer*) : index (base 1)

#### `editor_drivePathEditor_splineMgr.resetGeometry(spline)`

Vide toute la géométrie d'une spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) et la marque isDirty.

- `spline` (*table|nil*) : spline

#### `editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle)`

Place le véhicule au nœud de départ (startingNode) de la spline, orienté selon les nœuds voisins, avec 0.3 m de décalage vertical. Mémorise une seule fois sa pose d'origine. En mode graphe, utilise les nœuds du navgraph (nécessite le cache).

- `spline` (*table*) : spline
- `vehicle` (*table*) : entrée de véhicule {vid, veh…}

#### `editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline)`

Sérialise une spline en table.

- `spline` (*table*) : spline
- **renvoie** : table données sérialisées

#### `editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx)`

Place une spline à un index et la marque isDirty.

- `spline` (*table*) : spline
- `idx` (*integer*) : index (base 1)

#### `editor_drivePathEditor_splineMgr.setDrivePathSplines(splines)`

Place toutes les splines d'un tableau (chacune marquée isDirty).

- `splines` (*table*) : tableau de splines

#### `editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData)`

Rétablit une édition de spline unique à partir de drivePathSplineData.new.

- `drivePathSplineData` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData)`

Annule une édition de spline unique à partir de drivePathSplineData.old, puis relie à nouveau les véhicules.

- `drivePathSplineData` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx)`

Coupe une spline en deux au nœud donné (écart de 1.0 m entre les deux parties).

- `selectedSplineIdx` (*integer*) : index de la spline
- `selectedNodeIdx` (*integer*) : index du nœud de coupe

#### `editor_drivePathEditor_splineMgr.transSplineEditRedo(data)`

Rétablit une édition globale avec data.new.

- `data` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.transSplineEditUndo(data)`

Annule une édition globale (toutes les splines) avec data.old.

- `data` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle)`

Supprime le lien spline-véhicule et rend au véhicule sa pose d'origine mémorisée.

- `spline` (*table*) : spline
- `vehicle` (*table*) : entrée de véhicule

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua`.*

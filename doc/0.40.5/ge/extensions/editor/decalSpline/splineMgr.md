# `editor_decalSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/decalSpline/splineMgr.lua` · VM : Game Engine (GE) · 755 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline_splineMgr` : `extensions.load("editor_decalSpline_splineMgr")`, puis la globale `editor_decalSpline_splineMgr`

Gestionnaire des splines de l'outil Decal Spline de l'éditeur (préfixe « Decal Spline », mode d'édition decalSplineEditMode) : une spline de decals suit un tracé (nœuds, largeurs, normales) sur lequel des decals sont répartis (espacement, jitter, rotation, lignes/colonnes de l'atlas, échelle, frame, jusqu'à 4 composants). Le module garde la liste des splines et une table id vers index, crée/supprime/coupe/joint des splines, gère undo/redo, copie de profil, sérialisation (buffer binaire ou table JSON de session), liens avec des splines maîtres, et reconstruit la géométrie et les decals des splines marquées isDirty.

## Remarques

- Une spline est une table : name, id (UUID), isDirty, isLoop, isLink/linkId, nodes (vec3), widths, nmls, divPoints/divWidths/tangents/binormals/normals/discMap (géométrie dérivée recalculée), isEnabled, isAliasRoundRobin, roadLength, spacing, jitter, randomSeed, et par composant n (1 à 4) : rotN, numRowsN, numColsN, scaleN, frameN.
- Valeurs par défaut des curseurs : spacing 0, jitter 0, rot 1, randomSeed 41225, numRows 4, numCols 2, scale 1, frame 3, matériau par défaut asphalt_patches ; minimum 100 subdivisions ; taille minimale d'import d'un tracé 10 m.
- Toute modification d'une spline passe par isDirty = true : updateDirtyDecalSplines (appelée chaque frame par l'outil) reconstruit alors la géométrie (catmullRomRaycast) et les decals (pop.populateDecalSpline). Moins de 2 nœuds : decals et géométrie dérivée supprimés.
- Une spline désactivée (isEnabled = false) dont les decals existent déjà n'est pas reconstruite.
- convertPathsToDecalSplines crée une spline pour chaque chemin même si le chemin est trop petit (la spline reste alors vide), et le message de log compte #paths - #decalSplines (faux s'il existait déjà des splines).
- deepCopyDecalSplineState est listé deux fois dans l'interface publique (même fonction).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline_splineMgr.addNewDecalSpline()` | Ajoute à la fin une nouvelle spline vide avec un nom unique (« Decal Spline N »), un UUID Engine.generateUUID() et les paramètres par défaut. | 83 |
| `editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths)` | Convertit des tracés issus d'une image (points en grille terrain) en splines : coordonnées monde via l'éditeur de terrain, normales du terrain. Les tracés dont la plus petite dimension fait au plus 10 m ne sont pas importés (voir notes). | 608 |
| `editor_decalSpline_splineMgr.copyDecalSplineProfile(spline)` | Copie le profil (paramètres de répartition des decals) d'une spline, sans nodes, widths, nmls ni géométrie dérivée. | 466 |
| `editor_decalSpline_splineMgr.deepCopyDecalSpline(spline)` | Copie profonde (encode/decode string.buffer) d'une spline, avec la géométrie dérivée vidée. | 198 |
| `editor_decalSpline_splineMgr.deepCopyDecalSplineState()` | Copie profonde de toutes les splines (pour l'historique undo). | 210 |
| `editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject)` | Désérialise une spline depuis le blob de l'éditeur (string) ou une table JSON de session. Sur le chemin JSON, les tables dérivées sont vides et les positions réhydratées en vec3 avant la première construction. | 546 |
| `editor_decalSpline_splineMgr.getCurrentDecalSplineList()` | Liste des splines activées sous forme {name, id, type} (type = préfixe de l'outil), pour les sélecteurs d'autres outils. | 641 |
| `editor_decalSpline_splineMgr.getDecalSplines()` | Renvoie la table des splines (référence, non copiée). | 61 |
| `editor_decalSpline_splineMgr.getDefaultSliderParams()` | Renvoie les valeurs par défaut des curseurs de l'interface. | 80 |
| `editor_decalSpline_splineMgr.getEditModeKey()` | Renvoie la clé du mode d'édition (« decalSplineEditMode »). | 58 |
| `editor_decalSpline_splineMgr.getSplineMap()` | Renvoie la table id de spline vers index. | 64 |
| `editor_decalSpline_splineMgr.getToolPrefixStr()` | Renvoie le préfixe de l'outil (« Decal Spline »). | 55 |
| `editor_decalSpline_splineMgr.isLinked(id)` | Indique si la spline d'id donné est liée à une spline maîtresse. | 655 |
| `editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joint deux splines non bouclées : la géométrie concaténée est appliquée à la première, la seconde est supprimée. Sans effet si les index de nœuds sont invalides. | 335 |
| `editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile)` | Applique un profil à une spline : supprime ses decals, copie les paramètres (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN…) et la marque isDirty. | 481 |
| `editor_decalSpline_splineMgr.recomputeIdMap()` | Recalcule la table id vers index (appelée par l'utilitaire de session après un chargement). | 565 |
| `editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled)` | Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées et non liées. | 179 |
| `editor_decalSpline_splineMgr.removeDecalSpline(idx)` | Supprime une spline, retire ses decals de la scène, met à jour la table d'index, et supprime le dossier de decals s'il ne reste plus de spline. | 158 |
| `editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId)` | Supprime une spline à partir de son id (appelée quand la couche maîtresse est supprimée). Sans effet si l'id est inconnu. | 169 |
| `editor_decalSpline_splineMgr.serializeDecalSpline(spline)` | Sérialise une spline en blob binaire (string.buffer) pour l'éditeur. | 524 |
| `editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline)` | Sérialise une spline en table portable pour un fichier de session : géométrie dérivée vidée, handle de scène supprimé, la spline vivante n'est pas modifiée. | 537 |
| `editor_decalSpline_splineMgr.setDecalSpline(spline, idx)` | Place une spline à l'index donné et la marque isDirty. | 67 |
| `editor_decalSpline_splineMgr.setDecalSplines(splines)` | Place toutes les splines d'un tableau aux mêmes index (chacune marquée isDirty) ; ne supprime pas les autres. | 73 |
| `editor_decalSpline_splineMgr.setLink(id, groupId, isLink)` | Active ou désactive le lien d'une spline avec un groupe, supprime ses decals et la marque isDirty. | 661 |
| `editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData)` | Rétablit une édition de spline unique avec decalSplineData.new (si présent). *(interne)* | 434 |
| `editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData)` | Annule une édition de spline unique avec decalSplineData.old (si présent). *(interne)* | 426 |
| `editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx)` | Coupe une spline au nœud donné en deux splines. Une boucle est ouverte sur place en démarrant au nœud choisi. | 219 |
| `editor_decalSpline_splineMgr.transSplineEditRedo(data)` | Rétablit une édition globale avec data.new. *(interne)* | 454 |
| `editor_decalSpline_splineMgr.transSplineEditUndo(data)` | Annule une édition globale : supprime toutes les splines, remet data.old, marque tout isDirty et recalcule la table d'index. *(interne)* | 442 |
| `editor_decalSpline_splineMgr.unlinkAll()` | Délie toutes les splines liées et marque toutes les splines isDirty. | 698 |
| `editor_decalSpline_splineMgr.updateDirtyDecalSplines()` | Reconstruit les splines isDirty : raycasts verticaux des nœuds, géométrie Catmull-Rom, decals, longueur ; marque l'édition dans la session si au moins une a été reconstruite. Appelée chaque frame par l'outil. *(interne)* | 568 |
| `editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Met à jour une spline liée avec la géométrie de la spline maîtresse (nœuds, largeurs, normales, boucle). Si moins de 2 points, vide la géométrie dérivée et supprime les decals. | 676 |

### Détail des paramètres

#### `editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths)`

Convertit des tracés issus d'une image (points en grille terrain) en splines : coordonnées monde via l'éditeur de terrain, normales du terrain. Les tracés dont la plus petite dimension fait au plus 10 m ne sont pas importés (voir notes).

- `paths` (*table*) : tableau de {points, widths}

#### `editor_decalSpline_splineMgr.copyDecalSplineProfile(spline)`

Copie le profil (paramètres de répartition des decals) d'une spline, sans nodes, widths, nmls ni géométrie dérivée.

- `spline` (*table*) : spline source
- **renvoie** : table profil

#### `editor_decalSpline_splineMgr.deepCopyDecalSpline(spline)`

Copie profonde (encode/decode string.buffer) d'une spline, avec la géométrie dérivée vidée.

- `spline` (*table*) : spline
- **renvoie** : table copie

#### `editor_decalSpline_splineMgr.deepCopyDecalSplineState()`

Copie profonde de toutes les splines (pour l'historique undo).

- **renvoie** : table tableau de copies

#### `editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject)`

Désérialise une spline depuis le blob de l'éditeur (string) ou une table JSON de session. Sur le chemin JSON, les tables dérivées sont vides et les positions réhydratées en vec3 avant la première construction.

- `data` (*string|table*) : blob ou table
- `isCreateObject` (*boolean|nil*) : (déduit du code) indique s'il faut créer l'objet
- **renvoie** : table spline

#### `editor_decalSpline_splineMgr.getCurrentDecalSplineList()`

Liste des splines activées sous forme {name, id, type} (type = préfixe de l'outil), pour les sélecteurs d'autres outils.

- **renvoie** : table tableau de {name, id, type}

#### `editor_decalSpline_splineMgr.getDecalSplines()`

Renvoie la table des splines (référence, non copiée).

- **renvoie** : table tableau de splines

#### `editor_decalSpline_splineMgr.getDefaultSliderParams()`

Renvoie les valeurs par défaut des curseurs de l'interface.

- **renvoie** : table spacing, jitter, rot, randomSeed, numRows, numCols, scale, frame…

#### `editor_decalSpline_splineMgr.getEditModeKey()`

Renvoie la clé du mode d'édition (« decalSplineEditMode »).

- **renvoie** : string clé

#### `editor_decalSpline_splineMgr.getSplineMap()`

Renvoie la table id de spline vers index.

- **renvoie** : table<string, integer> id vers index

#### `editor_decalSpline_splineMgr.getToolPrefixStr()`

Renvoie le préfixe de l'outil (« Decal Spline »).

- **renvoie** : string préfixe

#### `editor_decalSpline_splineMgr.isLinked(id)`

Indique si la spline d'id donné est liée à une spline maîtresse.

- `id` (*string*) : id de spline
- **renvoie** : boolean vrai si liée

#### `editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joint deux splines non bouclées : la géométrie concaténée est appliquée à la première, la seconde est supprimée. Sans effet si les index de nœuds sont invalides.

- `splineIdx1` (*integer*) : index de la première spline (conservée)
- `nodeIdx1` (*integer*) : nœud d'extrémité de la première
- `splineIdx2` (*integer*) : index de la seconde spline (supprimée)
- `nodeIdx2` (*integer*) : nœud d'extrémité de la seconde

#### `editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile)`

Applique un profil à une spline : supprime ses decals, copie les paramètres (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN…) et la marque isDirty.

- `spline` (*table*) : spline cible
- `profile` (*table*) : profil issu de copyDecalSplineProfile

#### `editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled)`

Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées et non liées.

- `isIncludeDisabled` (*boolean*) : inclure les splines désactivées (et liées)

#### `editor_decalSpline_splineMgr.removeDecalSpline(idx)`

Supprime une spline, retire ses decals de la scène, met à jour la table d'index, et supprime le dossier de decals s'il ne reste plus de spline.

- `idx` (*integer*) : index (base 1)

#### `editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId)`

Supprime une spline à partir de son id (appelée quand la couche maîtresse est supprimée). Sans effet si l'id est inconnu.

- `splineId` (*string*) : id de la spline

#### `editor_decalSpline_splineMgr.serializeDecalSpline(spline)`

Sérialise une spline en blob binaire (string.buffer) pour l'éditeur.

- `spline` (*table*) : spline
- **renvoie** : string données encodées

#### `editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline)`

Sérialise une spline en table portable pour un fichier de session : géométrie dérivée vidée, handle de scène supprimé, la spline vivante n'est pas modifiée.

- `spline` (*table*) : spline
- **renvoie** : table table simple

#### `editor_decalSpline_splineMgr.setDecalSpline(spline, idx)`

Place une spline à l'index donné et la marque isDirty.

- `spline` (*table*) : spline
- `idx` (*integer*) : index (base 1)

#### `editor_decalSpline_splineMgr.setDecalSplines(splines)`

Place toutes les splines d'un tableau aux mêmes index (chacune marquée isDirty) ; ne supprime pas les autres.

- `splines` (*table*) : tableau de splines

#### `editor_decalSpline_splineMgr.setLink(id, groupId, isLink)`

Active ou désactive le lien d'une spline avec un groupe, supprime ses decals et la marque isDirty.

- `id` (*string*) : id de spline
- `groupId` (*string|nil*) : id du groupe de lien
- `isLink` (*boolean*) : lier ou délier

#### `editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData)`

Rétablit une édition de spline unique avec decalSplineData.new (si présent).

- `decalSplineData` (*table*) : {old, new}

#### `editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData)`

Annule une édition de spline unique avec decalSplineData.old (si présent).

- `decalSplineData` (*table*) : {old, new}

#### `editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx)`

Coupe une spline au nœud donné en deux splines. Une boucle est ouverte sur place en démarrant au nœud choisi.

- `selectedSplineIdx` (*integer*) : index de la spline
- `selectedNodeIdx` (*integer*) : index du nœud de coupe

#### `editor_decalSpline_splineMgr.transSplineEditRedo(data)`

Rétablit une édition globale avec data.new.

- `data` (*table*) : {old, new} avec des tableaux de splines

#### `editor_decalSpline_splineMgr.transSplineEditUndo(data)`

Annule une édition globale : supprime toutes les splines, remet data.old, marque tout isDirty et recalcule la table d'index.

- `data` (*table*) : {old, new} avec des tableaux de splines

#### `editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Met à jour une spline liée avec la géométrie de la spline maîtresse (nœuds, largeurs, normales, boucle). Si moins de 2 points, vide la géométrie dérivée et supprime les decals.

- `id` (*string*) : id de spline
- `points` (*table*) : nœuds vec3
- `widths` (*table*) : largeurs
- `nmls` (*table*) : normales
- `isLoop` (*boolean*) : boucle
- `isConformToTerrain` (*boolean*) : (non utilisé dans la fonction)

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline/splineMgr.lua`.*

# `editor_assemblySpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/assemblySpline/splineMgr.lua` · VM : Game Engine (GE) · 863 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_splineMgr` : `extensions.load("editor_assemblySpline_splineMgr")`, puis la globale `editor_assemblySpline_splineMgr`

Gestionnaire de données de l'outil Assembly Spline : tient la liste des assembly splines (assemblySplines) et la table id -> index (splineMap), crée/supprime/découpe/joint les splines, applique des presets de kit (Wooden Fence, Telegraph Pole, Metal Crash Barrier), gère copie/collage de profil, sérialisation, callbacks undo/redo, liens avec l'outil Master Spline et la mise à jour des splines « sales » (recalcul de la géométrie puis repeuplement en meshes via populate). Chaque spline est une table (name, id, nodes, widths, nmls, divPoints, spacing, verticalOffset, normalMode, sag, preRot, jitter*, splineRandomSeed, kitFolderPath, meshKit, moleculeDescription, isEnabled, isDirty, isLink, linkId, sceneTreeFolderId…) et chaque spline possède un SimGroup dans MissionGroup (cansave = false tant qu'elle n'est pas cuite).

## Remarques

- Presets (clé de setPreset) : 'wooden_fence', 'telegraph_pole', 'metal_crash_barrier' ; chacun définit un dossier de kit sous assets/meshes/props/assembly_kit/, spacing, normalMode (1 = haut global, 2 = haut du terrain), preRot (0, 1 = 90 deg, 2 = 180 deg autour de Z).
- Les splines utilisent un minimum de 100 subdivisions (minSplineDivisions) ; l'import de chemins bitmap ignore les tracés dont la plus petite dimension de l'AABB est <= 10 m.
- Une spline avec moins de 2 nœuds n'a aucun mesh : updateDirtyAssemblySplines supprime ses meshes et vide sa géométrie secondaire.
- updateDirtyAssemblySplines appelle session.markEdited('assemblySpline') quand au moins une spline a été reconstruite.
- Dans convertPathsToAssemblySplines, le message de log affiche #paths - #assemblySplines comme nombre de chemins ignorés : le calcul est faux si des splines existaient déjà avant l'appel, et les splines créées pour des chemins trop petits restent dans la liste, vides (déduit du code).
- M.deepCopyAssemblySplineState est assigné deux fois dans l'interface publique (sans conséquence).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_splineMgr.addNewAssemblySpline()` | Ajoute une spline vide (nom unique « Assembly Spline N », UUID, SimGroup) avec le kit Wooden Fence par défaut. Si le kit ne se charge pas, un avertissement est journalisé et le kit est vide. Met à jour splineMap. | 174 |
| `editor_assemblySpline_splineMgr.conformNodesToTerrain(spline)` | Pose une fois les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline sale. À relancer après un terraformage. | 702 |
| `editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths)` | Convertit des chemins tracés depuis une bitmap en assembly splines : coordonnées grille -> monde via l'éditeur de terrain, normales du terrain pour chaque nœud. Nécessite editor_terrainEditor. | 712 |
| `editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline)` | Copie le profil d'une spline : copie profonde sans identité, nœuds, largeurs, normales ni géométrie dérivée (reste : paramètres, kit, molécule, états d'activation). | 554 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline)` | Copie profonde d'une spline (encode/decode string.buffer) en vidant la géométrie secondaire dérivée (divPoints, divWidths, tangents, binormals, normals, discMap). | 304 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySplineState()` | Copie profonde de toutes les splines (pour l'historique d'annulation). | 316 |
| `editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject)` | Désérialise une spline depuis un blob encodé (string) ou une table JSON de session. Sur le chemin JSON, garantit l'existence des tables dérivées et réhydrate les positions en vec3 avant la première construction. | 624 |
| `editor_assemblySpline_splineMgr.findAssemblySpline(id)` | Trouve une spline vivante par id. | 269 |
| `editor_assemblySpline_splineMgr.getAssemblySplines()` | Renvoie la table vivante des assembly splines (non copiée). | 94 |
| `editor_assemblySpline_splineMgr.getCurrentAssemblySplineList()` | Liste des splines activées sous forme {name, id, type = 'Assembly Spline'} (pour l'outil Master Spline). | 744 |
| `editor_assemblySpline_splineMgr.getDefaultSliderParams()` | Renvoie les paramètres de curseurs par défaut (ceux du preset Wooden Fence) : spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed. | 127 |
| `editor_assemblySpline_splineMgr.getEditModeKey()` | Renvoie la clé du mode d'édition ('assemblySplineEditMode'). | 91 |
| `editor_assemblySpline_splineMgr.getSplineMap()` | Renvoie la table id -> index des splines. | 97 |
| `editor_assemblySpline_splineMgr.getToolPrefixStr()` | Renvoie le préfixe global de l'outil ('Assembly Spline'). | 88 |
| `editor_assemblySpline_splineMgr.isLinked(id)` | Indique si la spline d'id donné est liée à une Master Spline. | 758 |
| `editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joint deux splines ouvertes en une (spline1 modifiée, spline2 supprimée) selon les nœuds d'extrémité donnés (geom.joinSplineGeometry). Ne fait rien si les splines ou le cas de jonction sont invalides. | 414 |
| `editor_assemblySpline_splineMgr.objectSelectRedo(data)` | Callback de rétablissement d'une sélection d'objets (applique data.new). | 551 |
| `editor_assemblySpline_splineMgr.objectSelectUndo(data)` | Callback d'annulation d'une opération de sélection d'objets (restaure data.old). | 548 |
| `editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile)` | Applique un profil copié à une spline : supprime d'abord ses meshes, copie paramètres/kit/molécule/états d'activation, puis la marque sale. | 578 |
| `editor_assemblySpline_splineMgr.recomputeIdMap()` | Recalcule la table id -> index (appelé par le helper de session après un chargement). | 659 |
| `editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled)` | Supprime toutes les splines si isIncludeDisabled est vrai ; sinon seulement celles qui sont activées et non liées. | 285 |
| `editor_assemblySpline_splineMgr.removeAssemblySpline(idx)` | Supprime la spline d'index donné : ses meshes (pop.tryRemove), son SimGroup, puis la retire de la liste et met à jour splineMap. | 253 |
| `editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId)` | Supprime une spline liée par id (appelé quand une couche de Master Spline est supprimée). | 275 |
| `editor_assemblySpline_splineMgr.serializeAssemblySpline(spline)` | Sérialise une spline en blob encodé (string.buffer) pour la persistance de l'éditeur (voir onSerialize). | 603 |
| `editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline)` | Sérialise une spline en table simple portable pour un fichier de session (toolUtilities/session) : géométrie dérivée vidée, handle de scène supprimé, spline vivante non modifiée. | 615 |
| `editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx)` | Place une spline à l'index donné, lui crée au besoin un SimGroup dans MissionGroup (nom unique + UUID, cansave = false) et la marque sale. | 100 |
| `editor_assemblySpline_splineMgr.setAssemblySplines(splines)` | Applique setAssemblySpline à chaque élément de la liste. | 120 |
| `editor_assemblySpline_splineMgr.setLink(id, groupId, isLink)` | Lie ou délie une spline (isLink, linkId = groupId), supprime ses meshes et la marque sale. | 764 |
| `editor_assemblySpline_splineMgr.setPreset(spline, presetStr)` | Applique un preset à la spline : supprime ses meshes, recharge le kit (mol.getAssemblyKit), reconstruit la molécule et copie les paramètres du preset, puis marque la spline sale. Clé inconnue : seulement marquée sale. | 142 |
| `editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData)` | Callback de rétablissement d'une édition d'une seule spline. | 505 |
| `editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData)` | Callback d'annulation d'une édition d'une seule spline. | 497 |
| `editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx)` | Coupe la spline sélectionnée en deux au nœud sélectionné. Ne fait rien si la spline est invalide. | 325 |
| `editor_assemblySpline_splineMgr.transSplineEditRedo(data)` | Callback de rétablissement d'une édition transversale. | 525 |
| `editor_assemblySpline_splineMgr.transSplineEditUndo(data)` | Callback d'annulation d'une édition transversale (état complet des splines). | 513 |
| `editor_assemblySpline_splineMgr.unlinkAll()` | Délie toutes les splines et les marque sales. | 802 |
| `editor_assemblySpline_splineMgr.updateDirtyAssemblySplines()` | Pour chaque spline sale : recalcule la géométrie (Catmull-Rom avec raycast si isConformToTerrain, sinon libre en 3D), repeuple en meshes (pop.populateAssemblySpline) et met à jour roadLength. Sous 2 nœuds, supprime les meshes. Appelé chaque frame par onEditorGui. | 662 |
| `editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Met à jour la géométrie d'une spline liée depuis la master (nœuds, largeurs, normales, boucle, conformité au terrain) ; sous 2 points, vide la géométrie dérivée et supprime les meshes ; marque sale. | 779 |

### Détail des paramètres

#### `editor_assemblySpline_splineMgr.conformNodesToTerrain(spline)`

Pose une fois les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline sale. À relancer après un terraformage.

- `spline` (*table*) : Spline.

#### `editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths)`

Convertit des chemins tracés depuis une bitmap en assembly splines : coordonnées grille -> monde via l'éditeur de terrain, normales du terrain pour chaque nœud. Nécessite editor_terrainEditor.

- `paths` (*table[]*) : Liste de {points = {{x,y}}, widths}.

#### `editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline)`

Copie le profil d'une spline : copie profonde sans identité, nœuds, largeurs, normales ni géométrie dérivée (reste : paramètres, kit, molécule, états d'activation).

- `spline` (*table*) : Spline.
- **renvoie** : table Profil.

#### `editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline)`

Copie profonde d'une spline (encode/decode string.buffer) en vidant la géométrie secondaire dérivée (divPoints, divWidths, tangents, binormals, normals, discMap).

- `spline` (*table*) : Spline.
- **renvoie** : table Copie.

#### `editor_assemblySpline_splineMgr.deepCopyAssemblySplineState()`

Copie profonde de toutes les splines (pour l'historique d'annulation).

- **renvoie** : table[] Copies.

#### `editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject)`

Désérialise une spline depuis un blob encodé (string) ou une table JSON de session. Sur le chemin JSON, garantit l'existence des tables dérivées et réhydrate les positions en vec3 avant la première construction.

- `data` (*string|table*) : Blob ou table.
- `isCreateObject` (*boolean*) : Créer le SimGroup de scène de la spline (déduit du code).
- **renvoie** : table Spline.

#### `editor_assemblySpline_splineMgr.findAssemblySpline(id)`

Trouve une spline vivante par id.

- `id` (*string*) : Id (UUID) de la spline.
- **renvoie** : table|nil Spline ou nil.

#### `editor_assemblySpline_splineMgr.getAssemblySplines()`

Renvoie la table vivante des assembly splines (non copiée).

- **renvoie** : table[] Splines.

#### `editor_assemblySpline_splineMgr.getCurrentAssemblySplineList()`

Liste des splines activées sous forme {name, id, type = 'Assembly Spline'} (pour l'outil Master Spline).

- **renvoie** : table[] Entrées.

#### `editor_assemblySpline_splineMgr.getDefaultSliderParams()`

Renvoie les paramètres de curseurs par défaut (ceux du preset Wooden Fence) : spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed.

- **renvoie** : table Paramètres.

#### `editor_assemblySpline_splineMgr.getEditModeKey()`

Renvoie la clé du mode d'édition ('assemblySplineEditMode').

- **renvoie** : string Clé.

#### `editor_assemblySpline_splineMgr.getSplineMap()`

Renvoie la table id -> index des splines.

- **renvoie** : table<string, integer> splineMap.

#### `editor_assemblySpline_splineMgr.getToolPrefixStr()`

Renvoie le préfixe global de l'outil ('Assembly Spline').

- **renvoie** : string Préfixe.

#### `editor_assemblySpline_splineMgr.isLinked(id)`

Indique si la spline d'id donné est liée à une Master Spline.

- `id` (*string*) : Id.
- **renvoie** : boolean true si liée.

#### `editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joint deux splines ouvertes en une (spline1 modifiée, spline2 supprimée) selon les nœuds d'extrémité donnés (geom.joinSplineGeometry). Ne fait rien si les splines ou le cas de jonction sont invalides.

- `splineIdx1` (*integer*) : Première spline.
- `nodeIdx1` (*integer*) : Nœud de la première.
- `splineIdx2` (*integer*) : Seconde spline.
- `nodeIdx2` (*integer*) : Nœud de la seconde.

#### `editor_assemblySpline_splineMgr.objectSelectRedo(data)`

Callback de rétablissement d'une sélection d'objets (applique data.new).

- `data` (*table*) : {old, new}.

#### `editor_assemblySpline_splineMgr.objectSelectUndo(data)`

Callback d'annulation d'une opération de sélection d'objets (restaure data.old).

- `data` (*table*) : {old, new}.

#### `editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile)`

Applique un profil copié à une spline : supprime d'abord ses meshes, copie paramètres/kit/molécule/états d'activation, puis la marque sale.

- `spline` (*table*) : Spline cible.
- `profile` (*table*) : Profil de copyAssemblySplineProfile.

#### `editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled)`

Supprime toutes les splines si isIncludeDisabled est vrai ; sinon seulement celles qui sont activées et non liées.

- `isIncludeDisabled` (*boolean*) : Inclure les désactivées (verrouillées) et liées.

#### `editor_assemblySpline_splineMgr.removeAssemblySpline(idx)`

Supprime la spline d'index donné : ses meshes (pop.tryRemove), son SimGroup, puis la retire de la liste et met à jour splineMap.

- `idx` (*integer*) : Index.

#### `editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId)`

Supprime une spline liée par id (appelé quand une couche de Master Spline est supprimée).

- `splineId` (*string*) : Id de la spline.

#### `editor_assemblySpline_splineMgr.serializeAssemblySpline(spline)`

Sérialise une spline en blob encodé (string.buffer) pour la persistance de l'éditeur (voir onSerialize).

- `spline` (*table*) : Spline.
- **renvoie** : string Données encodées.

#### `editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline)`

Sérialise une spline en table simple portable pour un fichier de session (toolUtilities/session) : géométrie dérivée vidée, handle de scène supprimé, spline vivante non modifiée.

- `spline` (*table*) : Spline.
- **renvoie** : table Table sérialisable en JSON.

#### `editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx)`

Place une spline à l'index donné, lui crée au besoin un SimGroup dans MissionGroup (nom unique + UUID, cansave = false) et la marque sale.

- `spline` (*table*) : Spline.
- `idx` (*integer*) : Index.

#### `editor_assemblySpline_splineMgr.setAssemblySplines(splines)`

Applique setAssemblySpline à chaque élément de la liste.

- `splines` (*table[]*) : Splines.

#### `editor_assemblySpline_splineMgr.setLink(id, groupId, isLink)`

Lie ou délie une spline (isLink, linkId = groupId), supprime ses meshes et la marque sale.

- `id` (*string*) : Id de la spline.
- `groupId` (*string|nil*) : Id du groupe de liaison.
- `isLink` (*boolean*) : true pour lier.

#### `editor_assemblySpline_splineMgr.setPreset(spline, presetStr)`

Applique un preset à la spline : supprime ses meshes, recharge le kit (mol.getAssemblyKit), reconstruit la molécule et copie les paramètres du preset, puis marque la spline sale. Clé inconnue : seulement marquée sale.

- `spline` (*table*) : Spline.
- `presetStr` (*string*) : 'wooden_fence', 'telegraph_pole' ou 'metal_crash_barrier'.

#### `editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData)`

Callback de rétablissement d'une édition d'une seule spline.

- `assemblySplineData` (*table*) : Données de l'action d'historique.

#### `editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData)`

Callback d'annulation d'une édition d'une seule spline.

- `assemblySplineData` (*table*) : Données de l'action d'historique.

#### `editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx)`

Coupe la spline sélectionnée en deux au nœud sélectionné. Ne fait rien si la spline est invalide.

- `selectedSplineIdx` (*integer*) : Index de la spline.
- `selectedNodeIdx` (*integer*) : Index du nœud de coupe.

#### `editor_assemblySpline_splineMgr.transSplineEditRedo(data)`

Callback de rétablissement d'une édition transversale.

- `data` (*table*) : Données de l'action d'historique.

#### `editor_assemblySpline_splineMgr.transSplineEditUndo(data)`

Callback d'annulation d'une édition transversale (état complet des splines).

- `data` (*table*) : Données de l'action d'historique.

#### `editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Met à jour la géométrie d'une spline liée depuis la master (nœuds, largeurs, normales, boucle, conformité au terrain) ; sous 2 points, vide la géométrie dérivée et supprime les meshes ; marque sale.

- `id` (*string*) : Id.
- `points` (*vec3[]*) : Nœuds.
- `widths` (*number[]*) : Largeurs.
- `nmls` (*vec3[]*) : Normales.
- `isLoop` (*boolean*) : Spline fermée.
- `isConformToTerrain` (*boolean*) : Suivre le terrain.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/splineMgr.lua`.*

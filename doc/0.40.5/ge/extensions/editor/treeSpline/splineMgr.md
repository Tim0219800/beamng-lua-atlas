# `editor_treeSpline_splineMgr`

*Fichier : `lua/ge/extensions/editor/treeSpline/splineMgr.lua` · VM : Game Engine (GE) · 470 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline_splineMgr` : `extensions.load("editor_treeSpline_splineMgr")`, puis la globale `editor_treeSpline_splineMgr`

Gestionnaire de données de l'outil Tree Spline : détient la liste des splines d'arbres (treeSplines) et la table id -> index (splineMap), crée/supprime/copie/divise les splines, gère la sérialisation (rechargement Lua et fichiers de session JSON), l'annulation/rétablissement, les liens avec la Master Spline et la reconstruction des splines sales (géométrie puis replantage via editor/treeSpline/populate). Utilisé par editor/treeSpline.lua et par les outils partagés (splineInput, session).

## Remarques

- Chaque spline porte : name, id (UUID), isDirty, isLoop, isEnabled (faux = verrouillée), isConformToTerrain (toujours vrai), isLink/linkId, avoidInfrastructure, nodes/widths/nmls, divPoints/divWidths/tangents/binormals/normals/discMap, items/count (instances Forest, runtime seulement) et les paramètres de feuillage (class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed, species, speciesWeights).
- Valeurs par défaut de feuillage : posVariance 0.25, slopeMaxDeg 89, le reste vient de scatter.getDefaultDistribution() ; une seule espèce cochée par défaut pour que la spline plante.
- Une spline liée (isLink) tire sa géométrie de la Master Spline ; son drapeau de conformité au terrain est volontairement ignoré.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline_splineMgr.addNewTreeSpline()` | Ajoute une nouvelle spline vide (nom unique, UUID Engine.generateUUID, isConformToTerrain = true) ; l'utilisateur place ensuite ses nœuds en cliquant sur le terrain. | 83 |
| `editor_treeSpline_splineMgr.copyTreeSplineProfile(spline)` | Copie le profil (paramètres de feuillage seulement, pas la géométrie) ; callback requis par splineInput. | 259 |
| `editor_treeSpline_splineMgr.deepCopyTreeSpline(spline)` | Copie profonde d'une spline, sans la géométrie dérivée ni les poignées runtime (reconstruites depuis les nœuds et paramètres). | 142 |
| `editor_treeSpline_splineMgr.deepCopyTreeSplineState()` | Copie profonde de toute la liste (pour l'annulation/rétablissement inter-splines). | 162 |
| `editor_treeSpline_splineMgr.deserializeTreeSpline(data)` | Reconstruit une spline depuis un blob encodé (string) ou une table JSON. Réinitialise les tables dérivées, marque la spline sale, réhydrate les vec3 (nodes, nmls) et reprend les arbres conservés (keptObjects) via pop.adopt. | 296 |
| `editor_treeSpline_splineMgr.getCurrentTreeSplineList()` | Liste des splines actives sous forme {name, id, type} pour le lien avec la Master Spline. | 364 |
| `editor_treeSpline_splineMgr.getEditModeKey()` | Renvoie la clé du mode d'édition de l'outil. | 49 |
| `editor_treeSpline_splineMgr.getFoliageParamDefaults()` | Valeurs numériques de distribution par défaut pour une nouvelle spline (sans accès au scenetree, sûr au chargement du module). | 58 |
| `editor_treeSpline_splineMgr.getSplineMap()` | Renvoie la table id -> index des splines. | 55 |
| `editor_treeSpline_splineMgr.getState()` | Instantané complet (toutes les splines) en données simples, pour onSerialize. | 317 |
| `editor_treeSpline_splineMgr.getToolPrefixStr()` | Renvoie le préfixe de nom de l'outil (utilisé pour nommer les splines et identifier le type dans la Master Spline). | 46 |
| `editor_treeSpline_splineMgr.getTreeSplines()` | Renvoie la liste (vivante, non copiée) des tree splines. | 52 |
| `editor_treeSpline_splineMgr.isLinked(id)` | Indique si la spline d'identifiant donné est liée à une Master Spline. | 377 |
| `editor_treeSpline_splineMgr.makeFoliageDefaults()` | Construit la distribution de feuillage par défaut d'une nouvelle spline : les valeurs numériques plus une espèce cochée (species) avec son poids 1.0 (speciesWeights). | 72 |
| `editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile)` | Applique un profil de feuillage à une spline ; la géométrie reste inchangée. | 265 |
| `editor_treeSpline_splineMgr.recomputeIdMap()` | Recalcule la table id -> index ; appelé par l'aide de session après un chargement qui ajoute des splines. *(interne)* | 314 |
| `editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled)` | Supprime toutes les splines (et leurs arbres). Sans isIncludeDisabled, seules les splines actives et non liées sont supprimées. | 131 |
| `editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId)` | Supprime une spline liée par id (appelé quand un calque de la Master Spline est retiré). | 414 |
| `editor_treeSpline_splineMgr.removeTreeSpline(idx)` | Supprime la spline à l'index donné et retire ses arbres plantés. Sans effet si l'index est invalide. | 122 |
| `editor_treeSpline_splineMgr.serializeTreeSpline(spline)` | Sérialise une spline (liste blanche des champs primaires, sans géométrie dérivée) en blob encodé, pour la persistance au rechargement Lua. | 274 |
| `editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline)` | Table simple portable pour un fichier de session (toolUtilities/session) : décode le blob de serializeTreeSpline ; jsonWriteFile aplatit les nœuds vec3. | 290 |
| `editor_treeSpline_splineMgr.setLink(id, groupId, isLink)` | Lie ou délie la spline à un groupe de Master Spline (linkId), retire ses arbres et la marque sale. | 383 |
| `editor_treeSpline_splineMgr.setState(state)` | Restaure toute la liste depuis un instantané (supprime d'abord tout) ; les splines sont marquées sales et replantées. | 324 |
| `editor_treeSpline_splineMgr.setTreeSpline(spline, idx)` | Remplace l'enregistrement d'une spline (chemin d'annulation de la sélection d'objet dans splineInput). | 203 |
| `editor_treeSpline_splineMgr.setTreeSplines(splines)` | Remplace toute la liste des splines (annulation/rétablissement inter-splines). | 215 |
| `editor_treeSpline_splineMgr.singleSplineEditRedo(splineData)` | Rétablit l'édition d'une seule spline (callback d'historique). *(interne)* | 244 |
| `editor_treeSpline_splineMgr.singleSplineEditUndo(splineData)` | Annule l'édition d'une seule spline (callback d'historique de l'éditeur). *(interne)* | 243 |
| `editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx)` | Coupe la spline sélectionnée en deux au nœud choisi (splines ouvertes), ou déroule une boucle sur place. Les deux moitiés héritent des paramètres de feuillage et du réglage de conformité. | 180 |
| `editor_treeSpline_splineMgr.transSplineEditRedo(data)` | Rétablit une édition inter-splines. *(interne)* | 252 |
| `editor_treeSpline_splineMgr.transSplineEditUndo(data)` | Annule une édition inter-splines (ajout, suppression, réordonnancement sur toute la liste). *(interne)* | 247 |
| `editor_treeSpline_splineMgr.unlinkAll()` | Délie toutes les splines liées et les marque sales. | 422 |
| `editor_treeSpline_splineMgr.updateDirtyTreeSplines()` | Reconstruit la géométrie et replante les splines sales ; peut être appelée à chaque frame. Signale l'édition à la session (session.markEdited). *(interne)* | 332 |
| `editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Met à jour une spline liée avec la géométrie poussée par la Master Spline (nœuds, largeurs, normales, boucle) ; vide la géométrie dérivée et les arbres si moins de 2 points. Le paramètre isConformToTerrain est ignoré. | 395 |

### Détail des paramètres

#### `editor_treeSpline_splineMgr.addNewTreeSpline()`

Ajoute une nouvelle spline vide (nom unique, UUID Engine.generateUUID, isConformToTerrain = true) ; l'utilisateur place ensuite ses nœuds en cliquant sur le terrain.

- **renvoie** : integer Index de la nouvelle spline.

#### `editor_treeSpline_splineMgr.copyTreeSplineProfile(spline)`

Copie le profil (paramètres de feuillage seulement, pas la géométrie) ; callback requis par splineInput.

- `spline` (*table*) : Spline source.
- **renvoie** : table Profil copié.

#### `editor_treeSpline_splineMgr.deepCopyTreeSpline(spline)`

Copie profonde d'une spline, sans la géométrie dérivée ni les poignées runtime (reconstruites depuis les nœuds et paramètres).

- `spline` (*table*) : Spline à copier.
- **renvoie** : table Copie.

#### `editor_treeSpline_splineMgr.deepCopyTreeSplineState()`

Copie profonde de toute la liste (pour l'annulation/rétablissement inter-splines).

- **renvoie** : table Liste copiée.

#### `editor_treeSpline_splineMgr.deserializeTreeSpline(data)`

Reconstruit une spline depuis un blob encodé (string) ou une table JSON. Réinitialise les tables dérivées, marque la spline sale, réhydrate les vec3 (nodes, nmls) et reprend les arbres conservés (keptObjects) via pop.adopt.

- `data` (*string|table*) : Blob de l'éditeur ou table issue d'un fichier de session.
- **renvoie** : table Spline reconstruite.

#### `editor_treeSpline_splineMgr.getCurrentTreeSplineList()`

Liste des splines actives sous forme {name, id, type} pour le lien avec la Master Spline.

- **renvoie** : table[] Entrées {name, id, type = préfixe de l'outil}.

#### `editor_treeSpline_splineMgr.getEditModeKey()`

Renvoie la clé du mode d'édition de l'outil.

- **renvoie** : string Clé du mode d'édition.

#### `editor_treeSpline_splineMgr.getFoliageParamDefaults()`

Valeurs numériques de distribution par défaut pour une nouvelle spline (sans accès au scenetree, sûr au chargement du module).

- **renvoie** : table class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed.

#### `editor_treeSpline_splineMgr.getSplineMap()`

Renvoie la table id -> index des splines.

- **renvoie** : table<string, integer> Table id vers index.

#### `editor_treeSpline_splineMgr.getState()`

Instantané complet (toutes les splines) en données simples, pour onSerialize.

- **renvoie** : table Liste de blobs sérialisés.

#### `editor_treeSpline_splineMgr.getToolPrefixStr()`

Renvoie le préfixe de nom de l'outil (utilisé pour nommer les splines et identifier le type dans la Master Spline).

- **renvoie** : string Préfixe de l'outil.

#### `editor_treeSpline_splineMgr.getTreeSplines()`

Renvoie la liste (vivante, non copiée) des tree splines.

- **renvoie** : table Liste de splines.

#### `editor_treeSpline_splineMgr.isLinked(id)`

Indique si la spline d'identifiant donné est liée à une Master Spline.

- `id` (*string*) : Identifiant de la spline.
- **renvoie** : boolean Vrai si liée.

#### `editor_treeSpline_splineMgr.makeFoliageDefaults()`

Construit la distribution de feuillage par défaut d'une nouvelle spline : les valeurs numériques plus une espèce cochée (species) avec son poids 1.0 (speciesWeights).

- **renvoie** : table Paramètres de feuillage.

#### `editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile)`

Applique un profil de feuillage à une spline ; la géométrie reste inchangée.

- `spline` (*table*) : Spline cible.
- `profile` (*table*) : Profil renvoyé par copyTreeSplineProfile.

#### `editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled)`

Supprime toutes les splines (et leurs arbres). Sans isIncludeDisabled, seules les splines actives et non liées sont supprimées.

- `isIncludeDisabled` (*boolean*) : Vrai pour inclure les splines verrouillées ou liées.

#### `editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId)`

Supprime une spline liée par id (appelé quand un calque de la Master Spline est retiré).

- `splineId` (*string*) : Identifiant.

#### `editor_treeSpline_splineMgr.removeTreeSpline(idx)`

Supprime la spline à l'index donné et retire ses arbres plantés. Sans effet si l'index est invalide.

- `idx` (*integer*) : Index de la spline.

#### `editor_treeSpline_splineMgr.serializeTreeSpline(spline)`

Sérialise une spline (liste blanche des champs primaires, sans géométrie dérivée) en blob encodé, pour la persistance au rechargement Lua.

- `spline` (*table*) : Spline.
- **renvoie** : string Blob encodé.

#### `editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline)`

Table simple portable pour un fichier de session (toolUtilities/session) : décode le blob de serializeTreeSpline ; jsonWriteFile aplatit les nœuds vec3.

- `spline` (*table*) : Spline.
- **renvoie** : table Table sérialisable en JSON.

#### `editor_treeSpline_splineMgr.setLink(id, groupId, isLink)`

Lie ou délie la spline à un groupe de Master Spline (linkId), retire ses arbres et la marque sale.

- `id` (*string*) : Identifiant de la spline.
- `groupId` (*string*) : Identifiant du groupe Master Spline.
- `isLink` (*boolean*) : Vrai pour lier.

#### `editor_treeSpline_splineMgr.setState(state)`

Restaure toute la liste depuis un instantané (supprime d'abord tout) ; les splines sont marquées sales et replantées.

- `state` (*table|nil*) : Instantané de getState.

#### `editor_treeSpline_splineMgr.setTreeSpline(spline, idx)`

Remplace l'enregistrement d'une spline (chemin d'annulation de la sélection d'objet dans splineInput).

- `spline` (*table*) : Nouvelle spline.
- `idx` (*integer*) : Index à remplacer.

#### `editor_treeSpline_splineMgr.setTreeSplines(splines)`

Remplace toute la liste des splines (annulation/rétablissement inter-splines).

- `splines` (*table*) : Nouvelle liste.

#### `editor_treeSpline_splineMgr.singleSplineEditRedo(splineData)`

Rétablit l'édition d'une seule spline (callback d'historique).

- `splineData` (*table*) : Données {old, new} de l'action.

#### `editor_treeSpline_splineMgr.singleSplineEditUndo(splineData)`

Annule l'édition d'une seule spline (callback d'historique de l'éditeur).

- `splineData` (*table*) : Données {old, new} de l'action.

#### `editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx)`

Coupe la spline sélectionnée en deux au nœud choisi (splines ouvertes), ou déroule une boucle sur place. Les deux moitiés héritent des paramètres de feuillage et du réglage de conformité.

- `selIdx` (*integer*) : Index de la spline.
- `nodeIdx` (*integer*) : Index du nœud de coupe.
- **renvoie** : integer Nouvel index sélectionné.

#### `editor_treeSpline_splineMgr.transSplineEditRedo(data)`

Rétablit une édition inter-splines.

- `data` (*table*) : Données {old, new} de l'action.

#### `editor_treeSpline_splineMgr.transSplineEditUndo(data)`

Annule une édition inter-splines (ajout, suppression, réordonnancement sur toute la liste).

- `data` (*table*) : Données {old, new} de l'action.

#### `editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Met à jour une spline liée avec la géométrie poussée par la Master Spline (nœuds, largeurs, normales, boucle) ; vide la géométrie dérivée et les arbres si moins de 2 points. Le paramètre isConformToTerrain est ignoré.

- `id` (*string*) : Identifiant.
- `points` (*table*) : Nœuds.
- `widths` (*table*) : Largeurs.
- `nmls` (*table*) : Normales.
- `isLoop` (*boolean*) : Spline fermée.
- `isConformToTerrain` (*boolean*) : Ignoré.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline/splineMgr.lua`.*

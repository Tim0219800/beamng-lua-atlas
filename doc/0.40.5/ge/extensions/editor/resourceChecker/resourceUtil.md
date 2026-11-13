# `editor_resourceChecker_resourceUtil`

*Fichier : `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua` · VM : Game Engine (GE) · 2942 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_resourceChecker_resourceUtil` : `extensions.load("editor_resourceChecker_resourceUtil")`, puis la globale `editor_resourceChecker_resourceUtil`

Moteur de l'outil Resource Checker de l'éditeur : analyse les matériaux, textures, meshes et assets d'un niveau ou d'un véhicule (versions de matériaux, doublons, persistentId, textures manquantes ou non puissance de deux, matériaux/modèles/textures inutilisés, dummies, colmeshes, export DDS vers PNG, statistiques de taille). Chaque vérification tourne dans un job (extensions.core_jobsystem.create) qui met à jour une progression et renvoie son résultat à l'UI via extensions.editor_resourceChecker.jobData(canal, {type, compte, ..., isDone}). Plusieurs fonctions modifient ou suppriment des fichiers (fixPID, removeDummy, removeUnused, textureExporter) : à utiliser avec précaution.

## Exemple

```lua
local ru = extensions.editor_resourceChecker_resourceUtil
ru.verifyVersion('/levels/mon_niveau/')
-- plus tard, dans l'UI :
local p = ru.getProgress()
if p then print(p) end -- 0..100, nil si aucun job ne tourne
```

## Remarques

- Les fonctions de vérification ne renvoient rien : le résultat arrive de façon asynchrone via extensions.editor_resourceChecker.jobData(...). Ce module dépend donc de l'extension editor_resourceChecker.
- isDone vaut 1 en cas de succès et 2 en cas d'erreur (chemin invalide ou nom de niveau absent) dans les données renvoyées.
- Les chemins de matériaux doivent contenir un « / » sinon la fonction journalise une erreur (ensureValidPath).
- Les champs xxxworkJob exportés valent nil au chargement du module (copie de variables locales non encore assignées) : les jobs eux-mêmes sont des locales privées, getProgress et stopProgress sont la seule interface fiable.
- removeUnusedworkJob n'est pas exporté, mais getProgress/stopProgress le gèrent. checkColData accepte un paramètre removal qui n'est pas transmis au job (déduit du code).
- textureExporter : les messages log('E'/'I', 'texte') passent le message comme tag (appel à deux arguments avec un seul message) ; en cas d'échec de convertDDSToPNG, le fichier est tout de même compté et listé.
- Les fonctions qui parsent des fichiers matériaux gèrent materials.cs (TorqueScript, parseur maison) et *materials.json.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_resourceChecker_resourceUtil.assetStats(levelname)` | Job : calcule des statistiques de taille des assets d'un niveau (textures, meshes sources et cache, terrains, audio, datablocks, autres) et la liste des fichiers avec leur taille. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}). | 2778 |
| `editor_resourceChecker_resourceUtil.checkColData(levelname, removal)` | Job : cherche les colmeshes (collision) utilisés dans un niveau (prefabs, forêt, TSStatic). jobData(3, {9, ...}). | 1739 |
| `editor_resourceChecker_resourceUtil.checkForest()` | Job : liste les ForestItemData de la scène. Résultat via jobData(3, {2, ...}). | 944 |
| `editor_resourceChecker_resourceUtil.checkMatTex(convertdata)` | Job : vérifie les textures référencées par les matériaux (fichiers manquants, chemins incorrects). Résultat via jobData(2, {6, ...}). | 588 |
| `editor_resourceChecker_resourceUtil.checkStatic()` | Job : liste les shapes utilisées par les TSStatic de la scène. Résultat via jobData(3, {1, ...}). | 875 |
| `editor_resourceChecker_resourceUtil.checkTerrains()` | Job : liste les TerrainBlock de la scène. Résultat via jobData(3, {3, ...}). | 993 |
| `editor_resourceChecker_resourceUtil.checkTex(convertdata)` | Job : vérifie les fichiers de texture eux-mêmes (par ex. dimensions puissance de deux, voir powerOfTwo). Résultat via jobData(2, {7, ...}). | 715 |
| `editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal)` | Job : détermine les matériaux d'un niveau qui ne sont utilisés par aucun objet (prefabs, forêt, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stocke le résultat dans matstoRemove. jobData(3, {4, ...}). | 1277 |
| `editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal)` | Job : trouve les modèles (shapes) du niveau non utilisés (prefabs, TSStatic, forêt, GroundCover). Stocke le résultat dans shapestoRemove. jobData(3, {5, ...}). | 1937 |
| `editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal)` | Job : même parcours que checkUnusedMats mais pour lister les matériaux utilisés. jobData(3, {8, ...}). | 1593 |
| `editor_resourceChecker_resourceUtil.checkmissingMats(convertdata)` | Job : cherche dans les meshes les matériaux référencés mais absents des fichiers de matériaux. Résultat via jobData(2, {8, ...}). | 803 |
| `editor_resourceChecker_resourceUtil.duplicateData(material)` | Job : parcourt les matériaux de /levels, /vehicles, /art et /core pour trouver les doublons d'un matériau donné. | 2378 |
| `editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist)` | Détecte les noms de matériaux en double et les mapTo en double (hors unmapped_mat) dans une liste. Le résultat est stocké dans un état interne du module utilisé par verifyDuplicate. | 236 |
| `editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon)` | Job : retire les persistentId des matériaux JSON en les resauvegardant (resaveMaterial). Modifie les fichiers. Résultat via jobData(2, {5, nombre, "", fichiersModifiés, isDone}). | 448 |
| `editor_resourceChecker_resourceUtil.getMaterialTexFields(mat)` | Pour un objet Material, renvoie ses champs de type filename non vides, par couche (4 couches pour version 0 ou 1, activeLayers pour 1.5, sinon 1). | 206 |
| `editor_resourceChecker_resourceUtil.getProgress()` | Renvoie la progression du job en cours (parmi tous les jobs du module), ou nil si aucun ne tourne. | 2783 |
| `editor_resourceChecker_resourceUtil.getSimObjects(fileName)` | Parcourt tous les objets de la scène (scenetree.getAllObjects) et renvoie ceux dont getFileName() égale le fichier donné. Sert à retrouver les objets créés en chargeant un fichier de matériaux. | 145 |
| `editor_resourceChecker_resourceUtil.onExtensionLoaded()` | Hook de chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 2897 |
| `editor_resourceChecker_resourceUtil.onExtensionUnloaded()` | Hook de déchargement ; appelle extensions.unload('extensions.editor_resourceChecker_resourceUtil'). *(interne)* *(hook)* | 140 |
| `editor_resourceChecker_resourceUtil.powerOfTwo(x)` | Teste si un nombre est une puissance de deux (utile pour les dimensions de texture). | 177 |
| `editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon)` | Job : supprime des fichiers materials.json les matériaux « dummy » (sans Stages ou Stages[1] vide) et réécrit les fichiers. jobData(2, {9, nombre, "dummy", liste, isDone}). | 2447 |
| `editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData)` | Ouvre un fichier JSON de ForestItemData, retire l'entrée dont shapeFile correspond à shape et réécrit le fichier. Journalise un avertissement si introuvable. | 186 |
| `editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected)` | Job : supprime les éléments inutilisés sélectionnés. item 1 retire des matériaux (matstoRemove), 2 des shapes (shapestoRemove, et entrées forest), 3 des textures (textoRemove). Supprime des fichiers : irréversible. jobData(3, {7, ...}). | 2329 |
| `editor_resourceChecker_resourceUtil.resaveMaterial(file)` | Recharge un fichier materials.json, vide le persistentId de chaque Material puis le sauvegarde via un PersistenceManager temporaire. Réécrit le fichier. | 157 |
| `editor_resourceChecker_resourceUtil.stopProgress()` | Demande l'arrêt de tous les jobs en cours en mettant job.stop = true ; les jobs s'arrêtent à leur prochain point de contrôle (abort). | 2840 |
| `editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath)` | Job : convertit les fichiers .dds trouvés sous un dossier en .png (convertDDSToPNG) pour ceux qui n'ont pas déjà un .png, en écrivant sous exportpath. jobData(2, {10, nombre, "dummy", fichiers, isDone}). | 2492 |
| `editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal)` | Job : trouve les textures non référencées (matériaux, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stocke le résultat dans textoRemove. jobData(3, {6, ...}). | 2176 |
| `editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon)` | Job : repère les matériaux dont le nom ou le mapTo est en double. Avec skipCommon == false, inclut /vehicles/common, /art et /core. Résultat via jobData(2, {3, nombre, "dummy", liste, isDone}). | 394 |
| `editor_resourceChecker_resourceUtil.verifyVersion(convertdata)` | Job : compte les matériaux de version < 1.5 (anciens) et ceux en 1.5 (PBR) sous un dossier, et liste les anciens avec leur fichier. Charge réellement les fichiers matériaux dans le jeu. Résultat via jobData(2, {2, nbAnciens, liste, nbPBR, isDone}). | 326 |

### Détail des paramètres

#### `editor_resourceChecker_resourceUtil.assetStats(levelname)`

Job : calcule des statistiques de taille des assets d'un niveau (textures, meshes sources et cache, terrains, audio, datablocks, autres) et la liste des fichiers avec leur taille. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}).

- `levelname` (*string*) : Nom du niveau.

#### `editor_resourceChecker_resourceUtil.checkColData(levelname, removal)`

Job : cherche les colmeshes (collision) utilisés dans un niveau (prefabs, forêt, TSStatic). jobData(3, {9, ...}).

- `levelname` (*string*) : Nom du niveau.
- `removal` (*any*) : Non transmis au job (voir notes).

#### `editor_resourceChecker_resourceUtil.checkMatTex(convertdata)`

Job : vérifie les textures référencées par les matériaux (fichiers manquants, chemins incorrects). Résultat via jobData(2, {6, ...}).

- `convertdata` (*string*) : Dossier à analyser.

#### `editor_resourceChecker_resourceUtil.checkTex(convertdata)`

Job : vérifie les fichiers de texture eux-mêmes (par ex. dimensions puissance de deux, voir powerOfTwo). Résultat via jobData(2, {7, ...}).

- `convertdata` (*string*) : Dossier à analyser.

#### `editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal)`

Job : détermine les matériaux d'un niveau qui ne sont utilisés par aucun objet (prefabs, forêt, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stocke le résultat dans matstoRemove. jobData(3, {4, ...}).

- `levelname` (*string*) : Nom du niveau.
- `removal` (*any*) : Option de suppression (déduit du code).

#### `editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal)`

Job : trouve les modèles (shapes) du niveau non utilisés (prefabs, TSStatic, forêt, GroundCover). Stocke le résultat dans shapestoRemove. jobData(3, {5, ...}).

- `levelname` (*string*) : Nom du niveau.
- `removal` (*any*) : Option (déduit du code).

#### `editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal)`

Job : même parcours que checkUnusedMats mais pour lister les matériaux utilisés. jobData(3, {8, ...}).

- `levelname` (*string*) : Nom du niveau.
- `removal` (*any*) : Option (déduit du code).

#### `editor_resourceChecker_resourceUtil.checkmissingMats(convertdata)`

Job : cherche dans les meshes les matériaux référencés mais absents des fichiers de matériaux. Résultat via jobData(2, {8, ...}).

- `convertdata` (*string*) : Dossier à analyser.

#### `editor_resourceChecker_resourceUtil.duplicateData(material)`

Job : parcourt les matériaux de /levels, /vehicles, /art et /core pour trouver les doublons d'un matériau donné.

- `material` (*string*) : Matériau à rechercher ; log E si nil.

#### `editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist)`

Détecte les noms de matériaux en double et les mapTo en double (hors unmapped_mat) dans une liste. Le résultat est stocké dans un état interne du module utilisé par verifyDuplicate.

- `duplicatelist` (*table*) : Table de {nom, mapTo, fichier}.

#### `editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon)`

Job : retire les persistentId des matériaux JSON en les resauvegardant (resaveMaterial). Modifie les fichiers. Résultat via jobData(2, {5, nombre, "", fichiersModifiés, isDone}).

- `convertdata` (*string*) : Dossier à traiter.
- `skipCommon` (*boolean*) : false pour inclure les dossiers communs.

#### `editor_resourceChecker_resourceUtil.getMaterialTexFields(mat)`

Pour un objet Material, renvoie ses champs de type filename non vides, par couche (4 couches pour version 0 ou 1, activeLayers pour 1.5, sinon 1).

- `mat` (*userdata*) : Objet de classe Material.
- **renvoie** : table<string, string>|nil Clés « champ.couche » vers chemin de fichier ; nil (et log E) si ce n'est pas un Material.

#### `editor_resourceChecker_resourceUtil.getProgress()`

Renvoie la progression du job en cours (parmi tous les jobs du module), ou nil si aucun ne tourne.

- **renvoie** : number|nil Progression de 0 à 100.

#### `editor_resourceChecker_resourceUtil.getSimObjects(fileName)`

Parcourt tous les objets de la scène (scenetree.getAllObjects) et renvoie ceux dont getFileName() égale le fichier donné. Sert à retrouver les objets créés en chargeant un fichier de matériaux.

- `fileName` (*string*) : Chemin du fichier source de l'objet (ex. un materials.json).
- **renvoie** : table Liste d'objets SimObject.

#### `editor_resourceChecker_resourceUtil.powerOfTwo(x)`

Teste si un nombre est une puissance de deux (utile pour les dimensions de texture).

- `x` (*number*) : Valeur à tester.
- **renvoie** : boolean false si x est nil ou <= 0 ou n'est pas une puissance de deux.

#### `editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon)`

Job : supprime des fichiers materials.json les matériaux « dummy » (sans Stages ou Stages[1] vide) et réécrit les fichiers. jobData(2, {9, nombre, "dummy", liste, isDone}).

- `convertdata` (*string*) : Dossier à traiter.
- `skipCommon` (*boolean*) : false pour inclure les dossiers communs.

#### `editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData)`

Ouvre un fichier JSON de ForestItemData, retire l'entrée dont shapeFile correspond à shape et réécrit le fichier. Journalise un avertissement si introuvable.

- `shape` (*string*) : Valeur de shapeFile à supprimer.
- `foresData` (*string*) : Chemin du fichier JSON forest.

#### `editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected)`

Job : supprime les éléments inutilisés sélectionnés. item 1 retire des matériaux (matstoRemove), 2 des shapes (shapestoRemove, et entrées forest), 3 des textures (textoRemove). Supprime des fichiers : irréversible. jobData(3, {7, ...}).

- `levelname` (*string*) : Nom du niveau.
- `item` (*integer*) : 1 matériaux, 2 modèles, 3 textures.
- `selected` (*table*) : Table dont les clés sont les entrées sélectionnées à supprimer.

#### `editor_resourceChecker_resourceUtil.resaveMaterial(file)`

Recharge un fichier materials.json, vide le persistentId de chaque Material puis le sauvegarde via un PersistenceManager temporaire. Réécrit le fichier.

- `file` (*string*) : Chemin d'un fichier de matériaux existant.

#### `editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath)`

Job : convertit les fichiers .dds trouvés sous un dossier en .png (convertDDSToPNG) pour ceux qui n'ont pas déjà un .png, en écrivant sous exportpath. jobData(2, {10, nombre, "dummy", fichiers, isDone}).

- `convertdata` (*string*) : Dossier contenant les .dds.
- `exportpath` (*string*) : Préfixe du chemin de sortie des PNG (concaténé avec le dossier et le nom).

#### `editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal)`

Job : trouve les textures non référencées (matériaux, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stocke le résultat dans textoRemove. jobData(3, {6, ...}).

- `levelname` (*string*) : Nom du niveau.
- `removal` (*any*) : Option (déduit du code).

#### `editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon)`

Job : repère les matériaux dont le nom ou le mapTo est en double. Avec skipCommon == false, inclut /vehicles/common, /art et /core. Résultat via jobData(2, {3, nombre, "dummy", liste, isDone}).

- `convertdata` (*string*) : Dossier à analyser.
- `skipCommon` (*boolean*) : false pour inclure les dossiers communs.

#### `editor_resourceChecker_resourceUtil.verifyVersion(convertdata)`

Job : compte les matériaux de version < 1.5 (anciens) et ceux en 1.5 (PBR) sous un dossier, et liste les anciens avec leur fichier. Charge réellement les fichiers matériaux dans le jeu. Résultat via jobData(2, {2, nbAnciens, liste, nbPBR, isDone}).

- `convertdata` (*string*) : Dossier à analyser (niveau ou véhicule).

## Champs

| Champ | Type | Description |
|---|---|---|
| `checkColDataworkJob` | any | Exporté mais nil (voir notes) : handle du job checkColData. |
| `checkUnusedMatsworkJob` | any | Exporté mais nil (voir notes) : handle du job checkUnusedMats. |
| `checkUnusedModelsworkJob` | any | Exporté mais nil (voir notes) : handle du job checkUnusedModels. |
| `checkUsedMatsworkJob` | any | Exporté mais nil (voir notes) : handle du job checkUsedMats. |
| `duplicateDataworkJob` | any | Exporté mais nil (voir notes) : handle du job duplicateData. |
| `matstoRemove` | table | Liste des matériaux inutilisés trouvés par checkUnusedMats ; remplacée par M.matstoRemove à la fin du job. Utilisée ensuite par removeUnused (item 1). |
| `removeDummyworkJob` | any | Exporté mais nil (voir notes) : handle du job removeDummy. |
| `shapestoRemove` | table | Liste des modèles (shapes) inutilisés trouvés par checkUnusedModels ; utilisée par removeUnused (item 2). |
| `textoRemove` | table | Liste des textures inutilisées trouvées par unusedTextures ; utilisée par removeUnused (item 3). |
| `textureExporterworkJob` | any | Exporté mais nil (voir notes) : handle du job textureExporter. |
| `unusedTexturesworkJob` | any | Exporté mais nil (voir notes) : handle du job unusedTextures. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `isLinkFile`, `removeFile`, `stat`
- `obj:` `getField`, `getFields`, `getFileName`, `getName`
- `scenetree.` `findClassObjects`, `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/resourceChecker/resourceUtil.lua`.*

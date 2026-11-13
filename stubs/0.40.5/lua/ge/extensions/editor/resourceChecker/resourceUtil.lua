---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/resourceChecker/resourceUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur de l'outil Resource Checker de l'éditeur : analyse les matériaux, textures, meshes et assets d'un niveau ou d'un véhicule (versions de matériaux, doublons, persistentId, textures manquantes ou non puissance de deux, matériaux/modèles/textures inutilisés, dummies, colmeshes, export DDS vers PNG, statistiques de taille). Chaque vérification tourne dans un job (extensions.core_jobsystem.create) qui met à jour une progression et renvoie son résultat à l'UI via extensions.editor_resourceChecker.jobData(canal, {type, compte, ..., isDone}). Plusieurs fonctions modifient ou suppriment des fichiers (fixPID, removeDummy, removeUnused, textureExporter) : à utiliser avec précaution.
--- Accès : extension `editor_resourceChecker_resourceUtil` : `extensions.load("editor_resourceChecker_resourceUtil")`, puis la globale `editor_resourceChecker_resourceUtil`
---@class editor_resourceChecker_resourceUtil
---@field checkColDataworkJob any Exporté mais nil (voir notes) : handle du job checkColData.
---@field checkUnusedMatsworkJob any Exporté mais nil (voir notes) : handle du job checkUnusedMats.
---@field checkUnusedModelsworkJob any Exporté mais nil (voir notes) : handle du job checkUnusedModels.
---@field checkUsedMatsworkJob any Exporté mais nil (voir notes) : handle du job checkUsedMats.
---@field duplicateDataworkJob any Exporté mais nil (voir notes) : handle du job duplicateData.
---@field matstoRemove table Liste des matériaux inutilisés trouvés par checkUnusedMats ; remplacée par M.matstoRemove à la fin du job. Utilisée ensuite par removeUnused (item 1).
---@field removeDummyworkJob any Exporté mais nil (voir notes) : handle du job removeDummy.
---@field shapestoRemove table Liste des modèles (shapes) inutilisés trouvés par checkUnusedModels ; utilisée par removeUnused (item 2).
---@field textoRemove table Liste des textures inutilisées trouvées par unusedTextures ; utilisée par removeUnused (item 3).
---@field textureExporterworkJob any Exporté mais nil (voir notes) : handle du job textureExporter.
---@field unusedTexturesworkJob any Exporté mais nil (voir notes) : handle du job unusedTextures.
editor_resourceChecker_resourceUtil = {}

--- Job : calcule des statistiques de taille des assets d'un niveau (textures, meshes sources et cache, terrains, audio, datablocks, autres) et la liste des fichiers avec leur taille. jobData(3, {typeId, breakdown, totals, sceneCounts, isDone, {files = ...}}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2778
---@param levelname string Nom du niveau.
function editor_resourceChecker_resourceUtil.assetStats(levelname) end

--- Job : cherche les colmeshes (collision) utilisés dans un niveau (prefabs, forêt, TSStatic). jobData(3, {9, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1739
---@param levelname string Nom du niveau.
---@param removal any Non transmis au job (voir notes).
function editor_resourceChecker_resourceUtil.checkColData(levelname, removal) end

--- Job : liste les ForestItemData de la scène. Résultat via jobData(3, {2, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:944
function editor_resourceChecker_resourceUtil.checkForest() end

--- Job : vérifie les textures référencées par les matériaux (fichiers manquants, chemins incorrects). Résultat via jobData(2, {6, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:588
---@param convertdata string Dossier à analyser.
function editor_resourceChecker_resourceUtil.checkMatTex(convertdata) end

--- Job : liste les shapes utilisées par les TSStatic de la scène. Résultat via jobData(3, {1, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:875
function editor_resourceChecker_resourceUtil.checkStatic() end

--- Job : liste les TerrainBlock de la scène. Résultat via jobData(3, {3, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:993
function editor_resourceChecker_resourceUtil.checkTerrains() end

--- Job : vérifie les fichiers de texture eux-mêmes (par ex. dimensions puissance de deux, voir powerOfTwo). Résultat via jobData(2, {7, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:715
---@param convertdata string Dossier à analyser.
function editor_resourceChecker_resourceUtil.checkTex(convertdata) end

--- Job : détermine les matériaux d'un niveau qui ne sont utilisés par aucun objet (prefabs, forêt, TSStatic, terrains, GroundPlane, GroundCover, DecalRoad, MeshRoad, DecalData). Stocke le résultat dans matstoRemove. jobData(3, {4, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1277
---@param levelname string Nom du niveau.
---@param removal any Option de suppression (déduit du code).
function editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal) end

--- Job : trouve les modèles (shapes) du niveau non utilisés (prefabs, TSStatic, forêt, GroundCover). Stocke le résultat dans shapestoRemove. jobData(3, {5, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1937
---@param levelname string Nom du niveau.
---@param removal any Option (déduit du code).
function editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal) end

--- Job : même parcours que checkUnusedMats mais pour lister les matériaux utilisés. jobData(3, {8, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1593
---@param levelname string Nom du niveau.
---@param removal any Option (déduit du code).
function editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal) end

--- Job : cherche dans les meshes les matériaux référencés mais absents des fichiers de matériaux. Résultat via jobData(2, {8, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:803
---@param convertdata string Dossier à analyser.
function editor_resourceChecker_resourceUtil.checkmissingMats(convertdata) end

--- Job : parcourt les matériaux de /levels, /vehicles, /art et /core pour trouver les doublons d'un matériau donné.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2378
---@param material string Matériau à rechercher ; log E si nil.
function editor_resourceChecker_resourceUtil.duplicateData(material) end

--- Détecte les noms de matériaux en double et les mapTo en double (hors unmapped_mat) dans une liste. Le résultat est stocké dans un état interne du module utilisé par verifyDuplicate.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:236
---@param duplicatelist table Table de {nom, mapTo, fichier}.
function editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist) end

--- Job : retire les persistentId des matériaux JSON en les resauvegardant (resaveMaterial). Modifie les fichiers. Résultat via jobData(2, {5, nombre, "", fichiersModifiés, isDone}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:448
---@param convertdata string Dossier à traiter.
---@param skipCommon boolean false pour inclure les dossiers communs.
function editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon) end

--- Pour un objet Material, renvoie ses champs de type filename non vides, par couche (4 couches pour version 0 ou 1, activeLayers pour 1.5, sinon 1).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:206
---@param mat userdata Objet de classe Material.
---@return table<string, string>|nil  Clés « champ.couche » vers chemin de fichier ; nil (et log E) si ce n'est pas un Material.
function editor_resourceChecker_resourceUtil.getMaterialTexFields(mat) end

--- Renvoie la progression du job en cours (parmi tous les jobs du module), ou nil si aucun ne tourne.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2783
---@return number|nil  Progression de 0 à 100.
function editor_resourceChecker_resourceUtil.getProgress() end

--- Parcourt tous les objets de la scène (scenetree.getAllObjects) et renvoie ceux dont getFileName() égale le fichier donné. Sert à retrouver les objets créés en chargeant un fichier de matériaux.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:145
---@param fileName string Chemin du fichier source de l'objet (ex. un materials.json).
---@return table  Liste d'objets SimObject.
function editor_resourceChecker_resourceUtil.getSimObjects(fileName) end

--- Hook de chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2897
function editor_resourceChecker_resourceUtil.onExtensionLoaded() end

--- Hook de déchargement ; appelle extensions.unload('extensions.editor_resourceChecker_resourceUtil').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:140
function editor_resourceChecker_resourceUtil.onExtensionUnloaded() end

--- Teste si un nombre est une puissance de deux (utile pour les dimensions de texture).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:177
---@param x number Valeur à tester.
---@return boolean  false si x est nil ou <= 0 ou n'est pas une puissance de deux.
function editor_resourceChecker_resourceUtil.powerOfTwo(x) end

--- Job : supprime des fichiers materials.json les matériaux « dummy » (sans Stages ou Stages[1] vide) et réécrit les fichiers. jobData(2, {9, nombre, "dummy", liste, isDone}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2447
---@param convertdata string Dossier à traiter.
---@param skipCommon boolean false pour inclure les dossiers communs.
function editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon) end

--- Ouvre un fichier JSON de ForestItemData, retire l'entrée dont shapeFile correspond à shape et réécrit le fichier. Journalise un avertissement si introuvable.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:186
---@param shape string Valeur de shapeFile à supprimer.
---@param foresData string Chemin du fichier JSON forest.
function editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData) end

--- Job : supprime les éléments inutilisés sélectionnés. item 1 retire des matériaux (matstoRemove), 2 des shapes (shapestoRemove, et entrées forest), 3 des textures (textoRemove). Supprime des fichiers : irréversible. jobData(3, {7, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2329
---@param levelname string Nom du niveau.
---@param item integer 1 matériaux, 2 modèles, 3 textures.
---@param selected table Table dont les clés sont les entrées sélectionnées à supprimer.
function editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected) end

--- Recharge un fichier materials.json, vide le persistentId de chaque Material puis le sauvegarde via un PersistenceManager temporaire. Réécrit le fichier.
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:157
---@param file string Chemin d'un fichier de matériaux existant.
function editor_resourceChecker_resourceUtil.resaveMaterial(file) end

--- Demande l'arrêt de tous les jobs en cours en mettant job.stop = true ; les jobs s'arrêtent à leur prochain point de contrôle (abort).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2840
function editor_resourceChecker_resourceUtil.stopProgress() end

--- Job : convertit les fichiers .dds trouvés sous un dossier en .png (convertDDSToPNG) pour ceux qui n'ont pas déjà un .png, en écrivant sous exportpath. jobData(2, {10, nombre, "dummy", fichiers, isDone}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2492
---@param convertdata string Dossier contenant les .dds.
---@param exportpath string Préfixe du chemin de sortie des PNG (concaténé avec le dossier et le nom).
function editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath) end

--- Job : trouve les textures non référencées (matériaux, TerrainMaterials, WaterPlane/Block, River, CloudLayer, ScatterSky, Cubemap, Info). Stocke le résultat dans textoRemove. jobData(3, {6, ...}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2176
---@param levelname string Nom du niveau.
---@param removal any Option (déduit du code).
function editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal) end

--- Job : repère les matériaux dont le nom ou le mapTo est en double. Avec skipCommon == false, inclut /vehicles/common, /art et /core. Résultat via jobData(2, {3, nombre, "dummy", liste, isDone}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:394
---@param convertdata string Dossier à analyser.
---@param skipCommon boolean false pour inclure les dossiers communs.
function editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon) end

--- Job : compte les matériaux de version < 1.5 (anciens) et ceux en 1.5 (PBR) sous un dossier, et liste les anciens avec leur fichier. Charge réellement les fichiers matériaux dans le jeu. Résultat via jobData(2, {2, nbAnciens, liste, nbPBR, isDone}).
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:326
---@param convertdata string Dossier à analyser (niveau ou véhicule).
function editor_resourceChecker_resourceUtil.verifyVersion(convertdata) end


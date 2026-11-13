---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des textures du système de decals dynamiques de l'éditeur. Scanne /art/dynamicDecals/textures (*.jpg et *.png), lit/écrit pour chacune un fichier « sidecar » <texture>.dynDecalTexture.json (version, type, isSdfCompatible, tags, vehicle), tient les index de tags et migre les sidecars anciens via editor_api_dynamicDecals_sidecarFileMigration. Un sidecar manquant est créé à partir d'un modèle par défaut.
--- Accès : extension `editor_api_dynamicDecals_textures` : `extensions.load("editor_api_dynamicDecals_textures")`, puis la globale `editor_api_dynamicDecals_textures`
---@class editor_api_dynamicDecals_textures
---@field textureType table<string, integer> greyscale=0, color=1, sdf=2 (obsolète), fillTexture=3
editor_api_dynamicDecals_textures = {}

--- Renvoie une copie de la liste des textures dont le sidecar manquait au dernier scan, puis vide la liste interne.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:282
---@return string[]  Chemins de textures
function editor_api_dynamicDecals_textures.getAndFlushMissingSidecarFiles() end

--- Modèle de sidecar par défaut (version 2, type color, isSdfCompatible=false, tags vide, vehicle vide).
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:281
---@return table  Modèle (table partagée, à copier avant modification)
function editor_api_dynamicDecals_textures.getSidecarTemplate() end

--- Liste des tags distincts connus.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:290
---@return string[]|nil  Tags (nil avant le premier scan)
function editor_api_dynamicDecals_textures.getTags() end

--- Table tag -> liste des textures portant ce tag.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:291
---@return table<string, string[]>|nil  Index des tags
function editor_api_dynamicDecals_textures.getTagsWithRefs() end

--- Liste des chemins de textures connues (nil avant le premier scan).
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:280
---@return string[]|nil  Chemins
function editor_api_dynamicDecals_textures.getTextureFiles() end

--- Dossier des textures avec slash final : /art/dynamicDecals/textures/.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:292
---@return string  Chemin
function editor_api_dynamicDecals_textures.getTexturesDirectoryPath() end

--- Hook de surveillance de fichiers. Pour un png/jpg sous le dossier des textures : 'added'/'modified' ajoute la texture (crée son sidecar si absent) et émet dynamicDecals_onTextureFileAdded(filepath) ; 'deleted' retire ses tags et la texture, et émet dynamicDecals_onTextureFileDeleted(filepath).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:244
---@param filepath string Fichier modifié
---@param type string 'added', 'modified' ou 'deleted'
function editor_api_dynamicDecals_textures.onFileChanged(filepath, type) end

--- Lit le sidecar JSON d'une texture, nil s'il n'existe pas.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:76
---@param textureFilepath string Chemin de la texture
---@return table|nil  Contenu du sidecar
function editor_api_dynamicDecals_textures.readSidecarFile(textureFilepath) end

--- Redécouvre toutes les textures, reconstruit les tags, migre les sidecars de version < 2 et crée les sidecars manquants (listés dans missingSidecarFiles).
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:111
function editor_api_dynamicDecals_textures.reloadTextureFiles() end

--- Équivalent yieldant de reloadTextureFiles, pour un job : la découverte et chaque texture traitée appellent callbacks.yield.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:162
---@param callbacks table yield(section) pendant la découverte et après chaque fichier ; onTotal(total) nombre de textures trouvées ; onProgress(count) textures traitées depuis le dernier appel
function editor_api_dynamicDecals_textures.reloadTextureFilesAsync(callbacks) end

--- Récupère l'extension de migration, scanne les textures (bloquant) et crée le dossier de textures s'il manque.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:229
function editor_api_dynamicDecals_textures.setup() end

--- Version de setup() à exécuter dans un job (jobsystem) : le scan est réparti sur plusieurs frames. Les callbacks sont transmis à reloadTextureFilesAsync.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:237
---@param callbacks table yield, onTotal, onProgress (voir reloadTextureFilesAsync)
function editor_api_dynamicDecals_textures.setupAsync(callbacks) end

--- Teste l'existence du sidecar d'une texture.
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:72
---@param textureFilepath string Chemin de la texture
---@return boolean  true si le sidecar existe
function editor_api_dynamicDecals_textures.sidecarFileExists(textureFilepath) end

--- Écrit le sidecar et met à jour les index de tags (retire les anciens tags de la texture, ajoute les nouveaux).
---Source : lua/ge/extensions/editor/api/dynamicDecals/textures.lua:84
---@param textureFilepath string Chemin de la texture
---@param data table Contenu du sidecar (voir getSidecarTemplate)
function editor_api_dynamicDecals_textures.updateSidecarFile(textureFilepath, data) end


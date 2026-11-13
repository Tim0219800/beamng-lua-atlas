---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dataBlock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour gérer les datablocks du moteur (objets de données partagés : sons, particules, matériaux physiques…). initialize(editor) ajoute les fonctions de création, recherche, sauvegarde et suppression sur l'objet editor ; la persistance passe par un PersistenceManager nommé dataBlockPersistMan. Fichier par défaut : art/datablocks/managedDatablocks.json.
--- Accès : extension `editor_api_dataBlock` : `extensions.load("editor_api_dataBlock")`, puis la globale `editor_api_dataBlock`
---@class editor_api_dataBlock
editor_api_dataBlock = {}

--- Crée le PersistenceManager dataBlockPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dataBlock.lua:99
---@param editorInstance table Objet editor
function editor_api_dataBlock.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet editor par initialize.
---@class editor_api_dataBlock_editor
local editor_api_dataBlock_editor = {}

--- Crée un datablock du type donné, copie éventuellement les champs d'un existant, l'enregistre, le nomme, l'ajoute au groupe dataBlockGroup et au set de datablocks, puis le marque modifié pour le fichier.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:13
---@param name string|nil Nom unique
---@param type string Type (classe) du datablock
---@param copyFrom string|nil Nom d'un datablock dont copier les champs (ignoré si nil ou vide)
---@param filename string|nil Fichier cible, défaut art/datablocks/managedDatablocks.json
---@return integer  ID de l'objet créé
function editor_api_dataBlock_editor.createDataBlock(name, type, copyFrom, filename) end

--- Cherche un datablock par son nom en parcourant le set.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:92
---@param name string Nom recherché
---@return userdata|nil  Datablock trouvé ou nil
function editor_api_dataBlock_editor.findDataBlock(name) end

--- Renvoie le set de tous les datablocks (Sim.getDataBlockSet()).
---Source : lua/ge/extensions/editor/api/dataBlock.lua:86
---@return userdata  SimSet de datablocks
function editor_api_dataBlock_editor.getDataBlocks() end

--- Indique si le datablock a été modifié.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:75
---@param dataBlock userdata Objet datablock
---@return boolean  true si modifié
function editor_api_dataBlock_editor.isDataBlockDirty(dataBlock) end

--- Retire le datablock du set et, s'il a un nom de fichier, le supprime de son fichier.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:51
---@param dataBlock userdata Objet datablock
function editor_api_dataBlock_editor.removeDataBlockFromFile(dataBlock) end

--- Associe le datablock à un fichier (par défaut son fichier actuel) puis le sauvegarde immédiatement.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:69
---@param dataBlock userdata Objet datablock
---@param filename string|nil Fichier cible
function editor_api_dataBlock_editor.saveDataBlockToFile(dataBlock, filename) end

--- Sauvegarde le datablock s'il est modifié.
---Source : lua/ge/extensions/editor/api/dataBlock.lua:45
---@param dataBlock userdata Objet datablock
function editor_api_dataBlock_editor.saveDirtyDataBlock(dataBlock) end

--- Marque le datablock comme modifié (fichier = son fichier, sinon le fichier par défaut).
---Source : lua/ge/extensions/editor/api/dataBlock.lua:81
---@param dataBlock userdata Objet datablock
function editor_api_dataBlock_editor.setDataBlockDirty(dataBlock) end


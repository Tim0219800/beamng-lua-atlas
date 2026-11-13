---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/material.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour manipuler les matériaux (objets `Material`, fichiers materials.json) : création, copie, déplacement vers un autre fichier, modification d'une propriété, suppression. `initialize` installe les fonctions sur l'objet `editor`. Les écritures disque passent par le PersistenceManager `scenetree.matLuaEd_PersistMan` ; la suppression d'une entrée JSON se fait par manipulation de texte pour ne pas réordonner tout le fichier (jsonWriteFile trie les clés).
--- Accès : extension `editor_api_material` : `extensions.load("editor_api_material")`, puis la globale `editor_api_material`
---@class editor_api_material
editor_api_material = {}

--- Enregistre un PersistenceManager 'materialPersistMan' s'il n'existe pas, mémorise l'éditeur et y installe createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/material.lua:369
---@param editorInstance table objet `editor`
function editor_api_material.initialize(editorInstance) end

--- Fonctions ajoutées à `editor` par initialize.
---@class editor_api_material_editor
local editor_api_material_editor = {}

--- Copie tous les paramètres (toutes couches et champs dynamiques) d'un matériau source sur un matériau cible existant, en gardant nom, mapTo et fichier de la cible. La cible doit être dans un .json ; elle est rechargée et sauvegardée.
---Source : lua/ge/extensions/editor/api/material.lua:285
---@param source table|string Material source ou nom
---@param target table|string Material cible ou nom
---@return boolean  false si l'un n'est pas un Material, si source = cible ou si la cible n'est pas dans un json
function editor_api_material_editor.copyMaterial(source, target) end

--- Copie un matériau dans un nouveau matériau (name et mapTo = newName) écrit dans le fichier donné.
---Source : lua/ge/extensions/editor/api/material.lua:315
---@param source table|string Material source ou nom
---@param newName string nom du nouveau matériau (non vide, non utilisé)
---@param newFilename string fichier materials.json de destination (dossier existant)
---@return boolean  true si créé
function editor_api_material_editor.copyMaterialAsNew(source, newName, newFilename) end

--- Crée un nouveau Material (version 1.5) et l'écrit sur disque. Échoue si le nom est vide, déjà pris, ou si le dossier n'existe pas. Si mapTo est vide, le nom du matériau est utilisé.
---Source : lua/ge/extensions/editor/api/material.lua:12
---@param materialName string nom du matériau
---@param materialFilename string chemin du materials.json à écrire
---@param materialMapTo string valeur mapTo (nom de matériau du mesh)
---@return boolean  true si créé
function editor_api_material_editor.createMaterial(materialName, materialFilename, materialMapTo) end

--- Supprime l'objet Material de la scène et son entrée dans son fichier JSON (via removeMaterialFromJson).
---Source : lua/ge/extensions/editor/api/material.lua:351
---@param material table|string Material ou son nom
---@return boolean  true si c'était un Material
function editor_api_material_editor.deleteMaterial(material) end

--- Déplace un matériau vers un autre fichier (le sauvegarde dans le nouveau) puis retire son entrée de l'ancien fichier s'il s'agissait d'un .json existant.
---Source : lua/ge/extensions/editor/api/material.lua:188
---@param material table|string Material ou son nom
---@param newFilename string fichier de destination (dossier existant requis)
---@return boolean  false si pas un Material, même fichier ou dossier inexistant
function editor_api_material_editor.moveMaterial(material, newFilename) end

--- Supprime l'entrée de premier niveau `materialName` d'un fichier materials.json par édition de texte (gère les virgules, indépendant de l'indentation) et réécrit le fichier. Logue une erreur/avertissement et ne renvoie rien si le fichier ou l'entrée est introuvable.
---Source : lua/ge/extensions/editor/api/material.lua:79
---@param materialName string clé du matériau à retirer
---@param materialFilename string chemin du fichier JSON
function editor_api_material_editor.removeMaterialFromJson(materialName, materialFilename) end

--- Fixe un champ du matériau sur une couche puis recharge le matériau (ne sauvegarde pas sur disque).
---Source : lua/ge/extensions/editor/api/material.lua:60
---@param material table|string Material ou son nom
---@param property string nom du champ
---@param layer integer index de couche (0 à 3)
---@param value string valeur au format texte du champ
---@return boolean  true si l'objet est un Material
function editor_api_material_editor.setMaterialProperty(material, property, layer, value) end


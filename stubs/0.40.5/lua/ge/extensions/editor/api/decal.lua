---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour les decals de terrain/objets (Engine.Render.DecalMgr) : création et suppression de templates (DecalData), ajout/suppression d'instances, recherche et sauvegarde. initialize(editor) crée le PersistenceManager decalPersistMan et ajoute les fonctions sur editor. Les templates sont sauvés dans art/decals/managedDecalData.json du dossier de la mission, les instances dans main.decals.json.
--- Accès : extension `editor_api_decal` : `extensions.load("editor_api_decal")`, puis la globale `editor_api_decal`
---@class editor_api_decal
editor_api_decal = {}

--- Crée decalPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/decal.lua:133
---@param editorInstance table Objet editor
function editor_api_decal.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet editor par initialize.
---@class editor_api_decal_editor
local editor_api_decal_editor = {}

--- Ajoute une instance de decal orientée par une normale et une rotation autour de celle-ci.
---Source : lua/ge/extensions/editor/api/decal.lua:55
---@param pos vec3 Position
---@param normal vec3 Normale
---@param rotAroundNormal number Rotation autour de la normale
---@param template userdata Template DecalData
---@param decalScale number|nil Échelle, 1 par défaut
---@param decalTexIndex integer|nil Index de texture, -1 par défaut
---@param flags integer|nil Drapeaux, 0 par défaut
---@param initialAlpha number|nil Alpha initial, 1 par défaut
---@return userdata  Instance créée
function editor_api_decal_editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha) end

--- Comme addDecalInstance mais orientée par un vecteur tangent.
---Source : lua/ge/extensions/editor/api/decal.lua:62
---@param pos vec3 Position
---@param normal vec3 Normale
---@param tangent vec3 Tangente
---@param template userdata Template DecalData
---@param decalScale number|nil Échelle, 1 par défaut
---@param decalTexIndex integer|nil Index de texture, -1 par défaut
---@param flags integer|nil Drapeaux, 0 par défaut
---@param initialAlpha number|nil Alpha initial, 1 par défaut
---@return userdata  Instance créée
function editor_api_decal_editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha) end

--- Comme addDecalInstanceWithTan mais en imposant l'index de l'instance.
---Source : lua/ge/extensions/editor/api/decal.lua:69
---@param pos vec3 Position
---@param normal vec3 Normale
---@param tangent vec3 Tangente
---@param template userdata Template DecalData
---@param decalScale number|nil Échelle, 1 par défaut
---@param decalTexIndex integer|nil Index de texture, -1 par défaut
---@param flags integer|nil Drapeaux, 0 par défaut
---@param initialAlpha number|nil Alpha initial, 1 par défaut
---@param index integer Index imposé (déduit du code)
---@return userdata  Instance créée
function editor_api_decal_editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index) end

--- Crée un DecalData au nom unique NewTemplate (matériau WarningMaterial), le marque modifié pour le fichier de decals.
---Source : lua/ge/extensions/editor/api/decal.lua:18
---@return integer  ID du template
function editor_api_decal_editor.createDecalTemplate() end

--- Supprime une instance et marque l'éditeur modifié.
---Source : lua/ge/extensions/editor/api/decal.lua:94
---@param instance userdata Instance
function editor_api_decal_editor.deleteDecalInstance(instance) end

--- Supprime toutes les instances utilisant ce template, retire le template du set et le met en file pour suppression au prochain saveDecals.
---Source : lua/ge/extensions/editor/api/decal.lua:34
---@param template userdata Template DecalData
function editor_api_decal_editor.deleteDecalTemplate(template) end

--- Renvoie le decal le plus proche d'une position.
---Source : lua/ge/extensions/editor/api/decal.lua:99
---@param pos vec3 Position
---@return userdata|nil  Instance la plus proche
function editor_api_decal_editor.getClosestDecal(pos) end

--- Chemin du fichier des templates : dossier de la mission + art/decals/managedDecalData.json.
---Source : lua/ge/extensions/editor/api/decal.lua:10
---@return string  Chemin
function editor_api_decal_editor.getDecalDataFilePath() end

--- Renvoie l'instance d'index donné, ou nil si invalide.
---Source : lua/ge/extensions/editor/api/decal.lua:76
---@param index integer Index
---@return userdata|nil  Instance
function editor_api_decal_editor.getDecalInstance(index) end

--- Renvoie l'instance d'uid donné, ou nil si invalide.
---Source : lua/ge/extensions/editor/api/decal.lua:83
---@param uid integer Uid
---@return userdata|nil  Instance
function editor_api_decal_editor.getDecalInstanceByUid(uid) end

--- Nombre d'emplacements du tableau d'instances.
---Source : lua/ge/extensions/editor/api/decal.lua:90
---@return integer  Taille
function editor_api_decal_editor.getDecalInstanceVecSize() end

--- Renvoie le set de templates (DecalMgr.getSet()).
---Source : lua/ge/extensions/editor/api/decal.lua:47
---@return userdata  SimSet de templates
function editor_api_decal_editor.getDecalTemplates() end

--- Indique si des templates ont des modifications non sauvegardées.
---Source : lua/ge/extensions/editor/api/decal.lua:51
---@return boolean  true si modifiés
function editor_api_decal_editor.hasDirtyDecalTemplates() end

--- Indique si le decal/template a des modifications non sauvegardées.
---Source : lua/ge/extensions/editor/api/decal.lua:108
---@param decal userdata Template
---@return boolean  true si modifié
function editor_api_decal_editor.isDecalDirty(decal) end

--- Prévient le moteur qu'une instance a changé et marque l'éditeur modifié.
---Source : lua/ge/extensions/editor/api/decal.lua:103
---@param instance userdata Instance
function editor_api_decal_editor.notifyDecalModified(instance) end

--- Sauvegarde un template modifié.
---Source : lua/ge/extensions/editor/api/decal.lua:112
---@param template userdata Template
function editor_api_decal_editor.saveDecal(template) end

--- Purge les templates mis en file pour suppression, sauvegarde les templates modifiés et écrit les instances dans main.decals.json du dossier de la mission.
---Source : lua/ge/extensions/editor/api/decal.lua:116
function editor_api_decal_editor.saveDecals() end


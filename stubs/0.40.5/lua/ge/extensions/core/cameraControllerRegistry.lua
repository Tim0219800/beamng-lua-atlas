---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraControllerRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Couche de routage facultative placée devant le chemin d'entrée caméra. Des 'contrôleurs' enregistrés (par id, avec priorité) peuvent consommer certaines entrées (ex. onRelativeInput, onEditorMouseWheel) quand ils sont actifs ; ce qui n'est pas consommé continue vers la caméra active comme avant. Se charge avec require('core/cameraControllerRegistry') (ce n'est pas une extension). Utilisé par core/cameraInput.lua. Un moddeur l'utilise pour intercepter la souris/molette (ex. outil d'édition de caméra) sans casser les caméras normales.
--- Accès : extension `core_cameraControllerRegistry` : `extensions.load("core_cameraControllerRegistry")`, puis la globale `core_cameraControllerRegistry`
---@class core_cameraControllerRegistry
core_cameraControllerRegistry = {}

--- Prend la capture exclusive des entrées pour ce contrôleur (voir notes pour les conditions).
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:70
---@param id string Identifiant d'un contrôleur enregistré
---@return boolean  true si la capture est (ou était déjà) à ce contrôleur
function core_cameraControllerRegistry.acquire(id) end

--- Envoie un évènement aux contrôleurs : au propriétaire de la capture seul s'il y en a un, sinon à tous dans l'ordre jusqu'à ce que l'un renvoie true.
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:51
---@param method string Nom de la méthode à appeler sur les contrôleurs
---@param ... any Arguments passés à la méthode
---@return boolean  true si un contrôleur a consommé l'évènement
function core_cameraControllerRegistry.dispatch(method, ...) end

--- Teste si ce contrôleur détient la capture.
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:88
---@param id string Identifiant
---@return boolean  true si propriétaire
function core_cameraControllerRegistry.isOwner(id) end

--- Teste si l'id est enregistré (et, si controller est donné, qu'il s'agit de ce contrôleur).
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:92
---@param id string Identifiant
---@param controller table|nil Contrôleur attendu
---@return boolean  true si enregistré
function core_cameraControllerRegistry.isRegistered(id, controller) end

--- Enregistre un contrôleur. Échoue (false) si l'id n'est pas une chaîne non vide, si controller n'est pas une table ou si l'id existe déjà.
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:31
---@param id string Identifiant unique
---@param controller table Table de callbacks nommés
---@param priority number|nil Priorité (plus grand = appelé en premier), 0 par défaut
---@return boolean  true si enregistré
function core_cameraControllerRegistry.register(id, controller, priority) end

--- Relâche la capture si ce contrôleur la détient.
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:82
---@param id string Identifiant
---@return boolean  true si relâchée
function core_cameraControllerRegistry.release(id) end

--- Retire un contrôleur. Si controller est donné, il doit correspondre à celui enregistré. Libère la capture si besoin.
---Source : lua/ge/extensions/core/cameraControllerRegistry.lua:42
---@param id string Identifiant
---@param controller table|nil Contrôleur attendu (vérification facultative)
---@return boolean  true si retiré
function core_cameraControllerRegistry.unregister(id, controller) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/guiInstancer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur du module. Champs : `instances` (table index -> {locked}), `nextInstanceIndex` (integer).
---@class editor_api_guiInstancer
local editor_api_guiInstancer = {}

--- Ajoute une instance `{ locked = false }` et renvoie son index. Repart de 1 si aucune instance n'existe.
---Source : lua/ge/extensions/editor/api/guiInstancer.lua:12
---@return integer  index de la nouvelle instance
function editor_api_guiInstancer:addInstance() end

--- Restaure `instances` et `nextInstanceIndex` depuis `state[name]` s'il existe (défauts `{}` et 1).
---Source : lua/ge/extensions/editor/api/guiInstancer.lua:29
---@param name string clé de l'état sauvegardé
---@param state table table d'état sauvegardée
function editor_api_guiInstancer:deserialize(name, state) end

--- Initialise `instances` à vide et `nextInstanceIndex` à 1. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/guiInstancer.lua:7
function editor_api_guiInstancer:init() end

--- Supprime l'instance à l'index donné (met la case à nil).
---Source : lua/ge/extensions/editor/api/guiInstancer.lua:21
---@param instanceIndex integer index renvoyé par addInstance
function editor_api_guiInstancer:removeInstance(instanceIndex) end

--- Écrit `{ instances, nextInstanceIndex }` dans `state[name]` pour la sauvegarde de l'état de l'éditeur.
---Source : lua/ge/extensions/editor/api/guiInstancer.lua:25
---@param name string clé sous laquelle stocker l'état
---@param state table table d'état à remplir
function editor_api_guiInstancer:serialize(name, state) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/prefabModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 50) qui fait apparaître, suit et supprime des prefabs (groupes d'objets de scène .prefab.json) pendant un projet. À l'ajout d'un prefab, il recense tous les objets enfants par classe, mémorise les transformations des véhicules, détecte si des colliders ou des waypoints / routes (navgraph) sont contenus, puis recharge la collision (be:reloadCollision) et le navgraph (map.reset) au bon moment. À l'arrêt, il supprime tous les prefabs non marqués dontDelete.
--- Accès : `require("extensions/flowgraph/modules/prefabModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_prefabModule
flowgraph_modules_prefabModule = {}

--- Suit un prefab existant de la scène : recense ses enfants, ses véhicules, détecte colliders et navgraph et programme les rechargements nécessaires. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab dans la scène
---@param moreData table|nil champs copiés dans les données ; skipCollisionReload, skipNavgraphReload
function flowgraph_modules_prefabModule.addPrefab(id, moreData) end

--- Appelé après le tick du graphe : recharge la collision et reconstruit le navgraph (map.reset, sauf pendant un chargement) si les drapeaux sont levés. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.afterTrigger() end

--- Vide prefabs, flags et sortedIds. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.clear() end

--- Supprime le prefab (sauf dontDelete sans force), le retire du suivi et programme un rechargement de collision s'il en contenait. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@param force boolean|nil ignorer dontDelete
function flowgraph_modules_prefabModule.deletePrefab(id, force) end

--- Appelé à l'arrêt du projet : supprime tous les prefabs suivis non marqués dontDelete, recharge collision et navgraph si nécessaire, puis appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.executionStopped() end

--- Renvoie les données du prefab suivi, ou une table vide. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@return table  données du prefab
function flowgraph_modules_prefabModule.getPrefab(id) end

--- Renvoie les ids de véhicules contenus dans le prefab, triés. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@return integer[]  ids
function flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id) end

--- Crée les tables prefabs, sortedIds, flags puis appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
function flowgraph_modules_prefabModule.init() end

--- Calcule {pos, rot, up} de chaque véhicule (BeamNGVehicle) du prefab et les ajoute au module vehicle du manager. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param data table données du prefab, avec allChildrenIds
---@return table<integer, table>  transformations par id de véhicule
function flowgraph_modules_prefabModule.originalVehicleTransforms(data) end

--- Replace les véhicules du prefab à leur position et rotation d'origine et réinitialise la physique et les déformations. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
function flowgraph_modules_prefabModule.restoreVehiclePositions(id) end

--- Marque le prefab comme à conserver à l'arrêt du projet (dontDelete). Avertit si le prefab n'est pas suivi. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@param keep boolean conserver
function flowgraph_modules_prefabModule.setKeepPrefab(id, keep) end

--- Indique si les véhicules doivent être extraits avant la suppression du prefab. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@param set boolean extraire les véhicules
function flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set) end

--- Crée un prefab depuis <nom>.prefab.json (chemin relatif au projet), l'ajoute à MissionGroup et le suit via addPrefab. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param fileName string nom du prefab (sans extension)
---@return integer  id de l'objet prefab
function flowgraph_modules_prefabModule.spawnPrefab(fileName) end

--- Éclate le prefab (obj:explode), supprime le prefab puis réinsère ses véhicules dans MissionGroup à leur position courante avant de supprimer le groupe restant. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:dyn
---@param id integer id du prefab
---@param obj userdata objet prefab de la scène
function flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/prefabModule.lua
---@class flowgraph_modules_prefabModule_C
local flowgraph_modules_prefabModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:152
---@param id any
---@param moreData any
function flowgraph_modules_prefabModule_C:addPrefab(id, moreData) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:20
function flowgraph_modules_prefabModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:14
function flowgraph_modules_prefabModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:284
---@param id any
---@param force any
function flowgraph_modules_prefabModule_C:deletePrefab(id, force) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:307
function flowgraph_modules_prefabModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:135
---@param id any
function flowgraph_modules_prefabModule_C:getPrefab(id) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:239
---@param id any
function flowgraph_modules_prefabModule_C:getVehicleIdsForPrefab(id) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:7
function flowgraph_modules_prefabModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:92
---@param data any
function flowgraph_modules_prefabModule_C:originalVehicleTransforms(data) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:225
---@param id any
function flowgraph_modules_prefabModule_C:restoreVehiclePositions(id) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:277
---@param id any
---@param keep any
function flowgraph_modules_prefabModule_C:setKeepPrefab(id, keep) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:271
---@param id any
---@param set any
function flowgraph_modules_prefabModule_C:setUnpackVehiclesBeforeDeletion(id, set) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:139
---@param fileName any
function flowgraph_modules_prefabModule_C:spawnPrefab(fileName) end

---Source : lua/ge/extensions/flowgraph/modules/prefabModule.lua:248
---@param id any
---@param obj any
function flowgraph_modules_prefabModule_C:unpackPrefabAndDelete(id, obj) end


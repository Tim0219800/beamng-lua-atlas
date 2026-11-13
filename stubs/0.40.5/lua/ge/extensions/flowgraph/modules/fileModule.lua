---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/fileModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui lit et écrit de petits fichiers de sauvegarde JSON propres aux projets flowgraph. Les fichiers sont stockés sous 'settings/cloud/flowgraphSaveData' + nom + '.save.json' avec la structure {lastModified, data}. Les fichiers sont chargés à la demande, mis en cache, et réécrits sur disque à la fin du tick (afterTrigger) s'ils ont été modifiés.
--- Accès : `require("extensions/flowgraph/modules/fileModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_fileModule
flowgraph_modules_fileModule = {}

--- Appelé après le tick du graphe : écrit sur disque (jsonWriteFile) chaque fichier modifié et vide la liste des modifications. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.afterTrigger() end

--- Vide le cache de fichiers et la liste des fichiers modifiés. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.clear() end

--- Appelé au démarrage du projet : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.executionStarted() end

--- Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.executionStopped() end

--- Oublie le fichier mis en cache ; il sera relu au prochain accès. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string nom du fichier (sans préfixe de dossier ni extension)
function flowgraph_modules_fileModule.forceReload(file) end

--- Renvoie la table {lastModified, data} du fichier, en le chargeant depuis le disque (ou en créant une table vide) à la première demande. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string nom du fichier
---@return table  {lastModified = number, data = table}
function flowgraph_modules_fileModule.getFile(file) end

--- Appelé à la création du module : appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.init() end

--- Lit data[field] du fichier. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string nom du fichier
---@param field string clé
---@return any  valeur ou nil
function flowgraph_modules_fileModule.read(file, field) end

--- Écrit une valeur dans data[field], met à jour lastModified (os.time()) et marque le fichier à sauvegarder. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string nom du fichier
---@param field string clé
---@param value any valeur sérialisable en JSON
function flowgraph_modules_fileModule.write(file, field, value) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/fileModule.lua
---@class flowgraph_modules_fileModule_C
local flowgraph_modules_fileModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:51
function flowgraph_modules_fileModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:14
function flowgraph_modules_fileModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:64
function flowgraph_modules_fileModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:60
function flowgraph_modules_fileModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:19
---@param file any
function flowgraph_modules_fileModule_C:forceReload(file) end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:23
---@param file any
function flowgraph_modules_fileModule_C:getFile(file) end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:10
function flowgraph_modules_fileModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:47
---@param file any
---@param field any
function flowgraph_modules_fileModule_C:read(file, field) end

---Source : lua/ge/extensions/flowgraph/modules/fileModule.lua:40
---@param file any
---@param field any
---@param value any
function flowgraph_modules_fileModule_C:write(file, field, value) end


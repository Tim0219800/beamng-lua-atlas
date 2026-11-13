---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/cameraModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder -500, donc l'un des premiers) qui gère les trajectoires de caméra (camPath) pendant un projet. Il charge un fichier <nom>/<nom>.camPath.json relatif au projet via core_paths.loadPath, ou stocke un chemin fourni en mémoire, puis le joue avec core_paths.playPath. Il suit le chemin actif, le nombre de fins de parcours (completions) et le mode boucle.
--- Accès : `require("extensions/flowgraph/modules/cameraModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_cameraModule
flowgraph_modules_cameraModule = {}

--- Enregistre un chemin déjà construit sous un nom. Sans force, renvoie l'id existant si le nom est déjà connu. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param name string nom
---@param path table chemin de caméra (avec markers)
---@param force boolean|nil remplacer le nom existant
---@return integer  id du chemin
function flowgraph_modules_cameraModule.addCustomPath(name, path, force) end

--- Appelé après le tick du graphe : finalise les variables. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.afterTrigger() end

--- Arrête le chemin de caméra en cours (core_paths.stopCurrentPath). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.cancelPathCam() end

--- Réinitialise le chemin actif, les complétions et les tables de chemins stockés. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.clear() end

--- Arrête le chemin actif (si id est nil ou égal à l'actif) et efface l'état. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer|nil id attendu
function flowgraph_modules_cameraModule.endActivePath(id) end

--- Appelé à l'arrêt du projet : arrête la caméra de chemin si active puis appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.executionStopped() end

--- Renvoie l'id du chemin de ce nom, en le chargeant si besoin depuis <nom>/<nom>.camPath.json (résolu par mgr:getRelativeAbsolutePath). Journalise une erreur si le fichier est introuvable. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param name string nom du chemin / dossier
---@return integer  id du chemin
function flowgraph_modules_cameraModule.findPath(name) end

--- Callback appelé par core_paths en fin de parcours : sans boucle, arrête la caméra ; dans tous les cas incrémente completions. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.finishedPath() end

--- Construit une commande Lua pour le module 'button' (voir notes : copier-coller probable). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id
---@return string  code Lua
function flowgraph_modules_cameraModule.getCmd(id) end

--- Incrémente et renvoie un id. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@return integer  id
function flowgraph_modules_cameraModule.getFreeId() end

--- Renvoie la table du chemin stocké. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id du chemin
---@return table|nil  chemin
function flowgraph_modules_cameraModule.getPath(id) end

--- Durée du chemin = temps du dernier marqueur, 0 si le chemin est inconnu. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id du chemin
---@return number  durée (s)
function flowgraph_modules_cameraModule.getPathDuration(id) end

--- Renvoie prefix..'-'..id unique. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param prefix string préfixe
---@return string  nom unique
function flowgraph_modules_cameraModule.getUniqueName(prefix) end

--- Crée le variableStorage et appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.init() end

--- Vrai si ce chemin est le chemin actif et a été terminé au moins une fois. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id du chemin
---@return boolean  terminé
function flowgraph_modules_cameraModule.isPathComplete(id) end

--- Relance le chemin actif avec le même réglage de boucle (si id est nil ou égal à l'actif). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer|nil id attendu
function flowgraph_modules_cameraModule.restartActivePath(id) end

--- Passe en caméra de jeu si la caméra libre est active, puis joue le chemin avec core_paths.playPath (useDtReal = true) et mémorise l'id, la boucle et complétions = 0. Ne fait rien si l'id est inconnu. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id du chemin
---@param loop boolean|nil rejouer en boucle
function flowgraph_modules_cameraModule.startPath(id, loop) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/cameraModule.lua
---@class flowgraph_modules_cameraModule_C
local flowgraph_modules_cameraModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:48
---@param name any
---@param path any
---@param force any
function flowgraph_modules_cameraModule_C:addCustomPath(name, path, force) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:127
function flowgraph_modules_cameraModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:92
function flowgraph_modules_cameraModule_C:cancelPathCam() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:25
function flowgraph_modules_cameraModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:104
---@param id any
function flowgraph_modules_cameraModule_C:endActivePath(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:134
function flowgraph_modules_cameraModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:34
---@param name any
function flowgraph_modules_cameraModule_C:findPath(name) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:96
function flowgraph_modules_cameraModule_C:finishedPath() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:122
---@param id any
function flowgraph_modules_cameraModule_C:getCmd(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:11
function flowgraph_modules_cameraModule_C:getFreeId() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:57
---@param id any
function flowgraph_modules_cameraModule_C:getPath(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:61
---@param id any
function flowgraph_modules_cameraModule_C:getPathDuration(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:16
---@param prefix any
function flowgraph_modules_cameraModule_C:getUniqueName(prefix) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:20
function flowgraph_modules_cameraModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:65
---@param id any
function flowgraph_modules_cameraModule_C:isPathComplete(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:114
---@param id any
function flowgraph_modules_cameraModule_C:restartActivePath(id) end

---Source : lua/ge/extensions/flowgraph/modules/cameraModule.lua:69
---@param id any
---@param loop any
function flowgraph_modules_cameraModule_C:startPath(id, loop) end


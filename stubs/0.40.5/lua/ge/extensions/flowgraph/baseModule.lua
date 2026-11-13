---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/baseModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base des modules du gestionnaire flowgraph (les « modules » attachés au manager, par opposition aux nœuds). Elle définit une classe C avec des hooks vides (clear, onUpdate, executionStarted, executionStopped) que les modules dérivés surchargent. Le fichier n'est pas une extension utilisable seule : il est utilisé par les modules flowgraph via M.use(mgr, derivedClass).
--- Accès : extension `flowgraph_baseModule` : `extensions.load("flowgraph_baseModule")`, puis la globale `flowgraph_baseModule`
---@class flowgraph_baseModule
flowgraph_baseModule = {}

--- Crée une instance de la classe de base : table avec C comme métatable, puis appelle init(...) (donc init(mgr)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseModule.lua:27
---@param ... any arguments transmis à init, normalement le manager flowgraph mgr
---@return table  instance du module de base
function flowgraph_baseModule.createBase(...) end

--- Crée un module de base, copie dessus tous les champs/méthodes de derivedClass (surcharge), puis rappelle init() si la classe dérivée l'a redéfini.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseModule.lua:35
---@param mgr table manager flowgraph propriétaire du module
---@param derivedClass table table de méthodes/champs qui remplacent ceux de la base
---@return table  instance du module
function flowgraph_baseModule.use(mgr, derivedClass) end

--- Classe de base d'un module flowgraph. Les méthodes vides sont à surcharger.
---@class flowgraph_baseModule_C
local flowgraph_baseModule_C = {}

--- Hook vide « utilisable » par les modules dérivés pour vider leur état.
---Source : lua/ge/extensions/flowgraph/baseModule.lua:15
function flowgraph_baseModule_C:clear() end

--- Hook vide appelé au démarrage de l'exécution du flowgraph.
---Source : lua/ge/extensions/flowgraph/baseModule.lua:18
function flowgraph_baseModule_C:executionStarted() end

--- Hook vide appelé à l'arrêt de l'exécution du flowgraph.
---Source : lua/ge/extensions/flowgraph/baseModule.lua:17
function flowgraph_baseModule_C:executionStopped() end

--- Mémorise le manager dans self.mgr.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseModule.lua:10
---@param mgr table manager flowgraph
function flowgraph_baseModule_C:init(mgr) end

--- Appelle self:executionStopped(). Sert de réaction au vidage du manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseModule.lua:19
function flowgraph_baseModule_C:onClear() end

--- Hook vide appelé à chaque mise à jour du manager (surchargé par les modules).
---Source : lua/ge/extensions/flowgraph/baseModule.lua:16
---@param dtReal number delta de temps réel (s)
---@param dtSim number delta de temps de simulation (s)
---@param dtRaw number delta de temps brut (s)
function flowgraph_baseModule_C:onUpdate(dtReal, dtSim, dtRaw) end


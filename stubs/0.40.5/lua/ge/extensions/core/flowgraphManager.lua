---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/flowgraphManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_flowgraphManager` : gestionnaire des projets Flowgraph (scripts visuels à base de nœuds) en cours d'exécution. Il crée, charge, démarre, supprime et sérialise les `manager` (un par projet .flow.json), fournit les catalogues de nœuds et de templates d'état disponibles pour l'éditeur, et expose des helpers `_flowgraph_createNode / _flowgraph_createStateNode / _flowgraph_createModule` que les fichiers de nœuds utilisent pour se déclarer. Un moddeur l'utilise pour lancer un projet flowgraph par script ou retrouver un nœud/module d'un projet actif.
--- Accès : extension `core_flowgraphManager` : `extensions.load("core_flowgraphManager")`, puis la globale `core_flowgraphManager`
---@class core_flowgraphManager
---@field enableUsageTracking boolean Drapeau de suivi d'usage (false par défaut) ; lu par d'autres modules flowgraph.
---@field nodePath string '/lua/ge/extensions/flowgraph/nodes/' : dossier des nœuds de base.
---@field runningProxies table<string, any> Extensions proxy en cours ; leurs clés servent à recalculer M.dependencies (refreshDependencies).
---@field skipCountdowns boolean Drapeau pour ignorer les compte à rebours (false par défaut) ; lu par d'autres modules flowgraph.
core_flowgraphManager = {}

--- Crée un manager, éventuellement à partir de données déjà décodées, et l'ajoute à la liste. Ne le démarre pas.
---Source : lua/ge/extensions/core/flowgraphManager.lua:115
---@param data table|nil Données de projet sérialisées.
---@return table  Manager.
function core_flowgraphManager.addManager(data) end

--- Détruit tous les managers et vide la liste.
---Source : lua/ge/extensions/core/flowgraphManager.lua:59
function core_flowgraphManager.clearAllManagers() end

--- Diffuse à tous les managers l'évènement de contrôle 'onControlsReset' (name = 'reset') ou 'onControlsAction' (name = 'action').
---Source : lua/ge/extensions/core/flowgraphManager.lua:387
---@param name string 'reset' ou 'action' ; autres valeurs ignorées.
function core_flowgraphManager.controls(name) end

--- Liste de tous les managers actifs (référence directe à la table interne).
---Source : lua/ge/extensions/core/flowgraphManager.lua:66
---@return table[]  Managers.
function core_flowgraphManager.getAllManagers() end

--- Scanne récursivement '/lua/ge/extensions/flowgraph/nodes/' (*.lua), les charge avec require (les erreurs sont loguées et le nœud ignoré) et construit un arbre de catégories et une table à plat. Résultat mis en cache jusqu'à la modification d'un fichier de nœud.
---Source : lua/ge/extensions/core/flowgraphManager.lua:262
---@return table  Arbre : sous-dossier -> {nodes = {nom -> template}, ...sous-dossiers}.
---@return table<string, table>  Table à plat chemin -> template (champs ajoutés : path, sourcePath, splitPath, availablePinTypes).
function core_flowgraphManager.getAvailableNodeTemplates() end

--- Types de pins entrants/sortants d'un nœud d'après son pinSchema ; ajoute 'flow' en entrée et sortie pour les nœuds fonctionnels non simples (via ui_flowgraph_editor).
---Source : lua/ge/extensions/core/flowgraphManager.lua:302
---@param node table Définition de nœud (champs pinSchema, category).
---@return table  {_in = {type = true}, _out = {type = true}}.
function core_flowgraphManager.getAvailablePinTypes(node) end

--- Scanne '/flowgraphEditor/states/' (*state.flow.json), lit chaque fichier et construit un arbre et une table à plat de templates d'état. Les fichiers directement à la racine du dossier sont ignorés.
---Source : lua/ge/extensions/core/flowgraphManager.lua:326
---@return table  Arbre par sous-dossier : {states = {…}}.
---@return table<string, table>  Table à plat chemin -> {data, path, sourcePath, splitPath}.
function core_flowgraphManager.getAvailableStateTemplates() end

--- Cherche un manager par son id.
---Source : lua/ge/extensions/core/flowgraphManager.lua:70
---@param id integer Id du manager.
---@return table|nil  Manager ou nil.
function core_flowgraphManager.getManagerByID(id) end

--- Récupère en sécurité un nœud d'un graphe d'un manager actif ; nil si un des ids est invalide (à préférer à l'accès direct getManagerByID(m).graphs[g].nodes[n]).
---Source : lua/ge/extensions/core/flowgraphManager.lua:79
---@param mgrId integer Id du manager.
---@param graphId integer Id du graphe.
---@param nodeId integer Id du nœud.
---@return table|nil  Nœud.
function core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId) end

--- Récupère un module d'un manager actif par son nom ; nil si absent.
---Source : lua/ge/extensions/core/flowgraphManager.lua:89
---@param mgrId integer Id du manager.
---@param moduleName string Nom du module.
---@return table|nil  Module.
function core_flowgraphManager.getManagerModule(mgrId, moduleName) end

--- Compteur d'identifiants uniques incrémenté à chaque appel. Le code indique « do not use ever » : réservé à l'implémentation de flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:9
---@return integer  Identifiant.
function core_flowgraphManager.getNextUniqueIdentifier() end

--- Renvoie le manager unique de ce nom ; le charge depuis 'flowgraphEditor/<name>.flow.json', le démarre et le mémorise s'il n'existe pas encore.
---Source : lua/ge/extensions/core/flowgraphManager.lua:367
---@param name string Nom de projet sans extension.
---@return table|nil  Manager ; nil si le fichier est introuvable.
function core_flowgraphManager.getSingleton(name) end

--- Crée un manager et y charge un projet .flow.json. Le manager est ajouté à la liste même si le fichier est introuvable (erreur loguée, manager vide).
---Source : lua/ge/extensions/core/flowgraphManager.lua:97
---@param filepath string Chemin du fichier .flow.json.
---@param hidden boolean|nil Marque le manager comme caché (mgr.hidden).
---@param keepSavedDirs boolean|nil true = garde savedDir/savedFilename du fichier au lieu de ceux de filepath.
---@return table  Manager.
---@return boolean  true si le fichier a été lu.
function core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs) end

--- Hook de restauration : détruit les managers, les recrée depuis les données, relance les singletons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:244
---@param data table Données de onSerialize.
function core_flowgraphManager.onDeserialized(data) end

--- Hook au chargement : définit les fonctions globales _flowgraph_createNode, _flowgraph_createStateNode et _flowgraph_createModule (rawset dans _G) utilisées par les fichiers de nœuds/modules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:29
function core_flowgraphManager.onExtensionLoaded() end

--- Hook de modification de fichier : si un nœud de base ou un '*Node.lua' du dossier customNodes d'un projet actif change, recharge (sérialise/désérialise) tous les managers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:206
---@param filename string Chemin du fichier.
---@param type any Non utilisé.
function core_flowgraphManager.onFileChanged(filename, type) end

--- Hook appelé à l'ajout d'un objet de scène flowgraph : affiche seulement un dump de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:399
---@param id integer Id de l'objet.
---@param name string Nom.
---@param fgPath string Chemin du flowgraph.
function core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath) end

--- Hook de modification d'un objet de scène flowgraph : dump de debug uniquement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:407
---@param id integer Id de l'objet.
---@param name string Nom.
---@param fgPath string Chemin du flowgraph.
function core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath) end

--- Hook de suppression d'un objet de scène flowgraph : dump de debug uniquement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:403
---@param id integer Id de l'objet.
---@param name string Nom.
---@param fgPath string Chemin du flowgraph.
function core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath) end

--- Hook en fin d'écran de chargement : démarre les managers de la liste startOnLoadingScreenFadeout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:153
function core_flowgraphManager.onLoadingScreenFadeout() end

--- Hook de sauvegarde avant rechargement des extensions : sérialise les managers non transitoires et l'index des singletons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:224
---@return table  {mgrs, uniques}.
function core_flowgraphManager.onSerialize() end

--- Hook par image : résout les hooks en attente et réinitialise chaque manager, démarre/supprime ceux planifiés puis diffuse 'onFlowgraphManagerPreUpdate' à chacun.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/flowgraphManager.lua:166
function core_flowgraphManager.onUpdate() end

--- Recalcule M.dependencies à partir des clés de M.runningProxies.
---Source : lua/ge/extensions/core/flowgraphManager.lua:21
function core_flowgraphManager.refreshDependencies() end

--- Détruit un manager et le retire de la liste ainsi que des singletons. Sans effet si le manager n'est pas trouvé (comparaison par id).
---Source : lua/ge/extensions/core/flowgraphManager.lua:124
---@param mgr table Manager.
function core_flowgraphManager.removeManager(mgr) end

--- Planifie la suppression d'un manager au prochain onUpdate (évite de détruire un manager pendant son exécution).
---Source : lua/ge/extensions/core/flowgraphManager.lua:148
---@param mgr table Manager.
function core_flowgraphManager.removeNextFrame(mgr) end

--- Planifie setRunning(true) d'un manager au prochain onUpdate.
---Source : lua/ge/extensions/core/flowgraphManager.lua:145
---@param mgr table Manager.
function core_flowgraphManager.startNextFrame(mgr) end

--- Met un manager en file pour démarrer à la fin de l'écran de chargement (hook onLoadingScreenFadeout), utilisé par les projets lancés automatiquement avec un niveau.
---Source : lua/ge/extensions/core/flowgraphManager.lua:161
---@param fg table Manager.
function core_flowgraphManager.startOnLoadingScreenFadeout(fg) end


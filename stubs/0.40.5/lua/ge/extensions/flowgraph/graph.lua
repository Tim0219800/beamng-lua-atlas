---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet graphe renvoyé par le constructeur.
---@class flowgraph_graph
local flowgraph_graph = {}

--- Appelé au démarrage du projet : notifie chaque nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:1266
function flowgraph_graph:_executionStarted() end

--- Appelé à l'arrêt du projet : notifie les nœuds et le variableStorage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:1281
function flowgraph_graph:_executionStopped() end

--- Notifie les nœuds et le variableStorage d'un clear.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:1274
function flowgraph_graph:_onClear() end

--- Reconstruit le graphe (nœuds triés par id, liens, variables) depuis les données sérialisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:1031
---@param data table données
function flowgraph_graph:_onDeserialized(data) end

--- Sérialise le graphe (nom, nœuds, liens ordonnés, type, variables, vue, parentId…). Renvoie la table et le plus petit id utilisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:952
---@return table  données
---@return integer  plus petit id
function flowgraph_graph:_onSerialize() end

--- Affiche récursivement l'arbre des graphes avec indentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:1378
---@param depth integer profondeur
function flowgraph_graph:_printStructure(depth) end

--- Vrai si un lien peut être créé entre a et b (directions opposées, nœuds différents, types compatibles, lien inexistant, noms égaux si matchName).
---Source : lua/ge/extensions/flowgraph/graph.lua:1229
---@param a table pin
---@param b table pin
---@param newLinkInfo table|nil infos d'autorisation par nœud
---@return boolean  autorisé
function flowgraph_graph:canCreateLink(a, b, newLinkInfo) end

--- Supprime les graphes enfants, détruit les nœuds et vide nodes, links, pins.
---Source : lua/ge/extensions/flowgraph/graph.lua:789
function flowgraph_graph:clear() end

--- Vide les changements de variables en attente de ce graphe et de ses descendants.
---Source : lua/ge/extensions/flowgraph/graph.lua:77
function flowgraph_graph:clearVariableChangesChildren() end

--- Crée un lien entre une pin de sortie et une pin d'entrée (après avoir retiré la valeur codée en dur de la pin cible).
---Source : lua/ge/extensions/flowgraph/graph.lua:913
---@param startPin table pin source
---@param endPin table pin cible
---@param ... any arguments supplémentaires
---@return table  lien
function flowgraph_graph:createLink(startPin, endPin, ...) end

--- Crée un nœud d'un type donné (ex. 'events/onUpdate') à partir des modèles du manager. Journalise une erreur et renvoie nil si le type est inconnu. Marque les nœuds obsolètes dans leur nom.
---Source : lua/ge/extensions/flowgraph/graph.lua:818
---@param nodeType string chemin du type de nœud
---@param forceId integer|nil id imposé
---@param ... any arguments passés au constructeur du nœud
---@return table|nil  nœud créé
function flowgraph_graph:createNode(nodeType, forceId, ...) end

--- Supprime un lien : met à jour pinIn / _mInFlow de la cible, notifie pins et nœuds, planifie la suppression côté éditeur.
---Source : lua/ge/extensions/flowgraph/graph.lua:919
---@param link table lien
function flowgraph_graph:deleteLink(link) end

--- Supprime un nœud et ses liens (sauf nœuds undeleteable hors mode debug ; un nœud qui représente un graphe supprime ce graphe, sauf ignoreIntegratedNodes).
---Source : lua/ge/extensions/flowgraph/graph.lua:874
---@param node table nœud
---@param ignoreIntegratedNodes boolean|nil ne pas supprimer le graphe représenté
function flowgraph_graph:deleteNode(node, ignoreIntegratedNodes) end

--- Alias de findNodeRecursive.
---Source : lua/ge/extensions/flowgraph/graph.lua:1347
---@param id integer id du nœud
---@return table|nil  nœud
function flowgraph_graph:findNodeInChildren(id) end

--- Cherche un nœud par id dans ce graphe puis dans ses enfants.
---Source : lua/ge/extensions/flowgraph/graph.lua:1350
---@param id integer id du nœud
---@return table|nil  nœud
function flowgraph_graph:findNodeRecursive(id) end

--- Renvoie la pin d'id donné.
---Source : lua/ge/extensions/flowgraph/graph.lua:1249
---@param pinId integer|nil id
---@return table|nil  pin
function flowgraph_graph:findPin(pinId) end

--- Force la mise à jour de la position éditeur de tous les nœuds (récursif).
---Source : lua/ge/extensions/flowgraph/graph.lua:1365
function flowgraph_graph:forceRecursiveNodeUpdatePosition() end

--- Ajoute à rNodes et rLinks les nœuds et liens de ce graphe et de ses enfants, et renseigne interInfo pour les nœuds macro/integrated.
---Source : lua/ge/extensions/flowgraph/graph.lua:127
---@param rNodes table[] liste de nœuds à remplir
---@param rLinks table[] liste de liens à remplir
---@param interInfo table informations d'intégration par nœud
function flowgraph_graph:gatherNodesAndLinks(rNodes, rLinks, interInfo) end

--- Renvoie la suite d'indices de ce graphe parmi les enfants depuis la racine de l'instance.
---Source : lua/ge/extensions/flowgraph/graph.lua:1315
---@return integer[]  indices
function flowgraph_graph:getChildPosition() end

--- Renvoie les graphes enfants (parentId == id), triés par id.
---Source : lua/ge/extensions/flowgraph/graph.lua:65
---@return table[]  enfants
function flowgraph_graph:getChildren() end

--- Enfants du graphe, plus (pour un graphe d'états) les graphes non-états représentés par ses nœuds.
---Source : lua/ge/extensions/flowgraph/graph.lua:1427
---@return table[]  enfants
function flowgraph_graph:getChildrenWithStates() end

--- Descend dans les enfants selon des indices (voir notes : utilise un champ children inexistant).
---Source : lua/ge/extensions/flowgraph/graph.lua:1326
---@param indexes integer[] indices
---@return table|nil  graphe
function flowgraph_graph:getDeepChild(indexes) end

--- Collecte les ids de macros 'dirty' utilisés par des instances enfants.
---Source : lua/ge/extensions/flowgraph/graph.lua:92
---@param dirtyChildren table<integer, boolean>|nil table à remplir
---@return table<integer, boolean>  ids de macros à mettre à jour
function flowgraph_graph:getDirtyChildren(dirtyChildren) end

--- Renvoie la racine de l'instance (premier ancêtre avec macroID).
---Source : lua/ge/extensions/flowgraph/graph.lua:1304
---@return table  graphe
function flowgraph_graph:getInstanceRoot() end

--- Renvoie le chemin du graphe depuis la racine (noms, ou ids si withIds), états parents compris.
---Source : lua/ge/extensions/flowgraph/graph.lua:1472
---@param withIds boolean|nil renvoyer aussi les ids
function flowgraph_graph:getLocation(withIds) end

--- Pour un graphe de type 'instance', renvoie le graphe macro d'origine correspondant.
---Source : lua/ge/extensions/flowgraph/graph.lua:1290
---@return table|nil  macro
function flowgraph_graph:getMacro() end

--- Renvoie le graphe parent.
---Source : lua/ge/extensions/flowgraph/graph.lua:58
---@return table|nil  graphe parent
function flowgraph_graph:getParent() end

--- Comme getParent, mais si le graphe n'a pas de parent, renvoie le graphe d'états dont un nœud représente ce graphe.
---Source : lua/ge/extensions/flowgraph/graph.lua:1405
---@return table|nil  parent
function flowgraph_graph:getParentWithStates() end

--- Collecte récursivement les nœuds (pour leurs hooks) et les dépendances d'extensions déclarées par les nœuds.
---Source : lua/ge/extensions/flowgraph/graph.lua:1334
---@param hooks table[] liste de nœuds à remplir
---@param deps table<string, boolean> dépendances à remplir
---@return table[]  nœuds
---@return table<string, boolean>  dépendances
function flowgraph_graph:getRecursiveHooksAndDependencies(hooks, deps) end

--- Remonte jusqu'au graphe racine.
---Source : lua/ge/extensions/flowgraph/graph.lua:84
---@return table  racine
function flowgraph_graph:getRootGraph() end

--- Renvoie les graphes frères (même parent, états compris) ; imprime le nom du parent (voir notes).
---Source : lua/ge/extensions/flowgraph/graph.lua:1441
---@return table[]  frères
function flowgraph_graph:getSiblings() end

--- Vrai si une pin d'entrée de type autre que flow/state est déjà liée.
---Source : lua/ge/extensions/flowgraph/graph.lua:1171
---@param pin table pin
---@return boolean  liée
function flowgraph_graph:hasLink(pin) end

--- Initialise le graphe : id, nom, type 'graph', tables vides, variableStorage, position et zoom de vue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:18
---@param mgr table manager
---@param name string|nil nom (défaut 'Graph <id>')
---@param forceId integer|nil id imposé (désérialisation)
function flowgraph_graph:init(mgr, name, forceId) end

--- Vrai s'il existe déjà un lien entre ces deux pins.
---Source : lua/ge/extensions/flowgraph/graph.lua:1162
---@param startPin table pin source
---@param endPin table pin cible
---@return boolean  existe
function flowgraph_graph:linkExists(startPin, endPin) end

--- Déplace un nœud vers un autre graphe en supprimant ses liens.
---Source : lua/ge/extensions/flowgraph/graph.lua:863
---@param node table nœud
---@param newGraph table graphe destination
function flowgraph_graph:moveNodeToGraph(node, newGraph) end

--- Teste la compatibilité des types de deux pins : 'any' accepte tout, les pins 'state' ne se lient qu'entre elles, les types table doivent avoir le même tableType ou 'generic'.
---Source : lua/ge/extensions/flowgraph/graph.lua:1180
---@param sourcePin table pin
---@param targetPin table pin
---@return boolean|nil  compatible
function flowgraph_graph:pinsCompatible(sourcePin, targetPin) end

--- Planifie l'exécution (graphe racine non-macro) : dépendances, racines de flux, propagation des couleurs, ordre des nœuds, génération du code d'exécution. Appelé par le manager avant de lancer ou après modification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/graph.lua:266
function flowgraph_graph:plan() end

--- Affiche l'arbre des graphes (seulement depuis une racine).
---Source : lua/ge/extensions/flowgraph/graph.lua:1390
function flowgraph_graph:printStructure() end

--- Suit les liens à travers les nœuds macro/integrated et macro/io pour créer des liens virtuels (virtualLink) entre le vrai émetteur et les vraies cibles.
---Source : lua/ge/extensions/flowgraph/graph.lua:192
---@param rLinks table[] liste de liens à compléter
---@param interInfo table informations d'intégration
function flowgraph_graph:resolveInterHops(rLinks, interInfo) end

--- Marque le graphe (et ses enfants de même type) comme modifié ; par défaut en partant de la racine.
---Source : lua/ge/extensions/flowgraph/graph.lua:109
---@param dirty boolean état
---@param startFromRoot boolean|nil défaut true
function flowgraph_graph:setDirty(dirty, startFromRoot) end

--- Texte 'nom (id / type)'.
---Source : lua/ge/extensions/flowgraph/graph.lua:1374
---@return string  description
function flowgraph_graph:toString() end

--- Applique un type à ce graphe et à ses descendants (s'arrête sur ignoreType).
---Source : lua/ge/extensions/flowgraph/graph.lua:1256
---@param t string nouveau type
---@param ignoreType string|nil type à ne pas traverser
function flowgraph_graph:updateChildrenTypes(t, ignoreType) end


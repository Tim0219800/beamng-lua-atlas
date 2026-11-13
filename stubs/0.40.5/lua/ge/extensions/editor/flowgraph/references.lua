---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/references.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_references', windowDescription 'References'). Principales données : nodeTable (par nom de nœud : displayName, amount, pins {inPins,outPins}, category, behaviour, amountForProjects), nodeStatistics, filteredNodes, sortedProjects, sortedCategories, viewMode (1 liste, 2 détail).
---@class editor_flowgraph_references_C
local editor_flowgraph_references_C = {}

--- Ajoute à l'entrée nodeTable les pins et comportements (simple, duration, once) qui ne sont créés qu'à l'exécution selon la catégorie du nœud.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:232
---@param nodeName string Nœud concerné.
---@param category string|nil Catégorie du nœud.
function editor_flowgraph_references_C:addPinsAndBehavioursForCategory(nodeName, category) end

--- Recalcule les occurrences de chaque nœud dans les fichiers .flow.json et dans le projet courant, puis refiltre et retrie.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:82
---@param initialCheck boolean true à la création : ne remet pas les compteurs à zéro.
function editor_flowgraph_references_C:checkFilesForNodes(initialCheck) end

--- Construit nodeTable à partir des modèles de nœuds disponibles puis compte les usages (checkFilesForNodes(true)).
---Source : lua/ge/extensions/editor/flowgraph/references.lua:35
function editor_flowgraph_references_C:createNodeTable() end

--- Dessine la fenêtre : bouton « Load Data » tant que nodeTable est vide, sinon flèches de navigation et vue 1 ou 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/references.lua:343
function editor_flowgraph_references_C:draw() end

--- Vue liste : champ de recherche, combo de mode de filtre, statistiques et liste des nœuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/references.lua:376
function editor_flowgraph_references_C:drawViewMode1() end

--- Vue détail du nœud inspecté : pins et projets qui l'utilisent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/references.lua:497
function editor_flowgraph_references_C:drawViewMode2() end

--- Lit chaque fichier de flowgraph de la liste et met à jour les occurrences de ses nœuds.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:131
---@param flowgraphDirectory string[] Chemins de fichiers .flow.json.
function editor_flowgraph_references_C:fillNodeTable(flowgraphDirectory) end

--- Construit filteredNodes selon le texte saisi et le mode de filtre (All, Current, unused), trié par nombre d'usages décroissant.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:179
function editor_flowgraph_references_C:filterNodes() end

--- Parcourt récursivement l'arbre des dossiers de nœuds et crée une entrée nodeTable par nœud (pins in/out du pinSchema, catégorie, comportements) en mettant à jour les statistiques par catégorie.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:47
---@param nodeDirectory table Arbre de modèles renvoyé par getAvailableNodeTemplates.
function editor_flowgraph_references_C:findNodesRecursive(nodeDirectory) end

--- Écrit un libellé en surlignant les occurrences du texte cherché (copie de nodelibrary).
---Source : lua/ge/extensions/editor/flowgraph/references.lua:294
---@param label string Texte.
---@param highlightText string Sous-chaîne à surligner.
function editor_flowgraph_references_C:highlightText(label, highlightText) end

--- Enregistre la fenêtre et initialise les tables, le mode de vue (1) et le filtre (All).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/references.lua:21
function editor_flowgraph_references_C:init() end

--- Indique si un pin de ce nom existe déjà dans l'entrée du nœud.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:278
---@param nodeName string Nœud.
---@param direction string 'in' ou 'out'.
---@param pinName string Nom du pin.
---@return boolean|nil  true si trouvé, sinon nil.
function editor_flowgraph_references_C:pinExists(nodeName, direction, pinName) end

--- Trie les catégories par nombre de types de nœuds décroissant dans self.sortedCategories.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:116
function editor_flowgraph_references_C:sortCategories() end

--- Trie les projets utilisant le nœud inspecté par nombre d'occurrences décroissant dans self.sortedProjects.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:326
function editor_flowgraph_references_C:sortProjects() end

--- Incrémente les compteurs d'usage d'un nœud (total, par projet, par catégorie) ; crée une entrée 'OBSOLETE' si le nœud est inconnu.
---Source : lua/ge/extensions/editor/flowgraph/references.lua:146
---@param nodeName string Nom (chemin) du type de nœud.
---@param fileName string Fichier projet où il apparaît.
function editor_flowgraph_references_C:updateNodeOccurrence(nodeName, fileName) end


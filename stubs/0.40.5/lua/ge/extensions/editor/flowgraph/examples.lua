---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/examples.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre Examples (windowName = 'fg_examples', arrowControllable = true).
---@class editor_flowgraph_examples_C
local editor_flowgraph_examples_C = {}

--- Désérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:302
---@param data table Données.
function editor_flowgraph_examples_C:_onDeserialized(data) end

--- Sérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:298
---@param data table Données.
function editor_flowgraph_examples_C:_onSerialize(data) end

--- Compte l'élément dans la liste navigable et dessine le cadre de sélection clavier.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:306
---@param cursor ImVec2 Position du curseur avant l'élément.
---@param itemSize ImVec2 Taille de l'élément.
---@param doHover boolean|nil (déduit du code)
function editor_flowgraph_examples_C:arrowHelper(cursor, itemSize, doHover) end

--- Associe le manager et réinitialise la recherche.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:13
---@param mgr table Manager flowgraph.
function editor_flowgraph_examples_C:attach(mgr) end

--- Demande de valider l'élément sélectionné au prochain affichage (doClick).
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:76
function editor_flowgraph_examples_C:createNode() end

--- Affiche les résultats de recherche (ou « No Results! »).
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:178
function editor_flowgraph_examples_C:displayResults() end

--- Affiche l'arborescence complète des exemples.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:235
function editor_flowgraph_examples_C:displayTreeView() end

--- Dessine la fenêtre Examples (recherche ou arborescence).
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:214
function editor_flowgraph_examples_C:draw() end

--- Dessine le champ « Find », le bouton d'effacement et l'aide.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:91
function editor_flowgraph_examples_C:drawSearchInput() end

--- Soumet chaque exemple à l'utilitaire de recherche.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:119
---@param match string Chaîne recherchée (non utilisée directement dans le corps, déduit du code).
function editor_flowgraph_examples_C:findExamples(match) end

--- Relance la recherche si le texte a changé et remplit self.results.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:133
function editor_flowgraph_examples_C:findStuff() end

--- Renvoie l'arbre et la table plate (via loadExamples).
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:72
---@return table  Arbre.
---@return table  Lookup.
function editor_flowgraph_examples_C:getExamplesLookup() end

--- Quand la fenêtre a le focus, empile l'action map « NodeLibrary » pour la navigation aux flèches.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:283
function editor_flowgraph_examples_C:handleActionMap() end

--- Affiche un libellé en surlignant en orange les occurrences du texte cherché.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:147
---@param label string Libellé.
---@param highlightText string Texte à surligner.
function editor_flowgraph_examples_C:highlightText(label, highlightText) end

--- Enregistre la fenêtre, crée l'utilitaire de recherche et charge les exemples.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:20
function editor_flowgraph_examples_C:init() end

--- Parcourt FS:findFiles sur les .flow.json d'exemples, construit l'arbre (res) et la table plate (lookup) avec leur contenu JSON, puis les met en cache.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:30
---@return table  Arbre des exemples.
---@return table  Table plate chemin -> données.
function editor_flowgraph_examples_C:loadExamples() end

--- Si l'élément est cliqué (ou validé au clavier), crée un manager via core_flowgraphManager.addManager et le rend actif dans l'éditeur.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:205
---@param result table Résultat contenant info.data (données du projet).
function editor_flowgraph_examples_C:manageClick(result) end

--- Déplace la sélection clavier dans la liste.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:80
---@param up boolean true pour monter.
function editor_flowgraph_examples_C:navigateList(up) end

--- Affiche récursivement un nœud de l'arbre : exemples triés puis sous-dossiers.
---Source : lua/ge/extensions/editor/flowgraph/examples.lua:242
---@param element table Nœud de l'arbre.
---@param depth integer Profondeur (sert aux identifiants ImGui).
function editor_flowgraph_examples_C:recursiveTreeView(element, depth) end


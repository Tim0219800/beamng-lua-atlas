---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/search.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_search', windowDescription 'Search', arrowControllable = true).
---@class editor_flowgraph_search_C
local editor_flowgraph_search_C = {}

--- Hook de désérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:301
---@param data table Données restaurées.
function editor_flowgraph_search_C:_onDeserialized(data) end

--- Hook de sérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:297
---@param data table Table de sauvegarde.
function editor_flowgraph_search_C:_onSerialize(data) end

--- Compte les boutons de la liste, dessine le cadre de l'élément sélectionné/survolé et fait défiler pour le garder visible.
---Source : lua/ge/extensions/editor/flowgraph/search.lua:305
---@param cursor ImVec2 Position du curseur avant l'élément.
---@param itemSize ImVec2 Taille de l'élément.
---@param doHover boolean Non utilisé.
function editor_flowgraph_search_C:arrowHelper(cursor, itemSize, doHover) end

--- Mémorise le manager, force une nouvelle recherche et crée la table de résultats du manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:13
---@param mgr table Manager flowgraph.
function editor_flowgraph_search_C:attach(mgr) end

--- Appelé par l'éditeur quand l'utilisateur valide (Entrée) : demande le clic sur l'entrée sélectionnée au prochain dessin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:27
function editor_flowgraph_search_C:createNode() end

--- Affiche la liste des résultats (type, nom surligné, localisation, score en mode debug) ou « No Results! ».
---Source : lua/ge/extensions/editor/flowgraph/search.lua:184
function editor_flowgraph_search_C:displayResults() end

--- Dessine la fenêtre « Search » si elle est visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:264
function editor_flowgraph_search_C:draw() end

--- Dessine le champ « Find: », le bouton X et l'icône d'aide (syntaxe node:/graph:/pin:).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:42
function editor_flowgraph_search_C:drawSearchInput() end

--- Soumet à la recherche chaque graphe de type 'graph' du manager.
---Source : lua/ge/extensions/editor/flowgraph/search.lua:97
---@param match string Texte cherché (non utilisé).
function editor_flowgraph_search_C:findGraphs(match) end

--- Soumet à la recherche chaque nœud du manager (mgr:allNodes()) et chacun de leurs pins, avec leur localisation et un identifiant de frecency.
---Source : lua/ge/extensions/editor/flowgraph/search.lua:70
---@param match string Texte cherché (non utilisé dans la fonction).
function editor_flowgraph_search_C:findNodes(match) end

--- Si le texte a changé, relance la recherche complète (nœuds + graphes) et stocke les résultats pour le manager courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:126
function editor_flowgraph_search_C:findStuff() end

--- Extrait le préfixe de type ('node', 'graph', 'pin') du texte saisi.
---Source : lua/ge/extensions/editor/flowgraph/search.lua:170
---@return string|nil  Type filtré ou nil.
---@return string  Texte restant en minuscules.
function editor_flowgraph_search_C:getFilterType() end

--- Quand la fenêtre a le focus, pousse l'action map 'NodeLibrary' et s'enregistre comme fenêtre contrôlable aux flèches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:282
function editor_flowgraph_search_C:handleActionMap() end

--- Écrit un libellé en colorant (orange) jusqu'à 6 occurrences du texte cherché, insensible à la casse.
---Source : lua/ge/extensions/editor/flowgraph/search.lua:144
---@param label string Texte à afficher.
---@param highlightText string Sous-chaîne à surligner.
function editor_flowgraph_search_C:highlightText(label, highlightText) end

--- Enregistre la fenêtre, crée le champ de texte (128 car.) et l'objet de recherche searchUtil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:20
function editor_flowgraph_search_C:init() end

--- Gère le clic sur un résultat : met à jour la frecency, sélectionne le graphe, désélectionne tout puis sélectionne le nœud/graphe et demande le recentrage (focusSelection/focusContent).
---Source : lua/ge/extensions/editor/flowgraph/search.lua:235
---@param result table Résultat de recherche (type 'node', 'graph' ou 'pin').
function editor_flowgraph_search_C:manageClick(result) end

--- Déplace la sélection clavier dans la liste de résultats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/search.lua:31
---@param up boolean true pour monter, false pour descendre.
function editor_flowgraph_search_C:navigateList(up) end


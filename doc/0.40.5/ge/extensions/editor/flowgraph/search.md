# `editor_flowgraph_search`

*Fichier : `lua/ge/extensions/editor/flowgraph/search.lua` · VM : Game Engine (GE) · 336 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/search")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Search » (fg_search) de l'éditeur Flowgraph : recherche floue dans le projet courant des nœuds, des graphes et des pins, via editor/util/searchUtil avec un score de « frecency » mémorisé dans mgr.frecency. Le préfixe 'node:', 'graph:' ou 'pin:' restreint le type de résultat. Un clic (ou Entrée via l'action map NodeLibrary) sélectionne le graphe et le nœud et recentre la vue. Ouverte par le raccourci uiFindShortcut de flowgraphEditor.

## Remarques

- Les résultats sont mis en cache par manager (searchResultsByMgr[mgr.id]) et recalculés seulement quand le texte change (searchChanged).
- Navigation clavier : handleActionMap pousse l'action map 'NodeLibrary' quand la fenêtre a le focus, et fgEditor.arrowControllableWindow pointe sur elle.
- Incohérences : findGraphs référence une variable globale `score` inexistante (nil) ; le paramètre `match` de findNodes/findGraphs n'est pas utilisé ; la fonction de tri sortFun compare typeOrder quand les types sont identiques (donc toujours égal), le tri réel retombe sur le score ; le texte d'info d'un pin contient un guillemet en trop ("''").

## Classe `C`

Classe de la fenêtre (windowName 'fg_search', windowDescription 'Search', arrowControllable = true).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Hook de désérialisation : vide. | 301 |
| `C:_onSerialize(data)` | Hook de sérialisation : vide. | 297 |
| `C:arrowHelper(cursor, itemSize, doHover)` | Compte les boutons de la liste, dessine le cadre de l'élément sélectionné/survolé et fait défiler pour le garder visible. | 305 |
| `C:attach(mgr)` | Mémorise le manager, force une nouvelle recherche et crée la table de résultats du manager. | 13 |
| `C:createNode()` | Appelé par l'éditeur quand l'utilisateur valide (Entrée) : demande le clic sur l'entrée sélectionnée au prochain dessin. | 27 |
| `C:displayResults()` | Affiche la liste des résultats (type, nom surligné, localisation, score en mode debug) ou « No Results! ». | 184 |
| `C:draw()` | Dessine la fenêtre « Search » si elle est visible. | 264 |
| `C:drawSearchInput()` | Dessine le champ « Find: », le bouton X et l'icône d'aide (syntaxe node:/graph:/pin:). | 42 |
| `C:findGraphs(match)` | Soumet à la recherche chaque graphe de type 'graph' du manager. | 97 |
| `C:findNodes(match)` | Soumet à la recherche chaque nœud du manager (mgr:allNodes()) et chacun de leurs pins, avec leur localisation et un identifiant de frecency. | 70 |
| `C:findStuff()` | Si le texte a changé, relance la recherche complète (nœuds + graphes) et stocke les résultats pour le manager courant. | 126 |
| `C:getFilterType()` | Extrait le préfixe de type ('node', 'graph', 'pin') du texte saisi. | 170 |
| `C:handleActionMap()` | Quand la fenêtre a le focus, pousse l'action map 'NodeLibrary' et s'enregistre comme fenêtre contrôlable aux flèches. | 282 |
| `C:highlightText(label, highlightText)` | Écrit un libellé en colorant (orange) jusqu'à 6 occurrences du texte cherché, insensible à la casse. | 144 |
| `C:init()` | Enregistre la fenêtre, crée le champ de texte (128 car.) et l'objet de recherche searchUtil. | 20 |
| `C:manageClick(result)` | Gère le clic sur un résultat : met à jour la frecency, sélectionne le graphe, désélectionne tout puis sélectionne le nœud/graphe et demande le recentrage (focusSelection/focusContent). | 235 |
| `C:navigateList(up)` | Déplace la sélection clavier dans la liste de résultats. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/search.lua`.*

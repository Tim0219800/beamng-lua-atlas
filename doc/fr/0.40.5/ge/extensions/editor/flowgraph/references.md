# `editor_flowgraph_references`

*Fichier : `lua/ge/extensions/editor/flowgraph/references.lua` · VM : Game Engine (GE) · 615 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/references")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « References » (fg_references) de l'éditeur Flowgraph : statistiques d'utilisation des types de nœuds. Au clic sur « Load Data », elle recense tous les modèles de nœuds (core_flowgraphManager.getAvailableNodeTemplates), puis compte leurs occurrences dans tous les fichiers *.flow.json de /levels/, /gameplay/ et /lua/ge/extensions/flowgraph/examples, plus dans le projet courant (placeholder « CurrentLocalFile »). Deux vues : liste filtrable (All / Current / unused) et détail d'un nœud (pins, projets qui l'utilisent).

## Remarques

- Charger les données lit tous les fichiers de flowgraph du jeu : peut être lent.
- Un nœud trouvé dans un projet mais sans modèle est classé dans la catégorie 'OBSOLETE'.
- addPinsAndBehavioursForCategory reproduit la logique de basenode pour les pins créés à l'exécution (flow, incomplete/complete/completed, reset).
- Bugs probables : draw teste `self.nodeTable == {}` (toujours faux en Lua) ; updateNodeOccurrence crée la branche OBSOLETE avec la clé littérale `filename` au lieu du nom de fichier ; dans le cas f_duration, le test d'existence du pin 'completed' vérifie 'flow' ; showNodeReferences de flowgraphEditor appelle winReferences:searchFor qui n'existe pas dans cette fenêtre.

## Classe `C`

Classe de la fenêtre (windowName 'fg_references', windowDescription 'References'). Principales données : nodeTable (par nom de nœud : displayName, amount, pins {inPins,outPins}, category, behaviour, amountForProjects), nodeStatistics, filteredNodes, sortedProjects, sortedCategories, viewMode (1 liste, 2 détail).

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPinsAndBehavioursForCategory(nodeName, category)` | Ajoute à l'entrée nodeTable les pins et comportements (simple, duration, once) qui ne sont créés qu'à l'exécution selon la catégorie du nœud. | 232 |
| `C:checkFilesForNodes(initialCheck)` | Recalcule les occurrences de chaque nœud dans les fichiers .flow.json et dans le projet courant, puis refiltre et retrie. | 82 |
| `C:createNodeTable()` | Construit nodeTable à partir des modèles de nœuds disponibles puis compte les usages (checkFilesForNodes(true)). | 35 |
| `C:draw()` | Dessine la fenêtre : bouton « Load Data » tant que nodeTable est vide, sinon flèches de navigation et vue 1 ou 2. | 343 |
| `C:drawViewMode1()` | Vue liste : champ de recherche, combo de mode de filtre, statistiques et liste des nœuds. | 376 |
| `C:drawViewMode2()` | Vue détail du nœud inspecté : pins et projets qui l'utilisent. | 497 |
| `C:fillNodeTable(flowgraphDirectory)` | Lit chaque fichier de flowgraph de la liste et met à jour les occurrences de ses nœuds. | 131 |
| `C:filterNodes()` | Construit filteredNodes selon le texte saisi et le mode de filtre (All, Current, unused), trié par nombre d'usages décroissant. | 179 |
| `C:findNodesRecursive(nodeDirectory)` | Parcourt récursivement l'arbre des dossiers de nœuds et crée une entrée nodeTable par nœud (pins in/out du pinSchema, catégorie, comportements) en mettant à jour les statistiques par catégorie. | 47 |
| `C:highlightText(label, highlightText)` | Écrit un libellé en surlignant les occurrences du texte cherché (copie de nodelibrary). | 294 |
| `C:init()` | Enregistre la fenêtre et initialise les tables, le mode de vue (1) et le filtre (All). | 21 |
| `C:pinExists(nodeName, direction, pinName)` | Indique si un pin de ce nom existe déjà dans l'entrée du nœud. | 278 |
| `C:sortCategories()` | Trie les catégories par nombre de types de nœuds décroissant dans self.sortedCategories. | 116 |
| `C:sortProjects()` | Trie les projets utilisant le nœud inspecté par nombre d'occurrences décroissant dans self.sortedProjects. | 326 |
| `C:updateNodeOccurrence(nodeName, fileName)` | Incrémente les compteurs d'usage d'un nœud (total, par projet, par catégorie) ; crée une entrée 'OBSOLETE' si le nœud est inconnu. | 146 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/references.lua`.*

# `editor_flowgraph_examples`

*Fichier : `lua/ge/extensions/editor/flowgraph/examples.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/examples")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre « Examples » (fg_examples) de l'éditeur Flowgraph. Elle charge (une fois, mise en cache) tous les fichiers *flow.json du dossier /lua/ge/extensions/flowgraph/examples/, les range en arborescence par sous-dossier (beginner, intermediate, expert, nodes en premier), propose une recherche et, au clic sur un exemple, ouvre un nouveau projet flowgraph créé à partir de ses données (sans nom de fichier sauvegardé). Navigation possible aux flèches via l'action map « NodeLibrary ».

## Remarques

- Les exemples sont triés par exampleOrder (10^10 par défaut) ; la description vient du champ description du .flow.json.
- Le cache examplesLookup est partagé au niveau du module : il n'est pas rechargé tant que le jeu tourne.
- findExamples référence examplesLookup, qui doit déjà avoir été chargé par loadExamples.

## Classe `C`

Classe de la fenêtre Examples (windowName = 'fg_examples', arrowControllable = true).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Désérialisation (vide). | 302 |
| `C:_onSerialize(data)` | Sérialisation (vide). | 298 |
| `C:arrowHelper(cursor, itemSize, doHover)` | Compte l'élément dans la liste navigable et dessine le cadre de sélection clavier. | 306 |
| `C:attach(mgr)` | Associe le manager et réinitialise la recherche. | 13 |
| `C:createNode()` | Demande de valider l'élément sélectionné au prochain affichage (doClick). | 76 |
| `C:displayResults()` | Affiche les résultats de recherche (ou « No Results! »). | 178 |
| `C:displayTreeView()` | Affiche l'arborescence complète des exemples. | 235 |
| `C:draw()` | Dessine la fenêtre Examples (recherche ou arborescence). | 214 |
| `C:drawSearchInput()` | Dessine le champ « Find », le bouton d'effacement et l'aide. | 91 |
| `C:findExamples(match)` | Soumet chaque exemple à l'utilitaire de recherche. | 119 |
| `C:findStuff()` | Relance la recherche si le texte a changé et remplit self.results. | 133 |
| `C:getExamplesLookup()` | Renvoie l'arbre et la table plate (via loadExamples). | 72 |
| `C:handleActionMap()` | Quand la fenêtre a le focus, empile l'action map « NodeLibrary » pour la navigation aux flèches. | 283 |
| `C:highlightText(label, highlightText)` | Affiche un libellé en surlignant en orange les occurrences du texte cherché. | 147 |
| `C:init()` | Enregistre la fenêtre, crée l'utilitaire de recherche et charge les exemples. | 20 |
| `C:loadExamples()` | Parcourt FS:findFiles sur les .flow.json d'exemples, construit l'arbre (res) et la table plate (lookup) avec leur contenu JSON, puis les met en cache. | 30 |
| `C:manageClick(result)` | Si l'élément est cliqué (ou validé au clavier), crée un manager via core_flowgraphManager.addManager et le rend actif dans l'éditeur. | 205 |
| `C:navigateList(up)` | Déplace la sélection clavier dans la liste. | 80 |
| `C:recursiveTreeView(element, depth)` | Affiche récursivement un nœud de l'arbre : exemples triés puis sous-dossiers. | 242 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/examples.lua`.*

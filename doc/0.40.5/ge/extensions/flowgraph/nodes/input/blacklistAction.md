# `flowgraph_nodes_input_blacklistAction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua` · VM : Game Engine (GE) · 301 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/input/blacklistAction")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Input Actions » (once_instant, dépend de core_input_actionFilter). Bloque ou autorise une liste d'actions d'entrée, comme le fait un scénario. La liste (self.list) se choisit dans les propriétés (préréglages Empty/Scenario, recherche, catégories). Pins : block (défaut true : bloque, sinon autorise), ignoreUnrestriced (ignore le nœud si « restrictScenarios » est désactivé dans les réglages), id d'entrée (réutiliser une liste existante) et id de sortie (identifiant de la liste, pour l'annuler plus tard).

**Dépendances (chargées avant) :** `core_input_actionFilter`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 264 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 260 |
| `C:drawCustomProperties()` | Dessine l'éditeur de liste d'actions (préréglages, ajout par recherche ou catégorie, liste courante). | 113 |
| `C:drawMiddle(builder, style)` | Affiche le nombre d'actions et renomme le nœud en Block/Allow Input Actions si block est codé en dur. | 271 |
| `C:drawSearchInput()` | Dessine le champ de recherche d'actions et met à jour les résultats. | 60 |
| `C:highlightText(label, highlightText)` | Dessine `label` en surlignant les occurrences de `highlightText`. | 87 |
| `C:init()` | Initialise la liste avec le préréglage Scénario et le moteur de recherche. | 31 |
| `C:workOnce()` | Enregistre la liste dans le module action du flowgraph (registerList) si pas déjà fait, puis appelle blockActions(id) ou allowActions(id). | 282 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua`.*

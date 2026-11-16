# `flowgraph_nodes_gameplay_sites_locationsByTag`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/locationsByTag")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Locations by Tags » (catégorie once_instant). Trouve au plus `count` locations portant un tag donné, éventuellement entre minDist et maxDist d'une position pos. Les résultats sont mélangés (math.random) puis triés par distance à pos si fourni. Sorties : count, found_i (flow) et loc_i (locationData) pour i=1..N (N réglable). Entrées : sitesData, tag, pos, minDist/maxDist (-1 = pas de limite), amount (-1 = maximum).

## Remarques

- `reason` est une variable globale dans drawCustomProperties (non déclarée local).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 129 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 125 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 37 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 34 |
| `C:updatePins(old, new)` | Ajoute ou retire les paires de pins found_i / loc_i. | 53 |
| `C:workOnce()` | Construit la liste des locations (par tag ou par rayon), la mélange, garde les premières, les trie par distance, puis remplit found_i, loc_i et count. | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua`.*

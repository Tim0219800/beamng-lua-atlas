# `flowgraph_nodes_gameplay_traffic_trafficCustomGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua` · VM : Game Engine (GE) · 239 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Generate Vehicle Group » (catégorie provider, dépend de gameplay_traffic_trafficUtils). Génère les données d'un groupe de véhicules (sortie group, vehicleGroupData) pour le nœud Spawn Vehicle Group. Deux modes : « Parameters » (standard, simpleTraffic, simpleParked, fromSettings, fromWorld, avec filtres cars/trucks/large trucks et options joueur/trafic) et « Custom » (pins model_i / config_i). Si le groupe est vide, repli sur {model='pickup'}.

## Remarques

- Le mode « file » n'est plus géré : utiliser File Vehicle Group (avertissement dans les logs).
- onStateStarted met self.done à false (hook d'état).

**Dépendances (chargées avant) :** `gameplay_traffic_trafficUtils`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet self.done à false. | 133 |
| `C:_onDeserialized(data)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 222 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 212 |
| `C:buildGroup()` | Construit un groupe de type 'custom' à partir des pins model_i / config_i. | 137 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 34 |
| `C:generateGroup()` | Construit un groupe de type 'generator' à partir des paramètres choisis (20 véhicules via core_multiSpawn.createGroup ou copie depuis réglages/monde). | 149 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 24 |
| `C:onStateStarted()` | Remet self.done à false. | 105 |
| `C:resetParams()` | Remet les paramètres du mode Parameters à leurs valeurs par défaut. | 30 |
| `C:updatePins(old, new)` | Ajoute ou retire les paires de pins model_i / config_i (mode Custom). | 109 |
| `C:work()` | Une seule fois par exécution : génère le groupe (generateGroup ou buildGroup) et le publie sur group. | 192 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua`.*

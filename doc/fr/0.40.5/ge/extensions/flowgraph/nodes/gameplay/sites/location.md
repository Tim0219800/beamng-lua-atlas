# `flowgraph_nodes_gameplay_sites_location`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/location")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Location » (catégorie repeat_instant, tags scenario/sites). Décompose une donnée location (table locationData) : sorties name, pos, hasNavPos, navPos (projection sur la route la plus proche), roadSide (2 m du bord), roadDir (quat) et navRadius (5 si aucune route). Des pins de sortie supplémentaires (options, par défaut « key ») exposent les champs personnalisés (customFields.values) de la location.

## Remarques

- Sans route proche : hasNavPos=false, navPos=roadSide=pos, navRadius=5, roadDir={0,0,0,0}.
- Le bouton « Copy over Fields » de l'éditeur ne fait rien (bloc vide).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 118 |
| `C:_onDeserialized(nodeData)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 156 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 152 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 69 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 30 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 34 |
| `C:updateKeys()` | Reconstruit les pins de sortie dynamiques à partir de la liste d'options du nœud. | 38 |
| `C:work(args)` | Quand la location d'entrée change, remplit les sorties (nom, position, infos de route via findClosestRoadInfo, champs personnalisés). | 122 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua`.*

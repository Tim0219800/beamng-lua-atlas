# `flowgraph_nodes_vehicle_ai_scriptAI_pathStored`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua` · VM : Game Engine (GE) · 99 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Stored AI Path » (provider, couleur ai). Stocke dans le projet un chemin ScriptAI enregistré avec l'éditeur ScriptAIManager et le fournit. Sortie : path (type aiPath) = {path = aiPath}. L'inspecteur permet d'ouvrir ScriptAIManager, de choisir un enregistrement courant et de le charger dans le nœud ; le chemin est dessiné en debug (prismes magenta).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Ne fait rien. | 26 |
| `C:_onDeserialized(nodeData)` | Restaure aiPath (vide par défaut). | 94 |
| `C:_onSerialize(res)` | Sauvegarde aiPath dans le projet. | 90 |
| `C:drawCustomProperties()` | Affiche le nombre d'éléments, le chemin de debug, le bouton d'ouverture de ScriptAIManager, le sélecteur d'enregistrement et le bouton de chargement. | 50 |
| `C:drawDebugPath()` | Dessine le chemin stocké avec debugDrawer:drawSquarePrism pour les points proches de la caméra (100 à 200 m). | 33 |
| `C:drawMiddle(builder, style)` | Affiche le nombre d'éléments du chemin. | 85 |
| `C:init()` | Initialise un chemin vide et l'identifiant « Select... ». | 21 |
| `C:work()` | Publie {path = self.aiPath} sur la sortie path. | 81 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua`.*

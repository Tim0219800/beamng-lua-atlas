# `flowgraph_nodes_debug_comment`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/comment.lua` · VM : Game Engine (GE) · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/comment")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Comment » (catégorie logic, tag group, aucun pin). Place un commentaire dans le graphe, sous forme de cadre de groupe redimensionnable qui peut regrouper visuellement des nœuds. Propriétés éditables : titre, texte (2048 caractères max), alpha, couleurs de fond/bordure/texte, mode « Simple » (pas de groupe, juste du texte) et mode de déplacement (With Nodes : les nœuds à l'intérieur bougent avec le cadre ; Without Nodes). Purement éditeur, sans effet à l'exécution. Sérialise taille, couleurs, alpha, titre, texte (les retours à la ligne sont échappés en \n), simple et moveMode.

## Remarques

- Dans _onDeserialized, le test pour charger borderColor vérifie nodeData.backgroundColor (et non borderColor) : plante si borderColor est absent alors que backgroundColor existe.
- drawCustomProperties appelle dump(self.te) si un éditeur de texte existe, mais self.te n'est jamais créé (code commenté).

## Classe `C`

Classe du nœud (éditeur uniquement).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure les champs depuis les données chargées. | 167 |
| `C:_onSerialize(res)` | Ajoute au résultat les champs propres au commentaire. | 155 |
| `C:draw()` | Dessine le cadre, le titre, le groupe redimensionnable et l'indication de groupe dans l'éditeur. | 208 |
| `C:drawCustomProperties()` | Dessine le panneau de propriétés (titre, alpha, couleurs, simple, mode de déplacement, texte) et renvoie la raison de modification pour l'historique d'annulation. | 70 |
| `C:hideProperties()` | Appelée à la fermeture du panneau de propriétés ; sans effet (code commenté). | 65 |
| `C:init()` | Initialise taille 200x200, titre « Comment », couleurs (fond gris 0.5, bordure 0.8, texte blanc), alpha 0.75, moveMode 'withoutNodes', simple faux. | 23 |
| `C:refreshColors()` | Recalcule les ImVec4 de fond, bordure et texte depuis les tableaux de floats. | 149 |
| `C:showProperties()` | Appelée à l'ouverture du panneau de propriétés ; sans effet (code commenté). | 60 |
| `C:updateEditorPosition()` | Repositionne le nœud dans l'éditeur à l'ouverture du gestionnaire (si la position est dans des bornes valides) et force la taille. | 198 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/comment.lua`.*

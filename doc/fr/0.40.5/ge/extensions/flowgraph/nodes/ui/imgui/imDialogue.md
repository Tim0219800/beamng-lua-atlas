# `flowgraph_nodes_ui_imgui_imDialogue`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/imDialogue")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Dialogue » (catégorie repeat_instant, singleActive, tag imgui) : fenêtre imgui avec titre, description et boutons. Entrées : « title », « description » ; pour chaque option (liste modifiable, défaut accept / decline) un pin d'entrée string (libellé) et un pin de sortie flux mis à true au clic. Largeur de retour à la ligne : data.wrapSize (500).

## Remarques

- Bug : work() appelle self:closeDialogue() et self:closed(), qui ne sont pas définies dans ce fichier (erreur au premier clic si la classe de base ne les fournit pas).
- Showing two of these at the same time will break everything (todo du code).
- updateButtons : tous les liens de sortie sont mis dans flowLinks, et strLinks reste vide (les liens d'entrée ne sont pas recréés correctement).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 127 |
| `C:_onDeserialized(nodeData)` | Restaure options. | 122 |
| `C:_onSerialize(res)` | Sauvegarde options. | 118 |
| `C:drawCustomProperties()` | Édition de la liste des boutons. | 35 |
| `C:init()` | Options par défaut {accept, decline}, wrapSize = 500. | 26 |
| `C:onNodeReset()` | Ferme la fenêtre (open = false). | 135 |
| `C:postInit()` | Crée les pins des options. | 31 |
| `C:updateButtons()` | Recrée les pins des options. | 72 |
| `C:work()` | Si ouvert, dessine la fenêtre, le texte et les boutons. | 139 |
| `C:workOnce()` | Ouvre la fenêtre (open = true). | 131 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua`.*

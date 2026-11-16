# `flowgraph_nodes_debug_flowButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/flowButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Flow Button » (type simple, catégorie logic, tag input). Un bouton dans le nœud : un clic (uniquement quand le graphe tourne) produit une impulsion d'une frame sur la sortie flow. Entrée : flow. Le libellé du bouton (data.btnName, « Push » par défaut) prend le nom du pin lié (ou le nom du nœud cible si le pin s'appelle flow).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Éditeur : dessine le bouton ; un clic arme doTrigger si le graphe est en état « running ». | 26 |
| `C:init(mgr, ...)` | Libellé « Push » et doTrigger à faux. | 21 |
| `C:onLink(link)` | Hook éditeur : renomme le bouton d'après le pin ou le nœud cible si le nom est encore « Push ». | 44 |
| `C:onUnlink(link)` | Hook éditeur : remet le libellé « Push ». | 53 |
| `C:work()` | Met la sortie flow à doTrigger puis le remet à faux. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua`.*

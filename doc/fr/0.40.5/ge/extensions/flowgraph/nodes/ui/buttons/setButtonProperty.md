# `flowgraph_nodes_ui_buttons_setButtonProperty`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/setButtonProperty.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/setButtonProperty")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Button Property » (catégorie repeat_instant) : modifie les propriétés d'un bouton existant. Entrées : « buttonId », « label », « active », « order », « style ». Seules les propriétés dont le pin a une valeur non nil sont appliquées (module button:set).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit le modèle de valeur du pin style. | 19 |
| `C:work()` | Si le bouton existe, applique active/order/style/label dont les pins ne sont pas nil. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/setButtonProperty.lua`.*

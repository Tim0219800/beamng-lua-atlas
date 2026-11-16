# `flowgraph_nodes_ui_listDescription`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/listDescription")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « List Description » (catégorie repeat_instant) : construit un texte de liste à partir de clés de traduction ou d'objets de traduction contextuels. Entrées « item_i » (string ou table) pour chaque élément ; sortie « value » (string). Les éléments vides sont ignorés ; la mise en forme est faite par self.mgr.modules.ui:buildListText.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure count. | 69 |
| `C:_onSerialize(res)` | Sauvegarde count. | 65 |
| `C:drawCustomProperties()` | Champ « List Item Count ». | 29 |
| `C:init()` | count = 1. | 21 |
| `C:postInit()` | Crée les pins initiaux. | 25 |
| `C:updatePins(old, new)` | Ajuste le nombre de pins item_i. | 47 |
| `C:work()` | Traduit chaque élément (core_locales.translateWithOrWithoutContext), construit la liste et l'écrit sur « value ». | 74 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua`.*

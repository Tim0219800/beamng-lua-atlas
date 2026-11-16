# `flowgraph_nodes_ui_multiDescription`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/multiDescription")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Multi Description » (catégorie repeat_instant) : fusionne plusieurs textes en une description multiple pour Start Screen / End Screen. Entrées « value_i » (any) ; sortie « value » (table de type multiTranslationObject : liste des valeurs).

## Remarques

- drawMiddle utilise self.data.pattern, hérité d'un autre nœud (en pratique nil).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure count. | 69 |
| `C:_onSerialize(res)` | Sauvegarde count. | 65 |
| `C:drawCustomProperties()` | Champ « Count ». | 29 |
| `C:drawMiddle(builder, style)` | Affiche self.data.pattern (10 premiers caractères) si défini. | 82 |
| `C:init()` | count = 1. | 21 |
| `C:postInit()` | Crée les pins initiaux. | 25 |
| `C:updatePins(old, new)` | Ajuste le nombre de pins value_i. | 47 |
| `C:work()` | Construit la liste des valeurs d'entrée et l'écrit sur « value ». | 75 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua`.*

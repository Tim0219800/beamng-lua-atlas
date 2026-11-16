# `flowgraph_nodes_types_color`

*Fichier : `lua/ge/extensions/flowgraph/nodes/types/color.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/types/color")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Color » (provider). Fournit une couleur (table RGBA {r,g,b,a}, avec 4 valeurs PBR supplémentaires aux index 5-8 en mode custom) sur le pin color. Modes : 'custom' (sélecteur dans l'éditeur) ou 'from Pin' (pins r, g, b, a de type number).

## Remarques

- En mode 'from Pin', la sortie est {r,g,b,a} sans les valeurs PBR.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure clr (complété à 8 valeurs) et mode. | 84 |
| `C:_onSerialize(res)` | Sauvegarde l'état du noeud dans la table donnée. | 79 |
| `C:createColorPins()` | Crée les pins d'entrée number r, g, b, a. | 110 |
| `C:drawCustomProperties()` | Choix du mode, création/suppression des pins r/g/b/a et sélecteur de couleur (editor.uiColorEdit8). | 26 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 106 |
| `C:init()` | clr = {1,1,1,1}, mode = 'custom', modes = {'custom','from Pin'}. | 20 |
| `C:work()` | Écrit la couleur (depuis les pins en mode 'from Pin', sinon clr). | 98 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/types/color.lua`.*

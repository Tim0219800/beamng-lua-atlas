# `flowgraph_nodes_logic_compare`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/compare.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/compare")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Compare' (categorie logic). Compare les entrees A et B (type any) avec une fonction de comparaison choisie dans l'editeur (liste issue de getComparisonOps(), triee par nom). Sorties : flow, flow 'true', flow 'false' et le bool cache 'value'. Si A ou B vaut nil pour un operateur autre que == et ~=, un evenement d'erreur est journalise et toutes les sorties passent a false.

## Remarques

- Dans _onPropertyChanged le commentaire de log reference une variable 'value' inexistante, sans effet (ligne commentee).
- Si flow n'est pas connecte, pinOut.flow reflete simplement la valeur de pinIn.flow.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Retrouve la comparaison via opSymbol (ou l'ancien champ data.comparisonFunc) puis appelle refreshFunction. | 79 |
| `C:_onPropertyChanged(key, val)` | Appele quand une propriete change ; relance refreshFunction. | 70 |
| `C:_onSerialize(res)` | Sauvegarde opSymbol de la comparaison courante. | 75 |
| `C:drawCustomProperties()` | Panneau de proprietes : liste deroulante des fonctions de comparaison. | 38 |
| `C:drawMiddle(builder, style)` | Affiche le symbole de l'operateur. | 114 |
| `C:init()` | Trie les operateurs de comparaison par nom et selectionne le premier par defaut. | 29 |
| `C:refreshFunction()` | Met a jour compFunc depuis la comparaison choisie ; si absente, installe une fonction vide et signale l'erreur 'Invalid comparison'. | 59 |
| `C:work()` | Calcule value = compFunc(A, B) ; flow suit l'entree flow, true = value, false = not value. Cas nil decrit ci-dessus. | 97 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/compare.lua`.*

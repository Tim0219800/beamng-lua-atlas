# `flowgraph_nodes_ui_autoMedal`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/autoMedal.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/autoMedal")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Medal » (catégorie repeat_instant, UI) : détermine la médaille à partir d'un score. Entrées : « points », seuils « bronze » (50), « silver » (85), « gold » (100), « platinium » (125), « ascending » (caché, vrai : plus de points = mieux ; sinon plus petit = mieux) et textes « woodText/bronzeText/silverText/goldText ». Sorties : « medal » (wood/bronze/silver/gold/platinium), booléens bronze/silver/gold/platinium (cachés), « text », « nextScore », « nextMedal », « passed », « completed », « failed ». À brancher sur End Screen.

## Remarques

- Le nom de la médaille est 'platinium' (faute d'orthographe dans le code, utilisée pour les pins).
- Il n'y a pas de pin « platiniumText » : pour la médaille platinium, le texte de sortie reste celui de la dernière médaille atteinte avec texte (pinIn['platiniumText'] est nil).
- 'completed' = médaille platinium ; 'passed' = bronze, silver, gold ou platinium ; 'failed' = not passed.
- Sans 'points', la sortie medal est nil et rien d'autre n'est calculé.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Met le flux de sortie à true, compare 'points' aux seuils (>= ou <= selon 'ascending'), puis remplit medal, les booléens, text, nextMedal/nextScore, passed, completed et failed. | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/autoMedal.lua`.*

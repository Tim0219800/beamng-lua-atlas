# `flowgraph_nodes_ui_updatedUI_endScreenResults`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenResults.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenResults")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Results » (repeat_instant, couleur ui). Ajoute à l'écran de fin le panneau de résultats de la mission : texte formaté de la tentative (change.formattedAttempt), sous-texte optionnel, puis éventuellement objectifs et notes. Entrées : flow, text (string ou table), change (table de l'agrégat de tentative), includeObjectives, includeRatings (bool). Sortie : flow (chainFlow).

## Remarques

- Si includeObjectives ou includeRatings est vrai alors que change est nil, addObjectives/addRatings reçoivent nil.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Ne fait rien. | 26 |
| `C:work()` | Recopie flow. Ajoute un textPanel (en-tête « ui.missions.results.title » une seule fois) pour change.formattedAttempt et/ou pour text, puis appelle modules.ui:addObjectives / addRatings avec change si les options sont cochées. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenResults.lua`.*

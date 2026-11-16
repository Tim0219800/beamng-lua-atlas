# `flowgraph_nodes_ui_updatedUI_startScreenIntro`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro")` (fichier sous extensions/ mais pas une extension classique)

Nœud « StartScreen Intro » (repeat_instant, couleur ui). Nœud combiné pour l'écran de démarrage : panneau d'intro, puis objectifs et notes (ratings). Entrées : flow, text (string ou table), includeObjectives, objectivesPage (string, page optionnelle, main par défaut), includeRatings. Sortie : flow (chainFlow).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Recopie flow. Si text est non vide, ajoute un textPanel « Intro » (page main). Si demandé, ajoute les objectifs (modules.ui:addObjectives, éventuellement sur la page objectivesPage) et les ratings (addRatings). | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro.lua`.*

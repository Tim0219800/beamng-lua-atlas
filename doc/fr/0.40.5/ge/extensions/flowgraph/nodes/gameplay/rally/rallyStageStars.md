# `flowgraph_nodes_gameplay_rally_rallyStageStars`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageStars.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageStars")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Stage Stars » (catégorie once_instant, tags rally, mission, stars). Attribue les médailles bronze/argent/or d'une tentative en comparant son temps (attempt.data.time) aux seuils de la mission (missionTypeData.goldTime, silverTime, bronzeTime) : attempt.unlockedStars.<seuil> = temps <= seuil. Rien n'est évalué si la tentative est abandonnée (dnf) ou sans temps positif. Entrée et sortie : attempt (table 'attemptData').

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Si le flux est actif, met à jour unlockedStars de la tentative et la renvoie dans la pin de sortie attempt. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageStars.lua`.*

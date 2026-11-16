# `flowgraph_nodes_ui_updatedUI_endScreenAiCompetitorsLeaderboard`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « EndScreen AI Competitors Leaderboard » (catégorie once_instant, tags end/finish/rally) : ajoute au écran de fin de mission un onglet de classement des concurrents IA (rallye). Entrées : flow (chaînage), « leaderboard » (table issue du nœud Rally AI Competitors Leaderboard). Mono-étape : colonnes temps et écart ; multi-étapes : une colonne par étape plus le final. Ajoute un élément UI 'textPanel' via self.mgr.modules.ui:addUIElement avec header 'missions.aiCompetitorsLeaderboard.title'.

## Remarques

- Ignoré silencieusement si le tableau est vide ; journalise une erreur et ignore si la structure multi-étapes est invalide (stageCount, stageLabels, stageCells).
- Le nom du joueur vient d'OnlineServiceProvider.playerName, sinon 'Player' (useDefaultPlayerName = true).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Valide les données du classement et ajoute le panneau 'textPanel' à l'écran de fin. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard.lua`.*

# `flowgraph_nodes_career_onMissionPromptShown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onMissionPromptShown.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onMissionPromptShown")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Poi Prompt Shown » (catégorie repeat_instant, couleur/icône ui). Détecte que le joueur s'est arrêté sur un point d'intérêt et que l'invite (missions, concessionnaire, garage, ravitaillement) s'affiche. Sorties en impulsion d'une frame : shownPrompt (invite affichée, y compris garage et carburant) et openedMenu (liste de missions envoyée à l'UI).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 22 |
| `C:onActivityAcceptUpdate(data)` | Hook : lève shownPrompt. | 36 |
| `C:onAvailableMissionsSentToUi(data)` | Hook : lève openedMenu. | 40 |
| `C:work(args)` | Chaque frame : remet les deux sorties à faux, applique et efface les drapeaux. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onMissionPromptShown.lua`.*

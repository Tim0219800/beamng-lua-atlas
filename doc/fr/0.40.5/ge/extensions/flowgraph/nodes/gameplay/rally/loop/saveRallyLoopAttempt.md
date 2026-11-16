# `flowgraph_nodes_gameplay_rally_loop_saveRallyLoopAttempt`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Save Attempt » (catégorie once_instant, tag rally). Enregistre la tentative de la boucle rally. Avec dnfType renseigné (« restart » ou « abandon »), crée une tentative DNF via RallyAttempts.createRallyLoopAttemptForDnf (sauf si la mission courante est 'serviceOut', non comptée). Sans dnfType, crée la tentative de fin (createRallyLoopAttemptForFinish) et produit : change (objet de changement) et outroTranslation ({txt = texte de fin, context = copie de attempt.data}), le texte venant de RallyLoopStars.getOutroText ou à défaut de missionTypeData.endScreenText.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Crée la tentative DNF ou de fin et renseigne les sorties change et outroTranslation (cas fin seulement). | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt.lua`.*

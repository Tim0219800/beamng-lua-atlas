# `flowgraph_nodes_gameplay_drift_setDriftChallengeMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Drift Challenge Mode » (catégorie repeat_instant). Règle le mode de défi de drift via gameplay_drift_general.setChallengeMode. Pin d'entrée : driftChallengeMode (string ; l'aide du pin cite « A to B », « A to B with stunt zone », « Gymkhana »).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle gameplay_drift_general.setChallengeMode(driftChallengeMode). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftChallengeMode.lua`.*

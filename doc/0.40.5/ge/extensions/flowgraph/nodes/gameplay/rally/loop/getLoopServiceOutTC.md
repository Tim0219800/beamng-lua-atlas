# `flowgraph_nodes_gameplay_rally_loop_getLoopServiceOutTC`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Get Service Out TC » (catégorie once_instant, tag rally). Renvoie la position (pos, vec3) et la rotation (rot, quat) du contrôle horaire (TC) de sortie de parc d'assistance, via rm:getServiceOutTCPos() et rm:getServiceOutTCRot() du gestionnaire de la boucle rally.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Écrit pos et rot depuis le gestionnaire de boucle rally (rien si absent, erreur loggée). | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getLoopServiceOutTC.lua`.*

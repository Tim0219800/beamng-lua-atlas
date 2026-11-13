# `flowgraph_nodes_gameplay_multiseat`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/multiseat")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Multiseat » (catégorie once_instant, sans pin). Active le réglage 'multiseat' une fois (workOnce) en sauvegardant la valeur précédente, puis la restaure à l'arrêt de l'exécution du graphe.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet self.activated à false au démarrage du graphe. | 20 |
| `C:_executionStopped()` | Si le nœud avait activé le multiseat, restaure la valeur d'origine du réglage. | 30 |
| `C:init(mgr, ...)` | Initialise self.activated à false. | 16 |
| `C:workOnce()` | Lit le réglage 'multiseat' (défaut false), le mémorise dans self.previous puis met 'multiseat' à true via settings.setValue. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/multiseat.lua`.*

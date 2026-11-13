# `flowgraph_nodes_gameplay_rally_resyncAfterTeleport`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Resync After Teleport » (catégorie repeat_instant, tag rally). Efface l'état d'exécution des pacenotes et resynchronise le mode rally après une téléportation ou un reset, via gameplay_rally.getRallyManager():resyncAfterTeleport(). Recopie flow en sortie.

## Remarques

- Le resync est appelé à chaque frame d'exécution du nœud, pas seulement sur impulsion ; à n'activer qu'au besoin.
- Le nœud ne vérifie pas que gameplay_rally est chargé avant d'appeler getRallyManager.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle rm:resyncAfterTeleport() (erreur loggée si pas de rally manager) et recopie le flux. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/resyncAfterTeleport.lua`.*

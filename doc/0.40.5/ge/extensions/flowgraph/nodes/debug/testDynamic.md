# `flowgraph_nodes_debug_testDynamic`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/testDynamic")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Category Test » (catégorie once_f_duration), nœud de test de cette catégorie : au flux, passe à l'état de durée « started », compte 5 secondes (mgr.dtReal) avec une barre de progression dans le nœud, puis passe à « finished ». Aucun pin personnalisé.

## Remarques

- Bug : dans work(), `not self.durationState == 'started'` est évalué comme `(not self.durationState) == 'started'`, toujours faux ; la garde ne protège donc rien et le minuteur avance même hors de l'état started.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise à l'exécution. | 18 |
| `C:drawMiddle(builder, style)` | Éditeur : barre de progression timer/5. | 28 |
| `C:init(mgr, ...)` | Minuteur à 0 et état 'inactive'. | 13 |
| `C:onNodeReset()` | Réinitialise le minuteur et l'état. | 23 |
| `C:work(args)` | Avance le minuteur et passe à 'finished' à 5 s. | 38 |
| `C:workOnce()` | Minuteur à 0, état 'started'. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua`.*

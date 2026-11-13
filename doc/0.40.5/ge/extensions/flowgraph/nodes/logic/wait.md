# `flowgraph_nodes_logic_wait`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/wait.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/wait")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Wait' (categorie logic, behaviour duration+once). Quand le flux arrive, attend 'duration' secondes (3 par defaut) avant de sortir du flux ; necessite un flux d'entree continu. Pin 'reset' (impulsion), 'useDtSim' (utilise dtSim au lieu de dtReal). Sorties : flow (apres l'attente) et impulsion 'impulse' une seule fois.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet timer et running a zero. | 32 |
| `C:_onDeserialized(res)` | Migre l'ancien champ 'duration' vers le pin code en dur 'duration'. | 37 |
| `C:drawMiddle(builder, style)` | Barre de progression et bouton Reset. | 53 |
| `C:init(mgr, ...)` | timer=0, running=false. | 27 |
| `C:updateTimer()` | Si en cours, ajoute dtSim ou dtReal au timer ; a la fin arrete et emet l'impulsion. | 44 |
| `C:work(args)` | Gere flux/reset, appelle updateTimer ; flow = (timer >= duration) ET flux d'entree. | 64 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/wait.lua`.*

# `flowgraph_nodes_thread_loadProject`

*Fichier : `lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/thread/loadProject")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Load Project » (once_p_duration). Charge un flowgraph (.flow.json) par chemin et le démarre comme projet enfant via self.mgr.modules.thread:startProjectFromFilepath. Entrée : path (string) ; sortie : id (number) du projet démarré, utilisable avec Send/Receive Message.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet targetId à nil. | 33 |
| `C:_executionStopped()` | Remet targetId à nil. | 37 |
| `C:init(mgr, ...)` | Initialise targetId. | 23 |
| `C:postInit()` | Restreint path aux fichiers « Flowgraph Files » (.flow.json). | 27 |
| `C:workOnce()` | Résout le chemin (avec ou sans extension .flow.json), démarre le projet et écrit son id. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/thread/loadProject.lua`.*

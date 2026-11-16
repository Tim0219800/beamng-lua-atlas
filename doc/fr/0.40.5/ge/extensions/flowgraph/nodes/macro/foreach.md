# `flowgraph_nodes_macro_foreach`

*Fichier : `lua/ge/extensions/flowgraph/nodes/macro/foreach.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/macro/foreach")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Foreach' (macro, categorie logic). Pour chaque element de la table d'entree, charge un nouveau flowgraph (fichier .flow.json donne par 'elementFile') avec core_flowgraphManager.loadManager, renseigne mgr.modules.foreach.key/value (lus par le noeud Get Foreach) et lance l'execution. Ne fait cela qu'une fois (flag self.done).

## Remarques

- BUG : work lit self.pinIn.filepath.value alors que le pin s'appelle 'elementFile' (pinIn.filepath est nil, plantage probable).
- BUG : dans _executionStopped, la boucle nomme la variable 'mrg' mais utilise 'mgr:setRunning(false)' (variable globale nil) et removeNextFrame(self.mgr) (le manager parent, pas l'enfant).
- self.done n'est jamais remis a false.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Si destroyTargetOnStop, arrete et supprime les managers crees ; vide targets. | 39 |
| `C:init(mgr, ...)` | data.destroyTargetOnStop=true, targets=nil. | 28 |
| `C:postInit()` | Restreint le pin elementFile aux fichiers '.flow.json'. | 33 |
| `C:work()` | Au premier flux, cree et demarre un gestionnaire par element de la table ; self.done evite de recommencer. | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/macro/foreach.lua`.*

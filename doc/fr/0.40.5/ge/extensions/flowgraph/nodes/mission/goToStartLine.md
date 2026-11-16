# `flowgraph_nodes_mission_goToStartLine`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/goToStartLine")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Check Players Position' (categorie repeat_instant, fichier goToStartLine). Classe la position du vehicule par rapport a la ligne de depart selon le pin 'distance' : > 0,35 = outLineForward (trop avance), < 0 = outLineBackward (trop en arriere), sinon inLine (bien positionne). Le pin impulsion 'reset' remet les sorties a false.

## Remarques

- Le pin de sortie 'flow' n'est jamais ecrit dans work.
- Les pins 'velocity' et le vehicule recupere ne sont pas utilises.
- Les deux sorties outLineForward et outLineBackward ont la meme description ('Outflow when the vehicle is not in position').

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Recupere le vehicule via self.mgr.modules.vehicle:getVehicle(vehId). | 31 |
| `C:init()` | vehicle = nil. | 35 |
| `C:work()` | Sur reset : tout a false. Sinon met inLine/outLineForward/outLineBackward selon distance. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua`.*

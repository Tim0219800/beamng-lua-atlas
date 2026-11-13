# `flowgraph_nodes_logic_timedTrigger`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua` · VM : Game Engine (GE) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/timedTrigger")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Timed Trigger' (categorie logic, behaviour once+duration). Il faut maintenir du flux sur 'charge' pendant data.duration secondes (3 par defaut) pour declencher ; si 'charge' est coupe plus de data.resetTimer secondes (1 par defaut), la charge est remise a zero. Sorties : flow (tant que charge complete) et impulsion 'complete' une seule fois.

## Remarques

- Seule data.duration est sauvegardee ; resetTimer retombe sur 1 au chargement (valeur d'init).
- Le pin d'entree 'flow' n'est pas lu dans work.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet tous les compteurs a zero. | 35 |
| `C:_onDeserialized(res)` | Relit data.duration. | 47 |
| `C:_onSerialize(res)` | Sauvegarde data.duration. | 43 |
| `C:drawMiddle(builder, style)` | Deux barres de progression (charge et reset) avec temps restant. | 70 |
| `C:init(mgr, ...)` | Initialise resetTimer=1, duration=3 et l'etat interne. | 25 |
| `C:updateCharge()` | Incremente timer (dtSim) quand charge est actif, declenche completeTrigger a la duree ; sinon incremente reset et remet le timer a zero apres resetTimer. | 50 |
| `C:work(args)` | Appelle updateCharge, flow = (timer >= duration), complete = impulsion une seule fois (completeReady). | 80 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua`.*

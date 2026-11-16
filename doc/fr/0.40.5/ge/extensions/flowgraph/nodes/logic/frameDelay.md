# `flowgraph_nodes_logic_frameDelay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/frameDelay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Frame Delay' (categorie logic). Apres que le flux d'entree est apparu, attend 'frames' appels de work avant de sortir du flux. Necessite un flux continu. Le pin impulsion 'reset' remet le compteur a zero. Le pin 'frames' est cache et code en dur (defaut 1).

## Remarques

- La description du code contient la faute 'inpulse'.
- La sortie vaut true des le depart si frames <= 0 ; avec frames=1, la sortie passe a true des la premiere frame de flux.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet counter et running a zero au demarrage. | 28 |
| `C:_onDeserialized(res)` | Relit data.duration. | 37 |
| `C:_onSerialize(res)` | Sauvegarde data.duration (champ herite, non utilise ailleurs). | 33 |
| `C:drawMiddle(builder, style)` | Barre de progression compteur/frames et bouton Reset. | 49 |
| `C:init(mgr, ...)` | Initialise counter=0 et running=false. | 23 |
| `C:updateCounter()` | Si en cours, incremente le compteur et arrete quand il depasse 'frames'. | 41 |
| `C:work(args)` | Gere reset, demarre le compte quand il y a du flux, appelle updateCounter ; sortie flow = (counter >= frames). | 59 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua`.*

# `flowgraph_nodes_logic_sequencer`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/sequencer")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Sequencer' (categorie logic). Active tour a tour les sorties flow value_1..value_N. Mode d'increment 'auto' (+1 par frame), 'manual' (pins next/reset/count) ou 'select' (pin index). Mode de sequence : loop, random, once (pingpong est defini mais non propose). Sorties cachees currentIndex, maxIndex, totalIndex.

## Remarques

- Le champ C.todo du code signale que l'index demarre a 2 en mode auto.
- Dans work, 'self.mode == manual' est teste alors que 'manual' est un mode d'increment : self.pinIn.count n'est donc jamais utilise et c = self.count.
- En mode pingpong avec count=1, modulo 0 (non propose dans l'UI).
- updatePins ne supprime pas les liens des pins retirees.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | index = 0. | 45 |
| `C:_onDeserialized(res)` | Relit les reglages, recree les pins et le mode. | 140 |
| `C:_onSerialize(res)` | Sauvegarde mode, count, incMode. | 134 |
| `C:drawCustomProperties()` | Panneau : mode d'increment, mode de sequence (sauf select), nombre de sorties. | 70 |
| `C:drawMiddle(builder, style)` | Affiche le mode et l'index courant. | 179 |
| `C:init()` | count=1, mode='loop', incMode='auto', index=1. | 38 |
| `C:updateMode(m)` | Ajoute/supprime les pins d'entree selon le mode d'increment (index pour select ; next, reset, count pour manual). | 50 |
| `C:updatePins(old, new)` | Cree ou supprime les sorties flow value_i. | 117 |
| `C:work()` | Met a jour l'index selon le mode d'increment, calcule la sortie active, met value_i a (i == actif), ecrit currentIndex, maxIndex, totalIndex ; flow vaut le flux d'entree. | 148 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua`.*

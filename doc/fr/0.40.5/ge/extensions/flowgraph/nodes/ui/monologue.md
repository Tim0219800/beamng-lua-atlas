# `flowgraph_nodes_ui_monologue`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/monologue.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/monologue")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Monologue » (catégorie once_f_duration, durée) : affiche une suite de messages l'un après l'autre avec ui_message. Entrées : « category » (flowgraph), « icon » (error), puis pour chaque message i : « message_i » (any) et « duration_i » (5 s). La sortie de durée passe à 'finished' à la fin de la somme des durées.

## Remarques

- Utilise dtSim (temps de simulation), donc le défilement s'arrête en pause.
- Les pins message_i/duration_i sont supprimés selon lnk.sourcePin (au lieu de targetPin), donc les liens ne sont pas bien supprimés.
- Si une duration_i vaut nil, la somme provoque une erreur.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise index, temps et message courant. | 29 |
| `C:_onDeserialized(res)` | Restaure count et mode. | 120 |
| `C:_onSerialize(res)` | Sauvegarde count et mode. | 115 |
| `C:drawCustomProperties()` | Champ « Count ». | 36 |
| `C:init()` | count = 1. | 25 |
| `C:onNodeReset()` | État de durée 'inactive'. | 79 |
| `C:updatePins(old, new)` | Ajuste le nombre de paires de pins. | 53 |
| `C:work()` | Fait avancer le temps de simulation et affiche chaque message à son tour ; termine après la dernière durée. | 88 |
| `C:workOnce()` | temps = 0, état 'started'. | 83 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/monologue.lua`.*

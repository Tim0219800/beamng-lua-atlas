# `flowgraph_nodes_util_timedSequence`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/timedSequence")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Timed Sequence » (once_f_duration, icône timer). Enchaîne N parties chronométrées (réglable dans l'inspecteur, 1 minimum). Pour chaque partie i : pin d'entrée duration_i (s, 5 par défaut) et pins de sortie start_i (impulsion au début), active_i (pendant la partie), complete_i (impulsion à la fin). Le temps avance avec le temps simulé (mgr.dtSim). Pin hérité : allComplete devenu complete.

## Remarques

- Bug : _executionStarted est défini deux fois ; la seconde définition remplace la première (identiques).
- Dans updatePins, la suppression des liens teste lnk.sourcePin contre des pins d'entrée (pinInLocal) ; ces liens ne sont donc probablement jamais supprimés.
- Le champ mode est sauvegardé mais jamais utilisé.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet index, endTime, time et current à zéro (la fonction est définie deux fois dans le fichier, à l'identique). | 35 |
| `C:_onDeserialized(res)` | Restaure mode (« loop » par défaut) et count puis recrée les pins. | 161 |
| `C:_onSerialize(res)` | Sauvegarde mode et count. | 156 |
| `C:drawCustomProperties()` | Dessine le champ « Count » ; le modifier appelle updatePins. Renvoie la raison du changement. | 48 |
| `C:drawMiddle(builder, style)` | Affiche le temps écoulé et la section courante. | 145 |
| `C:init()` | Initialise count, index, endTime, time et current. | 23 |
| `C:onNodeReset()` | Remet le temps à zéro et l'état à « inactive ». | 98 |
| `C:postInit()` | Crée les pins de la première partie (updatePins(0, 1)). | 31 |
| `C:updatePins(old, new)` | Ajoute ou retire les pins duration_/start_/active_/complete_ pour passer de old à new parties et met à jour count. | 65 |
| `C:work()` | Tant que l'état est started, avance le temps, active start/active/complete selon la partie courante ; quand le temps total est écoulé, passe à « finished » et active complete de la dernière partie. | 103 |
| `C:workOnce()` | Passe l'état de durée à « started ». | 94 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua`.*

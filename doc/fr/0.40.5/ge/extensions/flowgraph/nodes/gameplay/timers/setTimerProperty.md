# `flowgraph_nodes_gameplay_timers_setTimerProperty`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/setTimerProperty.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/timers/setTimerProperty")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Timer Property » (catégorie repeat_instant). Modifie un timer existant : progress (temps écoulé en s), pause, duration, ref (mode). Seules les propriétés dont le pin n'est pas nil sont changées.

## Remarques

- duration et ref ont des valeurs par défaut (5, dtSim) : sans pin connecté elles sont donc réécrites à chaque frame.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit les valeurs prédéfinies du pin ref. | 20 |
| `C:work()` | Applique progress, pause, duration et ref au timer via le module timer. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/setTimerProperty.lua`.*

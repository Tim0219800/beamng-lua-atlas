# `flowgraph_nodes_activity_activityHook`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/activityHook")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Hook Trigger » (catégorie once_instant, tag activity). Déclenche un hook de mission nommé par data.eventName (« start » par défaut) en passant en argument tous les pins d'entrée personnalisés (sauf flow et reset) via mgr.modules.mission:missionHook. Marqué « généralement inutilisé » (C.todo). Pas de pins fixes ; tous types sauf flow autorisés comme pins personnalisés.

## Remarques

- C.todo du jeu : « This node is generally unused. »

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Fixe data.eventName = 'start' et active allowCustomInPins et savePins. | 29 |
| `C:workOnce()` | Construit une table {nomPin = valeur} avec les pins d'entrée (sauf flow, reset) et appelle mgr.modules.mission:missionHook(eventName, données). | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua`.*

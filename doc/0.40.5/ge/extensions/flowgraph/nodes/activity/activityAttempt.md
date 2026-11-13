# `flowgraph_nodes_activity_activityAttempt`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/activityAttempt.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/activityAttempt")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Attempt » (catégorie once_instant, tags activity/mission). Crée une tentative de mission via gameplay_missions_progress.newAttempt et la sort sur le pin table « attempt » (tableType attemptData) pour les autres nœuds d'activité. Pins fixes : entrées bool « passed » et « completed » ; sortie « attempt ». Les pins d'entrée personnalisés ajoutés par l'utilisateur (tous types sauf flow) sont copiés dans les données de la tentative. S'exécute une fois quand le flux arrive (workOnce).

## Remarques

- Le type de la tentative est toujours 'attempted' : les lignes qui le passaient à 'passed'/'completed' selon les pins sont commentées, donc les pins « passed » et « completed » sont sans effet dans ce nœud.
- Les pins fixes (passed, completed) ne sont pas copiés dans les données ; seuls les pins non fixes le sont.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Active savePins et allowCustomInPins (pins d'entrée personnalisés sauvegardés). | 37 |
| `C:postInit()` | Vide (code commenté sur des modèles de types de tentative). | 42 |
| `C:workOnce()` | Si le flux est actif, rassemble les pins non fixes dans une table, crée la tentative 'attempted' avec ces données et la place sur le pin de sortie attempt. | 51 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/activityAttempt.lua`.*

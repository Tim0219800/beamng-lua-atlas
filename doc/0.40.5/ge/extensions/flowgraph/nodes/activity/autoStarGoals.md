# `flowgraph_nodes_activity_autoStarGoals`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/autoStarGoals.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/autoStarGoals")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Auto Star Goals » (catégorie once_instant, tag activity). Crée automatiquement les objectifs de l'app Tasklist à partir des étoiles actives de la mission : envoie le guihook SetTasklistHeader (nom de la mission) puis un SetTasklistTask par étoile active (type goal, id = clé d'étoile, label depuis starLabels). Pin d'entrée codé en dur « addMissionTitle » (bool).

## Remarques

- Le pin addMissionTitle est déclaré mais jamais lu : l'en-tête est toujours envoyé.
- Un label string devient {txt, context} avec le contexte tiré des champs string/number de missionTypeData ; un label function est appelé avec la mission.
- Plante sans activité associée (self.mgr.activity nil).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 25 |
| `C:workOnce()` | Envoie SetTasklistHeader puis un SetTasklistTask (done/fail false, active true) pour chaque étoile de careerSetup.starsActive. | 39 |

**Évènements UI (guihooks.trigger) :** `SetTasklistHeader`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/autoStarGoals.lua`.*

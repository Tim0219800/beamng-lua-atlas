# `flowgraph_nodes_activity_missionAttemptStars`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/missionAttemptStars.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/missionAttemptStars")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Mission Attempt Stars » (catégorie once_instant, tags activity/mission). Ajoute des étoiles à une tentative « via le constructeur » : les pins d'entrée personnalisés sont rassemblés dans une table et passés à mission:addAttemptData(attempt, données), à charge du type de mission de remplir unlockedStars. Entrée et sortie fixes « attempt » (attemptData).

## Remarques

- Plante sans activité associée (self.mgr.activity nil est indexé). Si addAttemptData n'existe pas, la tentative est renvoyée telle quelle (avec unlockedStars = {} au minimum).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Active savePins et allowCustomInPins. | 22 |
| `C:workOnce()` | Initialise attempt.unlockedStars, collecte les pins personnalisés, appelle activity:addAttemptData si présent, puis sort attempt. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/missionAttemptStars.lua`.*

# `flowgraph_nodes_activity_attemptStars`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/attemptStars.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/attemptStars")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Attempt Stars » (catégorie once_instant, tags activity/mission). Ajoute à une tentative les étoiles remplies : chaque pin d'entrée bool personnalisé (le nom du pin = clé d'étoile) est écrit dans attempt.unlockedStars. Entrée et sortie fixes « attempt » (attemptData). Seul le type bool est autorisé pour les pins manuels.

## Remarques

- Une valeur nil sur un pin devient false dans unlockedStars. La table attempt est modifiée sur place puis renvoyée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Active savePins et allowCustomInPins. | 27 |
| `C:workOnce()` | Pour chaque pin d'entrée non fixe et non flow, met attempt.unlockedStars[nom] = valeur du pin (ou false), puis sort attempt. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/attemptStars.lua`.*

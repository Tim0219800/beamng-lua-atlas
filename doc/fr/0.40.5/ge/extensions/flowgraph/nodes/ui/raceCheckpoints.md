# `flowgraph_nodes_ui_raceCheckpoints`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/raceCheckpoints.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/raceCheckpoints")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set UI Race Checkpoints » (catégorie repeat_instant, auteur BeamNG, durée) : met à jour l'app UI de points de passage. Entrées : « cur » (nil = efface), « max ». Envoie 'WayPointChange' {current, count} et une entrée « checkpoint » (texte « cur / max ») dans ui_apps_genericMissionData (catégorie raceCheckpoints, order 100) ; efface avec 'WayPointReset'.

## Remarques

- Si max est nil, la concaténation du texte « cur / max » provoque une erreur.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Envoie ou efface le compteur de points de passage dans l'UI. | 24 |

**Évènements UI (guihooks.trigger) :** `WayPointChange`, `WayPointReset`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/raceCheckpoints.lua`.*

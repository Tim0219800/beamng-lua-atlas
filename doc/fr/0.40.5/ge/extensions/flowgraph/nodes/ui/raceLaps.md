# `flowgraph_nodes_ui_raceLaps`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/raceLaps.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/raceLaps")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set UI Race Laps » (catégorie repeat_instant, auteur BeamNG, durée) : met à jour l'app UI de tours. Entrées : « cur » (nil = efface), « max ». Envoie 'RaceLapChange' {current, count} et l'entrée de ui_apps_genericMissionData (catégorie raceLaps, order 110) ; efface avec 'RaceLapClear'.

## Remarques

- Si max est nil, la concaténation provoque une erreur.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Envoie ou efface le compteur de tours dans l'UI. | 24 |

**Évènements UI (guihooks.trigger) :** `RaceLapChange`, `RaceLapClear`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/raceLaps.lua`.*

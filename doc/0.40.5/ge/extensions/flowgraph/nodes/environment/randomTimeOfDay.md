# `flowgraph_nodes_environment_randomTimeOfDay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/randomTimeOfDay.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/randomTimeOfDay")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Random Time of Day » (catégorie repeat_instant, tags environment/tod/random). Tire une heure aléatoire entre deux heures (0-23) et la sort au format du jeu et en texte. Entrées : fromHour (défaut 9), toHour (défaut 17), use24Hour (défaut false : format 12 h AM/PM). Sorties : time (0 à 1, où 0.5 = minuit, 0 = midi) et timeString (« HH:MM » ou « H:MM AM/PM »). Gère l'intervalle qui passe minuit (ex. 22 à 2).

## Remarques

- Un nouveau tirage est fait à chaque frame où le nœud reçoit du flux (catégorie repeat_instant) ; pour une valeur stable, le déclencher une seule fois.
- Conversion : time = (heure/24 + 0.5) mod 1.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Configure les curseurs entiers 0-23 de fromHour et toHour dans l'éditeur. | 50 |
| `C:work()` | Borne les heures, tire un temps aléatoire (en gérant le passage de minuit), calcule heure/minute et écrit time et timeString. | 66 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/randomTimeOfDay.lua`.*

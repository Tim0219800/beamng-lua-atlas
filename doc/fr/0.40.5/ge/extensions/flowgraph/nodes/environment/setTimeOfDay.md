# `flowgraph_nodes_environment_setTimeOfDay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setTimeOfDay")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Time of Day » (catégorie dynamic_instant). Règle l'heure du jour via core_environment.setTimeOfDay. Pins d'entrée : flow, time (0 à 1 ; 0 = midi, 0.25 soir, 0.5 minuit, 0.75 matin), play (bool, lecture ou pause du cycle), dayLength (caché, durée d'un cycle complet en secondes réelles).

## Remarques

- time est ramené par % 1.
- Positionne mgr.modules.mission.todChanged = true pour que le module mission sache que l'heure a été modifiée.
- data.restoreTod = true est défini mais _executionStarted/_executionStopped sont vides : rien n'est restauré par ce nœud.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 43 |
| `C:_executionStopped()` | Vide. | 46 |
| `C:init(mgr)` | Définit data.restoreTod = true. | 23 |
| `C:postInit()` | Configure le pin time (curseur 0 à 1, modèles Midday/Evening/Midnight/Morning). | 27 |
| `C:setTimeOfDay()` | Marque todChanged puis appelle core_environment.setTimeOfDay({time, play, dayLength}). | 63 |
| `C:work()` | En mode repeat, applique l'heure à chaque frame. | 57 |
| `C:workOnce()` | Applique l'heure une fois. | 53 |

## Appels vers le moteur (C++)

- `core_environment.` `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua`.*

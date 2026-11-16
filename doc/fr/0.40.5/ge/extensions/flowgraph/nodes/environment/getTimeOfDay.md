# `flowgraph_nodes_environment_getTimeOfDay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getTimeOfDay.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getTimeOfDay")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Time of Day » (catégorie provider, tags environment/tod). Sort l'heure du jour actuelle (core_environment.getTimeOfDay) : time (0 à 1) et dayLength (durée d'un cycle jour-nuit en secondes réelles).

## Remarques

- Incohérence de documentation dans le jeu : ce nœud dit « 0/1 est minuit, 0.5 midi », alors que Set Time of Day dit « 0/1 midi, 0.5 minuit » et Random Time of Day « 0.5 minuit ». Les modèles de Set Time of Day (0 = Midday, 0.5 = Midnight) et les conversions de Random Time of Day vont dans le sens 0.5 = minuit.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, écrit time et dayLength sur les sorties. | 21 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getTimeOfDay.lua`.*

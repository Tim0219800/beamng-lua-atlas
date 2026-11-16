# `flowgraph_nodes_vehicle_alignForCoupling`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/alignForCoupling")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Align for Coupling » (couleur vehicle, icône link, comportement duration + once). Place une remorque derrière un véhicule tracteur pour faciliter l'attelage : aligne le point d'attelage de la remorque sur celui du tracteur avec la rotation voulue, puis active l'attelage automatique. Entrées : flow, reset, vehId (tracteur), trailerId (remorque), rot (number en degrés relatifs, ou quat ; caché), relativeRotationQuat (caché), ignoreCouple (caché, true : ne déplace pas et ne couple pas). Sortie : flow, actif uniquement quand les véhicules sont attelés.

## Remarques

- Avec ignoreCouple à true (valeur par défaut), la remorque n'est pas déplacée : coupled est mis à true immédiatement et le flow sort sans aucun alignement.
- Si un véhicule n'a pas de couplerOffset, le nœud retourne sans rien faire à chaque frame.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Efface done, waitForCouple et coupled. | 33 |
| `C:init()` | Ne fait rien. | 30 |
| `C:work()` | Gère reset. Une fois : retrouve les deux véhicules, lit leurs couplerOffset (modules.vehicle), calcule la matrice d'alignement, puis (si ignoreCouple est faux) déplace la remorque (setTransform), réinitialise sa physique et son flexmesh et active beamstate.activateAutoCoupling() sur le tracteur. Ensuite attend l'attelage (modules.vehicle:isCoupledTo) et active flow. | 38 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua`.*

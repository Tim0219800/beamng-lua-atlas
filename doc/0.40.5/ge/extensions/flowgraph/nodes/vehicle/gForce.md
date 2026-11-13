# `flowgraph_nodes_vehicle_gForce`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/gForce")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Gravity Force » (catégorie `repeat_p_duration`, tags gravity/force/gforce). Calcule les g subis par le véhicule à partir des accélérations lissées `accXSmooth/accYSmooth/accZSmooth` du véhicule (lues via `core_vehicleBridge`) et de la gravité de `core_environment`. Sorties : `gx` (latéral), `gy` (longitudinal), `gz` (vertical, gravité retirée), `gForce` (total) et `gForceZ0` (sans composante verticale, pin caché). Pin d'entrée : `vehId` (défaut : joueur).

## Remarques

- Les valeurs sont stockées dans une table locale partagée par tous les nœuds gForce du fichier (`values`).
- Les descriptions des pins disent gx = latéral, gy = longitudinal (conventions du code).
- La gravité est bornée à |g| >= 0,01 avec son signe ; `accZSmooth == 0` est remplacé par la gravité pour la première frame.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro. | 33 |
| `C:_executionStopped()` | Appelé par le gestionnaire quand l'exécution du projet s'arrête ; nettoie l'état interne. | 37 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 29 |
| `C:onNodeReset()` | Fonction vide (le code d'initialisation est commenté). | 41 |
| `C:work()` | Lit les accélérations lissées (s'abonne aux valeurs au premier appel), les divise par la gravité et remplit les sorties en g. | 45 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua`.*

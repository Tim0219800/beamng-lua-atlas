# `flowgraph_nodes_career_garageTutorialUtil`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/garageTutorialUtil")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Garage Tutorial Util » (catégorie repeat_instant, couleur/icône ui), aide pour le tutoriel du garage. Sorties bool : parkedInGarage (un véhicule de l'inventaire est dans le garage le plus proche et sa vitesse est < 0,25 m/s) et isRepaired (le véhicule du joueur n'a pas besoin de réparation selon l'assurance). Toutes les secondes de temps simulé, met à jour l'état des pièces du véhicule du joueur (hors marche à pied).

## Remarques

- Utilise career_modules_inventory et career_modules_insurance_insurance : nécessite la carrière.
- Le code lit map.objects[objId] sans test de nil.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Minuteur à 0 au démarrage du graphe. | 24 |
| `C:init()` | Minuteur à 0. | 20 |
| `C:work(args)` | Chaque frame : calcule parkedInGarage et isRepaired ; chaque seconde, appelle career_modules_inventory.updatePartConditions pour le véhicule du joueur s'il ne marche pas. | 28 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/garageTutorialUtil.lua`.*

# `flowgraph_nodes_vehicle_special_wheelDistance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/wheelDistance")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Wheel Distance » (catégorie `repeat_p_duration`). Donne la distance, projetée sur la direction du véhicule, entre un point `position` (vec3) et le milieu des deux roues les plus proches (par défaut seulement les roues avant, `data.onlyUseFrontWheels = true`). Pins d'entrée : `vehId`, `position`. Sortie : `distance` (number, signe : positif quand le point est devant les roues). `data.debug` active le tracé.

## Remarques

- Laisse des `print` de debug : `print(tostring(distanceFromStart))` à chaque frame et `print("ERROR1")` si le véhicule ou la position manque.
- Le tableau `wheels` est partagé : `wheelNodePos` est un vec3 unique réutilisé pour chaque roue, donc toutes les entrées pointent vers la même valeur (dernière roue) — la moyenne des deux roues les plus proches est faussée.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateDistanceFromStart(vehicle, target)` | Calcule la distance signée entre `target` et les roues les plus proches du véhicule `vehicle`. | 64 |
| `C:drawMiddle(builder, style)` | Affichage central vide. | 135 |
| `C:init()` | Constructeur ; `data.debug = false`, `data.onlyUseFrontWheels = true`. | 32 |
| `C:work()` | Lit le véhicule et la position puis écrit `distance`. | 122 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua`.*

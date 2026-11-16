# `flowgraph_nodes_vehicle_boost`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/boost")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Boost Vehicle » (catégorie `repeat_p_duration`, tags boost/thrust). Charge l'extension véhicule `core_booster` puis appelle `core_booster.boost({power,0,0}, dtSim)` à chaque frame. Pins d'entrée : `vehId`, `power` (number). Marqué `obsolete` dans le code (« statut inconnu, essayer Apply Velocity »).

## Remarques

- `C.todo` : l'auteur ignore si le nœud fonctionne. `C.obsolete` renvoie vers le nœud Apply Velocity.
- Pas de test `veh == nil` : plante si aucun véhicule n'est trouvé (le repli joueur peut aussi donner nil).
- Le vecteur de boost est {power, 0, 0} : la puissance n'est appliquée que sur l'axe X (repère véhicule présumé).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet `loaded = false` pour recharger `core_booster` au prochain démarrage. | 34 |
| `C:init()` | Constructeur ; `loaded = false` (l'extension n'est pas encore chargée côté véhicule). | 30 |
| `C:work()` | Charge `core_booster` dans la VM véhicule la première fois, puis envoie `core_booster.boost({power,0,0}, dtSim)` à chaque frame. | 38 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua`.*

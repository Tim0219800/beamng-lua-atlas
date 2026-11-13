# `flowgraph_nodes_vehicle_beamstate_couple`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/beamstate/couple")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Toggle Coupling » (catégorie `repeat_p_duration`, tags attach/detach/trailer/couple). Pilote les attelages (coupleurs) d'un véhicule selon la propriété `data.mode` : `toggle` (`beamstate.toggleCouplers()`), `activate` (`activateAutoCoupling()`, défaut), `disable` (`disableAutoCoupling()`), `detach` (`detachCouplers()`). Pin d'entrée : `vehId`. Si `vehId` n'est pas branché, le nœud prend le véhicule joueur (`getPlayerVehicle(0)`).

## Remarques

- Le mode n'est pas un pin : c'est `self.data.mode`, réglé dans l'éditeur. Une valeur inconnue affiche « (!) » dans le nœud et ne fait rien.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel. | 52 |
| `C:init(mgr, ...)` | Constructeur ; fixe `data.mode = "activate"` (paramètres `mgr, ...` ignorés). | 26 |
| `C:work()` | Envoie au véhicule la commande beamstate correspondant à `data.mode`. | 30 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua`.*

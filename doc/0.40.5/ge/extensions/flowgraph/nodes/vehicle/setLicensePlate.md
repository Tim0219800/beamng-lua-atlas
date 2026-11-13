# `flowgraph_nodes_vehicle_setLicensePlate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setLicensePlate")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set License Plate » (comportement `once`). Change le texte de plaque d'un véhicule avec `core_vehicles.setPlateText(text, vehId)`. Pins d'entrée : `flow`, `reset` (impulsions), `vehId` (défaut : joueur), `text` (string). Sortie : `flow` (impulsion). Ne s'exécute qu'une fois jusqu'à un `reset`.

## Remarques

- Un texte vide (`''`) ne change rien, mais le flux de sortie est quand même émis.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet `ready = true`. | 28 |
| `C:init(mgr, ...)` | Constructeur ; `ready = true` (paramètres `mgr, ...` ignorés). | 24 |
| `C:work()` | Gère `reset`, puis, si `ready` et `flow`, applique le texte et émet le flux de sortie une seule fois. | 32 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua`.*

# `flowgraph_nodes_vehicle_special_customVehicleGetter`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/customVehicleGetter")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Custom Vehicle Value » (comportement `duration`, `once`). Évalue côté véhicule une expression Lua (`data.fun`, par exemple `electrics.values.ignition` ou `electrics.values.hazard_enabled`, choisie dans une liste ou personnalisée) et renvoie le résultat via `obj:queueGameEngineLua` vers `returnValue`. Pins d'entrée : `flow`, `reset`, `VehId` ; sorties : `flow` (quand la valeur est arrivée, avec un délai de quelques frames), `value` (any), `valBool` (bool : valeur ~= 0 si number, sinon nil).

## Remarques

- Le pin d'entrée s'appelle `VehId` (majuscule) mais le code lit `self.pinIn.vehId` : le véhicule choisi est donc ignoré et le véhicule joueur est utilisé.
- L'expression est insérée telle quelle dans une commande Lua : à ne pas alimenter avec une source non fiable.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Efface la valeur reçue. | 97 |
| `C:drawCustomProperties()` | Liste déroulante des fonctions prédéfinies et champ de texte pour une fonction personnalisée. | 42 |
| `C:getCmd()` | Construit la commande Lua envoyée au véhicule. | 102 |
| `C:init()` | Constructeur ; `data.fun` = première fonction de la liste. | 38 |
| `C:returnValue(value)` | Appelé en retour par la VM véhicule avec la valeur sérialisée ; la désérialise dans `returnedValue`. | 106 |
| `C:work()` | Envoie la commande au véhicule une fois, puis expose `value`/`valBool` dès réception. | 67 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua`.*

# `flowgraph_nodes_vehicle_special_vehicleAction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/vehicleAction")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Vehicle Action » (comportement `duration`, catégorie `repeat_p_duration`). Appelle une action du véhicule définie dans son `input_actions.json` (ou celles de `lua/ge/extensions/core/input/actions/vehicle.json` pour « allVehicles »). Pins d'entrée : `vehId`, `val` (VALUE), `inputFilter` et `angle` (cachés, 0), flux `down`, `change`, `up` pour simuler onDown/onChange/onUp. Les mots VALUE, FILTERTYPE et ANGLE de la commande sont remplacés par les pins.

## Remarques

- Seules les actions de contexte `vlua` (ou sans contexte) sont proposées.
- Pas de repli sur le véhicule joueur dans `work`.
- `loadActions` trie avec `actions[a].order` : plante si une action n'a pas de champ `order`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure modèle, type, nom et action. | 183 |
| `C:_onSerialize(res)` | Sauvegarde modèle, type, nom et action. | 176 |
| `C:drawCustomProperties()` | Sélecteur de véhicule et liste des actions disponibles. | 71 |
| `C:formatCommand(cmd)` | Remplace VALUE, FILTERTYPE et ANGLE dans la commande par les valeurs des pins. | 149 |
| `C:init()` | Constructeur ; aucune action sélectionnée. | 34 |
| `C:loadActions(key, file)` | Charge et met en cache les actions d'un modèle (`key`) depuis `file` (défaut `vehicles/<key>/input_actions.json`). | 47 |
| `C:work()` | Envoie au véhicule `onDown`, `onChange`, `onUp` de l'action selon les pins de flux actifs. | 156 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua`.*

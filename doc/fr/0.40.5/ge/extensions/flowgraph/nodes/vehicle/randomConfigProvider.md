# `flowgraph_nodes_vehicle_randomConfigProvider`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/randomConfigProvider")` (fichier sous extensions/ mais pas une extension classique)

Nœud fournisseur « Random Config Provider » (catégorie `once_instant`). Choisit au hasard un modèle et une configuration parmi les voitures (`Type == 'Car'`) dont une config a `Top Speed > 10`. Sorties : `model`, `config`, `name` (cachée), `color` (cachée, nom de peinture aléatoire du modèle ou nil).

## Remarques

- Les options sont calculées une fois au premier démarrage (`self.options`) depuis `core_vehicles.getVehicleList()`.
- La description du pin `color` est copiée de `name` (« model name »).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Construit la liste `options` des modèles/configs éligibles si elle n'existe pas. | 46 |
| `C:_onDeserialized(nodeData)` | Fonction vide. | 92 |
| `C:_onSerialize(res)` | Fonction vide. | 88 |
| `C:drawCustomProperties()` | Ne dessine rien ; renvoie nil. | 34 |
| `C:drawMiddle(builder, style)` | Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel. | 41 |
| `C:init()` | Constructeur ; initialise les champs modèle/config. | 24 |
| `C:workOnce()` | Tire un modèle, une config et une peinture au hasard et les écrit sur les sorties. | 74 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua`.*

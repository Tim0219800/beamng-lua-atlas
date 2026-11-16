# `flowgraph_nodes_vehicle_vehicleConfigProvider`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/vehicleConfigProvider")` (fichier sous extensions/ mais pas une extension classique)

Nœud fournisseur « Vehicle Config Provider » (comportement `simple`, catégorie `provider`). Permet de choisir un modèle et une config de véhicule dans l'éditeur (`ui_flowgraph_editor.vehicleSelector`). Sorties : `model`, `config` (chemin de la config), `modelName` et `configName` (cachées).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restaure modèle, config, chemin, type et noms. | 65 |
| `C:_onSerialize(res)` | Sauvegarde modèle, config, chemin, type et noms. | 56 |
| `C:drawCustomProperties()` | Affiche le sélecteur de véhicule. | 36 |
| `C:drawMiddle(builder, style)` | Affichage central vide. | 42 |
| `C:init()` | Constructeur ; vide les champs modèle/config. | 26 |
| `C:work()` | Écrit le modèle et la config choisis sur les sorties. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua`.*

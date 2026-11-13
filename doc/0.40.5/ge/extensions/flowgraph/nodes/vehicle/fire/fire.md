# `flowgraph_nodes_vehicle_fire_fire`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/fire/fire")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Fire » (catégorie `once_p_duration`, tags destroy/damage/funstuff). Appelle une action de feu sur un véhicule via `core_vehicleBridge.executeAction(veh,'interactFire', fonction)`. La fonction se choisit dans l'éditeur : `igniteVehicle`, `extinguishVehicle`, `explodeVehicle`, `igniteRandomNode`, `igniteRandomNodeMinimal`, `extinguishVehicleSlowly`. Pin d'entrée : `vehId` (obligatoire).

## Remarques

- Pas de repli sur le véhicule joueur : sans `vehId`, rien ne se passe.
- `_executionStarted` met `self.done = false` mais `done` n'est utilisé nulle part.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Met `done = false` (champ inutilisé). | 52 |
| `C:_onDeserialized(nodeData)` | Appelé au chargement du projet ; restaure les réglages du nœud depuis `nodeData`. | 77 |
| `C:_onSerialize(res)` | Appelé à la sauvegarde du projet ; copie les réglages du nœud dans la table `res`. | 73 |
| `C:drawCustomProperties()` | Affichage ImGui des propriétés du nœud dans le panneau de l'éditeur ; renvoie une chaîne décrivant la modification faite, ou nil. | 38 |
| `C:drawMiddle(builder, style)` | Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel. | 67 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 26 |
| `C:workOnce()` | Envoie l'action `interactFire` avec la fonction sélectionnée au véhicule `vehId`. | 56 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua`.*

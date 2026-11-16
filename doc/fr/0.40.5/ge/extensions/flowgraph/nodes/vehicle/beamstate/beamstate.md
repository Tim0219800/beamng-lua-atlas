# `flowgraph_nodes_vehicle_beamstate_beamstate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/beamstate/beamstate")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Beamstate » (catégorie `once_p_duration`, tags destroy/damage/funstuff). Appelle une fonction sans paramètre de `beamstate` côté véhicule, choisie dans une liste déroulante : `breakAllBreakgroups`, `breakHinges`, `deflateTires`. Pin d'entrée : `vehId` (number, obligatoire). Exécuté une fois.

## Remarques

- Contrairement à d'autres nœuds, il n'y a pas de repli sur le véhicule joueur : sans `vehId` valide, rien ne se passe.
- `drawCustomProperties` ne renvoie pas `reason` (return vide) : le changement de fonction n'est pas signalé à l'éditeur.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Appelé au chargement du projet ; restaure les réglages du nœud depuis `nodeData`. | 69 |
| `C:_onSerialize(res)` | Appelé à la sauvegarde du projet ; copie les réglages du nœud dans la table `res`. | 65 |
| `C:drawCustomProperties()` | Affichage ImGui des propriétés du nœud dans le panneau de l'éditeur ; renvoie une chaîne décrivant la modification faite, ou nil. | 34 |
| `C:drawMiddle(builder, style)` | Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel. | 59 |
| `C:init()` | Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne. | 25 |
| `C:workOnce()` | Envoie `beamstate.<fonction choisie>()` au véhicule `vehId` via `queueLuaCommand`. Ne fait rien si le véhicule n'existe pas. | 48 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua`.*

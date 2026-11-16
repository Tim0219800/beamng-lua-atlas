# `flowgraph_nodes_mission_selectGarage2GarageVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua` · VM : Game Engine (GE) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Select Garage Vehicle' (categorie once_instant, auteur BeamNG) pour la mission garage-to-garage. Choisit au hasard un modele/config parmi mission.vehicleOptions (en appelant mission:generateVehicleOptions si besoin), en evitant les configs deja utilisees jusqu'a epuisement. Sorties : impulsion 'loaded', 'model', 'config', 'name' (nom affichable).

## Remarques

- La fonction locale getAllAvailableConfigs transforme les options en liste {model, config, name}.
- Quand toutes les configs ont ete utilisees, usedConfigs est vide et math.randomseed(os.time()) est rappele.
- En cas d'erreur (pas de mission, pas d'options), le noeud journalise une erreur et ne fait rien.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet la selection et les sorties a zero. | 37 |
| `C:init()` | Initialise la selection, state=1 et usedConfigs. | 23 |
| `C:resetData()` | Remet la selection, state=1 et les sorties a zero (usedConfigs est conserve). | 51 |
| `C:work()` | state 1 : choisit une config non utilisee, l'enregistre dans usedConfigs, ecrit model/config/name, loaded=true, passe a state 2. state 2 : loaded=false. | 90 |
| `C:workOnce()` | Appelle resetData. | 65 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua`.*

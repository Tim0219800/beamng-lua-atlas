# `flowgraph_nodes_mission_getCustomVehicleData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/getCustomVehicleData")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Custom Vehicle Data' (categorie once_instant). Prevu pour lire les champs dynamiques d'un vehicule (pin vehId) vers des pins de sortie personnalises ; l'implementation actuelle ne lit que les champs waypoints, routeSpeed et risk.

## Remarques

- BUG : dans workOnce, la condition teste 'veh.wayponits' (faute de frappe) et affecte 'wps', une variable jamais definie dans cette fonction (nil) : la sortie waypoints ne recoit jamais la liste, et convertStringToTable n'est jamais appelee.
- La boucle sur pinOut qui devait copier chaque champ dynamique est vide (seulement des commentaires).
- Si un pin de sortie waypoints, routeSpeed ou risk n'existe pas, l'indexation de nil provoque une erreur.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:convertStringToTable(str)` | Decoupe une chaine separee par des virgules en table de chaines. | 39 |
| `C:init()` | Active savePins et allowCustomOutPins. | 33 |
| `C:workOnce()` | Cherche le vehicule par id et copie routeSpeed et risk (convertis en nombre) vers les pins de sortie du meme nom ; la partie waypoints est cassee (voir notes). | 56 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua`.*

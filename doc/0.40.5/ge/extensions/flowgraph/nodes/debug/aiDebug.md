# `flowgraph_nodes_debug_aiDebug`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/aiDebug")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « AI Debug Display » (catégorie dynamic_p_duration, tags target/trajectory/route/debug). Affiche ou masque les visualisations de débogage de l'IA d'un véhicule en appelant ai.setVehicleDebugMode côté véhicule. Entrées : vehId (number, 0 ou vide = véhicule du joueur) et mode (string : off, target, trajectory, speeds, route ; 'off' par défaut). En mode dynamique 'repeat' la commande est renvoyée à chaque frame.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:SetAIDebugMode()` | Trouve le véhicule (vehId ou joueur) et lui envoie ai.setVehicleDebugMode({debugMode = mode}) par queueLuaCommand. | 42 |
| `C:postInit()` | Propose la liste des modes comme modèles du pin mode dans l'éditeur. | 24 |
| `C:work()` | Si dynamicMode vaut 'repeat', réapplique le mode à chaque frame. | 36 |
| `C:workOnce()` | Applique le mode une fois. | 32 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua`.*

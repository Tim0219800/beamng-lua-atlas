# `flowgraph_nodes_environment_setWind`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setWind.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setWind")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Wind » (catégorie once_p_duration). Applique un vent à un véhicule ou à tous. Pins d'entrée : vehId (vide = tous les véhicules), windSpeed (m/s) et windDir (vec3, {1,0,0} par défaut). À chaque frame, envoie obj:setWind(x,y,z) (direction multipliée par la vitesse) à la VM véhicule. Remet le vent à zéro au reset et à l'arrêt.

## Remarques

- Le vecteur windDir est mis à l'échelle sans être normalisé : une direction non unitaire change la vitesse réelle.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 26 |
| `C:init()` | Appelle onNodeReset (vent nul pour tous). | 22 |
| `C:onNodeReset()` | Envoie obj:setWind(0, 0, 0) à tous les véhicules. | 30 |
| `C:work()` | Calcule windDir * windSpeed et l'envoie par queueLuaCommand à chaque véhicule concerné. | 37 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setWind.lua`.*

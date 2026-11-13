# `flowgraph_nodes_environment_simplePlanet`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/simplePlanet")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Simple Planet » (catégorie once_p_duration). Crée une source de gravité sphérique pour un véhicule en envoyant obj:setPlanets({x,y,z,rayon,masse}) à sa VM. Pins d'entrée : vehId (défaut : véhicule joueur 0), position (vec3), radius, mass. Exécuté une seule fois ; le reset du nœud ou l'arrêt du graphe vide les planètes (obj:setPlanets({})).

## Remarques

- Si position, mass ou radius est nil, le nœud ne fait rien.
- Si vehId ne correspond à aucun objet, self.vehicle est nil et queueLuaCommand plante (non protégé).
- Ancien pin vehID renommé vehId (legacyPins). La description du pin vehId parle de gravité mais il désigne le véhicule cible.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 62 |
| `C:init()` | Initialise self.vehicle à nil. | 29 |
| `C:onNodeReset()` | Si un véhicule a été ciblé, lui envoie obj:setPlanets({}) et oublie la référence. | 33 |
| `C:workOnce()` | Construit la commande obj:setPlanets({x,y,z,radius,mass}) et l'envoie au véhicule ciblé. | 40 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua`.*

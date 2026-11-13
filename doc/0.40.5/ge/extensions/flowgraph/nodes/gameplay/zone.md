# `flowgraph_nodes_gameplay_zone`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/zone.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/zone")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « In Zone » (repeat_instant, couleur sites). Détecte si un véhicule (vehId) est dans les zones de sitesData : teste des points de la boîte englobante orientée de spawn (getSpawnWorldOOBB) avec sites:getZonesForPosition, publie inside, et dessine les zones en debug (rouge pulsé si dehors, blanc si dedans).

## Remarques

- Bug : work lit self.pinIn.flow, mais aucun pin d'entrée « flow » n'est déclaré dans pinSchema ; self.pinIn.flow est donc nil et l'indexation provoque une erreur Lua.
- Bug : la boucle `for i = 0, 8` teste toujours oobb:getPoint(0) au lieu de getPoint(i).
- Le pin sitesData n'a pas de tableType.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Initialise les couleurs rouge et blanc de dessin. | 46 |
| `C:work(args)` | Teste si le véhicule est dans une zone, dessine les zones en debug et écrit inside. | 19 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/zone.lua`.*

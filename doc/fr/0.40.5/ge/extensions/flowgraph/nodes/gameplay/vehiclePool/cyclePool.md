# `flowgraph_nodes_gameplay_vehiclePool_cyclePool`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Cycle Pool » (once_instant). Bascule un véhicule actif et un véhicule inactif du pool pour garder le même nombre de véhicules en marche (pool:cycle). Pins d'entrée : vehPool, vehId1 (actif, optionnel), vehId2 (inactif, optionnel) ; sorties : inactiveId, activeId. Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

## Remarques

- Bug : workOnce lit self.pinIn.activeId et self.pinIn.inactiveId, qui n'existent pas (les pins d'entrée s'appellent vehId1 et vehId2 ; activeId/inactiveId sont des sorties) : l'appel provoque une erreur Lua et les sorties ne sont jamais écrites.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Prévu pour appeler pool:cycle(activeId, inactiveId) ; voir la note sur les noms de pins incorrects. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/cyclePool.lua`.*

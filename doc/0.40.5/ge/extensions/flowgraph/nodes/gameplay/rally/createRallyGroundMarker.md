# `flowgraph_nodes_gameplay_rally_createRallyGroundMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Create Ground Marker Route » (catégorie once_instant, tag rally). Crée la route de marqueurs au sol (core_groundMarkers.setPath) vers une position nommée d'un pathData : les pathnodes triés (si includePathnodes, true par défaut) puis la position de départ nommée, reculée de routeEndOffsetMeters (10 m par défaut) le long de son axe -Y local et projetée sur le terrain. Les waypoints à moins de 1 m du précédent sont ignorés. Déclenche ensuite le hook onCreatedRallyGroundMarkerRoute. Entrées : pathData, name, includePathnodes, routeEndOffsetMeters.

## Remarques

- Si pathData est absent ou si la position nommée est introuvable, un avertissement est loggé et rien n'est créé.
- La projection au sol utilise core_terrain.getTerrainHeight, sinon un raycast statique de 150 m depuis 50 m au-dessus.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Construit la liste de waypoints, appelle core_groundMarkers.setPath puis extensions.hook('onCreatedRallyGroundMarkerRoute'). | 91 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCreatedRallyGroundMarkerRoute` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/createRallyGroundMarker.lua`.*

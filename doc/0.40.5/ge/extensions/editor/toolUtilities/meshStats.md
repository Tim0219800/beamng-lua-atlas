# `editor_toolUtilities_meshStats`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshStats.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshStats` : `extensions.load("editor_toolUtilities_meshStats")`, puis la globale `editor_toolUtilities_meshStats`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshStats.begin()` | Public interface. | 27 |
| `editor_toolUtilities_meshStats.recordMesh(name, family, nVerts, nTris)` | Record one ProceduralMesh by its scene-tree NAME (so a later rebuild under the same name overwrites, and a<br> render pass that renamed/dropped it is caught by the existence check in report()). family groups the rollup. | 35 |
| `editor_toolUtilities_meshStats.recordParts(category, nVerts, nTris)` | Record the geometry of ONE part inside a merged mesh, by its structural category (bridge.deck, tunnel.floor /<br> tunnel.shell; soffit + pier are now instanced TSStatics, counted in the instanced-props scan). Additive: a bridge/tunnel cluster remeshes exactly once per import,<br> so the running sum is accurate for the import (this is a breakdown of, not a duplicate of, the mesh totals). | 43 |
| `editor_toolUtilities_meshStats.report(tag)` | Aggregate everything and log the rollup. Ends the collection window. | 72 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshStats.lua`.*

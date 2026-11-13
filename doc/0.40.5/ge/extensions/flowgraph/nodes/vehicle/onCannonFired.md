# `flowgraph_nodes_vehicle_onCannonFired`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/onCannonFired")` (fichier sous extensions/ mais pas une extension classique)

Nœud événement « on Cannon Fired » (catégorie `repeat_instant`). Émet une impulsion sur la sortie flux `cannonFired` quand le hook `onCannonFired` est reçu. Aucune entrée.

## Remarques

- Le paramètre `id` du hook n'est pas exposé sur une sortie.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:onCannonFired(id)` | Hook appelé quand un canon tire ; lève le drapeau interne. `id` : identifiant du véhicule/objet (déduit du nom, non utilisé). | 35 |
| `C:work(args)` | Met `cannonFired` à true pendant une frame si un tir a été signalé, sinon false. | 26 |
| `C:workOnce()` | Met le drapeau interne `flag` à false. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua`.*

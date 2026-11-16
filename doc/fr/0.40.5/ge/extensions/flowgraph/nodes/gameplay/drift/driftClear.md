# `flowgraph_nodes_gameplay_drift_driftClear`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftClear.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftClear")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Clear Drift » (tags gameplay/utils). Vide le système de drift : zones de cascade, scores et autres systèmes, via gameplay_drift_general.clear(). Pin d'entrée : clearDrift (flow).

## Remarques

- work teste self.pinIn.flow.value alors que le pin déclaré s'appelle clearDrift : le pin « flow » standard du nœud sert de déclencheur, clearDrift n'est pas lu.
- Catégorie vide (C.category = '').

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle gameplay_drift_general.clear() si le flux d'entrée est actif. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftClear.lua`.*

# `flowgraph_nodes_gameplay_sites_posInZone`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/posInZone.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/posInZone")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Position in Zone » (catégorie repeat_instant). Teste en 2D (zone:containsPoint2D) si une position est dans une zone Sites. Sorties : inside, outside, et impulsions enter/exit lors du changement entre deux frames.

## Remarques

- Affiche dump("No zone data!") à chaque frame si la zone ou la position manque.
- enter et exit ne sont écrites qu'à partir de la 2e frame (self._lastInside non nil).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 29 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 26 |
| `C:work(args)` | Calcule inside/outside et détecte l'entrée ou la sortie en comparant à l'état de la frame précédente. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/posInZone.lua`.*

# `flowgraph_nodes_gfx_dof`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gfx/dof.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gfx/dof")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « DOF » (catégorie par défaut, tags gfx/dof). Fait apparaître (blurIn) ou disparaître (blurOut) un flou de profondeur de champ en fadeTime secondes (défaut 1) en pilotant les variables $DOFPostFx::BlurMin, BlurMax, BlurCurveFar (cible 430) et FocusRangeMax (3), puis rafraîchit DOFPostEffect. Sortie blurDone quand le fondu est terminé. Les valeurs d'origine sont sauvegardées et restaurées au reset ou à l'arrêt.

## Remarques

- Les sauvegardes savedBlurMin/Max/... sont lues puis réécrites à chaque changement de mode, sans être remises à nil.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset(). | 61 |
| `C:init(mgr, ...)` | Appelle reset(). | 57 |
| `C:reset()` | Remet le timer et le mode à zéro et restaure les variables DOF sauvegardées. | 33 |
| `C:updateSettings()` | Appelle DOFPostEffect.updateDOFSettings() si l'effet existe. | 26 |
| `C:work()` | Détecte le mode (in/out), sauvegarde les réglages DOF puis fait avancer le fondu avec dtSim ; met blurDone à true à la fin. | 65 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gfx/dof.lua`.*

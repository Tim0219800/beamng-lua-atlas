# `flowgraph_nodes_math_smoothers_nonLinear`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/smoothers/nonLinear")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Nonlinear Smoother' (categorie simple). Lissage non lineaire avec newTemporalSmoothingNonLinear : taux upRate/downRate selon le sens, pas de temps 'dt', 'set' pour forcer l'etat. Sortie 'value'. Descriptions de pins 'TODO' dans le code.

## Remarques

- init ecrit C.oldSet (classe) au lieu de self.oldSet.
- Le lisseur est cree dans init, donc il n'est pas remis a zero au redemarrage du graphe (contrairement au Linear Smoother).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkSetValue()` | Si 'set' a change, force l'etat du lisseur. | 32 |
| `C:drawMiddle(builder, style)` | Affiche l'etat du lisseur. | 59 |
| `C:init()` | Met C.oldSet=0 (classe) et cree le lisseur non lineaire. | 26 |
| `C:work()` | Sans entree, sort l'etat ; sinon sort smoother:getWithRate(sample, dt, rate) avec rate = upRate/downRate (defaut 1). | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua`.*

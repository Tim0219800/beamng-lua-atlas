# `flowgraph_nodes_math_smoothers_linear`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/smoothers/linear")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Linear Smoother' (categorie simple). Lissage lineaire d'un signal avec newTemporalSmoothing : 'value' vers l'etat interne a la vitesse upRate (monte) ou downRate (descend), avec le pas de temps 'dt'. 'set' force l'etat. Sortie 'value'. Les descriptions des pins sont 'TODO' dans le code.

## Remarques

- Le lisseur n'existe qu'apres _executionStarted.
- init ecrit C.oldSet (classe) au lieu de self.oldSet : partage entre instances.
- Le champ C.todo du code indique 'Requires testing and should have flow pins'.
- dt est nil si le pin n'est pas connecte.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Cree le lisseur (newTemporalSmoothing). | 31 |
| `C:checkSetValue()` | Si 'set' a change, force l'etat du lisseur a cette valeur. | 36 |
| `C:drawMiddle(builder, style)` | Affiche l'etat du lisseur. | 63 |
| `C:init()` | Met C.oldSet=0 (au niveau de la classe). | 26 |
| `C:work()` | Sans entree, sort l'etat courant ; sinon choisit le taux (upRate/downRate, defaut 1) et sort smoother:getWithRateUncapped(sample, dt, rate). | 44 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua`.*

# `flowgraph_nodes_math_smoothers_spring`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/smoothers/spring")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Spring Smoother' (categorie simple). Doit lisser un signal par ressort amorti (upSpring/downSpring, upDamp/downDamp selon le sens ; 'set' force l'etat). Sortie 'value'.

## Remarques

- BUG : le noeud cree un lisseur sigmoide (newTemporalSigmoidSmoothing) alors que getWithSpringDamp n'existe que sur temporalSpring (newTemporalSpring dans common/filters.lua) : appeler le noeud avec une valeur provoque une erreur 'attempt to call a nil value'.
- Le lisseur est partage entre instances (C.smoother).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkSetValue()` | Si 'set' a change, force l'etat du lisseur. | 34 |
| `C:drawMiddle(builder, style)` | Affiche l'etat du lisseur. | 64 |
| `C:init()` | Met C.oldSet=0 et C.smoother (classe) via newTemporalSigmoidSmoothing(). | 28 |
| `C:work()` | Sans entree, sort l'etat ; sinon appelle smoother:getWithSpringDamp(sample, dt, spring, damp). | 42 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua`.*

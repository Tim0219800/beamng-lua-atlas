# `flowgraph_nodes_math_smoothers_sigmoid`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/smoothers/sigmoid")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Sigmoid Smoother' (categorie simple). Lissage sigmoide avec newTemporalSigmoidSmoothing : limites de vitesse upRateLimit/downRateLimit et accelerations de depart/arret (up/down StartAccel et StopAccel) selon le sens ; 'set' force l'etat. Sortie 'value'.

## Remarques

- BUG : le pin est declare 'downstopAccel' (s minuscule) mais work lit self.pinIn.downStopAccel (nil) : indexer .value sur nil provoque une erreur des que la valeur d'entree est inferieure a l'etat (sens descendant).
- init ecrit C.smoother (classe) : le lisseur est partage entre toutes les instances du noeud.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkSetValue()` | Si 'set' a change, force l'etat du lisseur. | 36 |
| `C:drawMiddle(builder, style)` | Affiche l'etat du lisseur. | 69 |
| `C:init()` | Met C.oldSet=0 et C.smoother (au niveau de la classe). | 30 |
| `C:work()` | Sans entree, sort l'etat ; sinon choisit limit/start/stop selon le sens (defaut 1) et sort smoother:getWithRateAccel(sample, dt, limit, start, stop). | 44 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua`.*

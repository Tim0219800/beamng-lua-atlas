# `flowgraph_nodes_gameplay_isWalking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/isWalking")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Is Walking » (catégorie repeat_instant, couleur/icône « walking »). Il teste à chaque frame si le joueur est en mode marche via gameplay_walk.isWalking(). Pins de sortie : walking (flow, vrai si le joueur marche), nonWalking (flow, caché, vrai sinon), enteredWalking (flow impulsion, caché, vrai une frame à l'entrée en mode marche), exitedWalking (flow impulsion, caché, vrai une frame à la sortie). Dépend de l'extension gameplay_walk.

## Remarques

- Le nœud mémorise l'état initial dans self.prevWalk au démarrage de l'exécution (_executionStarted), mais work() ne met jamais prevWalk à jour : enteredWalking/exitedWalking restent donc vrais tant que l'état diffère de celui du démarrage (comportement observé dans le code, pas une vraie impulsion d'une seule frame).

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud, instanciée par _flowgraph_createNode(C).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage du graphe ; enregistre l'état de marche actuel dans self.prevWalk. | 23 |
| `C:drawMiddle(builder, style)` | Dessine dans l'éditeur une icône de marcheur, verte si le joueur marche, grisée sinon. | 35 |
| `C:work(args)` | Chaque frame : lit gameplay_walk.isWalking() et renseigne les pins walking, nonWalking, enteredWalking, exitedWalking. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua`.*

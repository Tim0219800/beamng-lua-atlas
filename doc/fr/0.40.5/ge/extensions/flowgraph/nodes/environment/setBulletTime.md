# `flowgraph_nodes_environment_setBulletTime`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setBulletTime")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Bullet Time » (catégorie repeat_instant). Ralentit ou met en pause le temps de simulation via simTimeAuthority. Pins d'entrée : instant (bool, caché : applique la vitesse tout de suite au lieu d'y tendre progressivement) et value (number, 0 = pause du jeu, curseur 0 à 1). S'exécute à chaque frame tant que le flux d'entrée est actif ; à l'arrêt du graphe, remet la vitesse à 1.

## Remarques

- Si value vaut 0, simTimeAuthority.pause(true) est appelé ; sinon la vitesse est réglée puis la pause est levée.
- Si value est nil, la vitesse 1 est utilisée (mais le test value == 0 est fait avant).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelé à l'arrêt du graphe : remet simTimeAuthority.set(1). | 21 |
| `C:postInit()` | Configure le pin value comme curseur flottant de 0 à 1. | 25 |
| `C:work()` | Si le flux est actif : pause si value == 0, sinon règle la vitesse (setInstant si instant, sinon set) et lève la pause. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua`.*

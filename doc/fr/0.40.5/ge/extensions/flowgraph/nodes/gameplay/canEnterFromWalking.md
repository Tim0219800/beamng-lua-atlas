# `flowgraph_nodes_gameplay_canEnterFromWalking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/canEnterFromWalking.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/canEnterFromWalking")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Can Enter From Walking » (catégorie repeat_instant, dépend de gameplay_walk). Vérifie que le joueur marche et est près d'un véhicule à l'arrêt qu'il peut entrer. Sorties : canEnter (flux), vehId (véhicule le plus proche ou nil), closeButNotStopped (flux caché, véhicule proche mais en mouvement).

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche une icône de véhicule verte si l'entrée est possible. | 28 |
| `C:work(args)` | Utilise gameplay_walk.isWalking, getVehicleInFront et isAtParkingSpeed pour remplir les pins de sortie. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/canEnterFromWalking.lua`.*

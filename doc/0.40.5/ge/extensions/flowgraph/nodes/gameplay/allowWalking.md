# `flowgraph_nodes_gameplay_allowWalking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/allowWalking.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/allowWalking")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Allow Walking » (catégorie par défaut, dépend de gameplay_walk). Autorise ou interdit le mode marche, donc l'entrée et la sortie des véhicules. Pins d'entrée : flow, allow, deny, set (caché) et enable (bool caché, utilisé avec set). Sortie : flow, recopie de l'entrée. Appelle gameplay_walk.enableToggling.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Si flow est actif : allow active le mode marche, deny le désactive, set l'applique selon enable. Recopie flow en sortie. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/allowWalking.lua`.*

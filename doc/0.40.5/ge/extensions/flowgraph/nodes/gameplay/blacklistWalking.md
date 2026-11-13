# `flowgraph_nodes_gameplay_blacklistWalking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/blacklistWalking.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/blacklistWalking")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Blacklist Walking » (dépend de gameplay_walk). Autorise ou interdit l'entrée dans un véhicule depuis le mode marche, via la liste noire de gameplay_walk. Pins d'entrée : flow, allow (retire de la liste), deny (ajoute), vehId, clear (impulsion, vide la liste), fill (tous les véhicules du projet), fillAll (tous les BeamNGVehicle de la scène). Sortie : flow.

## Remarques

- Bug : dans fill, le code appelle gameplay_walk.addVehicleToBlacklist(sortedIds) avec la variable globale (nil) au lieu de id ; la liste n'est donc pas remplie correctement.
- fill et fillAll vident d'abord la liste noire.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Vide. | 25 |
| `C:work(args)` | Si flow est actif, exécute allow/deny (si vehId), clear, fill, fillAll. Recopie flow en sortie. | 28 |

## Appels vers le moteur (C++)

- `obj:` `getId`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/blacklistWalking.lua`.*
